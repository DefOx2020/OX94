// imputation all

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_v4_Dec_23_CNS_v2.dta", clear


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

	mi impute chained (mlogit)ethnic_2cat (ologit)town_quintile = i.cancer_case i.symptom_7 i.symptom_9 i.symptom_21 i.symptom_23 i.symptom_36 i.symptom_37 i.symptom_38 i.symptom_40 i.symptom_48  i.symptom_52 i.symptom_54 i.symptom_49, rseed(1234) dots add(50) augment 




timer off 1 
timer list 

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_imputed_v2_Dec_23_CNS_all", replace


//run estimation for all timeline 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_imputed_v2_Dec_23_CNS_all", clear


mi estimate, or level(95): clogit cancer_case i.symptom_7 i.symptom_9 i.symptom_21 i.symptom_23 i.symptom_36 i.symptom_37 i.symptom_38 i.symptom_40 i.symptom_48  i.symptom_52 i.symptom_54 i.symptom_49 i.town_quint i.ethnic_2cat, group(setid) or



parmest, list(,) saving ("P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_multivariate_results_imputed_CNS_all", replace) eform label for(estimate min95 max95)


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
gen se_ppv_`x'=sqrt(ppv_`x'*(((1/0.019)*b_tot_`x')/((a_tot_`x')+((1/0.019)*b_tot_`x'))))/(a_tot_`x'+b_tot_`x')
}

preserve 
keep if patid==9101066
mi reshape long ppv_ se_ppv_, i(patid) j(event2)
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_long_CNS_test_p1", replace
restore 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_long_CNS_test_p1", clear 


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
 gen	ppv_`x'=a_tot_`x'/((a_tot_`x')+((1/0.019)*b_tot_`x'))

}

 forval x=29/$n {
gen se_ppv_`x'=sqrt(ppv_`x'*(((1/0.019)*b_tot_`x')/((a_tot_`x')+((1/0.019)*b_tot_`x'))))/(a_tot_`x'+b_tot_`x')
}

preserve 
keep if patid==9101066
mi reshape long ppv_ se_ppv_, i(patid) j(event2)
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_long_CNS_test_p2", replace
restore 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_long_CNS_test_p2", clear 


//early timeline
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_early_all_CNS", clear

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

	mi impute chained (mlogit)ethnic_2cat (ologit)town_quintile = i.cancer_case i.symptom_7 i.symptom_9 i.symptom_21 i.symptom_23 i.symptom_36 i.symptom_37 i.symptom_38 i.symptom_40 i.symptom_48  i.symptom_52 i.symptom_54 i.symptom_49, rseed(1234) dots add(50) augment




timer off 1 
timer list 

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_imputed_v2_Dec_23_early_CNS_all", replace


//run estimation for early timeline  all

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_imputed_v2_Dec_23_early_CNS_all", clear


mi estimate, or level(95): clogit cancer_case i.symptom_7 i.symptom_9 i.symptom_21 i.symptom_23 i.symptom_36 i.symptom_37 i.symptom_38 i.symptom_40 i.symptom_48  i.symptom_52 i.symptom_54 i.symptom_49 i.town_quint i.ethnic_2cat, group(setid) or



parmest, list(,) saving ("P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_multivariate_results_imputed_CNS_all_early", replace) eform label for(estimate min95 max95)

//////// graph all


 use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_multivariate_results_imputed_CNS_all", clear
 
 drop if estimate==1 
 gen log_OR=log(estimate)
 gen log_min=log(min95)
 gen log_max=log(max95)
 format PPV %3.2f
 format estimate min95 max95 log_OR log_min log_max %12.1f

gen group=0 
replace group=1 if parm=="Organomegaly" | parm=="Limb pain*" | parm=="Joint pain" | parm=="Cough*" | parm=="Squint" | parm=="Weight loss" | parm=="Feels unwell*" | parm=="Torticollis" | parm=="Hemiparesis*" | parm=="Testicular swelling" | parm=="Limp" | parm=="Dizziness*" | parm=="Precocious puberty" | parm=="Haematuria*" | parm=="Chest pain*"  | parm=="Rash*"  | parm=="Vomiting"   | parm=="Abnormal visual acuity*"  | parm=="Tiredness*" 
replace group=2 if parm=="Townsend Quintile 2" | parm=="Townsend Quintile 3" |parm=="Townsend Quintile 4" | parm=="Townsend Quintile 5" | parm=="non-White ethnic group"
label define grouplabels 0 "Already Known" 1 "New Association" 2"", replace 
label values group grouplabels
tab group, m
 sort estimate in 1/12
admetan log_OR log_min log_max, label(namevar=parm) nowt nooverall nosubgroup eform effect(Odds Ratio) rcols(PPV CI Early_OR) by(group) forestplot(hetstat(p) leftj) saving(defne_all_CNS,replace) 

use defne_all_CNS, clear 
label var _LABELS `"`"{bf:Symptoms}"'"'
replace _LABELS= `"{bf:"'+ _LABELS + `"}"' if _USE==0
label variable PPV "PPV(%)"
label variable CI "95% CI"
label variable Early_OR "Odds Ratio (95%CI) (23d before diagnosis excluded)"

forestplot, useopts nostats nobox nowt rcols(_EFFECT PPV CI Early_OR)


// imputation TYA
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_v4_Dec_23_CNS_v2", clear

drop if agediag_2==1

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

	mi impute chained (mlogit)ethnic_2cat (ologit)town_quintile = i.cancer_case i.symptom_7 i.symptom_9 i.symptom_21 i.symptom_23 i.symptom_36 i.symptom_37 i.symptom_38 i.symptom_40 i.symptom_48  i.symptom_52 i.symptom_54 i.symptom_49, rseed(1234) dots add(50) augment 




timer off 1 
timer list 

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_imputed_v2_Dec_23_TYA_CNS", replace


//run estimation for all timeline TYA

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_imputed_v2_Dec_23_TYA_CNS", clear


mi estimate, or level(95): clogit cancer_case i.symptom_21 i.symptom_23 i.symptom_40  i.symptom_54  i.town_quint i.ethnic_2cat, group(setid) or



parmest, list(,) saving ("P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_multivariate_results_imputed_TYA_CNS", replace) eform label for(estimate min95 max95)


///ppv calculations for all timeline TYA

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
 gen	ppv_`x'=a_tot_`x'/((a_tot_`x')+((1/0.01)*b_tot_`x'))

}

 forval x=1/$n {
gen se_ppv_`x'=sqrt(ppv_`x'*(((1/0.015)*b_tot_`x')/((a_tot_`x')+((1/0.01)*b_tot_`x'))))/(a_tot_`x'+b_tot_`x')
}

preserve 
keep if patid==9101066
mi reshape long ppv_ se_ppv_, i(patid) j(event2)
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_long_all_test_TYA_CNS_p1", replace
restore 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_long_all_test_TYA_p1", clear 


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
 gen	ppv_`x'=a_tot_`x'/((a_tot_`x')+((1/0.01)*b_tot_`x'))

}

 forval x=29/$n {
gen se_ppv_`x'=sqrt(ppv_`x'*(((1/0.015)*b_tot_`x')/((a_tot_`x')+((1/0.01)*b_tot_`x'))))/(a_tot_`x'+b_tot_`x')
}

preserve 
keep if patid==9101066
mi reshape long ppv_ se_ppv_, i(patid) j(event2)
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_long_all_test_TYA_CNS_p2", replace
restore 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_long_all_test_TYA_CNS_p1", clear 


//early timeline TYA
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_early_TYA_CNS", clear

drop if agediag_2==1
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

	mi impute chained (mlogit)ethnic_2cat (ologit)town_quintile = i.cancer_case i.symptom_7 i.symptom_9 i.symptom_21 i.symptom_23 i.symptom_36 i.symptom_37 i.symptom_38 i.symptom_40 i.symptom_48  i.symptom_52 i.symptom_54 i.symptom_49, rseed(1234) dots add(50) augment




timer off 1 
timer list 

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_imputed_v2_Dec_23_early_CNS_TYA", replace


//run estimation for early timeline TYA

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_imputed_v2_Dec_23_early_all_TYA", clear


mi estimate, or level(95): clogit cancer_case i.symptom_7 i.symptom_9 i.symptom_21 i.symptom_23 i.symptom_36 i.symptom_37 i.symptom_38 i.symptom_40 i.symptom_48  i.symptom_52 i.symptom_54 i.symptom_49 i.town_quint i.ethnic_2cat, group(setid) or



parmest, list(,) saving ("P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_multivariate_results_imputed_CNS_early_TYA", replace) eform label for(estimate min95 max95)

//////// graph TYA


 use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_multivariate_results_imputed_TYA_CNS", clear
 
 drop if estimate==1 
 gen log_OR=log(estimate)
 gen log_min=log(min95)
 gen log_max=log(max95)
 format PPV %3.2f
 format estimate min95 max95 log_OR log_min log_max %12.1f

gen group=0 
replace group=1 if parm=="Cough*" | parm=="Limb pain*" | parm=="Chest pain*" | parm=="Abnormal skin lesion" | parm=="Abnormal visual acuity" | parm=="Weight loss" | parm=="Feels unwell" | parm=="Torticollis" | parm=="Hemiparesis" | parm=="Testicular Swelling" | parm=="Limp" | parm=="Dizziness" | parm=="Pruritus*" | parm=="Haematuria" | parm=="Testicular swelling*" | parm=="Rash" 
replace group=2 if parm=="Townsend Quintile 2" | parm=="Townsend Quintile 3" |parm=="Townsend Quintile 4" | parm=="Townsend Quintile 5" | parm=="non-White ethnic group"
label define grouplabels 0 "Already Known" 1 "New Association" 2"", replace 
label values group grouplabels
tab group, m
sort estimate in 1/4
admetan log_OR log_min log_max, label(namevar=parm) nowt nooverall nosubgroup eform effect(Odds Ratio) rcols(PPV CI Early_OR) by(group) forestplot(hetstat(p) leftj) saving(defne_all_TYA_CNS, replace) 

use defne_all_TYA_CNS, clear 
label var _LABELS `"`"{bf:Symptoms}"'"'
replace _LABELS= `"{bf:"'+ _LABELS + `"}"' if _USE==0
label variable PPV "PPV(%)"
label variable CI "95% CI"
label variable Early_OR "Odds Ratio (95%CI) (33d before diagnosis excluded)"

forestplot, useopts nostats nobox nowt rcols(_EFFECT PPV CI Early_OR)




// imputation child
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_v4_Dec_23_CNS_v2", clear

drop if agediag_2==2

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

	mi impute chained (mlogit)ethnic_2cat (ologit)town_quintile = i.cancer_case i.symptom_7 i.symptom_9 i.symptom_21 i.symptom_23 i.symptom_36 i.symptom_37 i.symptom_38 i.symptom_40 i.symptom_48  i.symptom_52 i.symptom_54 i.symptom_49, rseed(1234) dots add(50) augment 




timer off 1 
timer list 

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_imputed_v2_Dec_23_child_CNS", replace


//run estimation for all timeline child

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_imputed_v2_Dec_23_child_CNS", clear


mi estimate, or level(95): clogit cancer_case i.symptom_7 i.symptom_9 i.symptom_21 i.symptom_23 i.symptom_36 i.symptom_37 i.symptom_40 i.symptom_48  i.symptom_52 i.symptom_54 i.symptom_49  i.town_quint i.ethnic_2cat, group(setid) or



parmest, list(,) saving ("P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_multivariate_results_imputed_child_CNS", replace) eform label for(estimate min95 max95)


///ppv calculations for all timeline child

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
 gen	ppv_`x'=a_tot_`x'/((a_tot_`x')+((1/0.01)*b_tot_`x'))

}

 forval x=1/$n {
gen se_ppv_`x'=sqrt(ppv_`x'*(((1/0.015)*b_tot_`x')/((a_tot_`x')+((1/0.01)*b_tot_`x'))))/(a_tot_`x'+b_tot_`x')
}

