# Functions

<!-- Google Slide ID -->
<!-- 1Bo0j-Ct0phh9ygYe9LOsmd-J8YNN92H5OS_kPtynEHs -->

<!-- Include a slide PNG with Page_ID from this Slide Deck: -->
<!-- ![](https://docs.google.com/presentation/d/1Bo0j-Ct0phh9ygYe9LOsmd-J8YNN92H5OS_kPtynEHs/export/png?id=1Bo0j-Ct0phh9ygYe9LOsmd-J8YNN92H5OS_kPtynEHs&pageid=PAGE_ID) -->
<!-- or use  `didactr::gs_slide_df("1Bo0j-Ct0phh9ygYe9LOsmd-J8YNN92H5OS_kPtynEHs")$png_markdown` -->


Functions were first introduced in the [Introduction to R](https://leanpub.com/universities/courses/jhu/cbds-intro-r) course in the Cloud-Based Data Science Course Set. If you'd like a review before this lesson, please refer back to the functions lesson in that course.

We review functions here as they are the operational unit of packages. As you continue to add functionality to the `cbds` package skeleton we created in the previous lesson, you'll need to be comfortable with writing functions. 

### Functions: Review

Functions help make your code more modular. This means that instead of having a single file with all of your code running as a script from top to bottom, you can instead write user-defined functions for processes that you'll do over and over again. 

{format: png}
![User-Defined Functions](https://docs.google.com/presentation/d/1Bo0j-Ct0phh9ygYe9LOsmd-J8YNN92H5OS_kPtynEHs/export/png?id=1Bo0j-Ct0phh9ygYe9LOsmd-J8YNN92H5OS_kPtynEHs&pageid=g5d13a53002_0_0) 

For example, if you are working with multiple, similar datasets and have to carry out the same operations on each dataset, rather than copying and pasting the code to do so and changing the DataFrame you're operating on, instead, you can write a single function, including the necessary code and then execute that function on each dataset. 

In doing this, you accomplish a few things:

1. You make your code **more readable**. Code is read more often than it is written. By having a single function, readers of your code only have to understand that code block once. When they encoutner its use, they already know what the code will do. And, it will lead to less code overall to read.
2. It **simplifies updating your code**. If you have the code in a single function and then use that function throughout, if a change needs to happen, you have to only change it in a single location, rather than looking for all the places you've copy and pasted the code. If you find yourself copy and pasting code more than once, write a function.
3. You **avoid accidental errors**. If you're using related and very similar code in multiple places rather than writing functions, you have to remember where you copy and pasted and how many places you've done so. With functions, you have a single copy and only have to update that, minimizing the chance of errors and forgetting to edit your code in more than one place. 

#### When To Write

Hopefully, if you're at the point in your learning that you're ready to start writing packages, you've gotten more comfortable with using functions from others' packages and are getting more comfortable with writing your own functions.

Packages are built around writing functions, so you'll get extra practice in this lesson and hopefully by the end of this course, it'll be close to second nature.

When writing packages, you'll write a lot of functions. The general rule is that you should **write a function whenever you've copy and pasted code more than once**. However, in packages, functions are the operational unit - the thing that we're going to be building a package upon, so we'll be thinking about building our packages with a function-first mentality!

{format: png}
![Avoid copying and pasting code more than once](https://docs.google.com/presentation/d/1Bo0j-Ct0phh9ygYe9LOsmd-J8YNN92H5OS_kPtynEHs/export/png?id=1Bo0j-Ct0phh9ygYe9LOsmd-J8YNN92H5OS_kPtynEHs&pageid=g5d13a53002_0_5) 


#### How To Write

As a reminder, there are three main components to a function. Each function has a:

1. name
2. argument(s)
3. body

In code, in its most simple form, defining a function looks as follows:

```r
name <- function(arguments){
	body
}
```
As discussed in the [Introduction to R](https://leanpub.com/universities/courses/jhu/cbds-intro-r) course, naming your function is an important step. So important, that we'll review it here.

In almost every case, **function names should be verbs** - or action words. This makes sense as functions **do** things; they carry out actions. (On the other hand, variable names tend to be nouns, as they represent objects or *things*.)

Function names should:

1. be verbs
2. explain what the function does
3. be succinct
4. use snake case (i.e. `make_snake_case()` could be a function that takes a string as an input and coverts the string to snake case, where all words are lowercase and separated by underscores)
5. not have a name used elsewhere (i.e. don't use `mutate()` as that's used in `dplyr`)

### Function Example: Temperature

In the [Introduction to R](https://leanpub.com/universities/courses/jhu/cbds-intro-r) course, we provided an example function of converting an input temperature in Celsius to Fahrenheit:


```r
celsius_to_fahrenheit <- function(){
  C <- readline(prompt="Enter a value in Celsius: ")
  F <- as.integer(C) * (9/5) + 32
  return(paste("The entered Celsius temperature is", F, "degrees Fahrenheit."))
}
```

Note that this code simply creates and **defines the function**. 

To actually *use* the function to convert degrees Celsius to Fahrenheit, you have to **execute the function**:

```r
> celsius_to_fahrenheit()
Enter a value in Celsius: 70
[1] "The entered Celsius temperature is 158 degrees Fahrenheit."
```

We also discussed previously that this function could be generalized to convert in both directions (to Celsius *or* to Fahrenheit) by utilizing **additional arguments**. To make the function clearer, we've also **included comments**:

```r
convert_temp <- function(temp, unit = "C"){
if (unit=="C"){
    # if temp in C, convert to F
    D <- temp * (9/5) + 32
} else if (unit=="F") {
    # if temp in F, convert to C
    D <- (temp - 32) * (5/9)
} else {
    D <- message("Please enter a correct unit -- either F or C")
}
return(D)
}
```

### Function Example: Even vs. Odd

Sometimes the best way to understand a topic is to familiarize yourself with multiple examples. We'll walk through two more function examples, explaining each part along the way. These are not functions we'll include in the package we're building in this course and are instead just meant to help you gain a deeper understanding of writing functions in R.

Here, we'll be building a function that determines whether or not an input value is even or odd. Something you may be less familiar with at this point is the modulo operator: `%%`. This operator divides the number on the left hand side of the operator with that on the right-hand side and returns the remainder. For example if you do the following mathematically: `7 / 3` in R, you would see that 7 divided by 3 is 2.3333. This is because 3 goes into 7 twice, with one remainder. If you're interested in only returning that 1 remainder, you would use the modulo operator. So, in R, `7 %% 3` returns 1 - the remainder of 7 divided by 3!

This operator can be helpful in many situations, one of which is determining whether a number is even or odd. For example, if a value divided by 2 returns a remainder of zero, you know that number is even! Let's write a function to do just that!

```r
## generate the function
even_odd <- function(value){
    if (value %% 2 == 0){ 
        print("even")
    }else{
        print("odd")
    }
}
```

Here, we see that the function's name is `even_odd` and that it takes one input parameter (`value`).

So if we created this function by running the code you see above, you would then be able to execute the function by calling the function name and providing an input variable:

```r
## execute the function
even_odd(6)
even_odd(17)
```

When we execute the two lines of code here we see that when 6 is the input argument, the function correctly returns "even". When 17 - and odd number - is the input argument, the function correctly returns "odd". 

**Naming the arguments**

As a reminder, R knows that you're specifying the input value even though you haven't explicitly stated that this is the `value` argument. To be more explicit and make your code even more readable, it can be helpful to explicitly state the argument's name in the function call. The code here is functionally the same as the code previously; however, we've added `value = ` to be clear what argument we're inputting to our function.

```r
## naming the argument
even_odd(value = 6)
even_odd(value = 17)
```

#### Adding warnings

Something we haven't talked about previously is checking that the inputs to your functions are what it was expecting. For example, our function for checking even vs. odd numbers works great if we give it a number. What happens if we accidentally give it a string, where checking even vs. odd does not make sense? 

```r
## will produce an error
even_odd('cbds')
```

In this example, we get the error: "Error in value%%2 : non-numeric argument to binary operator"

This is because it doesn't make sense to try to calculate the remainder of a string divided by 2. It is often the case in functions that you only want to operate on a certain type of input. When this is the case, it's best to check that the input to your function is what you expected.

One way to do something like this is to add a warning message, using the `warning()` function:

```r
even_odd <- function(value){
    # add warning message
    if(!is.numeric(value)){
       warning("Input value is not numeric.") 
    }
    if (value %% 2 == 0){ 
        print("even")
    }else{
        print("odd")
    }
}
```

For example, when we create the function here, we add an if statement at the top of the function to check if the input to value is not numeric and if it is not numeric print a warning that the "Input value is not numeric".

However, one caveat to this is that a warning doesn't stop the code from running. It will still attempt to run the function with this input. So, if you try to execute this function without a numeric input (for example running `even_odd('cbds')`), you'll see the warning; however, you'll still also get an error message.

#### Adding stop

If we replace `warning()` with `stop()`, the function will not execute past where `stop()` is encountered. This way, the user (you, in this case) only sees the specified error message.

```r
even_odd <- function(value){
    # stop if non-numeric
    if(!is.numeric(value)){
       stop("Input value is not numeric.") 
    }
    if (value %% 2 == 0){ 
        print("even")
    }else{
        print("odd")
    }
}
```

Using this function, when we then run `even_odd('cbds')`, the only thing returned is "Error in even_odd("cbds") : Input value is not numeric."

Note that what is returned from the function with a numeric input variable is still what we expect. `even_odd(6)` still returns "even".

It's good practice to add checks using `warning()` and `stop()` to ensure your functions are behaving as you expected them to when you wrote them.

### Function Example: Exponentiation

For another example, let's consider the case of exponentiation. In math you can exponentiate numbers. For example, 6 to the power 2 (`6^2`) means take the number 6 and multiply it by itself (`6 * 6`). 6 to the power 3 (`6^3`) says take 6  and then multiply itself again (`6 * 6 * 6`). This idea of exponentiation is very helpful, so it can be helpful to have a function that does this for you:

```r
exponentiate <- function(number, exponent){   
    out <- number ^ exponent
    return(out)
}
```

Here, we've generated a function called `exponentiate` that takes two parameters (`number`, `exponent`). Within the function, we see that the `number` is raised to the power `exponent`. This value is then stored in the variable `out`. This variable `out` is then returned from the function.

For example, after defining this function, we could execute it by running `exponentiate(6,2)` and it would return the value "36".

We could also be clearer about our arguments and run `exponentiate(number = 6, exponent = 2)`. This would also return "36".

**Default Parameters**

However, we could improve this function taking things one step further by specifying a default argument. In the case of exponentiation, it's most comment to raise something to the power 2. So, we may want to set the default argument for `exponent` to be 2. We do this within the arguments of `function()`. When we do this, if no value is provided when the `exponentiate()` function is executed, then R will use the default value 2.

```r
exponentiate <- function(number, exponent = 2){    
    out <- number ^ exponent
    return(out)
}
```
    
For example, if we created this function and then ran `exponentiate(6)` or `exponentiate(number = 6)`, R would return "36", as it knew to use the number 2 as the value for the `exponent` argument.  

However, we aren't locked into using 2 as the only possible value for exponentiation. If we call the function, we can specify a different value for this argument. `exponentiate(6, 3)` or `exponentiate(number = 6, exponent = 3)` would raise 6 to the power 3, returning the value "216".

Setting default values for arguments within functions can be very helpful and save you time.

### Summary

In this lesson, we've reminded you of  *the basics* of writing functions in R and walked through a few additional examples; however, we'll be creating a package throughout this course and writing more functions. If you'd like more information and practice than provided in this lesson before moving on to creating a package in this course, check on the additional resources below.

### Additional Resources

* [Chapter 19: Functions in r4ds](http://r4ds.had.co.nz/functions.html), by Hadley Wickham in R for Data Science
* [Functions](http://adv-r.had.co.nz/Functions.html), by Hadley Wickham in Advanced R
* [Writing Functions](https://nicercode.github.io/intro/writing-functions.html) and [Functions](https://nicercode.github.io/guides/functions/), blog posts from [Nice R Code](https://nicercode.github.io/)
*
### Slides and Video

<!-- ![Functions](YouTube Link) -->

  - [Slides](https://docs.google.com/presentation/d/1Bo0j-Ct0phh9ygYe9LOsmd-J8YNN92H5OS_kPtynEHs/edit?usp=sharing)

{quiz, id: quiz_02_functions}

### Functions quiz

{choose-answers: 4, points: 2} 
?1 Take a look at the source code below and determine what the best name for the following function would be (to replace the current name `function_name`):

```r
function_name <- function(a, b) {
  sum(a + b) / 2
}
```

C) average_two_values
o) sum_two_values
o) subtract_two_values
o) AverageTwoValues
o) SumTwoValues
o) SubtractTwoValues
o) average
o) subtract
o) sum

{choose-answers: 4, points: 2} 
?1 Take a look at the source code below and determine what the best name for the following function would be (to replace the current name `function_name`):

```r
function_name <- function(a, b) {
  sum(a + b)
}

```

C) sum_two_values
o) average_two_values
o) subtract_two_values
o) AverageTwoValues
o) SumTwoValues
o) SubtractTwoValues
o) average
o) subtract
o) sum

