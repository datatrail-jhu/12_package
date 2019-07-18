
# Documentation

<!-- Google Slide ID -->
<!-- 1P3XII64p0lwSZQ7V_GTwYyEOX1WXRyn2fgHymY9iNfQ -->

<!-- Include a slide PNG with Page_ID from this Slide Deck: -->
<!-- ![](https://docs.google.com/presentation/d/1P3XII64p0lwSZQ7V_GTwYyEOX1WXRyn2fgHymY9iNfQ/export/png?id=1P3XII64p0lwSZQ7V_GTwYyEOX1WXRyn2fgHymY9iNfQ&pageid=PAGE_ID) -->
<!-- or use  `didactr::gs_slide_df("1P3XII64p0lwSZQ7V_GTwYyEOX1WXRyn2fgHymY9iNfQ")$png_markdown` -->

So far in this course we've gotten to the point where you should have a functional package. The package has two functions, two tests, and a complete DESCRIPTION file. However, while this package is usable by you at this point, it's likely not usable by others ...or even by future you. Without proper documentation, the utility of any package (or any piece of software for that matter!) is limited. 

### Why Document? 

Documentation is *incredibly* important and largely undervalued. We often get too focused on writing the code and don't spend the required time to document our code. This lesson is a warning against that! As you write the code **also write the documentation**. You'll save yourself time by doing it in the moment in that you won't have to remember in the future what your code does. And, future you (and others if you release the package) will be able to use your package quickly and with ease.

Now, writing good documentation takes practice. And, we all know that practice makes perfect. So, it's best to practice writing good documentation on your own personal package so that when you release packages, you're already good at it! 

Okay, enough of the pep talk, let's get to documenting!

### `roxygen2`

There are multiple types of documentation. In the next lesson we'll talk about long-form documentation (in the form of vignettes), but in this lesson we're going to focus on **object** documentation. This is the documentation that you see anytime you use `?` or the `help()` functions in R. 

Previously we used the metaphor that R packages are like books in a library. The library stores all the packages you've installed. Extending this metaphor, if each R package is a book, documentation is the Glossary in the back of the book. It allows you to look up a function and receive definitions of what that function does and how to use it. 

The standard way of documenting objects (such as functions) is to write files including the object's documentation and store them with the .Rd extension in the `man/` directory. If you're currently looking at your `cbds` package, you may be thinking to yourself "Um...there isn't a `man/` directory..." And you're right, there isn't...yet!

Like package creation and testing, there's an R package out there to help you write documentation. `roxygen2` helps make documenting your code easier than manually creating any files and adding documentation.

In using `roxygen2` for your documentation, you'll:

- have the correct file formats and structures automatically
- write code and documentation in the same files so that you can update them easily and at once (and not forget to go update your documentation...)
- get started writing documentation quickly and won't have to worry about unnecessary details

#### General Procedure

When adding documentation to objects in your package, the process for each function is as follows:

1. Generate roxygen skeleton
2. Document your function using roxygen comments
3. Generate documentation - automatically convert the comments in your .R files into the required .Rd files
4. Take a peak at the documentation you've generated using `?` (or `help()`)

### Documenting Functions

Using the process mentioned above, `roxygen2`, and RStudio, we'll discuss this process and the details you need to know to document your functions!

#### Step 1: Generate roxygen skeleton

To get started documenting your package, **roxygen comments** -- which are special comments that start with `#'` instead of just `#` -- have to be added to the top of the .R file containing the object you'd like to document, you'll first have to install the `roxygen2` package (if you haven't already):

```r
# install package
install.packages("roxygen2")
```

Then, return to (open) your `check_na.R` file from within the `R/` directory. Once open, click on the wand icon within RStudio Cloud and select "Insert Roxygen Skeleton." 

{format: png}
![Insert Roxygen Skeleton](https://docs.google.com/presentation/d/1P3XII64p0lwSZQ7V_GTwYyEOX1WXRyn2fgHymY9iNfQ/export/png?id=1P3XII64p0lwSZQ7V_GTwYyEOX1WXRyn2fgHymY9iNfQ&pageid=g5dd0b1f446_0_0) 

This will get you started with what's necessary for documenting your function using `roxygen2`. Specifically, this will add a *block*, or a number of lines at the top of your file containing roxygen comments. Blocks include *tags*. Tags take the format: `@tag_name information` 

{format: png}
![Add roxygen comments in block at top of function](https://docs.google.com/presentation/d/1P3XII64p0lwSZQ7V_GTwYyEOX1WXRyn2fgHymY9iNfQ/export/png?id=1P3XII64p0lwSZQ7V_GTwYyEOX1WXRyn2fgHymY9iNfQ&pageid=g5dd0b1f446_0_6) 

Note that within roxygen comments "@" therefore has a special meaning. If you ever want to use an actual "@" symbol (for email addresses, for example), you'll need to use "@@".

#### Step 2: Document

The required information within this block are the title (first sentence) and description (second paragraph). Additional details are not required, but can be *very* helpful in actually making your function usable and well-documented. The third paragraph and beyond can include additional details about how the function works if needed.

##### Title & Description

For each object you document, the **title** should be a single line, written in sentence case (First word capitalized), and should *not* end in a period. The title should briefly explain the function's purpose. 

The **description** should briefly (in a few sentences) describe what the function does.

To see this clearly, let's use `?ggplot` (after loading the `ggplot2` library into RStudio Cloud) to see how these pieces go on to look in the documentation.

{format: png}
![title and description in `ggplot` function](https://docs.google.com/presentation/d/1P3XII64p0lwSZQ7V_GTwYyEOX1WXRyn2fgHymY9iNfQ/export/png?id=1P3XII64p0lwSZQ7V_GTwYyEOX1WXRyn2fgHymY9iNfQ&pageid=g5dd0b1f446_0_6) 

Now, having seen an example, let's add this specific information necessary to use *your* function.

**Title & Description: `check_na.R`**

Within the `check_na.R` file, let's first replace "Title" with "Return missingness info for a variable." After this, we can hit return/Enter twice. This will automatically add roxygen comments. Here, we'll add our function's description:

```r
#' Return missingness info for a variable
#'
#' Take variable as input and compute the number of total observations, 
#' number of missing observations and number of non-missing observations.
```

The first few lines of your .R file should now look as follows within RStudio Cloud:

{format: png}
![title and description in roxygen block](https://docs.google.com/presentation/d/1P3XII64p0lwSZQ7V_GTwYyEOX1WXRyn2fgHymY9iNfQ/export/png?id=1P3XII64p0lwSZQ7V_GTwYyEOX1WXRyn2fgHymY9iNfQ&pageid=g5dd0b1f446_0_29) 

As a brief aside, if you write a long description in a single line, you can use "Reflow Comment" (from the wand icon) to separate these comments into separate lines, so that no one line is too long (each line should be <80 characters long)  .

{format: png}
![Reflow Comment](https://docs.google.com/presentation/d/1P3XII64p0lwSZQ7V_GTwYyEOX1WXRyn2fgHymY9iNfQ/export/png?id=1P3XII64p0lwSZQ7V_GTwYyEOX1WXRyn2fgHymY9iNfQ&pageid=g5dd0b1f446_0_24) 

##### Documenting tags (`@tags`)

Functions, which are what we're focusing on documenting here use three tags typically: `@param`, `@return`, and `@examples` .

These come after the introduction block that we just worked on and are used for the following purposes:

* `@param`: describes functions inputs (parameters)
* `@return`: describes the functions output
* `@examples`: provides R code that demonstrates this function working

**`@param`**

This tag takes the following form: `@param name description`.

`name` should be replaced by the input parameter's name for each input to your function. 

`description` should include a summary of the type of the parameter (i.e. numeric) and what the parameter does. It should start with a capital letter and end with a period. It can take multiple lines. Every single parameter must be documented.

**`@return`**

This tag takes the following form: `@return description`.

`description` describes the output from the function and what type it takes

**`@examples`**

This tag is *incredibly* important. Many people look to examples first to get an understanding of what a function does and how to use it. This should include R code that can be run (executed) without error. 

**@tags: `check_na.R`**

Within `check_na.R`, we'll want to document our input parameter, explain what the function returns, and provide an example of how to use the function. 

Within our roxygen comments this would look as follows:

```r
#' @param variable Numeric, complex, or logical vectors.
#'
#' @return A matrix including the number of total, missing, and non-missing
#'   observations
#' @export
#'
#' @examples
#' check_na(c(NA, NA, 3, "cbds!", 4.5))
#' check_na(iris$Sepal.Width)
```

Note the following:

1. When there's more than one line for a tag, it must be indented for easy reading, as you see with the `@return` tag here
2. We've included two examples, each of which will execute without error

{format: png}
![@tags within `check_na.R`](https://docs.google.com/presentation/d/1P3XII64p0lwSZQ7V_GTwYyEOX1WXRyn2fgHymY9iNfQ/export/png?id=1P3XII64p0lwSZQ7V_GTwYyEOX1WXRyn2fgHymY9iNfQ&pageid=g5dd0b1f446_0_39) 

Also, you may see a tag in there that we haven't talked about yet. The **`@export`** tag indicates that this function should be added to the NAMESPACE file. While we haven't discussed that file and won't be editing it manually, it's important to know that functions included in the NAMESPACE are functions you want users of your package to have access to. So, if you want this function to be available to users, include the `@export` tag.

Note that sometimes you'll have functions that are used internally by other functions within your package and you won't want them to be exported (available to users). However, for this first package and for most packages you write as you get started, you'll likely want to `@export` each of your functions.

{format: png}
![@export tag makes function usable to users](https://docs.google.com/presentation/d/1P3XII64p0lwSZQ7V_GTwYyEOX1WXRyn2fgHymY9iNfQ/export/png?id=1P3XII64p0lwSZQ7V_GTwYyEOX1WXRyn2fgHymY9iNfQ&pageid=g5dd0b1f446_0_46) 

#### Step 3: Generate documentation

Now that you've add the required information to your function in the roxygen comments, you're ready to generate your documentation. To do this, return to the "Build" tab in RStudio Cloud, click on "More" and select "Document" from the drop-down menu.

{format: png}
![Document](https://docs.google.com/presentation/d/1P3XII64p0lwSZQ7V_GTwYyEOX1WXRyn2fgHymY9iNfQ/export/png?id=1P3XII64p0lwSZQ7V_GTwYyEOX1WXRyn2fgHymY9iNfQ&pageid=g5dd0b1f446_0_58) 

This will generate the documentation and give you a readout of what it's doing in the process:

{format: png}
![Generate documentation](https://docs.google.com/presentation/d/1P3XII64p0lwSZQ7V_GTwYyEOX1WXRyn2fgHymY9iNfQ/export/png?id=1P3XII64p0lwSZQ7V_GTwYyEOX1WXRyn2fgHymY9iNfQ&pageid=g5dd0b1f446_0_63) 

This results in the the `man/` documentation being generated for you. 

{format: png}
![`man/` direcotry generated](https://docs.google.com/presentation/d/1P3XII64p0lwSZQ7V_GTwYyEOX1WXRyn2fgHymY9iNfQ/export/png?id=1P3XII64p0lwSZQ7V_GTwYyEOX1WXRyn2fgHymY9iNfQ&pageid=g5dd0b1f446_0_68) 

Within the `man/` directory, you'll see that the `.Rd` file has been generated for you from the roxygen comments in your .R file.

#### Step 4: Look at your documentation!

It's finally time to take a look at your documentation using the `?` function.

To do so, "Install and Restart" from the Build tab.

{format: png}
!["Install and Restart"](https://docs.google.com/presentation/d/1P3XII64p0lwSZQ7V_GTwYyEOX1WXRyn2fgHymY9iNfQ/export/png?id=1P3XII64p0lwSZQ7V_GTwYyEOX1WXRyn2fgHymY9iNfQ&pageid=g5dd0b1f446_0_74) 

You're now ready to view your function's technology! To do so, run `?check_na` from the console. Your documentation will be viewable in the Help tab!

{format: png}
![Documentation in View Tab](https://docs.google.com/presentation/d/1P3XII64p0lwSZQ7V_GTwYyEOX1WXRyn2fgHymY9iNfQ/export/png?id=1P3XII64p0lwSZQ7V_GTwYyEOX1WXRyn2fgHymY9iNfQ&pageid=g5dd0b1f446_0_79) 

### Documenting `theme_cbds()`

We've walked through the steps to document a single function; however, you have a second function in your package! You'll want to be sure to repeat these steps to document `theme_cbds()`. 

For example, your file could include the following roxygen comment block:

```r
#' CBDS \code{ggplot2} theme
#'
#' theme that includes black border only on the x- and y- axis, removes grid
#' lines and background, moves axis labels closer to axes, and allows
#' flexibility in font and font szie
#'
#' @param base_size Base font size (default: 12)
#' @param base_family Base font size (default: "sans")
#' @param ... Arguments passed to \code{\link[ggplot2]{theme}}
#'
#' @return An object as returned by \code{\link[ggplot2]{theme}}
#' @seealso \code{\link[ggplot2]{theme}}
#'
#' @export
#'
#' @examples
#' require(ggplot2)
#' ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
#'   geom_point() +
#'   theme_cbds()
```

There are a few new ideas in this block. Something we haven't talked about yet is text formatting in .Rd documentation files. 

{format: png}
![Formatting and linking possible within docuemntation](https://docs.google.com/presentation/d/1P3XII64p0lwSZQ7V_GTwYyEOX1WXRyn2fgHymY9iNfQ/export/png?id=1P3XII64p0lwSZQ7V_GTwYyEOX1WXRyn2fgHymY9iNfQ&pageid=g5dd0b1f446_0_114) 

Specifically, you can italicize (`\emph{text}`), bold (`\strong{text}`), or specify that text should be formatted as code (`\code{code}`) within your documentation.

Additionally you can include links to *other* documentation. For another function within the same package you would specify `\code{\link{function_name}}`. If you wanted, however, to include a link to a function in another R package, you would use `\code{\link[other_package]{function_name}}`. 

You can see an example text formatting and linking to other packages in the documentation for our `theme_cbds()` function.

{format: png}
![Formatting and linking in rendered documentation](https://docs.google.com/presentation/d/1P3XII64p0lwSZQ7V_GTwYyEOX1WXRyn2fgHymY9iNfQ/export/png?id=1P3XII64p0lwSZQ7V_GTwYyEOX1WXRyn2fgHymY9iNfQ&pageid=g5dd0b1f446_0_114) 

Linking to places on the web is also possible using `url{}`, `\href{}`, and `\email{}`. Friendly reminder that the email would require @@.


### Other Documentation

In this lesson we've focused on documenting functions. Packages can also include datasets and classes. We're not going to focus on those here; however, the format is very similar, using titles, descriptions, and tags, so once you get familiar with documenting functions, which are the most common object generated within packages, you'll be able to pick up how to document these other objects.

### Summary

After this lesson you should have a DESCRIPTION file, two functions, tests for those functions, and documentation for your `cbds` package. You should be comfortable with generating roxygen comments and how to generate documentation once you've got the necessary information within your roxygen blocks! With that complete, let's chat about long-form documentation in the form of vignettes!


### Additional Resources
* [Writing Documentation](https://kbroman.org/pkg_primer/pages/docs.html), by Karl Broman
* [Object Documentation](https://r-pkgs.org/man.html), by Hadley Wickham & Jenny Bryan
* [Writing R Extensions](https://cran.r-project.org/doc/manuals/r-release/R-exts.html#Writing-R-documentation-files), from the R Core Team

### Slides and Video

<!-- ![Documentation](YouTube Link) -->

  - [Slides](https://docs.google.com/presentation/d/1P3XII64p0lwSZQ7V_GTwYyEOX1WXRyn2fgHymY9iNfQ/edit?usp=sharing)

{quiz, id: quiz_06_documentation}

### Documentation quiz

{choose-answers: 4} 
? For the following `emphasize_text()` function how many `@param` tags would you need to include in your roxygen comments?

```r
emphasize_text <- function(text, emphasis = "!!!"){
  out = toupper(text)
  out = paste0(out, emphasis)
  return(out)
}
```

C) 2
o) 0
o) 1
o) 3

{choose-answers: 4} 
? Which of the following correctly displays how a roxygen comment starts?

C) `#'`
o) `#`
o) `'`
o) `'#`
o) `@#`
o) `#@`
o) `#'@`


{choose-answers: 4} 
? What type of files are generated from the roxygen comments in your .R files?

C) .Rd
o) .Rmd
o) .R
o) .Rda
o) .r
o) .pdf
o) .png

{choose-answers: 4} 
? If you wanted to make "Be sure to first read the Getting Started vignette" **bold** in your documentation, how would you do that?

C) \strong{Be sure to first read the Getting Started vignette}
o) __Be sure to first read the Getting Started vignette__
o) **Be sure to first read the Getting Started vignette**
o) \strong{}Be sure to first read the Getting Started vignette
o) \bold{Be sure to first read the Getting Started vignette}
o) \bold{}Be sure to first read the Getting Started vignette

{choose-answers: 4} 
? Which tag specifies the output from your function?

C) `@return`
o) `@output`
o) `@function`
o) `@params`
o) `@out`
o) `@examples`
o) `@export`
o) `@seealso`

{choose-answers: 4} 
? Which of the following is NOT something true about `roxygen2`?

C) uses markdown formatting
C) requires you to write .Rd files manually
o) helps generate documentation within R packages
o) allows documentation and code to be in the same document
o) automatically generates .Rd documents in correct format
o) removes the need to edit code and documentation in two different places
o) is specified within roxygen comment blocks
o) allows for text to be bold and italicized within its roxygen comments
o) allows for links to places on the web within its roxygen comments


{/quiz}