preserve 
keep if patid==7710131
mi reshape long ppv_ se_ppv_, i(patid) j(event2)
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_long_all_test_child_CNS_p1", replace
restore 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_long_all_test_child_p1", clear 


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
 gen	ppv_`x'=a_tot_`x'/((a_tot_`x')+((1/0.01)*b_tot_`x'))

}

 forval x=29/$n {
gen se_ppv_`x'=sqrt(ppv_`x'*(((1/0.015)*b_tot_`x')/((a_tot_`x')+((1/0.01)*b_tot_`x'))))/(a_tot_`x'+b_tot_`x')
}

preserve 
keep if patid==7710131
mi reshape long ppv_ se_ppv_, i(patid) j(event2)
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_long_all_test_child_CNS_p2", replace
restore 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_long_all_test_child_CNS_p2", clear 


//early timeline child
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_early_child_CNS", clear

drop if agediag_2==2
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

	mi impute chained (mlogit)ethnic_2cat (ologit)town_quintile = i.cancer_case i.symptom_7 i.symptom_9 i.symptom_21 i.symptom_23 i.symptom_36 i.symptom_37 i.symptom_38 i.symptom_40 i.symptom_48  i.symptom_52 i.symptom_54 i.symptom_49, rseed(1234) dots add(50) augment 



