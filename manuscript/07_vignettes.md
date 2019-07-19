
# Vignettes

<!-- Google Slide ID -->
<!-- 1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ -->

<!-- Include a slide PNG with Page_ID from this Slide Deck: -->
<!-- ![](https://docs.google.com/presentation/d/1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ/export/png?id=1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ&pageid=PAGE_ID) -->
<!-- or use  `didactr::gs_slide_df("1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ")$png_markdown` -->

So far in this course we've discussed what R packages are, reviewed functions, and created a package with a complete DESCRIPTION file (including all metadata) and two functions, including both tests and documentation for those functions. At this point our package is in pretty good shape. 

It has documentation explaining to users how to use each function, which is great! What it doesn't have yet is long-form documentation in the form of vignettes. Rather than object documentation, which tells users how to use each individual piece of your package, vignettes help explain how the whole package fits together. It explains the functionality within your package and explains how it all works together, showing users through examples.

### Vignettes

Vignettes are long-form documentation in that they demonstrate how all the pieces of your package fit together. Admitedly, the package we're creating in this course only has two pieces and they aren't necessarily related; however, as you add functionality to your personal package, you could see that some pieces may be more related to one another. Grouping these together within your vignette than makes sense. 

And, the best way to do this involves technology with which you're likely already familiar! Vignettes are written as R Markdown documents. (If you're unfamiliar with R Markdown, refer back to the [Introduction to R](https://leanpub.com/universities/courses/jhu/cbds-intro-r) course.) This means that it's very easy to intermingle code and text explaining the code/thought process together in the same document. Good vignettes that a good package and make it a great package because it makes it easier for users to *just get started* with the package.

We'll discuss how to create a vignette for our `cbds` package in this lesson, but as our package is a personal package, rather than the typical package which sets out to solve a particular problem, we are going to spend more time discussing vignettes for other packages that are well-documented to demonstrate just how helpful vignettes can be first!

### Package Vignettes

Package vignettes should accomplish a few things:

1. Explain what the package does
2. Include code demonstrating the functionality
3. Show & explain outputs from package's functionality

To do this successfully, it's important to keep in mind that while *you* have written this code and been using these functions, your users have not. When they arrive at your vignettes, assume that the users are beginners. It's best to put yourself in the mind of a beginner before you set out to write these documents.

#### How many vignettes?

Packages can have as many vignettes as you'd like. Smaller packages likely only require a single vignette demonstrating how to get started and the main functionality. However, larger packages should likely be organized into multiple vignettes, with each vignette being self-contained. This means that each vignette can demonstrate a different part or set of tasks accomplished by your package. (However, if each vignette is completely unrelated to the others, it may be a good time to consider whether or not the functionality should be broken up into different packages!)

#### Viewing vignettes: `browseVignettes()`

To see the vignettes in a package, you can use the `browseVignettes()` function with the packagename of interest as an input. For example, to see the vignettes for `googlesheets`, which we'll discuss in detail next, just execute `browseVignettes("googlesheets")`. This will [open up a URL](https://cran.r-project.org/web/packages/googlesheets/vignettes/) in your web browser.

{format: png}
![`browseVignettes("googlesheets")`](https://docs.google.com/presentation/d/1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ/export/png?id=1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ&pageid=g5dd7d7062c_0_0)

### Vignettes: `googlesheets`

To get a sense of what vignettes a package should have and what they look like, we'll take a look more closely at the vignettes within the `googlesheets` package. At the time of writing this lesson, there are four vignettes in the `googlesheets` package:

1. Formulas and formatted numbers
2. googlesheets Basic Usage 
3. Managing Auth Tokens 
4. Use an alternative browser 

From their titles you can see that each plays a different role. The Basic Usage vignette is likely where most people would start. However, if after using this package, you found yourself running into trouble working with formulas in googlesheets, you'd likely check out the "Formulas and formatted numbers" vignette. If you were struggling to understand your authorization in the package, you would look at the "Managing Auth Tokens" vignette. And, if you wanted to use an alternative browser, you'd check out the last vignette listed above.

As the "googlesheets Basic Usage" vignette is where most people would start, that is the vignette we'll focus on most closely in this lesosn. The Vignette is viewable at [this link](https://cran.r-project.org/web/packages/googlesheets/vignettes/basic-usage.html) if you'd like to scroll through and have a look for yourself. (Note that vignettes can and should be updated overtime, so the images here may look different from what you see in the future!)

{format: png}
!["googlesheets Basic Usage"](https://docs.google.com/presentation/d/1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ/export/png?id=1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ&pageid=g5dd7d7062c_0_82)
  
At the top of the vignette, in addition to the title, you have information about who authored the vignette and when it was last updated. And, in the most helpful vignettes, there is a table of contents where you can see clearly what's included throughout the vignette. By looking at the topics here you can see that all of the basic functions you would want to accomplish using the `googlesheets` package (reading in a google sheet, creating a new google sheet, editing an existing sheet, etc.) are all documented within this vignette.

Let's focus in on ["List Your Google Sheets"](https://cran.r-project.org/web/packages/googlesheets/vignettes/basic-usage.html#list-your-google-sheets). If we click on that link within the table of contents, we'll be brought to the part of the vignette that explains how to accomplish listing all of your google sheets.

{format: png}
![Vignettes include text, code and outputs to demonstrate functionality](https://docs.google.com/presentation/d/1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ/export/png?id=1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ&pageid=g5dd7d7062c_0_96)

In this bit of the vignette it becomes clear through the text provided what this function is used for and then, through the code, it becomes clear *how* to use it. Now, you *could* have read the documentation for that function and learned similar information, but with the vignette you then have all the information in one place to tell you what you can do after you list your Google Sheets using this function. It demonstrates how all of the pieces of the package fit together functionally through text that helps explain and code that demonstrates how it works!

If you were to scroll through this vignette you would see that it's rather long, but that's OK. You don't have to read the whole thing. If you look at the vignette and figure out the answer to the question that brought you there, you can move on. But, if you're just getting started taking a look at the whole vignette can be very helpful! A vignette that helps its users most is the one that is well-organized, has clear examples, and has text to help explain the package.

### Vignettes: `stringr`

We could go through a similar process looking at the vignettes for another package we're familiar with: `lubridate`. By using `browseVignettes("stringr")` you'll be brought to [a URL](https://cran.r-project.org/web/packages/stringr/vignettes/) where you'll see that this package has two vignettes.

If you click on Aesthetic specifications, you'll be brought to [an HTML document](https://cran.r-project.org/web/packages/stringr/vignettes/stringr.html) that has a format that *looks* slightly different from what we saw in the `googlesheets` package but that contains very similar information. Here, we see an explanation in text of what the package is used for as well as descriptions of the functionality and examples of code and its outputs demonstrating this functionality.

### Creating Vignettes

Having looked at the output of these vignettes and what they look like for packages that have been released, let's now step back and create a vignette for our `cbds` package!



### Getting Started

As with other lessons in this course, the `usethis` package has a function for you to get started writing your vignette! To do this we'll use `use_vignette` from the `usethis` package.

What this does is it:

1. Adds needed packages to DESCRIPTION file automatically for you
2. Creates `inst/doc` and adds this directory to .gitignore (so that built vignettes are not version controlled)
3. Adds `vignettes/*.html` and `vignettes/*.R` to .gitiginore 


### Advice for Good Vignettes

### Summary

### Additional Resources

* [Vignettes](https://r-pkgs.org/vignettes.html), by Hadley Wickham & Jenny Bryan
* [Package Vignette](https://bookdown.org/yihui/rmarkdown/r-package-vignette.html), by Yihui Xie, J. J. Allaire, & Garrett Grolemund
* [Writing Vignettes](https://kbroman.org/pkg_primer/pages/vignettes.html), by Karl Broman


### Slides and Video

<!-- ![Vignettes](YouTube Link) -->

  - [Slides](Link to Slides)

{quiz, id: quiz_07_vignettes}

### Vignettes quiz

{choose-answers: 4} 
? What do you think?


C) The answer to this one
o) Not the answer
o) A bad answer
o) Not an answer

{/quiz}
