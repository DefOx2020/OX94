********************************************************************************
*                   3) GENERATION OF CASE CONTROL  PER CANCER                           *
********************************************************************************
//generate gp practice with at least 1 case

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_full_cohort_clean_final_revised_Dec_2023_v2.dta", clear
drop if cancer_type==9
save  "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_cohort_all_nonskin_revised_Dec_2023_v2.dta",replace

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_cohort_all_nonskin_revised_Dec_2023_v2.dta", clear

//1)leukaemia
gen case=1 if cancer_type==1
	tab case
	
	collapse (sum) case, by(study_practice)
	drop if case==0
	drop case
	sort study_practice
	gen study_practice1=_n
	sum study_practice1,de
	lab var study_practice1 "practice ID consecutive"
 save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\practice_temp.dta",replace
   
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_cohort_all_nonskin_revised_Dec_2023_v2.dta", clear 	
  
	merge m:1 study_practice using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\practice_temp.dta"
	tab sex if study_practice1==.
	drop if study_practice1==.	


 
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_ids_all_revised_Dec_2023_v2_leuk.dta",replace 	
erase "P:\OX94\OX94_backup_Dec_2023\ox94\Data\practice_temp.dta"


//stset cohort
 use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_ids_all_revised_Dec_2023_v2_leuk.dta",clear 
 stset cancer_fu, enter(enter3) failure(cancer_type==1) id(patid) scale(365.25)
global n 528
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_ids_stset_all_revised_Dec_2023_v2_leuk.dta", replace

forval x= 1/$n {
	use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_ids_stset_all_revised_Dec_2023_v2_leuk.dta",clear 
	keep if study_practice1==`x'
	set seed 12345  

	qui sttocc, match(yearofbirth sex1) number(20) gen(cancer_case set time) nodots //match by sex, age, calendar time, practice 

	qui gen index_date_case=cancer_date_all if cancer_case==1
	qui by set: egen index_date=min(index_date_case)
	qui by set: gen numset=_N
 
 save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\match_`x'_all_revised_Dec_2023_v2_leuk.dta", replace
	
}



use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\match_1_all_revised_Dec_2023_v2_leuk.dta",clear
set more off
	forval x=2/$n  {
	append using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\match_`x'_all_revised_Dec_2023_v2_leuk.dta"
	}
	tab cancer_case
 save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_0_all_revised_Dec_2023_v2_leuk.dta",replace  

 
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_0_all_revised_Dec_2023_v2_leuk.dta", clear

collapse (count) cancer_case, by(study_practice1 set)
	gen setid=_n
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\setid_temp.dta",replace

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_0_all_revised_Dec_2023_v2_leuk.dta", clear
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



save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_v2_leuk.dta",replace 



//2)lymphoma

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_cohort_all_nonskin_revised_Dec_2023_v2.dta", clear
gen case=1 if cancer_type==2
	tab case
	
	collapse (sum) case, by(study_practice)
	drop if case==0
	drop case
	sort study_practice
	gen study_practice1=_n
	sum study_practice1,de
	lab var study_practice1 "practice ID consecutive"
 save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\practice_temp.dta",replace
   
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_cohort_all_nonskin_revised_Dec_2023_v2.dta", clear 	
  
	merge m:1 study_practice using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\practice_temp.dta"
	tab sex if study_practice1==.
	drop if study_practice1==.	


 
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_ids_all_revised_Dec_2023_v2_lymph.dta",replace 	
erase "P:\OX94\OX94_backup_Dec_2023\ox94\Data\practice_temp.dta"


//stset cohort
 use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_ids_all_revised_Dec_2023_v2_lymph.dta",clear 
 stset cancer_fu, enter(enter3) failure(cancer_type==2) id(patid) scale(365.25)
global n 477
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_ids_stset_all_revised_Dec_2023_v2_lymph.dta", replace

forval x= 1/$n {
	use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_ids_stset_all_revised_Dec_2023_v2_lymph.dta",clear 
	keep if study_practice1==`x'
	set seed 12345  

	qui sttocc, match(yearofbirth sex1) number(20) gen(cancer_case set time) nodots //match by sex, age, calendar time, practice 

	qui gen index_date_case=cancer_date_all if cancer_case==1
	qui by set: egen index_date=min(index_date_case)
	qui by set: gen numset=_N
 
 save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\match_`x'_all_revised_Dec_2023_v2_lymph.dta", replace
	
}



use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\match_1_all_revised_Dec_2023_v2_lymph.dta",clear
set more off
	forval x=2/$n  {
	append using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\match_`x'_all_revised_Dec_2023_v2_lymph.dta"
	}
	tab cancer_case
 save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_0_all_revised_Dec_2023_v2_lymph.dta",replace  

 
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_0_all_revised_Dec_2023_v2_lymph.dta", clear

