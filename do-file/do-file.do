/*
Name: read-soep.do
Author: Garbuszus
Date: 2016-02-28
Content: Importing SOEP-data
*/

// webuse nhanes2b

// save "~/nhanes2b.dta"

capture log close

** We write code for Stata version 8 and later
version 8 // This runs with Stata 8 and might not work with Stata 7

** remove everything from our data memory
clear all
** disables more functionalty
set more off

use "~/multistage.dta"

des


// variables

** clone variable
clonevar SEX = sex

** generate variable
gen gender = .
recode gender . = 1 if sex == 1
recode gender . = 2 if sex == 2

** spot the difference
tab SEX
tab gender

drop sex // throw this variable away
** gender is now called sex
rename gender sex

** spot the difference
tab sex
tab SEX

clonevar edu = school

recode edu 10 = .
* different missing values (Stata knows .a - .z)
recode edu 9 = .a
recode edu 8 = .b
recode edu 7 = .c

tab sex if county == 1 & ///
  (school == 1 | school == 2)
  
** label a variable
label variable sex "Sex"
** define label for values
label define labsex 1 "male" 2 "female"
** assign label to variable
label values sex labsex 

// create weight and height
replace weight = weight / 2.2
replace height = height * 0.004

// bmi for lbs and in
gen bmi = (weight / (height ^ 2))

  gen bmi_r = round(bmi)
  recode bmi_r ///
    (0/18.5=1) /// underweight
    (18.5/25.0=2) /// normal
    (25.0/30.0=3) /// overweight
    (30.0/60=4) // obese
    
  tab bmi_r
    


recode school ///
(10=.) ///
(1=1 "One") ///
(2=2 "Two") ///
(3 5 6 7 8 = 99 "Ninetynine") ///
(4=3 "Three") ///
(9=5 "Five"), gen (school_rec)



** weight
replace weight = -1 if weight < 40
replace weight = -2 if weight > 140

tab weight
mean weight

mvdecode weight, mv (-1=.a\-2=.b)
mean weight


set scheme s1mono

scatter weight height
graph export "/home/jmg/Source/StataFolien/images/scatter.eps", replace

graph box weight
graph export "/home/jmg/Source/StataFolien/images/box.eps", replace

hist weight, freq
graph export "/home/jmg/Source/StataFolien/images/hist.eps", replace

graph dot (mean) weight, over(sex)
graph export "/home/jmg/Source/StataFolien/images/dot.eps", replace

mean height
summarize height
summarize height, detail

tabstat height, statistic(min max mean median p50)
tabstat height, statistic(min max range mean count q) by(county)

tabstat height, statistic(sd sem var q iqr)
tabstat height, statistics(skewness kurtosis)

tab county, summarize(height)


tab school county

** tabs of each variable
tab1 sex county school
** cross tabs of ab bc ac
tab2 sex county school

** chi^2
tab sex county, chi
** cramers v
tab sex county, V

** manual
tab sex county, exp col row
** phi and for 2x2 tabs V
di (1013*1002 - 925*1131) / (2144*1927*1938*2133)^(1/2) 
** chi^2
di 4071 *(-.00753735)^2
** usual way to compute V
di (.23128021 / 4071 * (2 - 1) )^(1/2) // V
