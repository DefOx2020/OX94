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
*     Calculating PPV from nested case-control sample
*     Calculating PPV confidence intervals from nested case-control sample 
********************************************************************************

log using "C:\Users\Defne Saatci.QRESEARCH\Downloads\ox94\log\cleaning_v2_DS_3.smcl", replace 

********************************************************************************
*                   1) PPV Calculations 		                         
********************************************************************************
 
global n 27 

//Calculate True Positive
forval x=1/$n {
gen a_`x'=0
replace a_`x'=1 if cancer_case==1 & symptom_`x'==1 
tab a_`x'
}

forval x=1/$n {
gen a_tot_`x'=sum(a_`x')
}

//Calculate False Positive
forval x=1/$n {
	gen b_`x'=0
replace b_`x'=1 if cancer_case==0 & symptom_`x'==1 
tab b_`x'
}

forval x=1/$n {
gen b_tot_`x'=sum(b_`x')
}

//Calculate PPV = TP/(TP+(1/sampling_fraction)*FP)
forval x=1/$n {
 gen	ppv_`x'=a_tot_`x'/((a_tot_`x')+((1/0.014)*b_tot_`x'))

}

preserve 
keep if patid==12873353
mi reshape long ppv_ , i(patid) j(event2)
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_long_all_test_p2", replace
restore 

********************************************************************************
*                   1) PPV Confidence Interval Calculations 		                         
********************************************************************************
 

 forval x=1/$n {
gen se_ppv_`x'=sqrt(ppv_`x'*(((1/0.015)*b_tot_`x')/((a_tot_`x')+((1/0.015)*b_tot_`x'))))/(a_tot_`x'+b_tot_`x')
}

preserve 
keep if patid==12873353
mi reshape long ppv_ se_ppv_, i(patid) j(event2)
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_long_all_test_p1", replace
restore 

 global n 56



forval x=29/$n {
gen a_`x'=0
replace a_`x'=1 if cancer_case==1 & symptom_`x'==1 
tab a_`x'
}


forval x=29/$n {
	gen b_`x'=0
replace b_`x'=1 if cancer_case==0 & symptom_`x'==1 
tab b_`x'
}

forval x=29/$n {
gen a_tot_`x'=sum(a_`x')
}

forval x=29/$n {
gen b_tot_`x'=sum(b_`x')
}

forval x=29/$n {
 gen	ppv_`x'=a_tot_`x'/((a_tot_`x')+((1/0.014)*b_tot_`x'))

}

 forval x=29/$n {
gen se_ppv_`x'=sqrt(ppv_`x'*(((1/0.015)*b_tot_`x')/((a_tot_`x')+((1/0.015)*b_tot_`x'))))/(a_tot_`x'+b_tot_`x')
}

preserve 
keep if patid==12873353
mi reshape long ppv_ se_ppv_, i(patid) j(event2)
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_long_all_test_p2", replace
restore 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_long_all_test_p2", clear 
