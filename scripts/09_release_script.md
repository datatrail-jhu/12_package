At this point, we've got our `cbds` package with two functions, documentation, unit tests, and a vignette. It's only meant to be a package for our use at this point, so we're not planning to release this package, but you should be familiar with how to release a package generally. So, we'll walk through those steps in this lesson. Releasing a package generally includes making it available to the public. There are a few main repositories for R packages. We've discussed these before, but I'll remind you that CRAN is the general place to R package release. When you run `install.packages()`, packages are located on CRAN and then installed. However, there are a number of requirements for packages included on CRAN to ensure consistency between packages and that all packages will work for all other users. There is a similar platform called Bioconductor for R packages related to bioinformatics. Finally, packages can be released on GitHub. The requirements for this are lower than for releasing a package on CRAN or Bioconductor. This means that for packages to be widely used, you'll want to put them on CRAN. For packages for your own use or while they're still in development, GitHub is the way to go! GitHub is also the simplest way to release a package. This is great because we're already familiar with working with GitHub, so it won't require a totally new skill. Additionally, even though we're not planning to release this package to the world yet, by putting this package on GitHub means that it will be version controlled, which we should do with all of our work - a win-win!

To get started on getting your package on GitHub, it's important that you're currently within your package's project. (If you're unsure, you can click on the Rproj for your package: `cbds.Rproj` to take you there. If you're not yet in the correct R project, you'll be asked if you want to switch to that project. Switch now! Alternatively, if you're already there, a window with the Project Options will pop up, indicating you're where you need to be and you can just click Cancel.)

Once you're sure you're within your package's R project, the next thing we're going to do is set up an SSH key so that you don't have to put your username and password in every time you push to GitHub. Now, we'll note that this SSH key will only work for this workspace. Any other workspaces in RStudio Cloud will require you to set up a separate SSH key. To get started, we'll first let git know who you are as we've done previously. Be sure to include your GitHub username and email when you run the code you see here in the Terminal (not the Console).

Now, it's time to set up the global options for the workspace, which will allow you to set up an SSH key for the workspace. Go to the Tools menu and select "Global Options" from the drop-down menu.

Within this window, select Git/SVN from the menu on the left, then click on "Create RSA Key..."

In the window that pops up, choose a passphrase and type it into both boxes. Remember this passphrase as you will need to type it in shortly. Then, click "Create".

This will return you to the Options window. On this window, click on "View public key". In the window that pops up, copy all the text for your key.