collapse (count) cancer_case, by(study_practice1 set)
	gen setid=_n
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\setid_temp.dta",replace

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_0_all_revised_Dec_2023_v2_lymph.dta", clear
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



save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_v2_lymph.dta",replace 



//3) CNS 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_cohort_all_nonskin_revised_Dec_2023_v2.dta", clear
gen case=1 if cancer_type==3
	tab case
	
	collapse (sum) case, by(study_practice)
	drop if case==0
	drop case
	sort study_practice
	gen study_practice1=_n
	sum study_practice1,de
	lab var study_practice1 "practice ID consecutive"
 save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\practice_temp.dta",replace
   
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_cohort_all_nonskin_revised_Dec_2023_v2.dta", clear 	
  
	merge m:1 study_practice using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\practice_temp.dta"
	tab sex if study_practice1==.
	drop if study_practice1==.	


 
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_ids_all_revised_Dec_2023_v2_CNS.dta",replace 	
erase "P:\OX94\OX94_backup_Dec_2023\ox94\Data\practice_temp.dta"


//stset cohort
 use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_ids_all_revised_Dec_2023_v2_CNS.dta",clear 
 stset cancer_fu, enter(enter3) failure(cancer_type==3) id(patid) scale(365.25)
global n 471
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_ids_stset_all_revised_Dec_2023_v2_CNS.dta", replace

forval x= 1/$n {
	use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_ids_stset_all_revised_Dec_2023_v2_CNS.dta",clear 
	keep if study_practice1==`x'
	set seed 12345  

	qui sttocc, match(yearofbirth sex1) number(20) gen(cancer_case set time) nodots //match by sex, age, calendar time, practice 

	qui gen index_date_case=cancer_date_all if cancer_case==1
	qui by set: egen index_date=min(index_date_case)
	qui by set: gen numset=_N
 
 save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\match_`x'_all_revised_Dec_2023_v2_CNS.dta", replace
	
}



use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\match_1_all_revised_Dec_2023_v2_CNS.dta",clear
set more off
	forval x=2/$n  {
	append using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\match_`x'_all_revised_Dec_2023_v2_CNS.dta"
	}
	tab cancer_case
 save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_0_all_revised_Dec_2023_v2_CNS.dta",replace  

 
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_0_all_revised_Dec_2023_v2_CNS.dta", clear

collapse (count) cancer_case, by(study_practice1 set)
	gen setid=_n
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\setid_temp.dta",replace

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_0_all_revised_Dec_2023_v2_CNS.dta", clear
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



save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_v2_CNS.dta",replace 

//4)sarcoma

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_cohort_all_nonskin_revised_Dec_2023_v2.dta", clear
gen case=1 if cancer_type==4
	tab case
	
	collapse (sum) case, by(study_practice)
	drop if case==0
	drop case
	sort study_practice
	gen study_practice1=_n
	sum study_practice1,de
	lab var study_practice1 "practice ID consecutive"
 save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\practice_temp.dta",replace
   
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_cohort_all_nonskin_revised_Dec_2023_v2.dta", clear 	
  
	merge m:1 study_practice using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\practice_temp.dta"
	tab sex if study_practice1==.
	drop if study_practice1==.	


 
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_ids_all_revised_Dec_2023_v2_sarcoma.dta",replace 	
erase "P:\OX94\OX94_backup_Dec_2023\ox94\Data\practice_temp.dta"


//stset cohort
 use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_ids_all_revised_Dec_2023_v2_sarcoma.dta",clear 
 stset cancer_fu, enter(enter3) failure(cancer_type==4) id(patid) scale(365.25)
global n 375
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_ids_stset_all_revised_Dec_2023_v2_sarcoma.dta", replace

forval x= 1/$n {
	use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_ids_stset_all_revised_Dec_2023_v2_sarcoma.dta",clear 
	keep if study_practice1==`x'
	set seed 12345  

	qui sttocc, match(yearofbirth sex1) number(20) gen(cancer_case set time) nodots //match by sex, age, calendar time, practice 

	qui gen index_date_case=cancer_date_all if cancer_case==1
	qui by set: egen index_date=min(index_date_case)
	qui by set: gen numset=_N
 
 save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\match_`x'_all_revised_Dec_2023_v2_sarcoma.dta", replace
	
}



use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\match_1_all_revised_Dec_2023_v2_sarcoma.dta",clear
set more off
	forval x=2/$n  {
	append using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\match_`x'_all_revised_Dec_2023_v2_sarcoma.dta"
	}
	tab cancer_case
 save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_0_all_revised_Dec_2023_v2_sarcoma.dta",replace  

 
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_0_all_revised_Dec_2023_v2_sarcoma.dta", clear

collapse (count) cancer_case, by(study_practice1 set)
	gen setid=_n
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\setid_temp.dta",replace

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_0_all_revised_Dec_2023_v2_sarcoma.dta", clear
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



save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_v2_sarcoma.dta",replace 


