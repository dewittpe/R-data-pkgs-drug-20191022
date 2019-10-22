#'---
#'title: "R Data Packages"
#'subtitle: "Denver R User Group"
#'author: "Peter E. DeWitt, Ph.D.<br><peter.dewitt@cuanschutz.edu>"
#'date: 22 October 2019
#'output:
#'  ioslides_presentation:
#'    keep_md: false
#'    widescreen: true
#'    logo: drug-logo.jpeg
#'    css: style.css
#'    self_contained: true
#'---
#'
#+ label = "setup", include = FALSE
knitr::opts_chunk$set(collapse = TRUE)

#'
#' # Data Packages
#'
#' ## Data Packages are Common
#' * Common for data sets to be included in packages
#'     * Useful for examples and documentation
#'     * Some R packages are just data sets, nothing else.
#+ size = "tiny"
head(data(package = "ggplot2")$results, 2)

head(data(package = "datasets")$results, 2)

#'
#'
#' # Problem to solve
#'
#' ## Reasons to build and use R Data Packages
#'
#' 1. Commonly used data, e.g., mtcars
#'     * Good for active work
#'     * Archiving data sets
#' 2. Limited Memory (RAM and or disk space)
#' 3. Collaborating on data which cannot be hosted on a central location
#'     * Cannot afford the hardware and admin costs
#'     * Sensitive data which needs to stay off line
#'
#' * All scenarios can support version control of data
#'
#' # My Motivating Problem
#'
#' ## More data than disk space
#'
#' | Data Set                | Compressed Size     | Uncompressed Size  |
#' | :---------              | ------------------: | -----------------: |
#' | Data Set A              |             59.0 GB |            568 GB  |
#' | Data Set B              |              4.3 GB |             23 GB  |
#' | Data Set C              |             41.0 GB |            144 GB  |
#' | Data Set D              |             36.0 GB |             81 GB  |
#' | Additional common files |           *trivial* |         *trivial*  |
#' |                         | **total:** 140.3 GB | **total:** 816 GB  |
#'
#'* Computing Resources: one laptop
#'  * Intel core i9 8th Gen / 916 GB hard drive space / 32 GB RAM (+32 GB SWAP)
#'
#' ## More data than disk space
#'
#' * **956 GB of data (compressed & decompressed) > 916 GB hard drive**
#'
#' * Need space for OS, applications, other projects
#' * Version control the data?  Back ups?
#'
#' * Data use agreements:
#'     * All data stays on Institution owned machines.
#'     * Cloud storage/computing resources are not an option.
#'
#' * Operating budget: $0
#'
#' * Self Imposed Requirement: *Reproducible Reports*
#'     * Fully documented -- literate programming and dynamic documents
#'     * Easy to reproduce -- rely on GNU make
#'
#' * Common solution for each of the major data sets
#'
#' ## Possible Solutions | Compressed data in the package
#'
#' * Version controlled (compressed data is versioned)
#' * Decompress to temp directory
#' * Import data into spark cluster without caching the data
#'
#' ## Possible Solutions | Compressed data in the package
#'
#' * Pros
#'     * temp directory will be unlinked with R session exits without error,
#'     * temp directory will be unlinked on system restart
#'     * keeps disk open for other data sets and general work.
#'     * easy to part an analysis into parts
#'     * scalable
#'
#' * Cons
#'     * slow (compared to a DB, server, etc.)
#'
#' * Slow is better than impossible
#' * This was the solution I used initially.
#'
#' ## Structure
#'
#' <div class="box13">
#' Package Structure
#' <iframe src="tree1.txt.html"></iframe>
#' </div>
#' <div class="box23">
#' import.R
#' <iframe src="import.R.html"></iframe>
#' </div>
#'
#' ## Possible Solutions | Tools for verifying data and importing
#'
#' I am working on a public project
#'
#' * R package for downloading and installing the Physician/Supplier Procedure
#' Summary Data provided by the Centers for Medicare and Medicaid
#'
#' * Focus on tools for importing the data via data.table or spark
#'
#' * Let's look at
#'      * github.com/dewittpe/cms.psps and
#'      * github.com/dewittpe/cms.program.statistics
#'
#' # Another Data Problem
#'
#' ## Archive and Publicly Release Data
#'
#' * A prospective observational research study on pediatric injuries needs to
#' be:
#'
#'     1. Protected Health Information (PHI) needs to be scrubbed from the data
#'     before release.
#'     2. Secondary potential identifiers need to be scrubbed before release.
#'     3. Data needs to be documented and published publicly.
#'
#' * Archived data will be easy to distribute.
#' * Easy to make sure everyone has the save version of the data.
#'
#' # Version Control
#'
#' ## Use the data package version number
#'
#' * Public packages will require well formed and "short" version numbers
#+
packageVersion("cms.psps")
packageVersion("cms.psps") == "0.0.0.9000"
packageVersion("cms.psps") >  "0.0.1"
packageVersion("cms.psps") >  "0.0.0.1"
#'
#' * Non public packages can use longer verison numbers, i.e., YYYY.MM.DD.HHMM
#'
# packageDescription("<package.name>") == "2019.10.22.1743"
#'
#' # Thank you for your time
#'
#' <img width=25% src="drug-logo.jpeg" align='left'> </img>
#'
#' **_Questions?_**
#'
#' **_Comments?_**
#'
#' **_Other Solutions?_**
#'
# /* end of file */
