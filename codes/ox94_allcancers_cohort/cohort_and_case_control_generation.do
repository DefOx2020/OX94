************************************************************************************
* Project: OX94- CTYA cancer early clinical features
* Authors: Defne Saatci 
* Date: 22/12/2021 - 01/01/2024
* Version: 1.0
*
* 
* Input file: multiple, from OX94 projects
* Output file: log file;
*      
*				        
********************************************************************************



********************************************************************************
*     TABLE OF CONTENTS:  
*			COHORT GENERATION
*			DESCRIPTIVES OF COHORT
*			CASE-CONTROL GENERATION
********************************************************************************

log using "C:\Users\Defne Saatci.QRESEARCH\Downloads\ox94\log\cleaning_v2_DS.smcl", replace 

********************************************************************************
*                   1) COHORT GENERATION		                         
********************************************************************************
***1) Define Exit Date***
//1.1) reaching age 25 in cohort and remove >24 to match PHE cohort**

gen date25= yearofbirth + 9130
format date25 %td
sort date25
drop if age>24 //n=400,915
tab sex1

//1.2) remove patids who exit after exitdate 31dec2019 

gen exit_date_final=td(31dec2019)
format exit_date_final %td

gen exitdate2=min(exit_date_final, exitdate)
format exitdate2 %td

gen exit_x=0
replace exit_x=1 if exitdate>exitdate2

sort exit_x
by exit_x: tab exitstatus

drop if (exit_x==1 & (exitstatus==1|exitstatus==2)) //n=479,621
tab sex1 

//1.3) Generate final exit date (either cancer diagnosis or leaving cohort)
gen exit_final=min(exitdate2, date25)
format exit_final %td

gen cancer_fu=min(cancer_date_all, exit_final)
format cancer_fu %td
sort cancer_fu

***2) Define Entry Requirements *** 
//2.1) Remove patids who are in the cohort for >1 year 
gen entryperiod=exitdate2-enter3
gen entercat=0
replace entercat=1 if entryperiod<365.25
sort entercat
by entercat: tab cancer_type

drop if entercat==1 // n=726,115

***3) Remove patids who have a cancer diagnosis beyond the age scope or outside entry/exit*** 
//3.1) remove agediag>24y or <0**

gen agediagnosis2=year(cancer_date_all)-year(yearofbirth)
tab agediagnosis2
drop if (any_cancer_source==1 & (agediagnosis2<0 | agediagnosis2>24)) // n=5,059
tab cancer_type
replace any_cancer_source=0 if any_cancer_source==.
tab any_cancer_source agediagnosis2


//3.2) remove cancers before entry date 

gen test1=0
replace test1=1 if (any_cancer_source==1 & cancer_date_all<=enter3)
replace test1=2 if (any_cancer_source==1 & cancer_date_all>enter3)
tab test1
sort test1
by test1: tab cancer_type
drop if test1==1
tab cancer_type


//3.3) make controls if cancer after exit date
gen after_exit=0
replace after_exit=1 if (any_cancer_source==1 & cancer_date_all>exitdate2)
replace after_exit=2 if (any_cancer_source==1 & cancer_date_all<exitdate2)
replace after_exit=3 if (any_cancer_source==0 & cancer_date_all<exitdate2)


****4) remove dates that appear wrong *****
//4.1 date of cancer before dob 
drop if (cancer_date<yearofbirth | effectivedatetime<yearofbirth | hes_admidate<yearofbirth)
tab cancer_type
//4.2 date of exit before entry
gen test2=0
replace test2=1 if exit_final<=enter3
drop if test2==1 

*****5) remove GP only cancer diagnoses - as per discussions *****
//5.1)drop gp only diagnoses**
tab cancer_source
sort cancer_source
by cancer_source: tab test1
by cancer_source: tab after_exit
drop if cancer_source==6 
tab cancer_type


save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_full_cohort_clean_final_revised_Dec_2023_v2.dta", replace




********************************************************************************
*                   2) DESCRIPTIVES OF COHORT                                 *
********************************************************************************
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_full_cohort_clean_final_revised_Dec_2023_v2.dta", clear


**1) Generate variables of interest 

// 1.1) Age-at-diagnosis/exit

gen age_exit= year(cancer_fu) - year(yearofbirth)
label var age_exit "age at exit"
sort age_exit

gen age_exit_2=1 if age_exit<15 
replace age_exit_2=2 if age_exit>14 & age_exit<25

label define agelabels_2 1 "0-14 years" 2 "15-24 years", replace
label values age_exit_2 agelabels_2
tab age_exit_2, m
sort age_exit_2

//1.2 Ethnic group categories

gen ethnic_2cat=0
replace ethnic_2cat=1 if ethriskid==2 | ethriskid==3 | ethriskid==4 | ethriskid==5 | ethriskid==8 | ethriskid==6 | ethriskid==7 |ethriskid==9
replace ethnic_2cat=. if ethriskid==.
label define ethniclabels 1 "White" 2 "Other", replace 
label values ethnic_2cat ethniclabels
tab ethnic_2cat, m

***2) Descriptives of variables for overall cancers vs. no cancers and each cancer type
sort any_cancer_source
tab any_cancer_source
by any_cancer_source:tab sex1
by any_cancer_source:tab town_quint,m
by any_cancer_source:tab ethnic_2cat,m
by any_cancer_source:summ age, detail