//5) abdo tumours

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_cohort_all_nonskin_revised_Dec_2023_v2.dta", clear
gen case=1 if cancer_type==5 | cancer_type==6 | cancer_type==7

gen cancer_abdo=0
replace cancer_abdo=1 if cancer_type=5 | cancer_type==6 | cancer_type==7
	tab case
	
	collapse (sum) case, by(study_practice)
	drop if case==0
	drop case
	sort study_practice
	gen study_practice1=_n
	sum study_practice1,de
	lab var study_practice1 "practice ID consecutive"
 save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\practice_temp.dta",replace
   
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_cohort_all_nonskin_revised_Dec_2023_v2.dta", clear 	
  
	merge m:1 study_practice using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\practice_temp.dta"
	tab sex if study_practice1==.
	drop if study_practice1==.	


 
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_ids_all_revised_Dec_2023_v2_abdo.dta",replace 	
erase "P:\OX94\OX94_backup_Dec_2023\ox94\Data\practice_temp.dta"


//stset cohort
 use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_ids_all_revised_Dec_2023_v2_abdo.dta",clear 
 gen cancer_abdo=0
replace cancer_abdo=1 if cancer_type==5 | cancer_type==6 | cancer_type==7
 stset cancer_fu, enter(enter3) failure(cancer_abdo==1) id(patid) scale(365.25)
global n 253
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_ids_stset_all_revised_Dec_2023_v2_abdo.dta", replace

forval x= 1/$n {
	use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_ids_stset_all_revised_Dec_2023_v2_abdo.dta",clear 
	keep if study_practice1==`x'
	set seed 12345  

	qui sttocc, match(yearofbirth sex1) number(20) gen(cancer_case set time) nodots //match by sex, age, calendar time, practice 

	qui gen index_date_case=cancer_date_all if cancer_case==1
	qui by set: egen index_date=min(index_date_case)
	qui by set: gen numset=_N
 
 save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\match_`x'_all_revised_Dec_2023_v2_abdo.dta", replace
	
}



use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\match_1_all_revised_Dec_2023_v2_abdo.dta",clear
set more off
	forval x=2/$n  {
	append using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\match_`x'_all_revised_Dec_2023_v2_abdo.dta"
	}
	tab cancer_case
 save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_0_all_revised_Dec_2023_v2_abdo.dta",replace  

 
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_0_all_revised_Dec_2023_v2_abdo.dta", clear

collapse (count) cancer_case, by(study_practice1 set)
	gen setid=_n
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\setid_temp.dta",replace

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_0_all_revised_Dec_2023_v2_abdo.dta", clear
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



save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_v2_abdo.dta",replace 


//8)Germ

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_cohort_all_nonskin_revised_Dec_2023_v2.dta", clear
gen case=1 if cancer_type==8
	tab case
	
	collapse (sum) case, by(study_practice)
	drop if case==0
	drop case
	sort study_practice
	gen study_practice1=_n
	sum study_practice1,de
	lab var study_practice1 "practice ID consecutive"
 save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\practice_temp.dta",replace
   
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_cohort_all_nonskin_revised_Dec_2023_v2.dta", clear 	
  
	merge m:1 study_practice using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\practice_temp.dta"
	tab sex if study_practice1==.
	drop if study_practice1==.	


 
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_ids_all_revised_Dec_2023_v2_germ.dta",replace 	
erase "P:\OX94\OX94_backup_Dec_2023\ox94\Data\practice_temp.dta"


//stset cohort
 use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_ids_all_revised_Dec_2023_v2_germ.dta",clear 
 stset cancer_fu, enter(enter3) failure(cancer_type==8) id(patid) scale(365.25)
global n 326
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_ids_stset_all_revised_Dec_2023_v2_germ.dta", replace

forval x= 1/$n {
	use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_ids_stset_all_revised_Dec_2023_v2_germ.dta",clear 
	keep if study_practice1==`x'
	set seed 12345  

	qui sttocc, match(yearofbirth sex1) number(20) gen(cancer_case set time) nodots //match by sex, age, calendar time, practice 

	qui gen index_date_case=cancer_date_all if cancer_case==1
	qui by set: egen index_date=min(index_date_case)
	qui by set: gen numset=_N
 
 save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\match_`x'_all_revised_Dec_2023_v2_germ.dta", replace
	
}



use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\match_1_all_revised_Dec_2023_v2_germ.dta",clear
set more off
	forval x=2/$n  {
	append using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\match_`x'_all_revised_Dec_2023_v2_germ.dta"
	}
	tab cancer_case
 save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_0_all_revised_Dec_2023_v2_germ.dta",replace  

 
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_0_all_revised_Dec_2023_v2_germ.dta", clear

collapse (count) cancer_case, by(study_practice1 set)
	gen setid=_n
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\setid_temp.dta",replace

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_0_all_revised_Dec_2023_v2_germ.dta", clear
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



save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_v2_germ.dta",replace 