timer off 1 
timer list 

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_imputed_v2_Dec_23_early_CNS_child", replace


//run estimation for early timeline child

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_imputed_v2_Dec_23_early_all_child", clear


mi estimate, or level(95): clogit cancer_case i.symptom_7 i.symptom_9 i.symptom_21 i.symptom_23 i.symptom_36 i.symptom_37 i.symptom_38 i.symptom_40 i.symptom_48  i.symptom_52 i.symptom_54 i.symptom_49 i.town_quint i.ethnic_2cat, group(setid) or



parmest, list(,) saving ("P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_multivariate_results_imputed_CNS_early_child", replace) eform label for(estimate min95 max95)

//////// graph child


 use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_multivariate_results_imputed_child_CNS", clear
 
 drop if estimate==1 
 gen log_OR=log(estimate)
 gen log_min=log(min95)
 gen log_max=log(max95)
 format PPV %3.2f
 format estimate min95 max95 log_OR log_min log_max %12.1f

gen group=0 
replace group=1 if parm=="Organomegaly" | parm=="Limb pain*" | parm=="Joint pain" | parm=="Cough*" | parm=="Squint" | parm=="Weight loss" | parm=="Feels unwell*" | parm=="Torticollis" | parm=="Hemiparesis*" | parm=="Testicular swelling" | parm=="Limp" | parm=="Dizziness*" | parm=="Precocious puberty" | parm=="Haematuria*" | parm=="Chest pain*"  | parm=="Rash*"  | parm=="Vomiting"   | parm=="Abnormal visual acuity*"  | parm=="Tiredness*" | parm=="Hemiparesis"
replace group=2 if parm=="Townsend Quintile 2" | parm=="Townsend Quintile 3" |parm=="Townsend Quintile 4" | parm=="Townsend Quintile 5" | parm=="non-White ethnic group"
label define grouplabels 0 "Already Known" 1 "New Association" 2"", replace 
label values group grouplabels
tab group, m
sort estimate in 1/11
admetan log_OR log_min log_max, label(namevar=parm) nowt nooverall nosubgroup eform effect(Odds Ratio) rcols(PPV CI Early_OR) by(group) forestplot(hetstat(p) leftj) saving(defne_all_child_CNS, replace) 

use defne_all_child_CNS, clear 
label var _LABELS `"`"{bf:Symptoms}"'"'
replace _LABELS= `"{bf:"'+ _LABELS + `"}"' if _USE==0
label variable PPV "PPV(%)"
label variable CI "95% CI"
label variable Early_OR "Odds Ratio (95%CI) (19d before diagnosis excluded)"

forestplot, useopts nostats nobox nowt rcols(_EFFECT PPV CI Early_OR)
