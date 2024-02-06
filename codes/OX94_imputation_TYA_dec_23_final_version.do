// imputation TYA
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_v4_Dec_2023", clear

drop if sex1==. 
gen ethnic_2cat=1
replace ethnic_2cat=2 if ethriskid==2 | ethriskid==3 | ethriskid==4 | ethriskid==5 | ethriskid==8 |ethriskid==6 | ethriskid==7 | ethriskid==9
replace ethnic_2cat=. if ethriskid==.
label define ethniclabels 1 "White" 2 "Other" , replace 
label values ethnic_2cat ethniclabels
tab ethnic_2cat, m

 
mi set wide 

mi register imputed ethnic_2cat town_quintile

timer clear 
timer on 1 

	mi impute chained (mlogit)ethnic_2cat (ologit)town_quintile = cancer_case i.symptom_1 i.symptom_2 i.symptom_3 i.symptom_4 i.symptom_5 i.symptom_6 i.symptom_7 i.symptom_8 i.symptom_9 i.symptom_10 i.symptom_11 i.symptom_12 i.symptom_13 i.symptom_16 i.symptom_18 i.symptom_19 i.symptom_21 i.symptom_22 i.symptom_23 i.symptom_27 i.symptom_29 i.symptom_30 i.symptom_31 i.symptom_36 i.symptom_37 i.symptom_38 i.symptom_40 i.symptom_47 i.symptom_48 i.symptom_49 i.symptom_50 i.symptom_51 i.symptom_52 i.symptom_53, rseed(1234) dots add(50) augment force




timer off 1 
timer list 

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_imputed_v2_Dec_23_child", replace