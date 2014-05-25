## Overview

This repository contains scripts that transform and summize a Human Activity Regocognition dataset.
 
## Contents

The repository contains the following files:

* "summarydata.csv" contains the tidy data set with summary data 
* "CodeBook.md" contains a description of the variables and the scripts used to transform them
* "run_analysis.R" contains the scripts that transform the data

## Overview of Scripts

All scripts are ran using the "run_analysis.R" file.  The scripts combine the original test and training datasets, and them select only the variables that directly collect means and standard deviations of variables.  The average of these original means and standard deviations are reported out in the "summarydata.csv" file, by subject and by activity.  The scripts and transformations are described in "CodeBook.md".  

## Selected Variables

Some variables were excluded because they include transformations of values and not the means of measurements, as the instructions indicate.  All "meanFreq" variables were excluded and all of the angle variables were excluded; for example, "angle(Y,gravityMean)".

