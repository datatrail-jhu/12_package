{
course-completeness: 100
course-attempts: 2
default-quiz-attempts: 2
default-random-choice-order: true
default-quiz-show-answers: none
}

# Building R Packages

<!-- Google Slide ID -->
<!-- 1fueR3mDU3mGjq0qemekAalmbeYop4_I_7Z9CPHW7fcY -->

<!-- Include a slide PNG with Page_ID from this Slide Deck: -->
<!-- ![](https://docs.google.com/presentation/d/1fueR3mDU3mGjq0qemekAalmbeYop4_I_7Z9CPHW7fcY/export/png?id=1fueR3mDU3mGjq0qemekAalmbeYop4_I_7Z9CPHW7fcY&pageid=PAGE_ID) -->
<!-- or use  `didactr::gs_slide_df("SLIDEID")$png_markdown` -->

This course will introduce you to all you need to know to get writing your own R packages. You'll learn about the structure of R packages, how to incorporate code, as well as how to document your code so that it's most easily usable by others (and future you)!

> **Note**: This first lesson should sound very familiar. If it doesn't, we recommend you return to earlier courses in [Cloud-Based Data Science](https://leanpub.com/universities/set/jhu/chromebook-data-science) to learn the basics of R before you embark on writing R packages of your own.


### R Packages

Earlier in this course set when we first started programming in R, we introduced the basics of R packages. We noted at that point in time that when you open up R, you have certain functionalities available to you. What is available to you when you first open R is known as **base R**. For example, when you first open R, you are able to calculate the mean (average) of a bunch of numbers. Specifically, by this point you're well aware that `mean(c(3,4,5))` returns 4, the average of the numbers 3, 4, and 5.

However, not everything that's possible in R is available to you every time you open up R or RStudio. This is done intentionally. There is **a lot** you can do with R; however, if all of that was made available every time you opened up R, it would take a long time for R to load and open. Rather, R makes some functionality available from base R (the `mean()` function, for example), while storing other functionality in **packages**.

You're likely very familiar with a number of packages at this point. You've probably used `ggplot2` to generate plots, `tidyr` and `diplyr` to work with tabular data, and `stringr`, `forcats`, & `lubridate` to make working with strings, factors, and dates (respectively) simpler. All of these packages contain R code that, when installed and loaded into R, makes their functionality available to the user.  

More specifically, a package is a collection of functions, data, and code conveniently provided in a nice, complete format for you. At the time of writing, there are just over 17,600 packages available to download - each with their own specialized functions and code, all developed for a specific but different purpose. What we haven't talked about previously, however, is that you too can write R packages. In fact, anyone can and should write R packages!

{format: png}
![R Documentation: R Packages](https://docs.google.com/presentation/d/1fueR3mDU3mGjq0qemekAalmbeYop4_I_7Z9CPHW7fcY/export/png?id=1fueR3mDU3mGjq0qemekAalmbeYop4_I_7Z9CPHW7fcY&pageid=g5cdfd9360d_0_244)

Writing your own R package is helpful:

* whenever you find yourself copying and pasting code and functions over and over again. If you do, stop, and store that functionality in a package. That way, any time you want to re-use that code, you simply load your package in and get to work!
* whenever you want to share code and/or analyses with others. Storing data, code, and results in a package is a great way to share your work with others.
* when you come up with some functionality that others may want to use. You can share your packages on GitHub or CRAN (discussed more below) so that others have access to your package's functionality!


##### Repositories?

For R packages, a repository is central location where many developed packages are located and available for download.

There are three big repositories for R packages:  
    1. [**CRAN (Comprehensive R Archive Network):**](https://cran.r-project.org/web/packages/) R's main repository (>12,100 packages available!)  
    2. [**GitHub:**](https://github.com/collections) A very popular, open source repository (not R specific!)  
    3. [**BioConductor:**](https://bioconductor.org/packages/release/BiocViews.html#___Software) A repository mainly for bioinformatic-focused packages   

We note BioConductor here for completeness' sake, but as these courses are not biology-focused, we'll stick to discussing CRAN and GitHub throughout this course.

### Installing, Loading, & Updating

As a refresher and to make sure we're all on the same page before moving forward, we'll review the basics of installing, loading and updating R packages.

#### Installing

As a brief refresher, if you are installing from the CRAN repository, use the `install.packages()` function, with the name of the package you want to install in quotes between the parentheses . For example, if you want to install the package `ggplot2`, you would use: `install.packages("ggplot2")`  

{format: png}
![Installing from CRAN](https://docs.google.com/presentation/d/1fueR3mDU3mGjq0qemekAalmbeYop4_I_7Z9CPHW7fcY/export/png?id=1fueR3mDU3mGjq0qemekAalmbeYop4_I_7Z9CPHW7fcY&pageid=g5cdfd9360d_0_162)

From GitHub, installation occurs using `devtools::install_github("author/package")` replacing "author" and "package" with their GitHub username and the name of the package.

{format: png}
![Installing from GitHub](https://docs.google.com/presentation/d/1fueR3mDU3mGjq0qemekAalmbeYop4_I_7Z9CPHW7fcY/export/png?id=1fueR3mDU3mGjq0qemekAalmbeYop4_I_7Z9CPHW7fcY&pageid=g5cdfd9360d_0_84)

#### Loading

Installing a package does *not* make its functions immediately available to you. After installation to make the functions available to you, you must **load** the package into R. To do so, use the `library()` function. Think of this like any other software you install on your computer. Just because you've *installed* a program, doesn't mean it's automatically running - you have to open the program. Same with R. You've installed it, but now you have to "open" it. For example, to "open" the `ggplot2` package, you would run:`library(ggplot2)`

**NOTE:** Unlike when you're installing a package, when loading a package, you do *not* have to put the package name in quotes.

{format: png}
![Loading a Package](https://docs.google.com/presentation/d/1fueR3mDU3mGjq0qemekAalmbeYop4_I_7Z9CPHW7fcY/export/png?id=1fueR3mDU3mGjq0qemekAalmbeYop4_I_7Z9CPHW7fcY&pageid=g5cdfd9360d_0_320)

There is an order to loading packages - some packages require other packages to be loaded first. These other packages are known as **dependencies**. When you install a new package, that new package's manual/help pages will automatically determine what packages this new package is dependent upon and will install those packages as well. We'll discuss this in more detail in a later lesson in this course.


#### Updating

Good packages are updated over time - bugs are fixed and new functionality is sometimes added. This means that from time to time, you'll have to update the package you've previously installed to a newer version.

To update all packages, use `update.packages()`. If you only want to update a specific package, just use once again `install.packages("packagename")`


### Summary

This lesson is meant to remind you of the basics of R packages - where to find them, how to install them, and why we use them. But, it's also meant to set you up in the mindset to get excited to write your own packages! The remaining lessons in this course will get you started with making your first R package!

We've linked to a number of helpful resources below, and we'll be using content from a number of them throughout the course.

### Additional Resources

- [Introduction to R Packages](http://faculty.washington.edu/kenrice/rintro/sess08.pdf), from Ken Rice and Timothy Thornton
- [Writing An R Package From Scratch](https://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/), by Hilary Parker
- [R Packages](http://r-pkgs.had.co.nz/), by Hadley Wickham


### Slides and Video

![Packages](https://www.youtube.com/watch?v=HpolN_i5Kbw)

- [Slides](https://docs.google.com/presentation/d/1fueR3mDU3mGjq0qemekAalmbeYop4_I_7Z9CPHW7fcY/edit?usp=sharing)
