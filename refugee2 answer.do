cd "..."

clear all
set more off

/* part - b */
cap log close
log using "LASTNAME_STUDENTID_refugee2results.log", replace

/* part - a */
use "refugee_data2.dta"

/* part - c */
describe
count if marital_status == 1
display 1413/2504

/* part - d */
twoway (scatter hrs_work english_prof), ytitle(Hours Worked) xtitle(English Proficiency)
graph export Scatter_Plot_LASTNAME_STUDENTID.pdf, replace

/* part - e */
gen indicator = 0 
replace indicator = 1 if age > 40

/* part - f */
ttest hrs_work  == 20, level(99)
