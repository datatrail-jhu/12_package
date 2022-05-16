# Code

<!-- Google Slide ID -->
<!-- 1VbKkYRdyWbtc37T7P4IhF1Dd-2SrMKSQmtyG56fVOQ8 -->

<!-- Include a slide PNG with Page_ID from this Slide Deck: -->
<!-- ![](https://docs.google.com/presentation/d/1VbKkYRdyWbtc37T7P4IhF1Dd-2SrMKSQmtyG56fVOQ8/export/png?id=1VbKkYRdyWbtc37T7P4IhF1Dd-2SrMKSQmtyG56fVOQ8&pageid=PAGE_ID) -->
<!-- or use  `didactr::gs_slide_df("1VbKkYRdyWbtc37T7P4IhF1Dd-2SrMKSQmtyG56fVOQ8")$png_markdown` -->

In the previous lessons in this course so far we've discussed R packages in general, reviewed functions and got a minimal R packages started using `create_package()` from the `usethis` package. This means that we're now ready to start adding functionality to our `cbds` package!

Earlier, we mentioned that a minimal package has a DESCRIPTION file and functions stored in .R files within the `R/` directory. It's those functions that we're going to write now and store in .R files within the `R/` directory. We'll get to the DESCRIPTION file shortly.

### Adding Functions

Functions are defined within your R package using the `function()` function, just as we discussed in the previous lesson. We've also discussed that picking good names for functions is important. And, we've mentioned that these functions are stored in .R files within the `R/` directory. What we haven't yet discussed yet is how many functions go in each .R file? 

Well, technically, it's up to you. You *could* store every single function in a single .R file, stick it in your packages `R/` directory and call it a day. *However*, that is likely *not* the best organization. With everything in a single file, it's hard for you or others reading your code to know where to look for certain functions. And, it's more difficult to document (which we'll get to later). 

So, for now, we're going to recommend that each function be stored in its own .R file. In this course we're going to add two functions to our package, which means we'll have two .R files...one for each function. We'll choose to name these files to match the names of the functions stored within. This is not required, but it makes your life easier.

As packages grow to have additional functionality, however, sometimes you'll write small "helper" functions that don't need much documentation.  These can be stored in a single file. We recommend that until you are comfortable with package development, you err on the side of more files rather than all functions in a single file.

The package we're developing here is meant to make your life easier. It's a package that will contain functionality for tasks you may find yourself doing over and over again - such as checking for missing data or changing the theme on your plots. Rather than writing the code to do this from scratch each time, we'll add functions to our package so that all you have to do is load your package into your R session and you'll be ready to go.