You've now generated an RSA key for your project. It's time to let GitHub know about this key so that it can verify who you are. To do so, go to [http://github.com/keys]. In this window, click on "New SSH key". 

Create a Title for this Key and then paste the text you just copied from RStudio Cloud into this box. Then, click Add SSH key.

You've now established a global RSA key for this workspace on RStudio Cloud. Now, it's time to connect this specific project to a repo on GitHub. To do so, select "Project Options" from the Tools drop-down menu on RStudio Cloud.

As with the Global options, select "Git/SVN" from the menu at left. Then, select "Git" from the Version control system drop down menu.

You will be asked two questions to confirm that you want a new git repository and that you want to restart RStudio. Select Yes for both.

At this point you now have a new Git tab for use within RStudio Cloud right next to the Build tab we've been using throughout this course

If you click on this tab, you'll see a list of the files in your R project. The question marks to the left of each file indicates that these files are untracked. (As a reminder, this means that git has not seen these before. You have not yet staged them.) An icon with an M indicates a file that has been modified. A D indicates a file has been deleted. And, an A indicates that it has been added (or staged).

If you then click on Diff, you'll be brought to a new window. Here, if you click on any file, you can see the changes since your last commit. As this is our first commit, everything is new, thus it's all in green. In the future, deleted lines are shown in red.

To stage all of these files, click the check boxes to the left for all the files. Then, add a helpful commit message on the right, and click "Commit".

A window will pop up giving you an update of what has changed with this commit.

At this point, we've generated an RSA key and shared that key with GitHub. We've also committed all our new files using git on RStudio Cloud. Now, it's time to take these files from RStudio Cloud and put them on GitHub. To do this, you'll have to Create a repository as we've done before at [http://github.com/new]. Add the package name as the name of the repo and include a short Description. Leave all other fields as is and click "Create repository."

On the screen that shows up next there are instructions about how to connect GitHub with your files on RStudio Cloud. To do this, be sure to toggle "SSH" at the top if it is not already. Then copy the highlighted text from GitHub. It should look similar to what you see here, but with your GitHub username.

Copy this text and then paste it into the Terminal on RStudio Cloud. Upon pressing enter (and executing these commands), you will be asked first if you want to use the RSA key fingerprint that you generated. Type "yes". Then, you will be asked for your passphrase. This is the passphrase you created when generating your RSA key. Type that now and press enter.

And, with that, your package will be pushed to GitHub! As an added bonus, you'll no longer have to type in your username and password every time you want to make a change on GitHub thanks to your RSA key setup!

Once your built package is on GitHub, others (including yourself) are able to install and use your package. To install your (or anyone's) package from GitHub, you use code you see here, where you specify the github username of where the package is on github and the name of the package, separated by a slash. With that, the package has been installed. Then, you just have to load it using `library(cbds)` to start using the functionality within the package.

In this lesson we noted that there are stricter rules and requirements for packages if you want to release them on CRAN or Bioconductor. While we won't be going into detail here, if you want more details, the R Packages book at https://r-pkgs.org is a great resource with lots of information about building a package for CRAN. Nevertheless, we do want to mention that there is a way to check your packages for common issues. There is a helpful function `R CMD check` that you can use to check for these common issues. The more frequently you check your package during development, the better. This way you identify issues along the way shortly after you've written a function or test. This avoids having tons of issues at the end of package development and will make your life easier overall at the end when you release the package. The easiest way to check your package is to click on the Check icon within the Build tab.

This will start running a number of checks for you, giving you a readout of all the checks it's carrying out. This checks all the aspects of your package that we've covered in this course, including the package's structure, metadata, NAMESPACE, data code, tests, vignettes, and documentation.

At the end of all of these checks, you'll get a readout of what was found. Here you see that there was 1 warning. The warning here has to do with an outside requirement, qpdf. If you google this warning, you'll see that this warning is really only applicable if you want to submit your package to CRAN and that it requires installing qpdf. However, as we don't want to submit to CRAN at this point, we're in pretty good shape with no errors, notes, or other warnings! Generally, errors should be fixed regardless of whether you're submitting to CRAN. Warnings are likely to cause an issue if you submit to release your package on CRAN. Notes are mild issues. It's best to ultimately have none of each of these, but it's not essential to address them all if the package is just for your own use.

One step beyond manually checking each time you make changes to your package is to set up continuous integration. This will run these checks for you automatically, each time you push to GitHub. To do this, we'll use Travis. To start using Travis with your R package, you'll first want to create a Travis account. Go to https://travis-ci.org/profile and click "Sign in with GitHub"

On the next screen click, "Authorize travis-ci".

Once authorized, you'll want to click on the repo that you'd like to use with Travis. Here, we'll click on `cbds`.

You'll get a note that this is not an active directory. Click "Activate repository" to activate.

You'll get a note that there are no builds for this repository. To change that, let's return to RStudio Cloud and set up Travis on that end. 

To accomplish integrating Travis with RStudio on the RStudio Cloud end, there's another helpful function from the `usethis` package. Execute the code and you see here. This will generate a file: `travis.yml`.

If you open this up, you'll notice that a few lines of information have been added in that file for you.  What these lines accomplish is that every time you push to GitHub or every time someone submits a pull request to your repo, `devtools::check()` (what is run when you click the "Check" icon) is automatically run. You'll learn about failures immediately, allowing you to address them more easily. Note that this yaml file can be customized. We'll stick with the defaults for now though.

Having added this yaml file, we want to push these changes to GitHub. Return to the Git tab, select to stage these files, add a commit message, and commit these files. Then, be sure to push these files to GitHub. (You may be asked your passphrase again.)

Upon pushing these changes to GitHub, Travis CI will automatically run `devtools::check()` for you. You can see Travis running on your Travis account. Yellow indicates a build that is running. Green indicates a successful build. Red indicates an error and something you'll want to address as soon as possible to avoid issues down the line.

It may take a while (~10 minutes) for your Travis build to generate. However, eventually it will either pass (and turn green) or fail (and be red). You'll also get a log indicating where it may have failed. If you followed the instructions here, your build will likely have failed. This was intentional. Builds fail frequently when you're just getting started! So, let's take a look at where we went wrong. By looking at the output on Travis we see that warnings were found. Well, this makes sense, we know that there are warnings. We just don't care about them at this point because we're not trying to put this package on CRAN.

So, we can tell Travis to not treat warnings as errors by adding the final like you see here to our `travis.yml` file.

After saving this file, we stage, commit, and push our changes to GitHub! Travis will then automatically re-build.

Eventually, Travis should indicate a successful build with a green check mark! Upon refresh, the badge at the top should indicate the build is "passing". Success!

We specified a version number within our DESCRIPTION file in an earlier lesson in this course, but we didn't fully explain how versioning works. We mentioned previously that your package's version will contain three numbers, separated by periods. Those numbers correspond to <major>.<minor>.<patch>. For example, 1.0.0 would be the first released version of your package. As you patch the package (make a small change), the patch value would increase, such that the next version may be 1.0.1. We'll discuss what major, minor, and patch mean in the context of versioning in the final lesson in this course. So far, we've been using the version "0.0.0.9000". The fact that there are three zeroes indicates that this is still a development version. 9000 is a somewhat arbitrary number, but it's helpful to use this to indicate that this is not a "typical" released version. Upon release, you'll want to drop the dev number, which is why your first released version is "1.0.0". Here the major version is "1" and the minor and patch are both "0". If you were to fix bugs without adding new functionality to your package, you'd want to increase your patch. For example, you would update your version to be "1.0.1." However, patch numbers remain 0 from one version to the next. If you included a few new features and bug fixes, this is a minor release, so you would increase the middle number by 1. These are the most common changes to package version. It's totally fie if you need more than one digit after many minor versions (i.e. 1.20.0). A major release is typically reserved for large package changes where users of the old major release will not be able to use the new version as so much has changed. This would require increasing the first number in your version by 1. These happen less frequently than minor version changes or patches. To change the version in your package, you would edit the version number in your DESCRIPTION file, Check, and rebuild your package before pushing the changes to GitHub.

Last but not least, a README.md can be very helpful to others who stumble upon your released package. Similar to a less-detailed vignette, the README included with your package should explain why someone should use your package, briefly demonstrate how to use it, and include information about how to install the package. The `usethis` package (of course!) has two helpful functions, as you see here, to generate these files for you which will generate the template README file and add it to .Rbuildignore.

For our `cbds` package, we'll write a very brief README to demonstrate the process, but for a package released to others, you'd want a more helpful README, similar to that of the googlesheets 

or dplyr packages.

For now, we'll generate a Markdown README to demonstrate the process in our package using `usethis::use_readme_md()`. This creates the `README.md` file and opens it up for you to edit.

In the file that is generated, for now, we can just edit the text to include that this is a personal package and demonstrate how to install it. We'll remove example for now until it becomes a full package for release.

Once edited, you'll click Preview to knit the file. You're then ready to add, commit, and push the changes to your repo. Your Travis build will automatically begin and you're package will be checked and ready to go!

In this lesson we've covered a whole lot. We've discussed how to release this package on GitHub, how to check your package before release, how to integrate this with Travis CI for automated checking, how to version your package, and briefly what to include in a README. We have not, however, discussed the ins and outs of how `devtools::check()` works, what precisely is checked, and how to deal with the warnings, errors, and notes you receive. If you're looking to release your package on CRAN, you'll ultimately have to get good at deciphering these. The R Packages book can be a great resource for further understanding on this and all topics covered in this course.
