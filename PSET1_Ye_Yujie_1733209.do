cd "D:\ECON113"

clear all
set more off


use state_stats.dta 
label var labor_force "People in the Labor Force"

*b Answer*
	
gen urate = 100*(unemployed/labor_force)
label var urate "Unemployment Rate"
summarize urate 
count if urate >=5



*c Answer*
*find median*
summarize state_id,d 
list urate if state_id == 29



*d Answer*
gen allstates = _N 
gen states = 0 if urate <= 3.02856 
egen somestates = count(states) 
gen proportion = 100*(somestates/allstates)
display proportion 


*e Answer*
egen maxurate = max(urate)
list state_id if urate == maxurate


*f Answer*
merge 1:1 state_id using bf_crosssection_annual.dta 
*way1*
egen tmp1 = mean(ba_nsa / (urate >= 4)) 
display r(mean)
*way2*
summarize ba_nsa if urate <4
display r(mean)


*g Answer*
gen ln_ba_nsa = ln(ba_nsa) 

histogram ln_ba_nsa, discrete width(0.5) start(8.5) xlabel(#10) addlabel xtitle(ln(new business applications))
graph export PSET1_Histogram_Ye_Yujie_1733209.pdf, replace

*h Answer*
twoway (scatter ln_ba_nsa urate), ytitle(ln(New Business Applications)) xtitle(Unemployment Rate)
graph export PSET1_scatter_biz_to_urate_Ye_Yujie_1733209.pdf, replace

*i Answer*
gen ln_pop = ln(population) 
twoway (scatter ln_ba_nsa ln_pop), ytitle(ln(New Business Applications)) xtitle(ln(Population)) 
graph export PSET1_scatter_biz_to_pop_Ye_Yujie_1733209.pdf, replace
corr(ln_ba_nsa ln_pop)
display r(rho)


