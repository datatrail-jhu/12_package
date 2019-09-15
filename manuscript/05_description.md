
# Description

<!-- Google Slide ID -->
<!-- 149NTXkAPfau6uxmvL7WnICAVe_UKMEF_Zc2B6mnEI5I -->

<!-- Include a slide PNG with Page_ID from this Slide Deck: -->
<!-- ![](https://docs.google.com/presentation/d/149NTXkAPfau6uxmvL7WnICAVe_UKMEF_Zc2B6mnEI5I/export/png?id=149NTXkAPfau6uxmvL7WnICAVe_UKMEF_Zc2B6mnEI5I&pageid=PAGE_ID) -->
<!-- or use  `didactr::gs_slide_df("149NTXkAPfau6uxmvL7WnICAVe_UKMEF_Zc2B6mnEI5I")$png_markdown` -->

At this point in your package development process, you should have the skeleton of for an R package with two functions and two test files already written. However, in previous lessons we noted that you need functions stored in the `R/` directory as well as a DESCRIPTION file. It's finally time to talk about that file and get it all ready to go! 

### Metadata

The DESCRIPTION file stores **metadata** for your package. In the most general sense metadata is data that describes other data. Specifically in R package development, metadata refers to what you need in order for your package to run, specifies who can use your package (license), and provides others with information about who wrote and is maintaining the package.

### DESCRIPTION

The DESCRIPTION file has already been generated for you and its expected structure has been established for you. Now, it's up to you to change the information in that file to reflect your `cbds` package.

To get started, click on the DESCRIPTION file in the "Files" tab so that it opens up at the top-left.

{format: png}
![DESCRIPTION file](https://docs.google.com/presentation/d/149NTXkAPfau6uxmvL7WnICAVe_UKMEF_Zc2B6mnEI5I/export/png?id=149NTXkAPfau6uxmvL7WnICAVe_UKMEF_Zc2B6mnEI5I&pageid=g5dcfb20e71_0_0)

The DESCRIPTION file contains different information on each line where there is a *field* and a *value* (separated by a colon). Values that take up more than one line have be be indented. 

{format: png}
![field and value are separated by a colon](https://docs.google.com/presentation/d/149NTXkAPfau6uxmvL7WnICAVe_UKMEF_Zc2B6mnEI5I/export/png?id=149NTXkAPfau6uxmvL7WnICAVe_UKMEF_Zc2B6mnEI5I&pageid=g5dcfb20e71_0_6)

We're going to walk through a number of these fields and describe what information goes in each of them so that you have a complete DESCRIPTION file and all your metadata is complete!

#### Package

The first line of the DESCRIPTION file contains the **Package** field. Notice that this line already contains the name of the package you specified previously. You shouldn't change anything about this line. Just remember that the format is `field: value`, so here we see "Package: cbds".

#### Title & Description

Next we get to fill in information about what this package does. We do this in two places: 

1. **Title** - a short (one-line, <65 characters) description of your package. Use Title Case (first letter of each word is capitalized, except for small words like "the" and "of" which remain lowercase) and do *not* add a period at the end.
2. **Description** - a longer (1 paragraph) and more detailed explanation of the package. Keep lines limited to 80 characters. Each new line will be indented with four spaces.

To get a clear example, let's take a look at the title and description for a few packages you're familiar with at this point.

For example, the `ggplot2` package has the following title and description:

**Title**: "Create Elegant Data Visualizations Using the Grammar of Graphics"
**Description**: A system for 'declaratively' creating graphics, based on "The Grammar of Graphics". You provide the data, tell 'ggplot2' how to map variables to aesthetics, what graphical primitives to use, and it takes care of the details.

Similarly, the `forcats` package has the following title and description:

**Title**: Tools for Working with Categorical Variables (Factors)
**Description**: Helpers for reordering factor levels (including moving specified levels to front, ordering by first appearance, reversing, and randomly shuffling), and tools for modifying factor levels (including collapsing rare levels into other, 'anonymising', and manually 'recoding'). 

A reminder that you can see the Title and description of packages by loading them into RStudio and then using ?packagename. The package documentation will show up in the Help tab.

{format: png}
![Title and Description fields help to explain what this package should be used for](https://docs.google.com/presentation/d/149NTXkAPfau6uxmvL7WnICAVe_UKMEF_Zc2B6mnEI5I/export/png?id=149NTXkAPfau6uxmvL7WnICAVe_UKMEF_Zc2B6mnEI5I&pageid=g5dcfb20e71_0_20)


Writing a good Title line and Description are *very* important if you plan on releasing your package - they're how others know what your package does. For our purposes with this first package we're developing in this course, they're less important, as we're just writing a package containing functions for our own use. Nevertheless, it's good to practice writing this information in the correct format, so write a Title and Description in your package's DESCRIPTION file.

{format: png}
![Title and Description fields in our package](https://docs.google.com/presentation/d/149NTXkAPfau6uxmvL7WnICAVe_UKMEF_Zc2B6mnEI5I/export/png?id=149NTXkAPfau6uxmvL7WnICAVe_UKMEF_Zc2B6mnEI5I&pageid=g5dcfb20e71_0_48)

#### Version

Working our way through the DESCRIPTION file, you'll see a **Version** field. We'll discuss versioning in more detail in the final lesson of this course, but for now, know that as packages are developed and improved over time, the package version changes. Users of your package can decide whether or not they want to use the most recent version of your package or if an older version of your package is what they need.

For now we'll just note that packages *in development* should start with the version: "0.0.0.9000", which is the current value in your DESCRIPTION file.

{format: png}
![Development version in DESCRIPTION file](https://docs.google.com/presentation/d/149NTXkAPfau6uxmvL7WnICAVe_UKMEF_Zc2B6mnEI5I/export/png?id=149NTXkAPfau6uxmvL7WnICAVe_UKMEF_Zc2B6mnEI5I&pageid=g5dcfb20e71_0_67)

Upon *release*, the version will contain three numbers, separated by periods. Those numbers correspond to <major>.<minor>.<patch>. For example, 1.0.0 would be the first released version of your package. As you patch the package (make a small change), the patch value would increase, such that the next version may be 1.0.1. We'll discuss what major, minor, and patch mean in the context of versioning in the final lesson in this course.

#### Author

The package's author (here, you!) must be included in your package's DESCRIPTION file. This gives you credit for your package, but more importantly let's others know who to contact if something goes wrong. 

The format for this field is odd because it includes R code, rather than the plain text used in other fields. This field should look like what you see in the DESCRIPTION file provided, but with *your* information included: 

```
Authors@R: 
    person(given = "Jane",
           family = "Doe",
           role = c("aut", "cre"),
           email = "janeeverydaydoe@gmail.com")
```

While you likely know your first (given) name, last (family) name, and email, the "role" field is likely something that's new and unfamiliar.

The roles you see in the example here are "aut" and "cre". These are three letter codes that refer to who the author ("aut") and creator ("cre") of the package are. The four most important roles in package development are: 

* **cre** : The creator or maintainer. Who to email if you have problems with the package
* **aut** : The author(s) - the person (or people!) who have made significant contributions to the functions, code, and ideas within the package
* **ctb** : The contributors - people who have made smaller contributions to the package
* **cph** : The copyright holder - If someone other than the author (a company, for example) holds the copyright.

Often, the creator and the author are the same person, but they don't have to be. *But*, every package is required to have at least one author (aut) and one maintainer (cre), even if they are the same person.

Be sure to edit your package's DESCRIPTION file to include your information.

{format: png}
![Author information included in DESCRIPTION file](https://docs.google.com/presentation/d/149NTXkAPfau6uxmvL7WnICAVe_UKMEF_Zc2B6mnEI5I/export/png?id=149NTXkAPfau6uxmvL7WnICAVe_UKMEF_Zc2B6mnEI5I&pageid=g5dcfb20e71_0_53)

Additionally, note that often in package development for large packages, there can be more than one author. The syntax for this requires that author `person()` calls be separated by a comma:

```
Authors@R: c(
    person(given = "Jane",
           family = "Doe",
           role = c("aut", "cre"),
           email = "janeeverydaydoe@gmail.com"),
    person(given = "Jack",
           family = "Doe",
           role = c("aut"),
           email = "jackdoe@gmail.com"))
```

#### License

The **License** field specifies who can use your package. If you're not releasing your package, this field is unimportant and can be left as is and ignored.

However, if you are releasing your package, this field is critical. There are standard licenses that may people choose to use in their packages (i.e. CC0). If using a standard license, you would include the abbreviation in this field.

The [CC0](https://tldrlegal.com/license/creative-commons-cc0-1.0-universal) license allows anyone to use your code for any purpose. 

{format: png}
![Specifies use of the Creative Commons CC0 license](https://docs.google.com/presentation/d/149NTXkAPfau6uxmvL7WnICAVe_UKMEF_Zc2B6mnEI5I/export/png?id=149NTXkAPfau6uxmvL7WnICAVe_UKMEF_Zc2B6mnEI5I&pageid=g5dcfb20e71_0_53)

Often, you may want to put some restrictions on your code and its use, in which case it's important to look into other licenses, such as the [MIT license](https://tldrlegal.com/license/mit-license) or [GPL-2](https://tldrlegal.com/license/gnu-general-public-license-v2). 

#### Dependencies

While including all of the information we've discussed so far is important for others to know what your package does, this section is critically important to make sure your package actually *works*.

In the skeleton provided for your package you'll see the **Suggests** field. This is one of a number of different fields that you can use to specify what packages your package relies on to function.

In this section of the lesson we're going to discuss the following fields related to dependencies: **Imports**, **Suggests**, and **Depends**. 

**Imports**

Packages included in the **Imports** field are those that are *required* for your package to function. Packages you include in this field will be installed (if they haven't been already) any time your package is installed. 

But, remember, that package installation and making a package available for use are two different steps. So, while this package will be installed, to be used in your package, you'll have to explicitly refer to the package and function you want to use (using the `package::function_name` syntax) within your packages code. (As stated previously, you should avoid using `library()` within your package code.)

In the two functions we've included in our package, the only package that is required for use of our package is `ggplot2`. While we only have one function in our package at this point that utilizes this package, we know that we'll likely be writing other themes over time and functions that have to do with plotting. For this reason, we're going to add `ggplot2` to our Imports field.

{format: png}
![Import `ggplot2`](https://docs.google.com/presentation/d/149NTXkAPfau6uxmvL7WnICAVe_UKMEF_Zc2B6mnEI5I/export/png?id=149NTXkAPfau6uxmvL7WnICAVe_UKMEF_Zc2B6mnEI5I&pageid=g5dcfb20e71_0_91)

If your package depends on multiple other packages, it's best to include them alphabetically, with each package listed on a separate line (and separated by a comma) so that they can be easily scanned by the human eye.

**Suggests**

Packages listed in this field can be used in your package, but aren't required. For example, if you have a single function in your package that uses this external package, you may list it in **Suggests**. Packages in this field are *not* installed along with your package. If you list a package in Suggests, you avoid the user of your package from installing a package they may not need. 

However, within your package, you'll want to be sure to include a `stop()` call in the function that uses your suggested package, prompting the user to install the package, for example:

```r
if(!requireNamespace("package_name", quietly = TRUE)){
  stop("package_name" required for use of this function. Please install it now.",
       call. = FALSE")
}
```

You may have noticed that `testthat` has already been added in the Suggests field for you. This means that testthat will *not* be installed upon installation of your package; however, if someone were to try to run the tests in your `testthat/` directory using the `testthat` package, they would have to install `testthat` first.

{format: png}
![Suggests `testthat`](https://docs.google.com/presentation/d/149NTXkAPfau6uxmvL7WnICAVe_UKMEF_Zc2B6mnEI5I/export/png?id=149NTXkAPfau6uxmvL7WnICAVe_UKMEF_Zc2B6mnEI5I&pageid=g5dcfb20e71_0_98)

The other notable bit about the testthat package in the DESCRIPTION file is the fact that "(>= 2.1.0)" is included. This specifies the version of the package necessary. Specifically, for `testthat` here, the DESCRIPTION file is specifying that version 2.1.0 *or a more recent version* is required. It's best practice to specify the minimum version necessary, rather than a specific version (== 2.1.0).

Note that we could have included a minimum version along with `ggplot2` in our **Imports** field if we felt that there was a minimum version required for our package to work. If we were to have added a version there, we would have added the version we were using at the time (i.e.">=3.2.0").

**Depends**

This field *used to* be how package developers stated that your package "depended" on another package. However, this is no longer the case. You should almost always use **Imports** or **Suggests** now. We include this here to avoid confusion if you look at older package's code. They may use this field heavily, but you should avoid this and instead use **Imports** and **Suggests** instead.

#### Other Fields

You may also notice in your DESCRIPTION file two other fields: **LazyData** and **Encoding**.

**LazyData** helps make access to data in your package easier. We'll discuss this further in a later lesson. You should leave this field and value as is in your DESCRIPTION file.

**Encoding** refers to how the characters used by the individual typing are stored and transmitted by the computer. There are a number of different systems for encoding. If you've heard for ASCII, UTF, or unicode, these refer to different systems used for encoding information within the computer. We note this here to specify that **UTF-8** is an encoding that works on all platforms, and is the one included by default in your DESCRIPTION file. Unless you have a reason to specify a different encoding, leave the value of this field as is.

{format: png}
![LazyData and Encoding left with their defaults](https://docs.google.com/presentation/d/149NTXkAPfau6uxmvL7WnICAVe_UKMEF_Zc2B6mnEI5I/export/png?id=149NTXkAPfau6uxmvL7WnICAVe_UKMEF_Zc2B6mnEI5I&pageid=g5dcfb20e71_0_105)

### Install & Restart

Finally, while we haven't added additionally functionality in this lesson, it's a good idea to "Install and Restart" to make sure you haven't messed up any of the expected formatting in this file before moving onto the next lesson. If it restarts R and loads you're package without error, you're ready to move on. If not, look back carefully at the syntax in your DESCRIPTION file before proceeding.

{format: png}
![Install and Restart](https://docs.google.com/presentation/d/149NTXkAPfau6uxmvL7WnICAVe_UKMEF_Zc2B6mnEI5I/export/png?id=149NTXkAPfau6uxmvL7WnICAVe_UKMEF_Zc2B6mnEI5I&pageid=g5dcfb20e71_0_112)


### Summary

This lesson was all about the DESCRIPTION file. This file is important for two reasons. First, it informs others what your package is all about, including information about who to contact if there's a problem. Second, it specifies your package's dependencies. Now that we have our minimal package *truly* ready to go, let's move onto one of the most important aspects of package development - documentation!

### Additional Resources

* [Metadata](https://r-pkgs.org/description.html), by Hadley Wickham and Jenny Bryan
* [Writing R Extensions](https://cran.r-project.org/doc/manuals/r-release/R-exts.html#The-DESCRIPTION-file), from the R Core Team


### Slides and Video

<!-- ![Description](YouTube Link) -->

  - [Slides](https://docs.google.com/presentation/d/149NTXkAPfau6uxmvL7WnICAVe_UKMEF_Zc2B6mnEI5I/edit?usp=sharing)

{quiz, id: quiz_05_description}

### Description quiz

{choose-answers: 4} 
? Which of the following is the most appropriate **Title** for an R package?


C) Wrangles Data Into the Tidy Data Format
o) wrangles data into the tidy data format
o) wrangles
o) Data!
o) Wrangles
o) data!
o) Wrangles Data Into the Tidy Data Format Using a Number of Other Helpful R Packages
o) wrangles data into the tidy data format using a number of other helpful R packages

{choose-answers: 4} 
? Which of the following is NOT true about your package's **Description** field?

C) should use Title Case
C) should be less than 65 characters
o) should be multiple lines
o) should be a single paragraph
o) should include a description of your package
o) new lines should be indented four spaces

{choose-answers: 4} 
? Your package's functions depend upon a number of functions in the `tidyr` package. Under which field should you include this package?

C) Imports
o) Suggests
o) Depends
o) None
o) Imports & Suggests
o) Imports & Depends
o) Suggests & Depends
o) Imports, Suggests, & Depends

{choose-answers: 4} 
? Which of the following is the **Title** for the `dplyr` package?

C) "a grammar of data manipulation"
o) "dplyr provides a flexible grammar of data manipulation. It's the next iteration of plyr, focused on tools for working with data frames (hence the d in the name)."
o) `dplyr`
o) "making data manipulation easier"
o) "providing R users with pipes"
o) "a grammar for data wrangling"


{choose-answers: 4} 
? What should be the version included in the first development version of your package?

C) 0.0.0.9000
o) 1.0.0.9000
o) 1.0.0
o) 0.0.9000
o) 1.0.9000

{choose-answers: 4} 
? You've specified an author (aut) for your package. Which of the following are you missing?

C) 'cre'
o) A second 'aut'
o) 'ctb'
o) 'cph'
o) 'lyr
o) 'wdc
o) 'cst'


{/quiz}
