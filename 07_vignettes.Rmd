# Vignettes

<!-- Google Slide ID -->
<!-- 1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ -->

<!-- Include a slide PNG with Page_ID from this Slide Deck: -->
<!-- ![](https://docs.google.com/presentation/d/1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ/export/png?id=1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ&pageid=PAGE_ID) -->
<!-- or use  `didactr::gs_slide_df("1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ")$png_markdown` -->

So far in this course we've discussed what R packages are, reviewed functions, and created a package with a complete DESCRIPTION file (including all metadata) and two functions, including both tests and documentation for those functions. At this point our package is in pretty good shape.

It has documentation explaining to users how to use each function, which is great! What it doesn't have yet is long-form documentation in the form of vignettes. Rather than object documentation, which tells users how to use each individual piece of your package, vignettes help explain how the whole package fits together. It explains the functionality within your package and explains how it all works together, showing users through examples.

### Vignettes

Vignettes are long-form documentation in that they demonstrate how all the pieces of your package fit together. Admittedly, the package we're creating in this course only has two pieces and they aren't necessarily related; however, as you add functionality to your personal package, you could see that some pieces may be more related to one another. Grouping these together within your vignette than makes sense.

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

To see the vignettes in a package, you can use the `browseVignettes()` function with the package name of interest as an input. For example, to see the vignettes for `googlesheets`, which we'll discuss in detail next, just execute `browseVignettes("googlesheets")`. This will [open up a URL](https://cran.r-project.org/web/packages/googlesheets/vignettes/) in your web browser.

{format: png}
![`browseVignettes("googlesheets")`](https://docs.google.com/presentation/d/1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ/export/png?id=1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ&pageid=g5dd7d7062c_0_0)

### Vignettes: `googlesheets`

To get a sense of what vignettes a package should have and what they look like, we'll take a look more closely at the vignettes within the `googlesheets` package. At the time of writing this lesson, there are four vignettes in the `googlesheets` package:

1. Formulas and formatted numbers
2. googlesheets Basic Usage
3. Managing Auth Tokens
4. Use an alternative browser

From their titles you can see that each plays a different role. The Basic Usage vignette is likely where most people would start. However, if after using this package, you found yourself running into trouble working with formulas in googlesheets, you'd likely check out the "Formulas and formatted numbers" vignette. If you were struggling to understand your authorization in the package, you would look at the "Managing Auth Tokens" vignette. And, if you wanted to use an alternative browser, you'd check out the last vignette listed above.

As the "googlesheets Basic Usage" vignette is where most people would start, that is the vignette we'll focus on most closely in this lesson. The Vignette is viewable at [this link](https://cran.r-project.org/web/packages/googlesheets/vignettes/basic-usage.html) if you'd like to scroll through and have a look for yourself. (Note that vignettes can and should be updated overtime, so the images here may look different from what you see in the future!)

{format: png}
!["googlesheets Basic Usage"](https://docs.google.com/presentation/d/1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ/export/png?id=1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ&pageid=g5dd7d7062c_0_82)

At the top of the vignette, in addition to the title, you have information about who authored the vignette and when it was last updated. And, in the most helpful vignettes, there is a table of contents where you can see clearly what's included throughout the vignette. By looking at the topics here you can see that all of the basic functions you would want to accomplish using the `googlesheets` package (reading in a google sheet, creating a new google sheet, editing an existing sheet, etc.) are all documented within this vignette.

Let's focus in on ["List Your Google Sheets"](https://cran.r-project.org/web/packages/googlesheets/vignettes/basic-usage.html#list-your-google-sheets). If we click on that link within the table of contents, we'll be brought to the part of the vignette that explains how to accomplish listing all of your google sheets.

{format: png}
![Vignettes include text, code and outputs to demonstrate functionality](https://docs.google.com/presentation/d/1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ/export/png?id=1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ&pageid=g5dd7d7062c_0_96)

In this bit of the vignette it becomes clear through the text provided what this function is used for and then, through the code, it becomes clear *how* to use it. Now, you *could* have read the documentation for that function and learned similar information, but with the vignette you then have all the information in one place to tell you what you can do after you list your Google Sheets using this function. It demonstrates how all of the pieces of the package fit together functionally through text that helps explain and code that demonstrates how it works!

If you were to scroll through this vignette you would see that it's rather long, but that's OK. You don't have to read the whole thing. If you look at the vignette and figure out the answer to the question that brought you there, you can move on. But, if you're just getting started taking a look at the whole vignette can be very helpful! A vignette that helps its users most is the one that is well-organized, has clear examples, and has text to help explain the package.

### Vignettes: `stringr`

We could go through a similar process looking at the vignettes for another package we're familiar with: `stringr`. By using `browseVignettes("stringr")` you'll be brought to [a URL](https://cran.r-project.org/web/packages/stringr/vignettes/) where you'll see that this package has two vignettes.

If you click on the HTML link next to "Introduction to stringr", you'll be brought to [an HTML document](https://cran.r-project.org/web/packages/stringr/vignettes/stringr.html) that has a format that *looks* slightly different from what we saw in the `googlesheets` package but that contains very similar information. Here, we see an explanation in text of what the package is used for as well as descriptions of the functionality and examples of code and its outputs demonstrating this functionality.

### Creating Vignettes

Having looked at the output of these vignettes and what they look like for packages that have been released, let's now step back and create a vignette for our `cbds` package!

#### Getting Started

As with other lessons in this course, the `usethis` package has a function for you to get started writing your vignette! To do this we'll use `usethis::use_vignette()`.

What this does:

1. Adds needed packages to DESCRIPTION file automatically for you
2. Creates `inst/doc` and adds this directory to .gitignore (so that built vignettes are not version controlled)
3. Adds `vignettes/*.html` and `vignettes/*.R` to .gitiginore

To do this, you may have to first install `knitr` (if you haven't previously) and then run then use the following code:

```r
# install.packages(c("knitr", "rmarkdown"))
usethis::use_vignette('get-started', title = "Getting Started")
```

With this, you'll see a new file (get-started.Rmd) has been added to your `vignettes/` directory, that file has opened up for you, and, in your Console, you see a read-out of what changes have been made for you.


{format: png}
![Vignette file generated from `use_vignette()`](https://docs.google.com/presentation/d/1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ/export/png?id=1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ&pageid=g5f4c3822f3_0_0)

Note that within the `get-started.Rmd` document, some required YAML information at the top of the document as well as two code chunks have been added for you. But, aside from a line of code loading in your package (`library(cbds)`) being included for you, none of this is specific to *your* package yet. It's time to personalize this document and make this vignette a helpful long-form piece of documentation to accompany your package!

{format: png}
![`get-started.Rmd` contains skeleton but requires that you add information about your package](https://docs.google.com/presentation/d/1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ/export/png?id=1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ&pageid=g5f4c3822f3_0_10)

#### Metadata

The metadata at the top of your vignette file should look something like what you see here:

```
---
title: "Getting Started"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{Getting Started}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---
```

It has a title (specified when we used the `use_vignette()` function) which is specific to our package, but it does not have much more information. Let's add a few fields to this portion of the document, to include additional helpful information, such as your name (as the author) and today's date! Remember that each field and value is separated by a colon in this YAML section *and* that spacing matters. Each line we'll add must start all the way to the left without any spaces or tabs before it.

Specifically, we'll leave the lines currently there alone, but let's *add* the following two lines. Be sure to include your name as the author of your vignette.

```
author: "Jane Doe"
date: "`r Sys.Date()`"
```

Note that `r Sys.Date()` will add today's date any time this document is Knit. This helps readers of your vignette know the last time it was updated! We also want to point out that these are *not* the only fields that can be added to this document, but they are very important.

#### Vignettes in R Markdown

The rest of this document is written as all other R Markdown documents you've worked with previously. There's space for text (using Markdown syntax) and code (using R chunks)!

And, after adding all necessary text and code to explain how to use your package, you'll use Knitr - just like before! - to Knit your document (running all of the code within the R chunks!) into a beautiful HTML document!

As we mentioned previously, vignettes are used to demonstrate the functionality of your package *and* how all the pieces fit together. This is the document where you get to show off what you've built and make it easier for others to use - a win-win!

### Write for Beginners

So, we've generated the file for our vignette, but we haven't added any information to it, specific to our package's functionality yet. Now we'll fix that. And, we'll do it while talking about how to write helpful and good vignettes.

The most important piece of advice to remember when writing a vignette is that other people have *not* used your package before. It's important to include all the necessary information someone new to your package would need to know. Don't skip steps that you're familiar with because others will not be as familiar. Include helpful examples and text explaining them so that others, who are beginners, will be able to follow along with ease.

Okay, with that in mind, let's add some examples and text to our vignette!

### The Process

The general process for writing a helpful vignette includes an interactive process where for each piece of your package you include enough text to explain to a beginner what's going on and code to demonstrate how to use your package's functionality. After adding text and code, it's best to run the code chunk to ensure that there are no errors. You do this iteratively until you have all the necessary functionality of your package explained. Once you've got a full vignette, you build the vignette and you're all set!

Let's do this for our `cbds` package now!

#### Step 1: Add Text

For large packages, sometimes you'll need a lot of introductory text or even a section dedicated to explaining your package, but for our package - which is primarily to hold functions for our personal use - we'll just include a brief paragraph introducing the package.

After our brief introduction, the functions in this package revolve around working with data. So, we'll introduce a dataset that we'll then use throughout our vignette.

{format: png}
![Include text that explains at a beginner's level](https://docs.google.com/presentation/d/1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ/export/png?id=1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ&pageid=g5f4c3822f3_0_24)


#### Step 2: Add code

To work with this dataset, we'll load the `ggplot2` package and then take a look at the diamonds dataset. Note that to do this, we include the code in a R Markdown code chunk.

{format: png}
![Write code in code chunks and run them to ensure the code executes](https://docs.google.com/presentation/d/1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ/export/png?id=1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ&pageid=g5f4c3822f3_0_33)


#### Step 3: Run code chunk

To ensure that there are no errors in the code you've written, it's always a good idea to run the code chunk before moving on to the next part of your vignette.

{format: png}
![Run code chunks to ensure the code executes without error](https://docs.google.com/presentation/d/1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ/export/png?id=1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ&pageid=g5f4c3822f3_0_42)


#### Step 4: Repeat Steps 1-3

At this point, we have an introduction and data to work with, so we're ready to continue adding text and code to demonstrate how the functions in our package work.

We have two functions currently, so we'll add an H1 header for each and then include text and code to demonstrate how they work.

First, we demonstrate using text, code, and code output how a user would use the function `check_na()`

{format: png}
![Including `check_na()` in our vignette](https://docs.google.com/presentation/d/1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ/export/png?id=1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ&pageid=g5f4c3822f3_0_55)

Second, we'll want to document our `theme_cbds()` function. Remember this is a custom theme to be applied to `ggplot2` plots. So, it would likely be helpful for users to be able to visualize the changes from default plots to what your theme produces.

Thus, it's a good idea to include what the plot would look like before applying your theme.

{format: png}
![Example of what plot looks like before applying `theme_cbds()`](https://docs.google.com/presentation/d/1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ/export/png?id=1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ&pageid=g5f4c3822f3_0_65)

Then, you can demonstrate what this plot would look like - using both text and code to explain - with your function:

{format: png}
![Example of what plot looks like before applying `theme_cbds()`](https://docs.google.com/presentation/d/1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ/export/png?id=1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ&pageid=g5f4c3822f3_0_73)

Note that text explaining the code can be included before the code *and* text explaining the output of the code can be included after the code chunk to summarize what's going on.

{format: png}
![Text can be included before or after code to help readers understand](https://docs.google.com/presentation/d/1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ/export/png?id=1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ&pageid=g5f4c3822f3_0_81)

Finally, sometimes, it can helpful to readers to demonstrate explicitly that a function works in different contexts. For example, we can include an additional plot, demonstrating what this would look like for a barplot (using a categorical variable).

{format: png}
![Multiple, related examples can help readers' understanding](https://docs.google.com/presentation/d/1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ/export/png?id=1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ&pageid=g5f4c3822f3_0_88)

At this point, our full vignette includes the following a YAML with modified metadata at the top, text introducing our package, and text, code and output demonstrating how to use the functions within our package. We're now ready for the final step - building our vignette!

#### Step 4: Build Vignette

To accomplish this, we'll first note that using "Clean & Rebuild" from the Build tab will *NOT* build your vignettes for you. This is to save time so that your Vignettes are not re-generated every time you change something small in your package.

However, at this point we *want* to build our vignettes. To do so we'll want to use the `build()` function from `devtoools`. To use this, first add `devtools` to your DESCRIPTION file.

{format: png}
![Add `devtools` to your DESCRIPTION file](https://docs.google.com/presentation/d/1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ/export/png?id=1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ&pageid=g5f4c3822f3_0_96)

Then, install the package on RStudio Cloud for immediate use:

```
install.packages("devtools")
```

Now, we can create our package bundle *and* generate vignettes by using:

```
devtools::build()
```

{format: png}
![Vignettes are built!](https://docs.google.com/presentation/d/1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ/export/png?id=1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ&pageid=g5f4c3822f3_0_110)

Note that the output indicates that our vignettes have been built (along with the rest of the package)!

### Summary

In this lesson we looked through examples of vignettes in other package and discussed how these long-form pieces of documentation can be really helpful for explaining and demonstrating how others should go about using your package.

While these documents are less helpful for packages you don't plan to release and that are primarily for your use, it's important to get practice writing good vignettes. So, we added a vignette to our `cbds` package and demonstrated how to build vignettes using `devtools`.

At this point you have a pretty complete and well-documented package that includes two documented functions, unit tests, and a vignette. In the final two lessons we'll discuss how to add data to your package, which, for data analysis, is often helpful and how to release your package on GitHub!

### Additional Resources

* [Vignettes](https://r-pkgs.org/vignettes.html), by Hadley Wickham & Jenny Bryan
* [Package Vignette](https://bookdown.org/yihui/rmarkdown/r-package-vignette.html), by Yihui Xie, J. J. Allaire, & Garrett Grolemund
* [Writing Vignettes](https://kbroman.org/pkg_primer/pages/vignettes.html), by Karl Broman


### Slides and Video

![Vignettes](https://youtu.be/rosqnrEJeAA)

  - [Slides](https://docs.google.com/presentation/d/1tupzSYZC49l5d0bXFv1Yv1nk8PLVMTWsntolAaNvXQQ/edit?usp=sharing)
