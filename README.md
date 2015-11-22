## Human activity recognition using Smartphones dataset (simplified)

## Author: Hari A R

## README for gettingcleaningdata-courseraproject repo

### Data Source:

This database is based on the recordings of 30 subjects within an age bracket of 19-48 years performing activities of daily living (abbreviated henceforth as ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. It was obtained from the following [link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). More information pertaining to the nature of the data  and the experiments used to capture the measurements can be obtained by visiting the link. 

### Files in this repository:

 * `tidyData.txt`:  The cleaned and simplified data set produced in R. If this file does not exist, it is created by the R script `gettingcleaningproject.R`. Readers wishing to view this data set can do so by using the following appropriate command in R:

 > tidyData <- read.table("tidyData.txt", header = TRUE)

 > View(tidyData)

**Disclaimer :** In using the above R code, the inherent assumption is that the file is being stored in the current R working directory. 

We also note that this is a tidy data text file as per pp. 15 of Hadley Wickham's paper on the subject [here](http://vita.had.co.nz/papers/tidy-data.pdf).
Of course, its `tidiness' will ultimately depend upon the kind of analysis that the user of this data wants to subject it to.

 *  `CodeBook.md`:  
    Explanation of the structure of, and variables contained in `tidyData.txt`.


 * `README.md`:  
    This file.

 * `gettingcleaningproject.R`:  

 

    The R script for acquiring and processing the data set in question.
    The following operations are performed by this script:
    
    1. If the experimental data set is not in the current directory, the script downloads and unzips it. 
    
    2. Combines the test/training sets into a single data set.
    
    3. For each measurement in the data set, only extracts the mean and 
       standard deviation pertaining to that measurement. 
    
    4. Replaces the numeric activity codes by descriptive text.
    
    5. Slightly modifies the variable names of the original data set for readability.  (See `CodeBook.md`)

	6. Using the `dplyr` package, creates a new summary data set, grouped by subject and activity. This new data set reports the averages of all reported means and standard 
deviations obtained in step 3.

    7. This new summary dataset is written to `tidyData.txt`
