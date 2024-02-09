************************************************************************************
* Project: OX94- CTYA cancer early clinical features
* Authors: Defne Saatci 
* Date:  01/01/2024
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
 
global n 56 

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

collapse (max) ppv_*
save "P:\OX94\Data\ppv_original.dta", replace 



********************************************************************************
*                   1) PPV Confidence Interval Calculations 		                         
********************************************************************************



forval i=1/1000 { 
use  "P:\OX94\Data\case_control_final.dta", clear 
bsample 

global n 56 
forval x=1/$n {
gen a_`x'=0
replace a_`x'=1 if cancer_case==1 & symptom_`x'==1 
tab a_`x'
}

forval x=1/$n {
gen a_tot_`x'=sum(a_`x')
}

forval x=1/$n {
	gen b_`x'=0
replace b_`x'=1 if cancer_case==0 & symptom_`x'==1 
tab b_`x'
}

forval x=1/$n {
gen b_tot_`x'=sum(b_`x')
}

forval x=1/$n {
 gen	ppv_`x'=a_tot_`x'/((a_tot_`x')+((1/0.014)*b_tot_`x'))
}
collapse (max) ppv_*
save "P:\OX94\Data\ppv_bs_`i'.dta", replace 
drop a_`x' b_`x' a_tot_`x' b_tot_`x' ppv_`x'
}

use "P:\OX94\Data\ppv_original.dta", clear 
forval i=1/1000{
append using "P:\OX94\Data\ppv_bs_`i'.dta"
}

collapse (p97) ppv_* 
collapse (p2) ppv_*
