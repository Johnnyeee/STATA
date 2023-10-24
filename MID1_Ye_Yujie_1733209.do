cd "D:\ECON113\midterm1"

capture log close  			
log using Ye_1733209_refugee2results, replace

clear all
set more off

sysuse auto

*a
use refugee_data2

*c
tab marital_status

*d
twoway (scatter hrs_work english_prof), ytitle(hours worked per week) xtitle(english proficiency)
graph export MID1_scatter_Ye_Yujie_1733209.pdf, replace

*e
gen age_indicator = 1 if age > 40
replace age_indicator = 0 if age <= 40

*f

ttest hrs_work = 20, level(99)

 log close