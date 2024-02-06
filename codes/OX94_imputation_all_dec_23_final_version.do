// imputation all 

//all timeline
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_v4_Dec_23_v2", clear

drop if sex1==. 
gen ethnic_2cat=1
replace ethnic_2cat=2 if ethriskid==2 | ethriskid==3 | ethriskid==4 | ethriskid==5 | ethriskid==8 |ethriskid==6 | ethriskid==7 | ethriskid==9
replace ethnic_2cat=. if ethriskid==.
label define ethniclabels 1 "White" 2 "Other" , replace 
label values ethnic_2cat ethniclabels
tab ethnic_2cat, m
tab cancer_case
 
mi set wide 

mi register imputed ethnic_2cat town_quintile

timer clear 
timer on 1 

	mi impute chained (mlogit)ethnic_2cat (ologit)town_quintile = cancer_case i.symptom_1 i.symptom_2 i.symptom_3 i.symptom_4 i.symptom_5 i.symptom_6 i.symptom_7 i.symptom_8 i.symptom_9 i.symptom_10 i.symptom_11 i.symptom_12 i.symptom_13 i.symptom_16 i.symptom_18 i.symptom_19 i.symptom_21 i.symptom_22 i.symptom_23 i.symptom_27 i.symptom_29 i.symptom_30 i.symptom_31 i.symptom_32 i.symptom_37 i.symptom_36 i.symptom_38 i.symptom_40 i.symptom_48 i.symptom_49 i.symptom_51 i.symptom_52 i.symptom_53 i.symptom_54 i.symptom_56, rseed(1234) dots add(50) augment 




timer off 1 
timer list 

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_imputed_v2_Dec_23_final", replace


//run estimation for all timeline 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_imputed_v2_Dec_23_final", clear


mi estimate, or level(95): clogit cancer_case i.symptom_1 i.symptom_2 i.symptom_3 i.symptom_5 i.symptom_6 i.symptom_7 i.symptom_8 i.symptom_9 i.symptom_10  i.symptom_12 i.symptom_13 i.symptom_18 i.symptom_19 i.symptom_21 i.symptom_22 i.symptom_23 i.symptom_29 i.symptom_30 i.symptom_31 i.symptom_36 i.symptom_37 i.symptom_38 i.symptom_40 i.symptom_48 i.symptom_49 i.symptom_51 i.symptom_52 i.symptom_53 i.symptom_54 i.symptom_56 i.town_quint i.ethnic_2cat, group(setid) or



parmest, list(,) saving ("P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_multivariate_results_imputed_all_final", replace) eform label for(estimate min95 max95)

//diagnostics 

qui mi xeq: generate byte mis_ethnic= missing(ethnic_2cat)
qui mi xeq: generate byte mis_town=missing(town_quint)
mi register regular mis_ethnic mis_town

//check observed over imputaed values 
mi xeq 1/2: tab ethnic_2cat if mis_ethnic==0; tab ethnic_2cat if mis_ethnic==1

mi xeq 1: twoway (kdensity ethnic_2cat if mis_ethnic==0) (kdensity ethnic_2cat if mis_ethnic==1), legend(label(1 "Observed") label(2 "Imputed") )

//check specification error / influential points 
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_imputed_v2_Dec_23_final", clear


mi estimate, or level(95) saving(myestsave, replace): clogit cancer_case i.symptom_1 i.symptom_2 i.symptom_3 i.symptom_5 i.symptom_6 i.symptom_7 i.symptom_8 i.symptom_9 i.symptom_10  i.symptom_12 i.symptom_13 i.symptom_18 i.symptom_19 i.symptom_21 i.symptom_22 i.symptom_23 i.symptom_29 i.symptom_30 i.symptom_31 i.symptom_36 i.symptom_37 i.symptom_38 i.symptom_40 i.symptom_48 i.symptom_49 i.symptom_51 i.symptom_52 i.symptom_53 i.symptom_54 i.symptom_56 i.town_quint i.ethnic_2cat i.symptom_29##i.symptom_2, group(setid)
mi predict _hat using myestsave, xb
mi passive: gen _hatsq=_hat*_hat
mi estimate: clogit cancer_case _hat _hatsq, group(setid)
 
///ppv calculations for all timeline

global n 27 


forval x=1/$n {
gen a_`x'=0
replace a_`x'=1 if cancer_case==1 & symptom_`x'==1 
tab a_`x'
}


forval x=1/$n {
	gen b_`x'=0
replace b_`x'=1 if cancer_case==0 & symptom_`x'==1 
tab b_`x'
}

forval x=1/$n {
gen a_tot_`x'=sum(a_`x')
}

