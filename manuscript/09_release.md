# Release

<!-- Google Slide ID -->
<!-- 1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA -->

<!-- Include a slide PNG with Page_ID from this Slide Deck: -->
<!-- ![](https://docs.google.com/presentation/d/1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA/export/png?id=1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA&pageid=PAGE_ID) -->
<!-- or use  `didactr::gs_slide_df("1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA")$png_markdown` -->

At this point, we've got our `cbds` package with two functions, documentation, unit tests, and a vignette. It's only meant to be a package for our use at this point, so we're not planning to release this package, *but* you should be familiar with how to release a package generally. So, we'll walk through those steps in this lesson.

Releasing a package generally includes making it available to the public. There are a few main repositories for R packages. We've discussed these before, but I'll remind you that **CRAN** is the general place to R package release. When you run `install.packages()`, packages are located on CRAN and then installed. However, there are a number of requirements for packages included on CRAN to ensure consistency between packages and that all packages will work for all other users. There is a similar platform called **Bioconductor** for R packages related to bioinformatics. Finally, packages can be released on **GitHub**. The requirements for this are lower than for releasing a package on CRAN or Bioconductor. This means that for packages to be widely used, you'll want to put them on CRAN. For packages for your own use or while they're still in development, GitHub is the way to go!

GitHub is also the simplest way to release a package. This is great because we're already familiar with working with GitHub, so it won't require a totally new skill. Additionally, even though we're not planning to release this package to the world yet, by putting this package on GitHub means that it will be version controlled, which we should do with all of our work - a win-win!

### To GitHub

To get started on getting your package on GitHub, it's important that you're currently within your package's project. (If you're unsure, you can click on the Rproj for your package: `cbds.Rproj` to take you there. If you're not yet in the correct R project, you'll be asked if you want to switch to that project. Switch now! Alternatively, if you're already there, a window with the Project Options will pop up, indicating you're where you need to be and you can just click Cancel.)


#### GitHub Key Setup

Once you're sure you're within your package's R project, the next thing we're going to do is set up an SSH key so that you don't have to put your username and password in every time you push to GitHub. Now, we'll note that this SSH key will only work for *this* workspace. Any other workspaces in RStudio Cloud will require you to set up a separate SSH key.

To get started, we'll first let git know who you are as we've done previously. Be sure to include *your* GitHub username and email when you run the following in the **Terminal** (not the Console):

```
git config --global user.name "JaneEverydayDoe"
git config --global user.email "Jane.Everyday.Doe@gmail.com"
```

