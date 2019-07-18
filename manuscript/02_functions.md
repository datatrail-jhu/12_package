# Functions

<!-- Google Slide ID -->
<!-- 1Bo0j-Ct0phh9ygYe9LOsmd-J8YNN92H5OS_kPtynEHs -->

<!-- Include a slide PNG with Page_ID from this Slide Deck: -->
<!-- ![](https://docs.google.com/presentation/d/1Bo0j-Ct0phh9ygYe9LOsmd-J8YNN92H5OS_kPtynEHs/export/png?id=1Bo0j-Ct0phh9ygYe9LOsmd-J8YNN92H5OS_kPtynEHs&pageid=PAGE_ID) -->
<!-- or use  `didactr::gs_slide_df("1Bo0j-Ct0phh9ygYe9LOsmd-J8YNN92H5OS_kPtynEHs")$png_markdown` -->


Functions were covered in more detail in the [Introduction to R](https://leanpub.com/universities/courses/jhu/cbds-intro-r) course in the Cloud-Based Data Science Course Set. We won't be covering functions in as much detail here, but will just refresh everyone's memory in this lesson, so if you need a refresher, please refer back to the functions lesson in that course.

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

### Function Example

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

### Summary

In this lesson, we've covered *just the basics* to review functions in R; however, we'll be creating a package throughout this course and writing more functions. If you'd like more information and practice than provided in this lesson before moving on to creating a package in this course, check on the additional resources below.

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


{/quiz}
