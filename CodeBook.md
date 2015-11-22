## Human activity recognition using Smartphones dataset (simplified)

## Author: Hari A R

## Code Book

This database is based on the recordings of 30 subjects within an age bracket of 19-48 years performing activities of daily living (abbreviated henceforth as ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. It was obtained from the following [link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). More information pertaining to the nature of the data  and the experiments used to capture the measurements can be obtained by visiting the link. 

##The tidy data file

The data is contained in a text file, `tidyData.txt`. If this file does not exist, it is created by the R script `gettingcleaningproject.R`. It consists of a header row and 180 data rows, each containing 68 values, where all the fields are space-delimited.

The file in question presents the requisite variables (listed below) in a narrow form tidy data format. Both the wide and narrow forms can be considered to be 'tidy' depending upon the application in mind. In this matter, we draw the attention of the reader to pp. 15 of Hadley Wickham's paper on the subject [here](http://vita.had.co.nz/papers/tidy-data.pdf).

##The variables in the tidy data file

 - `subject` : An integer between 1 and 30, denoting the subject upon whom the experiment was performed.
 - `activity` : The activities performed by the subject and the source of the measurement. Possible values are:
    * `Laying`
    * `Sitting`
    * `Standing`
    * `Walking`
    * `Walking downstairs`
    * `Walking upstairs`

The remaining 66 variables represent the averages/standard deviations of the normalized observations recorded by the accelerometers/gyroscopes of the smartphones. The variable names have four levels of descriptors; these descriptors follow the format outlined below:

 - (domain)_ (observation)_ (statistic)_ (axis of measurement, if there is one)

The values for each coordinate:

`(domain)`:

* `Time`: Usual temporal measurement
* `Freq`: Fast Fourier Transform of the `Time` measurement. 

`(observation)`:

 * `BodyAccJerk`: Body acceleration jerk reading
 * `BodyAcc`: Body acceleration reading
 * `GravityAcc`: Gravity acceleration reading
 * `BodyAccMag` : Magnitude of 3-D body acceleration calculated using Euclidean Norm
 * `BodyAccJerkMag` : Magnitude of 3-D body jerk calculated using Euclidean Norm
 * `BodyGyroJerk`: Body gyroscope jerk reading
 * `BodyGyro`: Body gyroscope reading
 * `BodyGyroMag` : Magnitude of 3-D body gyroscope reading calculated using Euclidean Norm
 * `GravityAccMag`: Magnitude of 3-D Gravity acceleration calculated using Euclidean Norm

`(statistic)`:

* `MEAN`: Mean
* `STD`: Standard Deviation

`(axis of measurement, if one)`:

* `xAxis`, `yAxis`, or `zAxis`: direction of the axial signals.