{format: png}
![`git config`](https://docs.google.com/presentation/d/1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA/export/png?id=1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA&pageid=g5eb2058428_0_1)

**Global RSA Key**

Now, it's time to set up the global options for the workspace, which will allow you to set up an SSH key for the workspace. Go to the Tools menu and select "Global Options" from the drop-down menu.

{format: png}
![Global Options](https://docs.google.com/presentation/d/1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA/export/png?id=1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA&pageid=g5eb2058428_0_11)

Within this window, select Git/SVN from the menu on the left, then click on "Create RSA Key..."

{format: png}
![Create RSA Key](https://docs.google.com/presentation/d/1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA/export/png?id=1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA&pageid=g5eb2058428_0_6) 

In the window that pops up, choose a passphrase and type it into both boxes. Remember this passphrase as you will need to type it in shortly. Then, click "Create".

{format: png}
![Create Passphrase](https://docs.google.com/presentation/d/1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA/export/png?id=1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA&pageid=g5eb2058428_0_16) 

This will return you to the Options window. On this window, click on "View public key". In the window that pops up, copy all the text for your key.

{format: png}
![View public key](https://docs.google.com/presentation/d/1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA/export/png?id=1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA&pageid=g5eb2058428_0_101)

You've now generated an RSA key for your project. It's time to let GitHub know about this key so that it can verify who you are. To do so, go to [http://github.com/keys]. In this window, click on "New SSH key". 

{format: png}
![New SSH key on GitHub](https://docs.google.com/presentation/d/1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA/export/png?id=1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA&pageid=g5eb2058428_0_89)


Create a Title for this Key and then paste the text you just copied from RStudio Cloud into this box. Then, click Add SSH key.

{format: png}
![Paste RSA key into box and add](https://docs.google.com/presentation/d/1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA/export/png?id=1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA&pageid=g5eb2058428_0_95)

**Project Options**

You've now established a global RSA key for this workspace on RStudio Cloud. Now, it's time to connect this specific project to a repo on GitHub. To do so, select "Project Options" from the Tools drop-down menu on RStudio Cloud.

{format: png}
![Project Options](https://docs.google.com/presentation/d/1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA/export/png?id=1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA&pageid=g5eb2058428_0_166)

As with the Global options, select "Git/SVN" from the menu at left. Then, select "Git" from the Version control system drop down menu.

{format: png}
![Select Git from drop-down menu](https://docs.google.com/presentation/d/1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA/export/png?id=1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA&pageid=g5eb2058428_0_26)

You will be asked two questions to confirm that you want a new git repository and that you want to restart RStudio. Select Yes for both.

{format: png}
![Yes to git repo and new project](https://docs.google.com/presentation/d/1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA/export/png?id=1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA&pageid=g5eb2058428_0_31)

At this point you now have a new Git tab for use within RStudio Cloud right next to the Build tab we've been using throughout this course

{format: png}
![Git tab now viewable](https://docs.google.com/presentation/d/1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA/export/png?id=1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA&pageid=g5eb2058428_0_36)

If you click on this tab, you'll see a list of the files in your R project. The question marks to the left of each file indicates that these files are untracked. (As a reminder, this means that git has not seen these before. You have not yet staged them.) An icon with an M indicates a file that has been modified. A D indicates a file has been deleted. And, an A indicates that it has been added (or staged).

{format: png}
![Git tab lists files and status](https://docs.google.com/presentation/d/1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA/export/png?id=1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA&pageid=g5eb2058428_0_42)

If you then click on Diff, you'll be brought to a new window. Here, if you click on any file, you can see the changes since your last commit. As this is our first commit, everything is new, thus it's all in green. In the future, deleted lines are shown in red.

{format: png}
![Diff shows you what has changed since last commit](https://docs.google.com/presentation/d/1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA/export/png?id=1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA&pageid=g5eb2058428_0_47)

To stage all of these files, click the check boxes to the left for all the files. Then, add a helpful commit message on the right, and click "Commit".

{format: png}
![Stage and commit these files](https://docs.google.com/presentation/d/1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA/export/png?id=1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA&pageid=g5eb2058428_0_52)

A window will pop up giving you an update of what has changed with this commit.

{format: png}
![Git commit summary](https://docs.google.com/presentation/d/1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA/export/png?id=1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA&pageid=g5eb2058428_0_58)

**Connect to remote (GitHub)**

At this point, we've generated an RSA key and shared that key with GitHub. We've also committed all our new files using git on RStudio Cloud. Now, it's time to take these files from RStudio Cloud and put them on GitHub.

To do this, you'll have to Create a repository as we've done before at [http://github.com/new]. Add the package name as the name of the repo and include a short Description. Leave all other fields as is and click "Create repository."

{format: png}
![Create GitHub repo](https://docs.google.com/presentation/d/1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA/export/png?id=1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA&pageid=g5eb2058428_0_182)

On the screen that shows up next there are instructions about how to connect GitHub with your files on RStudio Cloud. To do this, be sure to toggle "SSH" at the top if it is not already. Then copy the highlighted text from GitHub. It should look similar to what you see here, but with your GitHub username:

```
git remote add origin git@github.com:JaneEverydayDoe/cbds.git
git push -u origin master
```

{format: png}
![connect to remote GitHub repo](https://docs.google.com/presentation/d/1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA/export/png?id=1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA&pageid=g5eb2058428_0_187)

Copy this text and then paste it into the Terminal on RStudio Cloud. 

Upon pressing enter (and executing these commands), you will be asked first if you want to use the RSA key fingerprint that you generated. Type "yes". 

Then, you will be asked for your passphrase. This is the passphrase you created when generating your RSA key. Type that now and press enter.

{format: png}
![Type yes and enter passphrase](https://docs.google.com/presentation/d/1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA/export/png?id=1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA&pageid=g5eb2058428_0_74)

And, with that, your package will be pushed to GitHub! 
 
{format: png}
![Package on GitHub](https://docs.google.com/presentation/d/1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA/export/png?id=1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA&pageid=g5eb2058428_0_78)

As an added bonus, you'll no longer have to type in your username and password every time you want to make a change on GitHub thanks to your RSA key setup!

### Installing From GitHub

Once your built package is on GitHub, others (including yourself) are able to install and use your package.

To install your (or anyone's) package from GitHub, you use the following approach:

```
# install from GitHub
devtools::install_github("username/packagename")
```

So, for this package we would use the following in the Console:

```
# install from GitHub
devtools::install_github("janeeverydaydoe/cbds")
```
  
With that, the package has been installed. Then, you just have to load it using `library(cbds)` to start using the functionality within the package.

{format: png}
![Installing from GitHub](https://docs.google.com/presentation/d/1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA/export/png?id=1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA&pageid=g5eb2058428_0_225)

### Package Checking

In this lesson we noted that there are stricter rules and requirements for packages if you want to release them on CRAN or Bioconductor. While we won't be going into detail here, if you want more details, the [R Packages](https://r-pkgs.org) book is a great resource with lots of information about building a package for CRAN.

Nevertheless, we do want to mention that there is a way to check your packages for common issues. There is a helpful function `R CMD check` that you can use to check for these common issues. The more frequently you check your package during development, the better. This way you identify issues along the way shortly after you've written a function or test. This avoids having *tons* of issues at the end of package development and will make your life easier overall at the end when you release the package. 

The easiest way to check your package is to click on the Check icon within the Build tab.

{format: png}
![Check in Build Tab](https://docs.google.com/presentation/d/1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA/export/png?id=1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA&pageid=g5eb2058428_0_236)

This will start running a number of checks for you, giving you a readout of all the checks it's carrying out. This checks all the aspects of your package that we've covered in this course, including the package's structure, metadata, NAMESPACE, data code, tests, vignettes, and documentation.

{format: png}
![Checks running](https://docs.google.com/presentation/d/1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA/export/png?id=1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA&pageid=g5eb2058428_0_231)

At the end of all of these checks, you'll get a readout of what was found:

{format: png}
![RMD check results](https://docs.google.com/presentation/d/1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA/export/png?id=1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA&pageid=g5eb2058428_0_242)

Here you see that there was 1 warning. The warning here has to do with an outside requirement, qpdf. If you google this warning, you'll see that this warning is really only applicable if you want to submit your package to CRAN and that it requires installing qpdf. However, as we don't want to submit to CRAN at this point, we're in pretty good shape with no errors, notes, or other warnings!

Generally, **errors** should be fixed regardless of whether you're submitting to CRAN. **Warnings** are likely to cause an issue if you submit to release your package on CRAN. **Notes** are mild issues. It's best to ultimately have none of each of these, but it's not essential to address them all if the package is just for your own use.


### Continuous Integration: Travis

One step beyond manually checking each time you make changes to your package is to set up continuous integration. This will run these checks for you automatically, each time you push to GitHub. To do this, we'll use [Travis](https://travis-ci.org/profile).

** Travis Account**

To start using Travis with your R package, you'll first want to create a Travis account. Go to [https://travis-ci.org/profile] and click "Sign in with GitHub"

{format: png}
![Sign in with GitHub](https://docs.google.com/presentation/d/1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA/export/png?id=1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA&pageid=g5eb2058428_0_252)

On the next screen click, "Authorize travis-ci".

{format: png}
![Authorize Travis-ci](https://docs.google.com/presentation/d/1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA/export/png?id=1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA&pageid=g5eb2058428_0_258)

Once authorized, you'll want to click on the repo that you'd like to use with Travis. Here, we'll click on `cbds`.

{format: png}
![Select `cbds` repo to use with Travis](https://docs.google.com/presentation/d/1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA/export/png?id=1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA&pageid=g5eb2058428_0_263)

You'll get a note that this is not an active directory. Click "Activate repository" to activate.


You'll get a note that there are no builds for this repository. To change that, let's return to RStudio Cloud and set up Travis on that end.

{format: png}
![No builds](https://docs.google.com/presentation/d/1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA/export/png?id=1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA&pageid=g5eb2058428_0_273)


** `usethis::use_travis`**

To accomplish integrating Travis with RStudio on the RStudio Cloud end, there's another helpful function from the `usethis` package:

```
usethis::use_travis()
```

Execute this function and you'll see that a file `travis.yml` is generated.

{format: png}
![`usethis::use_travis()`](https://docs.google.com/presentation/d/1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA/export/png?id=1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA&pageid=g5eb2058428_0_278)

If you open this up, you'll notice that a few lines of information have been added there. 

{format: png}
![`travis.yml`](https://docs.google.com/presentation/d/1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA/export/png?id=1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA&pageid=g5eb2058428_0_283)


What these lines accomplish is that every time you push to GitHub or every time someone submits a pull request to your repo, `devtools::check()` (what is run when you click the "Check" icon) is automatically run. You'll learn about failures immediately, allowing you to address them more easily. Note that this yaml file *can* be customized. We'll stick with the defaults here, but know that you can read about more options at [http://docs.travis-ci.com/user/deployment/].

Having added this yaml file, we want to push these changes to GitHub. Return to the Git tab, select to stage these files, add a commit message, and commit these files. Then, be sure to push these files to GitHub. (You may be asked your passphrase again.)

{format: png}
![`travis.yml`](https://docs.google.com/presentation/d/1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA/export/png?id=1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA&pageid=g5eb2058428_0_288)

Upon pushing these changes to GitHub, Travis CI will automatically run `devtools::check()` for you. You can see Travis running on your Travis account. Yellow indicates a build that is running. Green indicates a successful build. Red indicates an error and something you'll want to address as soon as possible to avoid issues down the line.

{format: png}
![Travis checking build](https://docs.google.com/presentation/d/1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA/export/png?id=1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA&pageid=g5eb2058428_0_294)

It may take a while (~10 minutes) for your Travis build to generate. However, eventually it will either pass (and turn green) or fail (and be red). You'll also get a log indicating where it may have failed.

{format: png}
![Travis build failed - check log](https://docs.google.com/presentation/d/1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA/export/png?id=1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA&pageid=g5eb2058428_0_358)

If you followed the instructions here, your build will likely have failed. This was intentional. Builds fail frequently when you're just getting started! So, let's take a look at where we went wrong. By looking at the output on Travis we see that warnings were found. Well, this makes sense, we *know* that there are warnings. We just don't care about them at this point because we're not trying to put this package on CRAN.

So, we can tell Travis to *not* treat warnings as errors by adding the following to our `travis.yml` file:

```
warnings_are_errors: false
```

{format: png}
![Update `travis.yml`](https://docs.google.com/presentation/d/1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA/export/png?id=1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA&pageid=g5eb2058428_0_363)

After saving this file, we stage, commit, and push our changes to GitHub! Travis will then automatically re-build.

{format: png}
![Push changes](https://docs.google.com/presentation/d/1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA/export/png?id=1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA&pageid=g5eb2058428_0_368)

Eventually, Travis should indicate a successful build with a green check mark! Upon refresh, the badge at the top should indicate the build is "passing". Success!

{format: png}
![A successful build!](https://docs.google.com/presentation/d/1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA/export/png?id=1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA&pageid=g5eb2058428_0_392)

### Versioning

We specified a version number within our DESCRIPTION file in an earlier lesson in this course, but we didn't fully explain how versioning works. 

We mentioned previously that:

> your package's version will contain three numbers, separated by periods. Those numbers correspond to <major>.<minor>.<patch>. For example, 1.0.0 would be the first released version of your package. As you patch the package (make a small change), the patch value would increase, such that the next version may be 1.0.1. We'll discuss what major, minor, and patch mean in the context of versioning in the final lesson in this course.

So far, we've been using the version "0.0.0.9000". The fact that there are three zeroes indicates that this is still a development version. 9000 is a somewhat arbitrary number, but it's helpful to use this to indicate that this is not a "typical" released version. 

Upon release, you'll want to drop the dev number, which is why your first released version is "1.0.0". Here the major version is "1" and the minor and patch are both "0". If you were to fix bugs without adding new functionality to your package, you'd want to increase your **patch**. For example, you would update your version to be "1.0.1." However, patch numbers remain 0 from one version to the next.

If you included a few new features and bug fixes, this is a minor release, so you would increase the middle number by 1. These are the most common changes to package version. It's totally fie if you need more than one digit after many minor versions (i.e. 1.20.0).

A **major** release is typically reserved for large package changes where users of the old major release will not be able to use the new version as so much has changed. This would require increasing the first number in your version by 1. These happen less frequently than minor version changes or patches.

To change the version in your package, you would edit the version number in your DESCRIPTION file, Check, and rebuild your package before pushing the changes to GitHub.

### README.md

Last but not least, a README.md can be *very* helpful to others who stumble upon your released package. Similar to a less-detailed vignette, the README included with your package should explain why someone should use your package, briefly demonstrate how to use it, and include information about how to install the package.

The `usethis` package (of course!) has two helpful functions to generate these files for you which will generate the template README file and add it to *.Rbuildignore*.

```
# to include markdown-formatted text
usethis::use_readme_md()

# to include markdown-formatted text
# AND R code chunks
usethis::use_readme_rmd()
```

For our `cbds` package, we'll write a very brief README to demonstrate the process, but for a package released to others, you'd want a more helpful README, similar to that of the [googlesheets](https://github.com/jennybc/googlesheets/blob/master/README.md) or [dplyr](https://github.com/tidyverse/dplyr/blob/master/README.md) packages.

{format: png}
![`googlesheets` README](https://docs.google.com/presentation/d/1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA/export/png?id=1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA&pageid=g5eb2058428_1_0)

For now, we'll generate a Markdown README to demonstrate the process in our package using `usethis::use_readme_md()`. This creates the `README.md` file and opens it up for you to edit.

{format: png}
![usethis::use_readme_md() generates and opens README](https://docs.google.com/presentation/d/1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA/export/png?id=1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA&pageid=g5eb2058428_1_10)

In the file that is generated, for now, we can just edit the text to include that this is a personal package and demonstrate how to install it. We'll remove example for now until it becomes a full package for release.

{format: png}
![Edit file](https://docs.google.com/presentation/d/1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA/export/png?id=1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA&pageid=g5eb2058428_1_15)

Once edited, you'll click Preview to knit the file. You're then ready to add, commit, and push the changes to your repo. 

{format: png}
![Commit and push changes](https://docs.google.com/presentation/d/1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA/export/png?id=1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA&pageid=g5eb2058428_1_20)

Your Travis build will automatically begin and you're package will be checked and ready to go!

### Summary

In this lesson we've covered a whole lot. We've discussed how to release this package on GitHub, how to check your package before release, how to integrate this with Travis CI for automated checking, how to version your package, and briefly what to include in a README. We have not, however, discussed the ins and outs of how `devtools::check()` works, what precisely is checked, and how to deal with the warnings, errors, and notes you receive. If you're looking to release your package on CRAN, you'll ultimately have to get good at deciphering these. The [R Packages](https://r-pkgs.org) book can be a great resource for further understanding on this and all topics covered in this course.

### Additional Resources

* [Git & GitHub](https://r-pkgs.org/git.html), from *R Packages* by Hadley Wickham & Jenny Bryan
* [Automated Checking](https://r-pkgs.org/r-cmd-check.html), from *R Packages* by Hadley Wickham & Jenny Bryan
* [Releasing a Packages](https://r-pkgs.org/release.html), from *R Packages* by Hadley Wickham & Jenny Bryan


### Slides and Video

![Release](https://youtu.be/GfSWRhOGhiA)

  - [Slides](https://docs.google.com/presentation/d/1rir5qKFkrPwkXHfJDM6OILAeuSGlhisn2nTumwyBTQA/edit?usp=sharing)

{quiz, id: quiz_09_release}

### Release quiz

{choose-answers: 4} 
? What did creating the RSA accomplish?


C) Verified to GitHub who we are so that we don't have to type in our Username and password every time we push to GitHub
o) Verified to Travis who we are so that we don't have to type in our Username and password every time we push to GitHub
o) Verified to CRAN who we are so that we don't have to type in our Username and password every time we push to GitHub
o) Identifies who are so that GitHub believes us when we type in our Username and password every time we push to GitHub
o) Identifies who are so that Travis believes us when we type in our Username and password every time we push to GitHub
o) Identifies who are so that CRAN believes us when we type in our Username and password every time we push to GitHub

{choose-answers: 4} 
? Fill in the blank: There are the fewest requirements for releasing a package on \_\_\_\_\_\_.

C) GitHub
o) Travis
o) Bioconductor
o) Rstudio
o) RStudio Cloud
o) CRAN

{choose-answers: 4} 
? Which of the following does Travis accomplish?

C) automatically checks package every time changes are pushed to GitHub
o) generates package structure needed for package development
o) auto-generates README and updates package version
o) Releases your package on CRAN
o) Releases your package on GitHub
o) Releases your packages on Bioconductor

{choose-answers: 4} 
? Which of the following approaches enables you to download a package from GitHub?

C) `devtools::install_github()`
o) `install.packages()`
o) `devtools::install.github()`
o) `devtools::install.packages()`
o) `install_packages()`
o) `install_git()`

{/quiz}