forval x=1/$n {
gen b_tot_`x'=sum(b_`x')
}

forval x=1/$n {
 gen	ppv_`x'=a_tot_`x'/((a_tot_`x')+((1/0.014)*b_tot_`x'))

}

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


//early timeline
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_early_all_dec_23_v2", clear

drop if sex1==. 
gen ethnic_2cat=1
replace ethnic_2cat=2 if ethriskid==2 | ethriskid==3 | ethriskid==4 | ethriskid==5 | ethriskid==8 |ethriskid==6 | ethriskid==7 | ethriskid==9
replace ethnic_2cat=. if ethriskid==.
label define ethniclabels 1 "White" 2 "Other" , replace 
label values ethnic_2cat ethniclabels
tab ethnic_2cat, m
tab cancer_case
 
mi set wide 

mi register imputed ethnic_2cat town_quintile

timer clear 
timer on 1 

	mi impute chained (mlogit)ethnic_2cat (ologit)town_quintile = cancer_case i.symptom_1 i.symptom_2 i.symptom_3 i.symptom_4 i.symptom_5 i.symptom_6 i.symptom_7 i.symptom_8 i.symptom_9 i.symptom_10 i.symptom_11 i.symptom_12 i.symptom_13 i.symptom_16 i.symptom_18 i.symptom_19 i.symptom_21 i.symptom_22 i.symptom_23 i.symptom_27 i.symptom_29 i.symptom_30 i.symptom_31 i.symptom_32 i.symptom_37 i.symptom_36 i.symptom_38 i.symptom_40 i.symptom_48 i.symptom_49 i.symptom_51 i.symptom_52 i.symptom_53 i.symptom_54 i.symptom_56, rseed(1234) dots add(50) augment 




timer off 1 
timer list 

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_imputed_v2_Dec_23_early_all", replace


//run estimation for early timeline 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_imputed_v2_Dec_23_early_all", clear


mi estimate, or level(95): clogit cancer_case i.symptom_1 i.symptom_2 i.symptom_3 i.symptom_5 i.symptom_6 i.symptom_7 i.symptom_8 i.symptom_9 i.symptom_10  i.symptom_12 i.symptom_13 i.symptom_18 i.symptom_19 i.symptom_21 i.symptom_22 i.symptom_23 i.symptom_29 i.symptom_30 i.symptom_31 i.symptom_36 i.symptom_37 i.symptom_38 i.symptom_40 i.symptom_48 i.symptom_49 i.symptom_51 i.symptom_52 i.symptom_53 i.symptom_54 i.symptom_56 i.town_quint i.ethnic_2cat, group(setid) or



parmest, list(,) saving ("P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_multivariate_results_imputed_all_early", replace) eform label for(estimate min95 max95)

//////// graph 


 use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_multivariate_results_imputed_all_final.dta", clear
 
 drop if estimate==1 
 gen log_OR=log(estimate)
 gen log_min=log(min95)
 gen log_max=log(max95)
 format PPV %3.2f
 format estimate min95 max95 log_OR log_min log_max %12.1f

gen group=0 
replace group=1 if parm=="Organomegaly" | parm=="Limb pain" | parm=="Joint pain" | parm=="Abnormal skin lesion" | parm=="Squint" | parm=="Weight loss" | parm=="Feels unwell" | parm=="Torticollis" | parm=="Hemiparesis" | parm=="Testicular swelling" | parm=="Limp" | parm=="Dizziness "  | parm=="Haematuria" | parm=="Chest pain" | parm=="Precocious puberty"
replace group=2 if parm=="Townsend Quintile 2" | parm=="Townsend Quintile 3" |parm=="Townsend Quintile 4" | parm=="Townsend Quintile 5" | parm=="non-White ethnic group"
label define grouplabels 0 "Already Known" 1 "New Association" 2"", replace 
label values group grouplabels
tab group, m
admetan log_OR log_min log_max, label(namevar=parm) nowt nooverall nosubgroup eform effect(Odds Ratio) rcols(PPV CI Early_OR) by(group) forestplot(hetstat(p) leftj) saving(defne_all3) 

use defne_all3, clear 
label var _LABELS `"`"{bf:Symptoms}"'"'
replace _LABELS= `"{bf:"'+ _LABELS + `"}"' if _USE==0
label variable PPV "PPV(%)"
label variable CI "95% CI"
label variable Early_OR "Odds Ratio (95%CI) (42d before diagnosis excluded)"

forestplot, useopts nostats nobox nowt rcols(_EFFECT PPV CI Early_OR)
