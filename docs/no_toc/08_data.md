# Data

<!-- Google Slide ID -->
<!-- 17jSiXAuZqt_y8LwEurK5kRLcCHQKH2UeZWWRs_DbcF4 -->

<!-- Include a slide PNG with Page_ID from this Slide Deck: -->
<!-- ![](https://docs.google.com/presentation/d/17jSiXAuZqt_y8LwEurK5kRLcCHQKH2UeZWWRs_DbcF4/export/png?id=17jSiXAuZqt_y8LwEurK5kRLcCHQKH2UeZWWRs_DbcF4&pageid=PAGE_ID) -->
<!-- or use  `didactr::gs_slide_df("17jSiXAuZqt_y8LwEurK5kRLcCHQKH2UeZWWRs_DbcF4")$png_markdown` -->

We noted in the last lesson that at this point we have a pretty complete package. We have functions, unit tests, documentation, and a vignette. However, what we haven't talked about yet is the fact that sometimes, packages require data. This generally takes one of three forms:

1. **Data Available to the User**
2. **Data Your Functions Need**
3. **Raw Data**

We'll walk through each of these in this lesson, explain how it relates to your R package, and demonstrate how to utilize the `usethis` package to make your life easier when adding data.

### Data Available to the User

As you start developing packages, making data available to the user is likely what you'll find yourself doing most frequently when it comes to data. This is because having datasets available to users that demonstrate the functionality of your package. For example, think about the datasets available from `ggplot2`, such as `diamonds` or `msleep`. They're great for demonstrating the various types of plots that can be made using `ggplot2`! It can be really helpful to include these types of datasets with your package for users to utilize.

Datasets you want to be available to your user should be stored in the `data/` directory. These are referred to as **external** or **exported** datasets.

You may notice at this point, however, that in your `cbds` package, there isn't yet a `data/` directory. This is where `usethis` comes into play.

To store data in the `data/` directory, you'll use `usethis::use_data()` and specify the objects that you want to be saved. In the example below, if you had a dataset about trees stored in the object `df_trees`, the following would create the .rda file appropriate for your package and put it in the right directory.

```r
# for external use
`usethis::use_data(df_trees)`
```

Note that you get a readout of the fact that the `data/` directory has been created for you and that your dataset has been saved within that directory.


![`use_data` does all the legwork for you to make data available to users](https://docs.google.com/presentation/d/17jSiXAuZqt_y8LwEurK5kRLcCHQKH2UeZWWRs_DbcF4/export/png?id=17jSiXAuZqt_y8LwEurK5kRLcCHQKH2UeZWWRs_DbcF4&pageid=g5f5d9320fd_0_0)

To double check this, you would look at your Files tab, where you would now see that the `data/` directory is there for you.


![`data/` directory has been created](https://docs.google.com/presentation/d/17jSiXAuZqt_y8LwEurK5kRLcCHQKH2UeZWWRs_DbcF4/export/png?id=17jSiXAuZqt_y8LwEurK5kRLcCHQKH2UeZWWRs_DbcF4&pageid=g5f5d9320fd_0_6)

Within that directory, you'll find that your object `df_trees` is now stored within `data/` as a `.rda` file: `df_trees.rda`. Unlike CSVs, this R Data file extension is something we haven't used a ton, but this is a great way to store data within an R package and is the most efficient format for making data available to users within a package.


![`df_trees.rda` is stored within data/](https://docs.google.com/presentation/d/17jSiXAuZqt_y8LwEurK5kRLcCHQKH2UeZWWRs_DbcF4/export/png?id=17jSiXAuZqt_y8LwEurK5kRLcCHQKH2UeZWWRs_DbcF4&pageid=g5f5d9320fd_0_11)

### Data Required By Your Functions

In addition to data that you want your users to have access to, sometimes your functions require data and you want that data to be available to your functions but not to all package users. So, the data can't be stored in `data/`. Data for your use by your package's functions is referred to as **internal data**. Internal data are generated again using the `use_data()` function from `usethis`; however, you'll need to change an input argument: `internal = TRUE`.

```r
# for internal use
usethis::use_data(df_trees, internal = TRUE)
```


![specify `internal = TRUE` to store internal data](https://docs.google.com/presentation/d/17jSiXAuZqt_y8LwEurK5kRLcCHQKH2UeZWWRs_DbcF4/export/png?id=17jSiXAuZqt_y8LwEurK5kRLcCHQKH2UeZWWRs_DbcF4&pageid=g5f5d9320fd_0_16)


Notice that these data are *not* stored in `data/` and instead are stored in the `R/` directory in a file named `sysdata.rda`.


![internal data are stored in `R/sysdata.rda`](https://docs.google.com/presentation/d/17jSiXAuZqt_y8LwEurK5kRLcCHQKH2UeZWWRs_DbcF4/export/png?id=17jSiXAuZqt_y8LwEurK5kRLcCHQKH2UeZWWRs_DbcF4&pageid=g5f5d9320fd_0_21)

As a reminder, these data are only available for use inside your package.

### Raw Data

Less frequently than providing users with an example dataset (that you've made available to them as discussed earlier in the lesson), you may find a need to provide raw data or original files with your package. These raw data files are often stored in `inst/extdata/`.

To automatically generate the scripts (using `usethis`) you'll use to generate raw data files (and the accompanying script), you would use the `usethis::use_data_raw()` function:

```r
# for raw data
usethis::use_data_raw("trees_raw")
```


![`use_data_raw` gets you started with external data](https://docs.google.com/presentation/d/17jSiXAuZqt_y8LwEurK5kRLcCHQKH2UeZWWRs_DbcF4/export/png?id=17jSiXAuZqt_y8LwEurK5kRLcCHQKH2UeZWWRs_DbcF4&pageid=g5f5d9320fd_0_26)

As previously, you get a helpful readout of what has been done for you as well as what still remains for you to do.

Specifically, the example above creates a `data-raw/` directory for you.


![`data-raw/` is generated for you](https://docs.google.com/presentation/d/17jSiXAuZqt_y8LwEurK5kRLcCHQKH2UeZWWRs_DbcF4/export/png?id=17jSiXAuZqt_y8LwEurK5kRLcCHQKH2UeZWWRs_DbcF4&pageid=g5f5d9320fd_0_31)

It also generates a script file of the name you specified within the `data-raw/` directory, and opens that script file.


![`use_raw_data()` helps you to get set up to add raw data](https://docs.google.com/presentation/d/17jSiXAuZqt_y8LwEurK5kRLcCHQKH2UeZWWRs_DbcF4/export/png?id=17jSiXAuZqt_y8LwEurK5kRLcCHQKH2UeZWWRs_DbcF4&pageid=g5f5d9320fd_0_26)

Within the script file, there is a comment prompting you to add code here that takes your raw data file and gets it into the cleaner form that you've shared with users. You would add your code to take your raw dataset from its raw form into the form shared with your users (in your `data/` directory).

One example of this approach being used comes from Hadley Wickham's [`babynames`](https://github.com/hadley/babynames/blob/master/data-raw/births.R) package. Within that package cleaned up data from the USA Social Security Administration are made available to users (in the `data/` directory). However, to make those data usable by others from the package, Hadley Wickham had to gather and clean the data. The code to accomplish this is stored within the `data-raw/` directory.


![Example of .R script that generates clean data from raw](https://docs.google.com/presentation/d/17jSiXAuZqt_y8LwEurK5kRLcCHQKH2UeZWWRs_DbcF4/export/png?id=17jSiXAuZqt_y8LwEurK5kRLcCHQKH2UeZWWRs_DbcF4&pageid=g5f5d9320fd_0_41)

At the end of this script, he saves the data file as a CSV into the `data-raw/` directory. This way his workflow is completely reproducible - anyone looking at the code in this package is completely clear on what data were used (from the information in `data-raw/`) and can get to using the dataset (because the clean version is stored in `data`/)

Note that to access raw data file from a package you utilize `system.file` using the following syntax:

```r
system.file("extdata", "births.csv", package = "babynames")
```

Here, "extdata" refers to the directory where the data are stored in the package, "births.csv" refers to the name of raw data file, and "babynames" refers to the package from which you want to retrieve this data.

### Documenting Datasets

Now that we've discussed the main ways of including data within a package, we have to take a second to talk about documenting data.

Datasets stored in `data/` (so, those external datasets you want your users to be able to use) are made available to users of your packages, just like functions! So, just like functions, external data must be documented. While we won't go into too many specifics here, roxygen2 blocks are also used to document datasets making the process familiar. These roxygen2 blocks should be saved in the `R/` directory in a file named `data.R`.

Here is what the documentation looks like for the `births` dataset from the `babynames` package we were just talking about

```r
#' Births
#'
#' Live births data from census.gov.
#'
#' @format A data frame:
#' \describe{
#' \item{year}{Year}
#' \item{births}{Number of live births, rounded to nearest 1000}}
"births"
```

Within this roxygen2 bloc, we see the name of the dataset and a brief description. However, the `@format` tag is new. This should describe the dataset. For a dataframe, you must provide users with a list that describes each variable in the dataset you're sharing. Here, we see that this dataset has two variables: `year` and `births`

Note that `@export` is not included (as you would for an exported function). Be sure not to include `@export` when documenting a dataset.

Finally, only data being made available to users have to be documented. You don't need roxygen2 blocks for internal data or raw data.

### Summary

In this lesson we cover the final piece of what you'll typically add to a package - data! Now, there are other topics surrounding creating R packages that we have not covered in the lessons here. In the next lesson we'll talk about how to get your package onto GitHub and use Travis CI, but we don't cover in detail what you'll need to do to get your package onto CRAN, the NAMESPACE, or Compiled Code. So, if you want to learn even more the [R Packages](https://r-pkgs.org) book by Hadley Wickham and Jenny Bryan is a *great* resource and is where tons of information in these lessons has come from. We also link to the appropriate section in that book after each lesson in this course.

### Additional Resources

* [External Data](https://r-pkgs.org/data.html), by Hadley Wickham & Jenny Bryan
* [Including Datasets](https://kbroman.org/pkg_primer/pages/data.html), by Karl Broman

### Slides and Video

![Data](https://youtu.be/P2tBbFFoKog)

  - [Slides](https://docs.google.com/presentation/d/17jSiXAuZqt_y8LwEurK5kRLcCHQKH2UeZWWRs_DbcF4/edit?usp=sharing)