{choose-answers: 4, points: 2} 
?2 How many arguments does the following function take?

```r
function_name <- function(a, b) {
  sum(a + b)
}

```
C) 2
o) None
o) 1
o) 3
o) it depends

{choose-answers: 4, points: 2} 
?3 How many arguments have default values in this function?

```r
function_name <- function(a, b) {
  sum(a + b)
}
```
C) None
o) 2
o) 1
o) 3
o) it depends

{choose-answers: 4, points: 2} 
?4 Given the function below, what would be the output of `emphasize_text('shannon')`

```r
emphasize_text <- function(text){
  out = toupper(text)
  out = paste0(out, "!!!")
  print(out)
}
```

C) "SHANNON!!!"
o) "Shannon!!!"
o) "Shannon"
o) "SHANNON"
o) "!!!"
o) "Shannon!"
o) "SHANNON!"


{choose-answers: 4} 
?5 What function do you include within your function definitions in order to state explicitly what information to store as the output of the function? 

C) `return()`
o) `emphasize_text()`
o) `function()`
o) `print()`
o) `out()`
o) `output()`

{points:3}
?6 Within the swirl project in the [Cloud-based Data Science Space on RStudio Cloud](https://rstudio.cloud/spaces/20345/join?access_code=n4b8J1s0XmWctSy83%2BEXbGAwj7rKcuFMI7WJEJFD) use the `swirl()` function and navigate to the course: `CBDS How To Build an R Package`. Then, navigate to the lesson `L02 Functions Q01 Swirl`. Complete this swirl module on object assignment. Once complete, paste the code provided at the end of the swirl module here.

! /.+(5kUr|0k2z|b4zW|eYiF|8XTc|YajI|Ko7J|jxQO|azkv|SCas).+/i

{points:3}
?7 Within the same course on swirl: `CBDS How To Build an R Package`, navigate to the lesson `L02 Functions Q02 Swirl`. Complete this swirl module on character type variables. Once complete, paste the code provided at the end of the swirl module here.

! /.+(0st8|uTWV|0T2Q|UIyz|QRFA|M6AW|bwJW|vSjV|euFp|FuSM).+/i


{points:3}
?8 Within the same course on swirl: `CBDS How To Build an R Package`, navigate to the lesson `L02 Functions Q03 Swirl`. Complete this swirl module on character type variables. Once complete, paste the code provided at the end of the swirl module here.

! /.+(Dydb|4UT1|OVGf|7OQp|Hj9a|cGqF|Hdq6|Dtwv|QFUu|9CUW).+/i

{/quiz}
