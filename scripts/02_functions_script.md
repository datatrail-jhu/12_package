Functions were covered in more detail in the Introduction to R] course in the Cloud-Based Data Science Course Set. We won't be covering functions in as much detail here, but will just refresh everyone's memory in this lesson, so if you need a refresher, please refer back to the functions lesson in that course. We review functions here as they are the operational unit of packages. As you continue to add functionality to the `cbds` package skeleton we created in the previous lesson, you'll need to be comfortable with writing functions. 

Functions help make your code more modular. This means that instead of having a single file with all of your code running as a script from top to bottom, you can instead write user-defined functions for processes that you'll do over and over again. For example, if you are working with multiple, similar datasets and have to carry out the same operations on each dataset, rather than copying and pasting the code to do so and changing the DataFrame you're operating on, instead, you can write a single function, including the necessary code and then execute that function on each dataset. 

In doing this, you accomplish a few things. You make your code more readable. Code is read more often than it is written. By having a single function, readers of your code only have to understand that code block once. When they encounter its use, they already know what the code will do. And, it will lead to less code overall to read. Second, it simplifies updating your code. If you have the code in a single function and then use that function throughout, if a change needs to happen, you have to only change it in a single location, rather than looking for all the places you've copy and pasted the code. If you find yourself copy and pasting code more than once, write a function. Third, You avoid accidental errors. If you're using related and very similar code in multiple places rather than writing functions, you have to remember where you copy and pasted and how many places you've done so. With functions, you have a single copy and only have to update that, minimizing the chance of errors and forgetting to edit your code in more than one place. 

Hopefully, if you're at the point in your learning that you're ready to start writing packages, you've gotten more comfortable with using functions from others' packages and are getting more comfortable with writing your own functions. Packages are built around writing functions, so you'll get extra practice in this lesson and hopefully by the end of this course, it'll be close to second nature. When writing packages, you'll write a lot of functions. The general rule is that you should write a function whenever you've copy and pasted code more than once. However, in packages, functions are the operational unit - the thing that we're going to be building a package upon, so we'll be thinking about building our packages with a function-first mentality!

As a reminder, there are three main components to a function. Each function has a, name, argument(s), and a body In code, in its most simple form, defining a function looks as you see here.

As discussed in the Introduction to R course, naming your function is an important step. So important, that we'll review it here. In almost every case, function names should be verbs - or action words. This makes sense as functions do things; they carry out actions. Function names should be verbs, explain what the function does, be succinct, use snake case, and should not have a name used elsewhere.


In the Introduction to R course, we provided an example function of converting an input temperature in Celsius to Fahrenheit. Note that this code simply creates and defines the function. 

To actually use the function to convert degrees Celsius to Fahrenheit, you have to execute the function.

We also discussed previously that this function could be generalized to convert in both directions (to Celsius or to Fahrenheit) by utilizing additional arguments. To make the function clearer, we've also included comments.

In this lesson, we've covered just the basics to review functions in R; however, we'll be creating a package throughout this course and writing more functions!


