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
*     Multiple Imputation
*     Multiple Imputation Diagnostics 
********************************************************************************

log using "C:\Users\Defne Saatci.QRESEARCH\Downloads\ox94\log\cleaning_v2_DS.smcl", replace 

********************************************************************************
*                   1) MULTIPLE IMPUTATION		                         
********************************************************************************

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_v4_Dec_2023", clear
 
mi set wide 

mi register imputed ethnic_2cat town_quintile

timer clear 
timer on 1 

mi impute chained (mlogit)ethnic_2cat (ologit)town_quintile = cancer_case i.symptom_1 i.symptom_2 i.symptom_3 i.symptom_5 i.symptom_6 i.symptom_7 i.symptom_8 i.symptom_9 i.symptom_10  i.symptom_12 i.symptom_13 i.symptom_18 i.symptom_19 i.symptom_21 i.symptom_22 i.symptom_23 i.symptom_27 i.symptom_29 i.symptom_30 i.symptom_31 i.symptom_36 i.symptom_37 i.symptom_38 i.symptom_40 i.symptom_47 i.symptom_48 i.symptom_49 i.symptom_50 i.symptom_51 i.symptom_52 i.symptom_53, rseed(1234) dots add(50) augment 

timer off 1 
timer list 

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_imputed_v2_Dec_23", replace



********************************************************************************
*                   1) MULTIPLE IMPUTATION	DIAGNOSTICS                         
********************************************************************************

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_imputed_v2_Dec_23", clear


mi estimate, or level(95): clogit cancer_case symptom_1 symptom_2  symptom_3  symptom_5 symptom_6 symptom_7 symptom_8 symptom_9 symptom_10 symptom_13  symptom_18 symptom_19 symptom_21 symptom_22 symptom_23 symptom_29 symptom_30 symptom_31 symptom_32  symptom_36 symptom_37 symptom_38 symptom_40 symptom_48 symptom_51 symptom_52 symptom_53 symptom_56 symptom_57 i.town_quint i.ethnic_2cat, group(setid) or