Many people have packages for their own personal use, including [Karl Broman](https://github.com/kbroman/broman) and [David Robinson](https://github.com/dgrtwo/drlib). Feel free to check out those links to see what others include in their personal packages. 

In the personal package we build in this course we're going to add two functions for tasks we may find ourselves doing frequently:

1. checking for missing data within a variable in a dataframe
2. changing the `ggplot2` theme

### Function Names

As discussed previously, using snake case (lower case with words separated by underscores) and verbs (action words) is a great place to start when naming functions. We also want them to be concise. So, for checking for missing data, let's go with `check_na()`, since NA is the designation for missing data in R. Now, for theme, we could use `set_theme`, but you could imagine that you may want to have different themes in different situations, so let's use `theme_cbds()`. It's not a verb, but it will be a modification of the existing `theme()` function, so it's a good name in this situation. Let's get to writing these functions!
 
### Storing Functions in .R files

Once you've got your plan and your function names, it's time to start writing functions in .R files. 

To do this, you'll first navigate to "File" > "New File" > "R Script" to create a new R Script.


![Create a new R Script file](https://docs.google.com/presentation/d/1VbKkYRdyWbtc37T7P4IhF1Dd-2SrMKSQmtyG56fVOQ8/export/png?id=1VbKkYRdyWbtc37T7P4IhF1Dd-2SrMKSQmtyG56fVOQ8&pageid=g5d3e7acaa9_0_0)

A new untitled R script will show up in the top-left hand pane.


![Untitled Script (.R) file](https://docs.google.com/presentation/d/1VbKkYRdyWbtc37T7P4IhF1Dd-2SrMKSQmtyG56fVOQ8/export/png?id=1VbKkYRdyWbtc37T7P4IhF1Dd-2SrMKSQmtyG56fVOQ8&pageid=g5d3e7acaa9_0_6)

We'll want to save this file with a helpful file name before including any code in this file. To do so, got to "File" > "Save As..."


![Save As...](https://docs.google.com/presentation/d/1VbKkYRdyWbtc37T7P4IhF1Dd-2SrMKSQmtyG56fVOQ8/export/png?id=1VbKkYRdyWbtc37T7P4IhF1Dd-2SrMKSQmtyG56fVOQ8&pageid=g5d3e7acaa9_0_11)

The Save File window that pops up is where you will type in your file name. Here, we'll save the first file as `check_na.R`. Note that this file is being stored in `/cloud/project/cbds/R`. We've mentioned previously that your package's functions should all be stored in the `R/` directory within your package. Be sure that the path to where these files should be saved is correct. Once you've typed in the filename, click "Save"


![Save script in `R/` directory](https://docs.google.com/presentation/d/1VbKkYRdyWbtc37T7P4IhF1Dd-2SrMKSQmtyG56fVOQ8/export/png?id=1VbKkYRdyWbtc37T7P4IhF1Dd-2SrMKSQmtyG56fVOQ8&pageid=g5d3e7acaa9_0_16)

Repeat this process to create a second .R file called `theme_cbds.R`. You should now have two files open in the top-left hand pane. And, if you click on the `R/` directory in the Files tab at the bottom-right, you should see these two files stored in that directory.

Now, we're ready to start writing some code!

### Function 1: `check_na()`

We'll start by writing our `check_na()` function.

#### Skeleton

When writing functions, it's typical to start with the basic function skeleton, including the function name, the `function()` call and curly braces.

Return to `check_na.R`, and let's get started with that skeleton:

```r
check_na <- function(){
  
}
```

#### Inputs & Outputs

We haven't discussed in detail yet exactly *how* we want this function to work, but I find myself frequently wanting to know how many NAs there are in a column in a dataframe. We could write a function to summarize the entire dataframe (as has been done in the `skimr` and `naniar` packages discussed in previous lectures), but let's just start simple. 

If we give the function a column of information as an input, can the function return the following three pieces of information:

1. number of observations
2. number of missing observations
3. number of *non*-missing observations

This means that the input will be information that could be stored in a column from a dataframe.

The output will be a summary of the three pieces of information above.

With that plan in mind, we can start building our function. Here, we've provided `variable` as the single input into the function we're writing we specified that we need and have included a few comments to help us plan what code we'll need to write within our function.

```r
check_na <- function(variable){
  # calculate number of observations
  
  # calculate number of missing observations
  
  # nonmissing = total = missing
  
  # return summary

}
```

Now we can start to fill in our function with code that accomplishes the plan we've laid out with comments:

```r
check_na <- function(variable){
  # calculate number of observations
  obs <- length(variable)

  # calculate number of missing observations
  nas <- sum(is.na(variable))

  # nonmissing = total = missing
  non_na <- obs - nas

  # return summary
  out <- cbind(obs, nas, non_na)
  colnames(out) <- c("N", "NAs", "Non-NAs")
  return(out)
}
```


![`check_na()` function in RStudio Cloud](https://docs.google.com/presentation/d/1VbKkYRdyWbtc37T7P4IhF1Dd-2SrMKSQmtyG56fVOQ8/export/png?id=1VbKkYRdyWbtc37T7P4IhF1Dd-2SrMKSQmtyG56fVOQ8&pageid=g5d3e7acaa9_0_36)


Remember that defining a function just creates the function. It does *not* execute the function. To execute this function, we would want to save the file `check_na.R`, then click "Install and Restart"in the Build top at the top right-hand portion of RStudio Cloud. Remember, this rebuilds your package, so the `check_na()` function is now available to you when your package is loaded into memory (using `library(cbds)`, which executes when you click "Install and Restart").


![Install and Restart](https://docs.google.com/presentation/d/1VbKkYRdyWbtc37T7P4IhF1Dd-2SrMKSQmtyG56fVOQ8/export/png?id=1VbKkYRdyWbtc37T7P4IhF1Dd-2SrMKSQmtyG56fVOQ8&pageid=g5d3e7acaa9_0_46)

Now you can test out the functionality of your package's first function! 

Let's first test it on a column from the `iris` dataset. We've seen this dataset before, and it includes information about different iris flowers. 


![`iris` dataset](https://docs.google.com/presentation/d/1VbKkYRdyWbtc37T7P4IhF1Dd-2SrMKSQmtyG56fVOQ8/export/png?id=1VbKkYRdyWbtc37T7P4IhF1Dd-2SrMKSQmtyG56fVOQ8&pageid=g5d3e7acaa9_0_41)

Remember: To execute a function you call the function's name and then provide the necessary inputs within the parentheses:

```r
check_na(iris$Sepal.Length)
```


![Testing `check_na()` on the `iris` dataset](https://docs.google.com/presentation/d/1VbKkYRdyWbtc37T7P4IhF1Dd-2SrMKSQmtyG56fVOQ8/export/png?id=1VbKkYRdyWbtc37T7P4IhF1Dd-2SrMKSQmtyG56fVOQ8&pageid=g5d3e7acaa9_0_16)

Note in the output we see that there are 150 observations and no missing data.

Let's make sure that this works for data where there *is* missing information. We've worked with the `msleep` (mammalian sleep) dataset previously from `ggplot2`. You may recall that the variable `sleep_rem` from that dataset had missing information. So, let's test out our function on that variable:

```r
library(ggplot2)
check_na(msleep$sleep_rem)
```


![Testing `check_na()` on the `msleep` dataset](https://docs.google.com/presentation/d/1VbKkYRdyWbtc37T7P4IhF1Dd-2SrMKSQmtyG56fVOQ8/export/png?id=1VbKkYRdyWbtc37T7P4IhF1Dd-2SrMKSQmtyG56fVOQ8&pageid=g5d3e7acaa9_0_56)

Perfect! Our function correctly calculates that there are 22 missing values in this variable! 

When we test out our functions in the console like this, we're doing what are called **smoke tests**. We're checking quickly to ensure that our function works. However, there are more formal tests called **unit tests** that we're going to discuss in the next lesson. So, keep this idea of testing out the functions within your package in the back of your mind for now and we'll discuss formal testing in the next lesson!

And, just like that, we've accomplished our first goal! We've got our first function in our `cbds` package!

Now for our second function!

  
### Function 2: `theme_cbds()`

Often we want to customize our plots to look a certain way. We want to change the default settings in `ggplot2` to better fit the look we're going for in our project. However, it's often that we're working on a project and we want that look to apply across all of our plots in the project we're working on. This leads us to want a function that will change the theme across all plots in a project. We can write a function to accomplish this!

In fact, others have already done this! We're going to be modifying code from [Karl Broman](https://github.com/kbroman/broman/blob/master/R/theme_karl.R)'s personal R package to accomplish this for our needs.

In our [Data Visualization](https://leanpub.com/universities/courses/jhu/cbds-visualization) course, we discussed a number of best practices in data visualization. One general theme we'll focus on here is that each bit of ink on the plot should serve a purpose. For example, the gray background that we have by default in `ggplot2` doesn't *really* serve a purpose, so in our `theme_cbds()` we'll get rid of it. We'll also make it easy to change the font and to increase or decrease the font size on our plots within this theme.

For anything that you want to change from one plot to the next, you'll have to include it as an argument (input) to your function. The two things we want to be able to change are the font size (`base_size`) and font (`base_family`). The third argument you see here is just three dots `...`. This is officially known as an ellipsis.

```r
theme_cbds <- function(base_size = 12, base_family = "", ...)
{

}

```

#### Aside: ellipsis

In R (and other programming languages), the ellipsis (`...`) allows functions to take any number of named or unnamed arguments. While this may seem a bit confusing, there are really only two cases where you would want to use this:

1. When your function calls *other* functions within it, and these functions can take additional arguments. This allows you to pass arguments into your function that will then be applied to the functions you use within your function.
2. When you need your function to be able to take a variable number of arguments.

Here, we'll see a case of Situation #1. 

With our skeleton function established, now it's time to figure out exactly what it is we want the aesthetic of our `cbds` plots to be.

Generally we'll want:

- a white background
- only the left and bottom axes to be present
- axis tick labels to be close to their axes
- grid lines removed

A lot of this (white background, left and bottom axes present, and grid lines removed) can be accomplished by setting the theme to [`theme_classic()`](https://ggplot2.tidyverse.org/reference/ggtheme.html), where we pass the input parameters of our function as inputs to that function.

However, to move the axis text labels closer, we'll need to modify `theme()` directly.

Our general approach will be as follows:

```r
theme_cbds <- function(base_size = 12, base_family = "", ...){
  # change to theme_classic
  
  # move axis ticks closer to axes

}
```

Now it's just time to fill in the code.

From [`ggplot2`'s documentation](https://ggplot2.tidyverse.org/reference/theme_get.html), we learn that we can use `%+replace%` to modify elements in a theme.

Additionally, you'll note that we're using `ggplot2::` any time we want to call a function from the `ggplot2` package. This is a best practice when writing functions within a package. You'll want to explicitly call the package name and the function you want to use, separated by two colons (`::`) any time you call another package's function.

Finally, you'll see that the ellipses is called within `ggplot2::theme()`. This means that if you were to pass additional arguments into your `theme_cbds()` function call, they would be applied to change additional aspects of the plot's `theme()`. 

```r
theme_cbds <- function(base_size = 12, base_family = "", ...){
  ggplot2::"%+replace%"(
    # change to theme_classic
    ggplot2::theme_classic(base_size = base_size,
                           base_family = base_family),

    # move axis ticks closer to axes
    ggplot2::theme(axis.ticks.length = grid::unit(0, "cm"), ...)
  )
}
```


![`theme_cbds`](https://docs.google.com/presentation/d/1VbKkYRdyWbtc37T7P4IhF1Dd-2SrMKSQmtyG56fVOQ8/export/png?id=1VbKkYRdyWbtc37T7P4IhF1Dd-2SrMKSQmtyG56fVOQ8&pageid=g5d3e7acaa9_0_56)

Just as with the first function example, we have to test out to make sure this function is behaving as we expect it to! Time for a few quick smoke tests.

After clicking "Install and Restart" in the Build tab, we can then test this function out on the `iris` dataset.

First, let's remind ourselves what the `ggplot2` defaults look like:

Note that if you're testing this out on a space where `ggplot2` has not been installed, you may have to uncomment and run the first line below:

```r
# install.packages("ggplot2")
library(ggplot2)

# generate default plot
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) + geom_point()
```


![Plot with default settings from `ggplot2`](https://docs.google.com/presentation/d/1VbKkYRdyWbtc37T7P4IhF1Dd-2SrMKSQmtyG56fVOQ8/export/png?id=1VbKkYRdyWbtc37T7P4IhF1Dd-2SrMKSQmtyG56fVOQ8&pageid=g5d3e7acaa9_0_78)

Now, let's utilize our new function from our package to improve this plot's aesthetics! 

```r
# use cbds theme
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) + 
  geom_point() +
  theme_cbds()
```


![Plot with `cbds_theme`](https://docs.google.com/presentation/d/1VbKkYRdyWbtc37T7P4IhF1Dd-2SrMKSQmtyG56fVOQ8/export/png?id=1VbKkYRdyWbtc37T7P4IhF1Dd-2SrMKSQmtyG56fVOQ8&pageid=g5d3e7acaa9_0_86)

That looks pretty great! A lot cleaner plot now that we've applied our modified theme to it!

But, don't forget that we have two inputs to our theme that we want to ensure are behaving as expected. So, let's generate the same plot but change the font and increase the font size by passing this information in as arguments to our function.

```r
# use cbds theme
# change font and font size
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) + 
  geom_point() +
  theme_cbds(base_size = 18, base_family = "serif")
```


![Plot with `cbds_theme`, serif font, and increased font](https://docs.google.com/presentation/d/1VbKkYRdyWbtc37T7P4IhF1Dd-2SrMKSQmtyG56fVOQ8/export/png?id=1VbKkYRdyWbtc37T7P4IhF1Dd-2SrMKSQmtyG56fVOQ8&pageid=g5d3e7acaa9_0_94)

Looks like our package with two functions is working as expected! We've got a different font and a larger font size for the text.

### Summary

At this point, we have a pretty minimal package - it does have two functions in it, but it is missing documentation and vignettes. And, we haven't yet discussed the DESCRIPTION file. So, feel free to add any additional functions you may want to have in your package at this time. And then let's continue on to the following lessons to take this package from a minimal package to a *strong* and well-documented package!

### Additional Resources

- [`testthat`](https://testthat.r-lib.org/), by Hadley Wickham
- [R Packages - R Code](https://r-pkgs.org/r.html), by Hadley Wickham and Jenny Bryan

### Slides and Video

![Code](https://www.youtube.com/watch?v=QwUkZ7zaIwQ)

  - [Slides](https://docs.google.com/presentation/d/1VbKkYRdyWbtc37T7P4IhF1Dd-2SrMKSQmtyG56fVOQ8/edit?usp=sharing)

{quiz, id: quiz_03_code}

### Code quiz

{choose-answers: 4} 
? What are ellipsis used for when writing functions?

C) Passing a variable number of arguments as inputs to a function
C) Allows functions to take a variable number arguments
o) Removes the need to define a function
o) Removes the need to specify any input arguments
o) Automatically chooses best name for your function
o) Executes function as it's defined

{choose-answers: 4} 
? What type of tests did we write in this lesson?

C) smoke tests
o) unit tests
o) integration tests
o) software tests
o) system testing
o) acceptance testing

{choose-answers: 4} 
? How are functions stored within R packages?

C) .R files within the `R/` directory
o) .R files within the root directory
o) .Rmd files within the `R/` directory
o) .Rmd files within the root directory
o) .txt files within the `R/` directory
o) .txt files within the root directory
o) DESCRIPTION files within the `R/` directory
o) DESCRIPTION files within the root directory

{choose-answers: 4} 
? What does the `check_na()` function we wrote in this lesson accomplish?

C) calculates missingness information for a variable
o) calculates missingness information on a dataframe
o) calculates the number of missing observations across a dataframe
o) modifies the theme for plots generated using `ggplot2`
o) generates summary statistics for a dataframe
o) generates a plot visualizing missingness for a variable
o) generates a plot visualizing missingness for a dataframe

{choose-answers: 4} 
? If you wrote a function called `summarize_missingness()`, what would be the best name for the file where the code for that function was stored?

C) summarize_missingness.R
o) summarize_missingness.Rmd
o) summarize_missingness.txt
o) functions.R
o) functions.Rmd
o) functions.txt
o) summarize.R
o) summarize.Rmd
o) summarize.txt

{/quiz}