sort cancer_type 
tab cancer_type
by cancer_type:tab sex1, m
by cancer_type:tab sha1, m
by cancer_type:tab town_quint
by cancer_type:tab ethnic_2cat
bys cancer_type: summ age,det


*****3) incidence calculations for al lcancers and each cancer type 

tab any_cancer_source cancer_type
replace any_cancer_source=0 if any_cancer_source==.
stset cancer_fu, enter(enter3) failure(any_cancer_source==1) id(patid) scale(365.25)
stptime, per(1000000)
stptime, by(age_exit_2) per(1000000)

replace cancer_type=. if cancer_type==0
gen leuk_tot=0
replace leuk_tot=1 if cancer_type==1
stset cancer_fu, enter(enter3) failure(leuk_tot==1) id(patid) scale(365.25)
stptime, per(1000000)
stptime, by(age_exit_2) per(1000000)
stptime, by(sex1) per(1000000)


gen lymph_tot=0
replace lymph_tot=1 if cancer_type==2
stset cancer_fu, enter(enter3) failure(lymph_tot==1) id(patid) scale(365.25)
stptime,  per(1000000)
stptime, by(age_exit_2) per(1000000)
stptime, by(sex1) per(1000000)

gen cns_tot=0
replace cns_tot=1 if cancer_type==3
stset cancer_fu, enter(enter3) failure(cns_tot==1) id(patid) scale(365.25)
stptime,  per(1000000)
stptime, by(age_exit_2) per(1000000)
stptime, by(sex1) per(1000000)

gen sarc_tot=0
replace sarc_tot=1 if cancer_type==4
stset cancer_fu, enter(enter3) failure(sarc_tot==1) id(patid) scale(365.25)
stptime,  per(1000000)
stptime, by(age_exit_2) per(1000000)
stptime, by(sex1) per(1000000)

gen abdo_tot=0
replace abdo_tot=1 if cancer_type==5 | cancer_type==6 | cancer_type==7
stset cancer_fu, enter(enter3) failure(abdo_tot==1) id(patid) scale(365.25)
stptime,  per(1000000)

gen germ_tot=0
replace germ_tot=1 if cancer_type==8
stset cancer_fu, enter(enter3) failure(germ_tot==1) id(patid) scale(365.25)
stptime,  per(1000000)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_full_cohort_clean_final_v2.dta", replace



********************************************************************************
*                   3) GENERATION OF CASE CONTROL                             *
********************************************************************************
//1) generate gp practice with at least 1 case

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_full_cohort_clean_final_revised_Dec_2023_v2.dta", clear


gen case=1 if any_cancer_source==1	////replace to cancer_type=X for case-control generation of each cancer subtype	
	tab case
	
	collapse (sum) case, by(study_practice)
	drop if case==0
	drop case
	sort study_practice
	gen study_practice1=_n
	sum study_practice1,de
	lab var study_practice1 "practice ID consecutive"
 save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\practice_temp.dta",replace
   
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_full_cohort_clean_final_revised_Dec_2023_v2.dta", clear 	
  
	merge m:1 study_practice using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\practice_temp.dta"
	tab sex if study_practice1==.
	drop if study_practice1==.		
 
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_ids_all_revised_Dec_2023_v2.dta",replace 	
erase "P:\OX94\OX94_backup_Dec_2023\ox94\Data\practice_temp.dta"


//2) stset cohort
 use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_ids_all_revised_Dec_2023_v2.dta",clear 
 stset cancer_fu, enter(enter3) failure(any_cancer_source==1) id(patid) scale(365.25)
global n 935
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_ids_stset_all_revised_Dec_2023_v2.dta", replace

//3) nested case control generation
forval x= 1/$n {
	use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_ids_stset_all_revised_Dec_2023_v2.dta",clear 
	keep if study_practice1==`x'
	set seed 12345  

	qui sttocc, match(yearofbirth sex1) number(20) gen(cancer_case set time) nodots //match by sex, age, calendar time, practice 

	qui gen index_date_case=cancer_date_all if cancer_case==1
	qui by set: egen index_date=min(index_date_case)
	qui by set: gen numset=_N
 
 save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\match_`x'_all_revised_Dec_2023_v2.dta", replace
	
}


use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\match_1_all_revised_Dec_2023_v2.dta",clear
set more off
	forval x=2/$n  {
	append using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\match_`x'_all_revised_Dec_2023_v2.dta"
	}
	tab cancer_case
 save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_0_all_revised_Dec_2023_v2",replace  

 
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_0_all_revised_Dec_2023_v2", clear

collapse (count) cancer_case, by(study_practice1 set)
	gen setid=_n
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\setid_temp.dta",replace

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_0_all_revised_Dec_2023_v2", clear
	drop cancer_fu time index_date_case _merge
	  format index_date %td

	gen agediag= year(index_date) - year(yearofbirth)
	label var agediag "age at index date in years"
	label var numset "number in matched set"
	label var cancer_case "case/control status"
	lab var index_date "date of case diagnosis or equivalent in controls"
	label def cancer_case 0 "control" 1 "case"
	label values cancer_case cancer_case
	label var set "matched set"
	tab sex,mis
	merge m:1 study_practice1 set using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\setid_temp.dta"
	tab sex,mis
	drop _merge set 
	lab var setid "unique set ID across case control dataset"
	order  patid sex1 yearofbirth study_practice1 cancer_case setid numset index_date  agediag  



save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_v2",replace 

