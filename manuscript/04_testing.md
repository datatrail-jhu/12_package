# Testing

<!-- Google Slide ID -->
<!-- 18fovc8dhIbVwNSz9sGyEtZwi4DTUI2jqtZ3ib9tay9g -->

<!-- Include a slide PNG with Page_ID from this Slide Deck: -->
<!-- ![](https://docs.google.com/presentation/d/18fovc8dhIbVwNSz9sGyEtZwi4DTUI2jqtZ3ib9tay9g/export/png?id=18fovc8dhIbVwNSz9sGyEtZwi4DTUI2jqtZ3ib9tay9g&pageid=PAGE_ID) -->
<!-- or use  `didactr::gs_slide_df("18fovc8dhIbVwNSz9sGyEtZwi4DTUI2jqtZ3ib9tay9g")$png_markdown` -->

### Code Testing

In the last lesson, we added two functions to our `cbds` R package. To see that they were working as we expected, we ran the functions on data and looked to see if we got the expected outcome. We mentioned that these are known as **smoke tests**. They're quick checks that you run to make sure your code is doing what you expect it to do. When people write code in R, they almost always run these types of tests. 

*However*, what is less common among R programmers, is writing tests that *automate your tests*. When automated, the tests are written and ready to run so that any time changes are made to your package, you run these tests to ensure that you're not getting any errors. It's this type of testing we'll cover in this lesson.

By the end of this lesson you'll have written tests for the two functions in our `cbds` package *and* be familiar with how to automatically run these tests during package development.


### Unit Tests

Writing **unit tests** moves your code from only writing smoke tests to be able to save your tests and automate package testing.

While it may take a little bit of work up front to get used to programming like this, it will ultimately save you a ton of time in the following ways:

1. *Fewer errors* - When you write tests explicitly for each aspect of your code, you're automatically checking to ensure that each piece is behaving as expected. When you change code within your package during development, these tests will identify whether or not behavior as broken automatically, cluing you into bugs in your code *much* earlier than if you didn't have the tests. Note that when you find a bug in your code, you should get in the habit of writing a unit test right then and there. This way, you never have to fix a bug more than once!
2. *Quickly identify bugs* - when a well-written unit test fails, you know precisely where to look in your code to identify the issue. You won't have to go back through all of the code in your package to track down what's gone wrong.
3. *Better code* - Code that is easily tested tends to be better code. In writing tests, you're forced to simplify your code into functions that carry out a single task (rather than having a large function that does a whole bunch of different things). In this process, your code will be easier to read and better designed overall.

**Unit tests** are meant to be small tests, each of which tests a different piece of your overall code (here, your package). So, for each "thing" that your package accomplishes, you'll want to be sure to have at least one unit test.

Note that there are additional tests that are helpful within software development (including integration tests and system tests); however, unit tests are the fundamental unit, the first piece in the puzzle, and the most important piece to master when writing R packages, so we'll focus on those here.

### `testthat`

As with writing packages, where `usethis` was a helpful package for automatically getting the structure of your package set up, `testthat` is a package written by Hadley Wickham to help R programmers write unit tests and automatically test the functionality within their packages. To use this package, you'll first have to install it from CRAN:

```r
# Install from CRAN
install.packages("testthat")
```

#### Creating a test file

Once you have `testthat` installed, you can use `use_test()` from `usethis` to set up the required directories and files needed to start running tests.

The input to this function should be the name you want to use for your test file. In our case, we're going to write tests for the `check_na` function, so we'll use that as the input. This function will then create (and open!) a file for us with the word `test-` followed by the name we specified. 

```r
# create test and structure
usethis::use_test("check_na")
```

{format: png}
![`use_test` sets up structure and files for automated testing](https://docs.google.com/presentation/d/18fovc8dhIbVwNSz9sGyEtZwi4DTUI2jqtZ3ib9tay9g/export/png?id=18fovc8dhIbVwNSz9sGyEtZwi4DTUI2jqtZ3ib9tay9g&pageid=g5d432a4243_0_0)

Executing this function *also* creates a `tests/` directory within our package. Within that directory there will be a directory called `testthat/`. The test file we just created `test-check_na.R` will be stored within that directory. There will be example code within that file. This is where we'll write our unit test code.

Finally, within `tests/` there will be a file called `testthat.R`. This file automatically has code within it that will allow for automated testing to take place.

{format: png}
![`testthat.R` contains code needed to automate testing](https://docs.google.com/presentation/d/18fovc8dhIbVwNSz9sGyEtZwi4DTUI2jqtZ3ib9tay9g/export/png?id=18fovc8dhIbVwNSz9sGyEtZwi4DTUI2jqtZ3ib9tay9g&pageid=g5d432a4243_0_11)

#### Testing Expectations

Within the file that was created for you using `use_test()`, you'll see an example unit tests:

test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

There are two parts of the `test_that()` example.

1. **test name** - a brief description of the test (i.e. "multiplication works")
2. **code** - the test containing the expectation (`expect_equal(2 * 2, 4))

The **test name** should be descriptive, informative, and short. Good descriptions will help you later on quickly identify any issues.

In this example, the **code** within the test is checking to see whether or not (2 * 2, what's on the left hand side of the comma) is equal to 4 (what's on the right hand side of the comma). As 2 * 2 *is* equal to 4, this test would pass. All tests should be written so that they pass. If a test does not pass, it will throw an error. This is how unit testing works! All tests that test code that is doing as we expect should pass silently. However, if an error is encountered, testing will throw an error.

Now, testing that two things are equal, using `expect_equal()`, is not the only way you can test code; however, it is a very common type of test. There are other expectations that you can use, but all of them evaluate as either TRUE or FALSE. Tests that pass evaluate as TRUE. Tests that fail evaluate as FALSE.

As we saw above with the `expect_equal()` multiplication works example, expectations have the following structure:

1. They start with `expect_`
2. They take two arguments: the first is the result of the test, the second is the expectation
3. If the actual and the expected results fail to agree, you'll get an error.

There are many different types of expectations, but the most commonly used are described here:

##### `expect_equal()`

As described above, `expect_equal()` tests that the statement passed as the first argument is equal to the second argument.

For example, the following statement would pass silently as 2 is in fact equal to 2:

```r
# passes silently
expect_equal(2, 2)
```

However, the following would throw an error, as 2 is not equal to 1:

```r
# throws an error
expect_equal(2, 1)
```

##### `expect_match()`

`expect_match()` tests a character vector and determines if it matches with the stated regular expression. 

Note: We discussed regular expression briefly in the Working with Strings lesson of the [Data Tidying](https://leanpub.com/universities/courses/jhu/cbds-tidying) course, so feel free to review that lesson before moving forward here.

For example, the following statement would pass silently as "love" is within the `test_string`:

```r
test_string <- "I love CBDS!"

# passes silently
expect_match(test_string, "love")
```

However, the following would throw an error, as "LOVE" is *not* within the `test_string`, due to case-sensitivity:

```r
# throws an error
expect_match(test_string, "LOVE")
```

##### `expect_message()`, `expect_warning()`, & `expect_error()`

These three expectations check at their simplest whether or not a message, warning, or error is generated.

For example if you tried to divide a number by a character string: `1/"cbds"`, you would get the error: "Error in 1/"cbds" : non-numeric argument to binary operator"

Therefore, if you're expecting an error, the following would produce an error and therefore pass silently:

```r
# passes silently
expect_error(1/"cbds")
```

However, it's best to include explicitly what the message, warning, or error you're expecting is.

```r
# explicit error provided
expect_error(1/"cbds", "non-numeric argument")
```

Note that if you stated the *incorrect* error message (one that is not produced), you will get an error.

```r
# incorrect error message
expect_error(1/"cbds", "NaNs produced")
```

By providing the error message to `expect_error()` that you're anticipating, you're writing a better test, so that it will only pass silently when the *expected* error message is produced.

##### `expect_is()`

`expect_is()` checks that the class of the specified object is of the stated class.

For example, the following statement would pass silently as "cbds" is of the class "character":

```r
# passes silently
expect_is("cbds", "character")
```

However, the following would throw an error, as the string "cbds" is not numeric:

```r
# throws an error
expect_is("cbds", "numeric")
```

##### `expect_true()` & `expect_false()`

Finally, if none of the other `expect_` functions fit what you need, you can use either of these functions which expect to evaluate as either TRUE or FALSE. However, whenever possible, it's best to be explicit and use the other expectations already mentioned.


### Testing Function #1: `check_na()`

Now that the files have been created and we have some idea of the different types of expectations we can utilize, it's time to start actually writing unit tests!

As we start writing tests, each test should test a single aspect of your package. Note that you can put more than one expectation within a single test. But, avoid putting too many expectations into a single test. When it comes to debugging and tracking down errors, a number of smaller tests is better than a single or a few large tests, for sure.

Additionally, you do not have to test every single function within your package. If there are small bits of simple code that you're sure will work, then you don't need a test. However, in the beginning, as you get comfortable writing unit tests, it's good practice to write tests for each major function within your package.

Finally, any time you encounter a bug during package development, *go write a test*. Your future self will thank you. Or rather, your future self won't waste time re-discovering the same bug. 

For our package, we'll write tests for both of the functions we generated. in the previous lesson.

#### Smoke Test Reminders

In the previous lesson we checked to see if our function was working by executing our functions and examining the output. These were smoke tests. They checked to ensure the functions were behaving as expected, but they did not accomplish this in an automated way.  

For example, we checked to see how many NAs there were in the `Sepal.Length` column of the `iris` dataset. Similarly, we looked at the output from our `check_na()` function using the `sleep_rep` variable from `msleep` dataset in `ggplot2`, since we knew there were NAs expected in that dataset.

#### Unit Test Generation

To write a unit test, we'll similarly want to check all expected behavior of our function, but we'll just want to do so in an automated fashion, using `testthat` and storing all expectations within the `testthat/` directory we previously generated.

For this function, we'll want to test that our function:

- correctly counts the number of observations in the input
- correctly returns the number of NAs in the input
- correctly returns the number of non-NAs in the input
- returns the information in the expected output

This means, that we'll have at least four expectations for this function. And, I'll argue here that we'll have two different tests, one to test the calculations and another to test the information is returned in the expected format.

Let's first write the test that checks the calculations. We'll delete the example test provided and then first include an example dataset so that we can test the output of the function on something where we confidently know the answer.

Then, within the test, we first include the description "NA calculations correct" and then include the code. The code includes a simple example object where we know the expected answer for sure, execute the function storing the output, and then test that all three calculations are occurring as expected in that output:

```r
obs <- c(3, 4, "str", 10, NA, NA, NA)
tested = check_na(obs)

test_that("NA calculations correct", {
  expect_equal(as.numeric(tested[1,"N"]), 7)
  expect_equal(as.numeric(tested[1,"NAs"]), 3)
  expect_equal(as.numeric(tested[1,"Non-NAs"]), 4)
})

```
Now we need the test that checks that the output are being returned in the expected format. Here we'll want to check that a matrix is being returned and that it has the expected number of rows and columns:

```r
test_that("NA output format", {
  expect_is(tested, "matrix")
  expect_equal(dim(tested), c(1,3))
})
```

The example code used and both of these tests will be all be stored in the `test-check_na.R` file we generated previously.

{format: png}
![test-check_na.R](https://docs.google.com/presentation/d/18fovc8dhIbVwNSz9sGyEtZwi4DTUI2jqtZ3ib9tay9g/export/png?id=18fovc8dhIbVwNSz9sGyEtZwi4DTUI2jqtZ3ib9tay9g&pageid=g5d432a4243_0_28)

#### Running tests in a package 

Now that we have our first two official unit tests, it's time to test our package. To do so, return to the Build tab in the top-right panel, click on More, and select "Test Package." This will run all of the tests in `tests/testthat`. 


{format: png}
![Run package tests](https://docs.google.com/presentation/d/18fovc8dhIbVwNSz9sGyEtZwi4DTUI2jqtZ3ib9tay9g/export/png?id=18fovc8dhIbVwNSz9sGyEtZwi4DTUI2jqtZ3ib9tay9g&pageid=g5d432a4243_0_39)

The results of these tests will be visible in the Build tab. Notice that we have passed all tests! Let's keep on writing tests for our package!

{format: png}
![Test output in Build tab](https://docs.google.com/presentation/d/18fovc8dhIbVwNSz9sGyEtZwi4DTUI2jqtZ3ib9tay9g/export/png?id=18fovc8dhIbVwNSz9sGyEtZwi4DTUI2jqtZ3ib9tay9g&pageid=g5d432a4243_0_44)


### Testing Function #2: `theme_cbds()`

Our second function is slightly harder to write tests for as we're dealing with plotting. However, we can still write effective unit tests for `theme_cbds`.

In the last lesson, we ran smoke tests to ensure that our plots looked as we expected. We wanted to see that our plots had: 

- a white background
- only the left and bottom axes visible
- axis tick labels to be close to their axes
- grid lines removed

While slightly more convoluted, we can write unit tests to check all of this expected behavior of our theme.

To do this, let's again use `use_test()` to create our test files within the expected structure. But, this time, we'll create a file for the `theme_cbds` function!

```r
# create test files
usethis::use_test("theme_cbds")
```

{format: png}
![Generate new test file](https://docs.google.com/presentation/d/18fovc8dhIbVwNSz9sGyEtZwi4DTUI2jqtZ3ib9tay9g/export/png?id=18fovc8dhIbVwNSz9sGyEtZwi4DTUI2jqtZ3ib9tay9g&pageid=g5d432a4243_0_49)

This generates a new file in `tests/testthat` called `test-theme_cbds.R`. We'll delete the example code in that file and replace it with a test that tests our functions expected behaviors:

```r
# generate test plot
p <- ggplot2::ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) + 
  geom_point() +
  theme_cbds()

test_that("plot theme defaults", {
  expect_equal(as.character(p$theme$axis.ticks.length), "0cm")
  expect_is(p$theme$panel.grid.major, "element_blank")
  expect_equal(p$theme$panel.background$fill, "white")
  expect_equal(p$theme$axis.line$colour, "black")
})
```

Here, it takes understanding that information about the theme is stored in the theme argument. Then, we have to know what we've set the values for each of these theme elements to be in the `theme_cbds` that we specified. 

However, remember that the `theme_cbds()` function also took two input parameters. We want to be sure we're testing that those are working correctly. So, we'll add another test into that same file.

```r
p2 <- ggplot2::ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point() +
  theme_cbds(base_size = 18, base_family = "serif")

test_that("font and font size", {
  expect_equal(p2$theme$text$family, "serif")
  expect_equal(p2$theme$text$size, 18)
})
```

Here, we're testing to ensure that when we change the `base_size` and `base_family`, the resulting plot reflects those changes.

We save all of this test code in `test-theme_cbds.R`.

{format: png}
![test-theme_cbds.R](https://docs.google.com/presentation/d/18fovc8dhIbVwNSz9sGyEtZwi4DTUI2jqtZ3ib9tay9g/export/png?id=18fovc8dhIbVwNSz9sGyEtZwi4DTUI2jqtZ3ib9tay9g&pageid=g5d432a4243_0_62)

With these tests written, we save the file, return to the Build Tab, again select More and then click check package from the drop-down menu. You should again get a message that all tests passed!

{format: png}
![All tests pass](https://docs.google.com/presentation/d/18fovc8dhIbVwNSz9sGyEtZwi4DTUI2jqtZ3ib9tay9g/export/png?id=18fovc8dhIbVwNSz9sGyEtZwi4DTUI2jqtZ3ib9tay9g&pageid=g5d432a4243_0_74)

### Test Errors

So far we've only demonstrated what it looks like when a test passes. But, what happens if a unit test fails? For example, what if into that last test, I had mispecified what font to expect, calling for "sans" in the plot but then testing for "serif"

{format: png}
![Errors in testing](https://docs.google.com/presentation/d/18fovc8dhIbVwNSz9sGyEtZwi4DTUI2jqtZ3ib9tay9g/export/png?id=18fovc8dhIbVwNSz9sGyEtZwi4DTUI2jqtZ3ib9tay9g&pageid=g5d432a4243_0_79)

In this case, the test would (and should!) fail. The output we would get when testing the package would then provide us with a lot of information! First, in red, we see the description of the test where the failure occurred was in the "font and font size" test. We also see what file this test is in, along with the number of the line of code where the failure occurred (here, line 20). We also get a readout of what the mismatch was, and we can see that the test saw a mismatch between "sans" and "serif".

We also see the overall results, where 10 tests passed and 1 failed. Note that even though the test in line 20 failed, the test in line 21 was still run. All tests are tried, even if one fails earlier in the file. 

If you're following along and made this change to see the error, do go back and change "sans" back to "serif" so that you're tests no longer fail!

After testing, feel free to click "Install and Relaunch" to ensure that your package is still building correctly.

### Summary

In this lesson we didn't add additional functionality to the package, but we did add automated testing to the functionality we added last lesson! We added this automated testing by writing unit tests via the `testthat` package. If you added any additional functions to the package, add unit tests for those functions now. Or, add additional unit tests for the functions we've included. The quicker you get comfortable with unit testing, the easier package development will become!

### Additional Resources

- [`testthat`](https://testthat.r-lib.org/), by Hadley Wickham
- [R Packages - Testing](http://r-pkgs.had.co.nz/tests.html), by Hadley Wickham
- [`usethis` documentation](https://usethis.r-lib.org/), by Jenny Bryan and Hadley Wickham


### Slides and Video

<!-- ![Testing](YouTube Link) -->

  - [Slides](https://docs.google.com/presentation/d/18fovc8dhIbVwNSz9sGyEtZwi4DTUI2jqtZ3ib9tay9g/edit?usp=sharing)

{quiz, id: quiz_04_testing}

### Testing quiz

{choose-answers: 4} 
? To generate the files necessary to test your package's functions, what would you use?

C) `usethis::use_test`
o) `testthat::use_test`
o) `usethis::create_package()`
o) `testthat::create_package()`
o) `usethis::create_test()`
o) `testthat::create_test()`

{choose-answers: 4} 
? When using `testthat`, where are the test files containing your unit tests stored?

C) `tests/testthat/`
o) `testthat/tests/`
o) package's root directory
o) `R/`
o) DESCRIPTION
o) `tests/`

{choose-answers: 4, points: 2} 
? Use the following variable `my_value`, which of the following would pass silently (meaning, it would not* throw an error)?

```
my_value <- 6
```

C) `expect_equal(my_value, 6)`
o) `expect_match(my_value, 6)`
o) `expect_warning(my_value, 6)`
o) `expect_message(my_value, 6)`
o) `expect_error(my_value, 6)`
o) `expect_is(my_value, 6)`

{choose-answers: 4, points: 2} 
? Use the following variable `my_string`, which of the following would pass silently (meaning, it would not* throw an error)?

```
my_string <- 'learning is the best'
```

C) `expect_match(my_string, "learning")`
C) `expect_match(my_string, 'learning')`
o) `expect_match(my_string, learning)`
o) `expect_match(my_string, "Best")`
o) `expect_match(my_string, "learning is the best!")`
o) `expect_match(my_string, "Learning is the best!")`
o) `expect_match(my_string, 'Best')`

{/quiz}
