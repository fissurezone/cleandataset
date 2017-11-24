# Code book for Coursera *Getting and Cleaning Data* course project

The data set that this code book pertains to is located in the `tidy_data.txt` file of this repository.

See the `README.md` file of this repository for more background information on this data set.

The structure of the data set is described in the [Data](#data) section, its variables are listed in the [Variables](#variables) section, and the transformations that were carried out to obtain the data set based on the source data are presented in the [Transformations](#transformations) section.

## Data <a name="data"></a>

The `tidy_data.txt` data file is a text file, containing space-separated quoted values.

The first row contains the names of the variables, which are listed and described in the [Variables](#variables) section, and the following rows contain the values of these variables. 

## Variables <a name="variables"></a>

Each row contains, for a given subject and activity, 66 averaged signal measurements.

### Identifiers <a name="identifiers"></a>

- `subject`

	Subject identifier, integer, ranges from 1 to 30.

- `activity`

	Activity identifier, string with 6 possible values: 
	- `Walking`: subject was walking
	- `Walking Upstairs`: subject was walking upstairs
	- `Walking Downstairs`: subject was walking downstairs
	- `Sittng`: subject was sitting
	- `Standing`: subject was standing
	- `Laying`: subject was laying

### Average of measurements <a name="average-measurements"></a>

10294 mesaurements were recorded in the source data. Each measurement was made of multiple readings taken over a fixed-width time window of 2.56 sec and 50% overlap (128 readings/window). The standard deviations and means of these 66 mesaurements were averaged for each of the 30 subjects * 6 activities (180 records).

- `Average.Time.Domain.Body.Accelerometer.X.Axis.Mean`
- `Average.Time.Domain.Body.Accelerometer.Y.Axis.Mean`
- `Average.Time.Domain.Body.Accelerometer.Z.Axis.Mean`
- `Average.Time.Domain.Body.Accelerometer.X.Axis.Standard Deviation`
- `Average.Time.Domain.Body.Accelerometer.Y.Axis.Standard Deviation`
- `Average.Time.Domain.Body.Accelerometer.Z.Axis.Standard Deviation`
- `Average.Time.Domain.Gravity.Accelerometer.X.Axis.Mean`
- `Average.Time.Domain.Gravity.Accelerometer.Y.Axis.Mean`
- `Average.Time.Domain.Gravity.Accelerometer.Z.Axis.Mean`
- `Average.Time.Domain.Gravity.Accelerometer.X.Axis.Standard Deviation`
- `Average.Time.Domain.Gravity.Accelerometer.Y.Axis.Standard Deviation`
- `Average.Time.Domain.Gravity.Accelerometer.Z.Axis.Standard Deviation`
- `Average.Time.Domain.Body.AccelerometerJerk.X.Axis.Mean`
- `Average.Time.Domain.Body.AccelerometerJerk.Y.Axis.Mean`
- `Average.Time.Domain.Body.AccelerometerJerk.Z.Axis.Mean`
- `Average.Time.Domain.Body.AccelerometerJerk.X.Axis.Standard Deviation`
- `Average.Time.Domain.Body.AccelerometerJerk.Y.Axis.Standard Deviation`
- `Average.Time.Domain.Body.AccelerometerJerk.Z.Axis.Standard Deviation`
- `Average.Time.Domain.Body.Gyroscope.X.Axis.Mean`
- `Average.Time.Domain.Body.Gyroscope.Y.Axis.Mean`
- `Average.Time.Domain.Body.Gyroscope.Z.Axis.Mean`
- `Average.Time.Domain.Body.Gyroscope.X.Axis.Standard Deviation`
- `Average.Time.Domain.Body.Gyroscope.Y.Axis.Standard Deviation`
- `Average.Time.Domain.Body.Gyroscope.Z.Axis.Standard Deviation`
- `Average.Time.Domain.Body.GyroscopeJerk.X.Axis.Mean`
- `Average.Time.Domain.Body.GyroscopeJerk.Y.Axis.Mean`
- `Average.Time.Domain.Body.GyroscopeJerk.Z.Axis.Mean`
- `Average.Time.Domain.Body.GyroscopeJerk.X.Axis.Standard Deviation`
- `Average.Time.Domain.Body.GyroscopeJerk.Y.Axis.Standard Deviation`
- `Average.Time.Domain.Body.GyroscopeJerk.Z.Axis.Standard Deviation`
- `Average.Time.Domain.Body.Accelerometer.Magnitude.Mean`
- `Average.Time.Domain.Body.Accelerometer.Magnitude.Standard Deviation`
- `Average.Time.Domain.Gravity.Accelerometer.Magnitude.Mean`
- `Average.Time.Domain.Gravity.Accelerometer.Magnitude.Standard Deviation`
- `Average.Time.Domain.Body.AccelerometerJerk.Magnitude.Mean`
- `Average.Time.Domain.Body.AccelerometerJerk.Magnitude.Standard Deviation`
- `Average.Time.Domain.Body.Gyroscope.Magnitude.Mean`
- `Average.Time.Domain.Body.Gyroscope.Magnitude.Standard Deviation`
- `Average.Time.Domain.Body.GyroscopeJerk.Magnitude.Mean`
- `Average.Time.Domain.Body.GyroscopeJerk.Magnitude.Standard Deviation`
- `Average.Frequency.Domain.Body.Accelerometer.X.Axis.Mean`
- `Average.Frequency.Domain.Body.Accelerometer.Y.Axis.Mean`
- `Average.Frequency.Domain.Body.Accelerometer.Z.Axis.Mean`
- `Average.Frequency.Domain.Body.Accelerometer.X.Axis.Standard Deviation`
- `Average.Frequency.Domain.Body.Accelerometer.Y.Axis.Standard Deviation`
- `Average.Frequency.Domain.Body.Accelerometer.Z.Axis.Standard Deviation`
- `Average.Frequency.Domain.Body.AccelerometerJerk.X.Axis.Mean`
- `Average.Frequency.Domain.Body.AccelerometerJerk.Y.Axis.Mean`
- `Average.Frequency.Domain.Body.AccelerometerJerk.Z.Axis.Mean`
- `Average.Frequency.Domain.Body.AccelerometerJerk.X.Axis.Standard Deviation`
- `Average.Frequency.Domain.Body.AccelerometerJerk.Y.Axis.Standard Deviation`
- `Average.Frequency.Domain.Body.AccelerometerJerk.Z.Axis.Standard Deviation`
- `Average.Frequency.Domain.Body.Gyroscope.X.Axis.Mean`
- `Average.Frequency.Domain.Body.Gyroscope.Y.Axis.Mean`
- `Average.Frequency.Domain.Body.Gyroscope.Z.Axis.Mean`
- `Average.Frequency.Domain.Body.Gyroscope.X.Axis.Standard Deviation`
- `Average.Frequency.Domain.Body.Gyroscope.Y.Axis.Standard Deviation`
- `Average.Frequency.Domain.Body.Gyroscope.Z.Axis.Standard Deviation`
- `Average.Frequency.Domain.Body.Accelerometer.Magnitude.Mean`
- `Average.Frequency.Domain.Body.Accelerometer.Magnitude.Standard Deviation`
- `Average.Frequency.Domain.Body.AccelerometerJerk.Magnitude.Mean`
- `Average.Frequency.Domain.Body.AccelerometerJerk.Magnitude.Standard Deviation`
- `Average.Frequency.Domain.Body.Gyroscope.Magnitude.Mean`
- `Average.Frequency.Domain.Body.Gyroscope.Magnitude.Standard Deviation`
- `Average.Frequency.Domain.Body.GyroscopeJerk.Magnitude.Mean`
- `Average.Frequency.Domain.Body.GyroscopeJerk.Magnitude.Standard Deviation`

## Transformations <a name="transformations"></a>

The zip file containing the source data is located at [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).


The following transformations were applied to the source data:

1. The training and test sets were merged to create one data set.
1. The measurements on the mean and standard deviation (i.e. signals containing the strings `mean` and `std`) were extracted for each measurement, and the others were discarded.
1. The activity identifiers (originally coded as integers between 1 and 6) were replaced with descriptive activity names (see [Identifiers](#identifiers) section).
1. The variable names were replaced with descriptive variable names (e.g. `tBodyAcc-mean()-X` was expanded to `Time.Domain.Body.Accelerometer.X.Axis.Mean`), using the following set of rules:
	- Replaced (supposedly incorrect as per source's `features_info.txt` file) `BodyBody` with `Body`.
	- The initial `f` and `t` were expanded to `Frequency.Domain` and `Time.Domain` respectively.
	- `Acc`, `Gyro`, `Mag`, `Freq`, `mean`, and `std` were replaced with `Accelerometer`, `Gyroscope`, `Magnitude`, `Frequency`, `Mean`, and `Standard.Deviation` respectively.
	- Trailing axis of measurement `X`, `Y`, or `Z` were replaces with `X.Axis`, `Y.Axis`, `Z.Axis` respectively.
	- The Axis of mesurement `X.Axis`, `Y.Axis`, `Z.Axis` were moved to the left of the class of mesaurement, i.e. `Mean` or`Standard.Deviation`.
	- Special characters (i.e. `(`, `)`, and `-`) were removed
1. From the data set in step 4, the final data set was created with the average of each variable for each activity and each subject.
1. `Average` was prepended to each variable name in the final data set

The collection of the source data and the transformations listed above were implemented by the `run_analysis.R` R script (see `README.md` file for usage instructions).