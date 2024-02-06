
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_master_final_all_dec_2023_sarcoma_final_version.dta", clear
tab cancer_type

bys patid: gen k1=sum(any_cancer_source)
bys patid: replace k1=. if _n<_N
bys patid: gen T=sum(any_cancer_source<.)
bys patid: replace T=. if _n<_N
bys patid: gen dup_1= cond(_N==1,0, _n)
sort patid k1
tab dup_1
tab k1,m
tab T
tab numset

gen case_repeat=0 
replace case_repeat=1 if cancer_case==1 & dup_1>=2 
tab case_repeat 

drop if numset==1


gen agediag_2=1 if agediag<15
replace agediag_2=2 if agediag>14 & agediag<25



label define agelabels_2 1 "0-14 years" 2 "15-24 years", replace
label values agediag_2 agelabels_2
tab agediag_2, m
sort agediag_2
by agediag_2: tab cancer_type


bys agediag_2: tab cancer_type
bys cancer_case: tab cancer_type

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_v2_Dec_23_sarcoma_v2", replace


/// demographics

replace cancer_type=0 if cancer_case==0
replace any_cancer_source=0 if cancer_case==0
gen ethnic_2cat=1
replace ethnic_2cat=2 if ethriskid==2 | ethriskid==3 | ethriskid==4 | ethriskid==5 | ethriskid==8 |ethriskid==6 | ethriskid==7 | ethriskid==9
replace ethnic_2cat=. if ethriskid==.
label define ethniclabels 1 "White" 2 "Other" , replace 
label values ethnic_2cat ethniclabels
tab ethnic_2cat, m



**general descriptives 
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


// generate new variable for multiple presentation 

gen any_presr=0 
replace any_presr=1 if organomegalyr_final==1 | lymphor_final==1 | feverr_final==1 | urtir_final ==1 |limbr_final==1 | jointr_final==1 | limpr_final ==1 |anpar_final ==1 |tiredr_final==1 | abdopr_final==1 | anorexiar_final==1 | rashr_final==1 | skinr_final==1 | hnpr_final==1 | hnsr_final==1 | clr_final==1 | respr_final==1 | chest_painr_final==1 | coughr_final==1 | breathlessr_final==1 | headacher_final==1 | bruiser_final==1 | vomitr_final ==1 |hepatomegalyr_final ==1 |splenomegalyr_final ==1 | hsmr_final==1 | abdomassr_final==1 | hn_lumpr_final==1 | other_lumpr_final==1 | wlr_final ==1 |pruritusr_final ==1 | papr_final==1 | macror_final==1 | hemir_final==1 | hemipar_final==1 | tortr_final ==1 |squintr_final==1 | eyer_final==1 | acuityr_final==1 | diplopiar_final==1 | exopthalmosr_final==1 | behaviour_r_final==1 | irritabilityr_final ==1 |delayr_final==1 | voicer_final==1 | cranialr_final==1 | seizurer_final==1 | pubertyr_final==1 | gaitr_final==1 | haematuriar_final==1 | unwellr_final==1 | constipationr_final==1 | balancer_final==1 | testicular_pr_final==1 | testicular_sp_final==1 
tab cancer_case any_presr
bys agediag_2:tab cancer_case any_presr

clogit cancer_case any_presr, group(setid) or
bys agediag_2: clogit cancer_case any_presr, group(setid) or


save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_v3_Dec_23_sarcoma_v2", replace

//total numbers per group 


use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_v3_Dec_23_sarcoma_v2", clear 



rename (organomegalyf lymphof fever_v2f urti_v2f limb_v2f joint_v2f limp_v2f anpa_v2f tired_v2f abdop_v2f anorexia_v2f rash_v2f skin_v2f hnp_v2f hns_v2f cl_v2f respf chest_painf coughf breathlessf headache_v2f bruise_v2f vomit_v2f hepatomegalyf splenomegaly_v2f hsm_v2f abdomassf  hn_lumpf other_lumpf wl_v2f pruritus_v2f  pap_v2f macro_v2f hemi_v2f hemipa_v2f tort_v2f squint_v2f eyef acuityf diplopiaf exopthalmosf behaviourf irritabilityf delayf voicef cranialf seizuref pubertyf gaitf haematuriaf unwellf constipationf balancef testicular_pf testicular_sf) (symptom_1 symptom_2  symptom_3 symptom_4 symptom_5 symptom_6 symptom_7 symptom_8 symptom_9 symptom_10 symptom_11 symptom_12 symptom_13 symptom_14 symptom_15 symptom_16 symptom_17 symptom_18 symptom_19 symptom_20 symptom_21 symptom_22 symptom_23 symptom_24 symptom_25 symptom_26 symptom_27  symptom_29 symptom_30 symptom_31 symptom_32 symptom_33 symptom_34 symptom_35 symptom_36 symptom_37 symptom_38 symptom_39 symptom_40 symptom_41 symptom_42 symptom_43 symptom_44 symptom_45 symptom_46 symptom_47 symptom_48 symptom_49 symptom_50 symptom_51 symptom_52 symptom_53 symptom_54 symptom_55 symptom_56)

rename (time_gap_organomegaly_final time_gap_lympho_final time_gap_fever_v2_final time_gap_urti_v2_final time_gap_limb_v2_final time_gap_joint_v2_final time_gap_limp_v2_final time_gap_anpa_v2_final time_gap_tired_v2_final time_gap_abdop_v2_final time_gap_anorexia_v2_final time_gap_rash_v2_final time_gap_skin_v2_final time_gap_hnp_v2_final time_gap_hns_v2_final time_gap_cl_v2_final time_gap_resp_final time_gap_chest_pain_final time_gap_cough_final time_gap_breathless_final time_gap_headache_v2_final time_gap_bruise_v2_final time_gap_vomit_v2_final time_gap_hepatomegaly_final time_gap_splenomegaly_v2_final time_gap_hsm_v2_final time_gap_abdomass_final time_gap_hn_lump_final time_gap_other_lump_final time_gap_wl_v2_final time_gap_pruritus_v2_final  time_gap_pap_v2_final time_gap_macro_v2_final time_gap_hemi_v2_final time_gap_hemipa_v2_final time_gap_tort_v2_final time_gap_squint_v2_final time_gap_eye_final time_gap_acuity_final time_gap_diplopia_final time_gap_exopthalmos_final time_gap_behaviour_final time_gap_irritability_final time_gap_delay_final time_gap_voice_final time_gap_cranial_final time_gap_seizure_final time_gap_puberty_final time_gap_gait_final time_gap_haematuria_final time_gap_unwell_final time_gap_constipation_final time_gap_balance_final time_gap_testicular_p_final time_gap_testicular_s_final ) (time_gap_1 time_gap_2  time_gap_3 time_gap_4 time_gap_5 time_gap_6 time_gap_7 time_gap_8 time_gap_9 time_gap_10 time_gap_11 time_gap_12 time_gap_13 time_gap_14 time_gap_15 time_gap_16 time_gap_17 time_gap_18 time_gap_19 time_gap_20 time_gap_21 time_gap_22 time_gap_23 time_gap_24 time_gap_25 time_gap_26 time_gap_27  time_gap_29 time_gap_30 time_gap_31 time_gap_32 time_gap_33 time_gap_34 time_gap_35 time_gap_36 time_gap_37 time_gap_38 time_gap_39 time_gap_40 time_gap_41 time_gap_42 time_gap_43 time_gap_44 time_gap_45 time_gap_46 time_gap_47 time_gap_48 time_gap_49 time_gap_50 time_gap_51 time_gap_52 time_gap_53 time_gap_54 time_gap_55 time_gap_56)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_v4_Dec_23_sarcoma_v2", replace 


use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_v4_Dec_23_sarcoma_v2", clear
///univariable analyses 
global n 15
forval x=1/$n {
	tab cancer_case symptom_`x'
	clogit cancer_case symptom_`x', group(setid) or
bys agediag_2: tab cancer_case symptom_`x'	
bys agediag_2: clogit cancer_case symptom_`x', group(setid) or
}

global n 27
forval x=15/$n {
	tab cancer_case symptom_`x'
	clogit cancer_case symptom_`x', group(setid) or
bys agediag_2: tab cancer_case symptom_`x'	
bys agediag_2: clogit cancer_case symptom_`x', group(setid) or
}

global n 45
forval x=29/$n {
	tab cancer_case symptom_`x'
	clogit cancer_case symptom_`x', group(setid) or
bys agediag_2: tab cancer_case symptom_`x'	
bys agediag_2: clogit cancer_case symptom_`x', group(setid) or
}

global n 56
forval x=45/$n {
	tab cancer_case symptom_`x'
	clogit cancer_case symptom_`x', group(setid) or
bys agediag_2: tab cancer_case symptom_`x'	
bys agediag_2: clogit cancer_case symptom_`x', group(setid) or
 clogit cancer_case symptom_`x', group(setid) or
}


global n 63
forval x=62/$n {
	tab cancer_case symptom_`x'
	clogit cancer_case symptom_`x', group(setid) or
bys agediag_2: tab cancer_case symptom_`x'	
bys agediag_2: clogit cancer_case symptom_`x', group(setid) or
 clogit cancer_case symptom_`x', group(setid) or
}


//multivariable conditional logistic 

clogit cancer_case i.symptom_2 i.symptom_5 i.symptom_6 i.symptom_7 i.symptom_10 i.symptom_13 i.symptom_29 i.symptom_30  i.symptom_53 , group(setid) or
bys agediag_2: clogit cancer_case i.symptom_2 i.symptom_5 i.symptom_6 i.symptom_7 i.symptom_10 i.symptom_13 i.symptom_29 i.symptom_30   i.symptom_53 , group(setid) or

/////////////diagnostic intervals

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_v4_Dec_23_sarcoma_v2", clear 


gen any_symptom=0
replace any_symptom=1 if symptom_1==1 | symptom_2==1 |   symptom_3==1 | symptom_4==1 |  symptom_5==1 |  symptom_6==1 |  symptom_7==1 |  symptom_8==1 |  symptom_9==1 |  symptom_10==1 | symptom_12==1 |   symptom_18==1 |  symptom_19==1 |    symptom_21==1 |  symptom_22==1 |  symptom_23==1 | symptom_27==1| symptom_23==1 |  symptom_30==1 |  symptom_31==1 |  symptom_37==1 |  symptom_51==1 |  symptom_52==1 |  symptom_54==1  
tab cancer_case any_symptom

rename (symptom_2 symptom_5 symptom_6 symptom_7 symptom_10 symptom_13 symptom_29 symptom_30  symptom_53)(symptom1_1 symptom1_2 symptom1_3 symptom1_4  symptom1_5 symptom1_6  symptom1_7 symptom1_8 symptom1_9)

rename (time_gap_2 time_gap_5 time_gap_6 time_gap_7 time_gap_10 time_gap_13 time_gap_29 time_gap_30 time_gap_53 )(time_gap1_1 time_gap1_2 time_gap1_3 time_gap1_4  time_gap1_5 time_gap1_6  time_gap1_7 time_gap1_8 time_gap1_9)

drop if cancer_case==0
tab cancer_case

gen time_gap_all=max(time_gap1_1, time_gap1_2, time_gap1_3, time_gap1_4,  time_gap1_5, time_gap1_6,  time_gap1_7, time_gap1_8, time_gap1_9)

summ time_gap_all, detail

drop constipation unwell cough
rename (time_gap1_1 time_gap1_2 time_gap1_3 time_gap1_4  time_gap1_5 time_gap1_6  time_gap1_7 time_gap1_8 time_gap1_9 )(lymphadenopathy LP JP limp AP ASL HNL BL constipation)


graph hbox lymphadenopathy LP JP AP limp ASL HNL BL constipation, showyvars nooutsides 


preserve
keep if agediag_2==1 
rename (symptom_5 symptom_6 symptom_7 symptom_13 symptom_29 symptom_30  symptom_53)(symptom1_1 symptom1_2 symptom1_3 symptom1_4  symptom1_5 symptom1_6  symptom1_7 )

rename ( time_gap_5 time_gap_6 time_gap_7 time_gap_13 time_gap_29 time_gap_30 time_gap_53 )(time_gap1_1 time_gap1_2 time_gap1_3 time_gap1_4  time_gap1_5 time_gap1_6  time_gap1_7)

drop if cancer_case==0
tab cancer_case

gen time_gap_all=max(time_gap1_1, time_gap1_2, time_gap1_3, time_gap1_4,  time_gap1_5, time_gap1_6,  time_gap1_7)

summ time_gap_all, detail

drop constipation unwell cough
rename (time_gap1_1 time_gap1_2 time_gap1_3 time_gap1_4  time_gap1_5 time_gap1_6  time_gap1_7 )(LP JP limp ASL HNL BL constipation)


graph hbox LP JP limp ASL HNL BL constipation, showyvars nooutsides 
restore

preserve
keep if agediag_2==2
rename (symptom_2 symptom_5 symptom_6 symptom_10 symptom_29 symptom_30 symptom_53)(symptom1_1 symptom1_2 symptom1_3 symptom1_4 symptom1_5 symptom1_6  symptom1_7 )

rename (time_gap_2 time_gap_5 time_gap_6 time_gap_10 time_gap_29 time_gap_30 time_gap_53 )(time_gap1_1 time_gap1_2 time_gap1_3 time_gap1_4  time_gap1_5 time_gap1_6  time_gap1_7)

drop if cancer_case==0
tab cancer_case

gen time_gap_all=max(time_gap1_1, time_gap1_2, time_gap1_3, time_gap1_4,  time_gap1_5, time_gap1_6,  time_gap1_7)

summ time_gap_all, detail

drop constipation unwell cough
rename (time_gap1_1 time_gap1_2 time_gap1_3 time_gap1_4  time_gap1_5 time_gap1_6  time_gap1_7 )(lymphadenopathy LP JP AP HNL BL constipation)


graph hbox lymphadenopathy LP JP AP HNL BL constipation, showyvars nooutsides 
restore



/// early logistics 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_v3_Dec_23_sarcoma_v2", clear 

keep if agediag_2==2

rename (organomegalyf lymphof fever_v2f urti_v2f limb_v2f joint_v2f limp_v2f anpa_v2f tired_v2f abdop_v2f anorexia_v2f rash_v2f skin_v2f hnp_v2f hns_v2f cl_v2f respf chest_painf coughf breathlessf headache_v2f bruise_v2f vomit_v2f hepatomegalyf splenomegaly_v2f hsm_v2f abdomassf hn_lumpf other_lumpf wl_v2f pruritus_v2f  pap_v2f macro_v2f hemi_v2f hemipa_v2f tort_v2f squint_v2f eyef acuityf diplopiaf exopthalmosf behaviourf irritabilityf delayf voicef cranialf seizuref pubertyf gaitf haematuriaf unwellf constipationf balancef testicular_pf testicular_sf) (symptom_1 symptom_2  symptom_3 symptom_4 symptom_5 symptom_6 symptom_7 symptom_8 symptom_9 symptom_10 symptom_11 symptom_12 symptom_13 symptom_14 symptom_15 symptom_16 symptom_17 symptom_18 symptom_19 symptom_20 symptom_21 symptom_22 symptom_23 symptom_24 symptom_25 symptom_26 symptom_27 symptom_29 symptom_30 symptom_31 symptom_32 symptom_33 symptom_34 symptom_35 symptom_36 symptom_37 symptom_38 symptom_39 symptom_40 symptom_41 symptom_42 symptom_43 symptom_44 symptom_45 symptom_46 symptom_47 symptom_48 symptom_49 symptom_50 symptom_51 symptom_52 symptom_53 symptom_54 symptom_55 symptom_56 )

rename (time_gap_organomegaly_final time_gap_lympho_final time_gap_fever_v2_final time_gap_urti_v2_final time_gap_limb_v2_final time_gap_joint_v2_final time_gap_limp_v2_final time_gap_anpa_v2_final time_gap_tired_v2_final time_gap_abdop_v2_final time_gap_anorexia_v2_final time_gap_rash_v2_final time_gap_skin_v2_final time_gap_hnp_v2_final time_gap_hns_v2_final time_gap_cl_v2_final time_gap_resp_final time_gap_chest_pain_final time_gap_cough_final time_gap_breathless_final time_gap_headache_v2_final time_gap_bruise_v2_final time_gap_vomit_v2_final time_gap_hepatomegaly_final time_gap_splenomegaly_v2_final time_gap_hsm_v2_final time_gap_abdomass_final time_gap_hn_lump_final time_gap_other_lump_final time_gap_wl_v2_final time_gap_pruritus_v2_final  time_gap_pap_v2_final time_gap_macro_v2_final time_gap_hemi_v2_final time_gap_hemipa_v2_final time_gap_tort_v2_final time_gap_squint_v2_final time_gap_eye_final time_gap_acuity_final time_gap_diplopia_final time_gap_exopthalmos_final time_gap_behaviour_final time_gap_irritability_final time_gap_delay_final time_gap_voice_final time_gap_cranial_final time_gap_seizure_final time_gap_puberty_final time_gap_gait_final time_gap_haematuria_final time_gap_unwell_final time_gap_constipation_final time_gap_balance_final time_gap_testicular_p_final time_gap_testicular_s_final) (time_gap_1 time_gap_2  time_gap_3 time_gap_4 time_gap_5 time_gap_6 time_gap_7 time_gap_8 time_gap_9 time_gap_10 time_gap_11 time_gap_12 time_gap_13 time_gap_14 time_gap_15 time_gap_16 time_gap_17 time_gap_18 time_gap_19 time_gap_20 time_gap_21 time_gap_22 time_gap_23 time_gap_24 time_gap_25 time_gap_26 time_gap_27  time_gap_29 time_gap_30 time_gap_31 time_gap_32 time_gap_33 time_gap_34 time_gap_35 time_gap_36 time_gap_37 time_gap_38 time_gap_39 time_gap_40 time_gap_41 time_gap_42 time_gap_43 time_gap_44 time_gap_45 time_gap_46 time_gap_47 time_gap_48 time_gap_49 time_gap_50 time_gap_51 time_gap_52 time_gap_53 time_gap_54 time_gap_55 time_gap_56)

global n 27
forval x=1/$n {


qui replace symptom_`x'=. if (time_gap_`x'<74 | time_gap_`x'>182)
qui replace time_gap_`x'=. if (time_gap_`x'<74 | time_gap_`x'>182)


qui replace symptom_`x'=0 if symptom_`x'==.

}

global n 56
forval x=29/$n {


qui replace symptom_`x'=. if (time_gap_`x'<74 | time_gap_`x'>182)
qui replace time_gap_`x'=. if (time_gap_`x'<74 | time_gap_`x'>182)


qui replace symptom_`x'=0 if symptom_`x'==.

}





save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_early_TYA_sarcoma", replace

/// symptom combos 


use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_v4_Dec_23_sarcoma_v2", clear 


global symptom symptom_2 symptom_5 symptom_6 symptom_7 symptom_10 symptom_12 symptom_13 symptom_18 symptom_21 symptom_29  symptom_30 symptom_31 symptom_51 symptom_53
keep sex1 symptom_* agediag_2 patid cancer_case cancer_type setid town_quint

corr $symptom

pca $symptom
screeplot, yline(1.01) ci

pca $symptom, mineigen(1.01)

pca $symptom, mineigen(1.01) blanks(0.30)

estat kmo
loadingplot
scoreplot
predict pca p1 p2 p3 p4 p5 p6 

clogit cancer_case p5, group(setid) or
gen symptom_combo_1=0
replace symptom_combo_1=1 if symptom_19==1 & (symptom_1==1 | symptom_2==1 |  symptom_3==1 | symptom_5==1 |  symptom_6==1 |  symptom_7==1 |  symptom_8==1 |  symptom_9==1 |  symptom_10==1 |  symptom_15==1 |  symptom_18==1 |   symptom_22==1 |    symptom_52==1 |  symptom_12==1| symptom_21==1 |  symptom_13==1 | symptom_20==1 | symptom_23==1 | symptom_29==1 | symptom_30==1 | symptom_31==1 | symptom_32==1 | symptom_34==1 | symptom_36==1 | symptom_37==1 | symptom_38==1 | symptom_40==1 | symptom_48==1 | symptom_51==1 | symptom_53==1 | symptom_56==1 | symptom_57==1)
gen symptom_combo_2=0
replace symptom_combo_2=1 if symptom_3==1 & (symptom_1==1 | symptom_2==1 |  symptom_19==1 | symptom_5==1 |  symptom_6==1 |  symptom_7==1 |  symptom_8==1 |  symptom_9==1 |  symptom_10==1 |  symptom_15==1 |  symptom_18==1 |   symptom_22==1 |    symptom_52==1 |  symptom_12==1| symptom_21==1 |  symptom_13==1 | symptom_20==1 | symptom_23==1 | symptom_29==1 | symptom_30==1 | symptom_31==1 | symptom_32==1 | symptom_34==1 | symptom_36==1 | symptom_37==1 | symptom_38==1 | symptom_40==1 | symptom_48==1 | symptom_51==1 | symptom_53==1 | symptom_56==1 | symptom_57==1)
gen symptom_combo_3=0
replace symptom_combo_3=1 if symptom_2==1 & (symptom_1==1 | symptom_12==1 |  symptom_3==1 | symptom_5==1 |  symptom_6==1 |  symptom_7==1 |  symptom_8==1 |  symptom_9==1 |  symptom_10==1 |  symptom_15==1 |  symptom_18==1 |   symptom_19==1 | symptom_22==1 |    symptom_52==1 |  symptom_3==1| symptom_21==1 |  symptom_13==1 | symptom_20==1 | symptom_23==1 | symptom_29==1 | symptom_30==1 | symptom_31==1 | symptom_32==1 | symptom_34==1 | symptom_36==1 | symptom_37==1 | symptom_38==1 | symptom_40==1 | symptom_48==1 | symptom_51==1 | symptom_53==1 | symptom_56==1 | symptom_57==1)
gen symptom_combo_4=0
replace symptom_combo_4=1 if symptom_5==1 & (symptom_1==1 | symptom_2==1 |  symptom_3==1 | symptom_19==1 |  symptom_6==1 |  symptom_7==1 |  symptom_8==1 |  symptom_9==1 |  symptom_10==1 |  symptom_15==1 |  symptom_18==1 |   symptom_22==1 |    symptom_52==1 |  symptom_12==1| symptom_21==1 |  symptom_13==1 | symptom_20==1 | symptom_23==1 | symptom_29==1 | symptom_30==1 | symptom_31==1 | symptom_32==1 | symptom_34==1 | symptom_36==1 | symptom_37==1 | symptom_38==1 | symptom_40==1 | symptom_48==1 | symptom_51==1 | symptom_53==1 | symptom_56==1 | symptom_57==1)
gen symptom_combo_5=0
replace symptom_combo_5=1 if symptom_6==1 & (symptom_1==1 | symptom_2==1 |  symptom_3==1 | symptom_5==1 |  symptom_19==1 |  symptom_7==1 |  symptom_8==1 |  symptom_9==1 |  symptom_10==1 |  symptom_15==1 |  symptom_18==1 |   symptom_22==1 |    symptom_52==1 |  symptom_12==1| symptom_21==1 |  symptom_13==1 | symptom_20==1 | symptom_23==1 | symptom_29==1 | symptom_30==1 | symptom_31==1 | symptom_32==1 | symptom_34==1 | symptom_36==1 | symptom_37==1 | symptom_38==1 | symptom_40==1 | symptom_48==1 | symptom_51==1 | symptom_53==1 | symptom_56==1 | symptom_57==1)
gen symptom_combo_6=0
replace symptom_combo_6=1 if symptom_1==1 & (symptom_2==1 | symptom_19==1 |  symptom_3==1 | symptom_5==1 |  symptom_6==1 |  symptom_7==1 |  symptom_8==1 |  symptom_9==1 |  symptom_10==1 |  symptom_15==1 |  symptom_18==1 |   symptom_22==1 |    symptom_52==1 |  symptom_12==1| symptom_21==1 |  symptom_13==1 | symptom_20==1 | symptom_23==1 | symptom_29==1 | symptom_30==1 | symptom_31==1 | symptom_32==1 | symptom_34==1 | symptom_36==1 | symptom_37==1 | symptom_38==1 | symptom_40==1 | symptom_48==1 | symptom_51==1 | symptom_53==1 | symptom_56==1 | symptom_57==1)
gen symptom_combo_7=0
replace symptom_combo_7=1 if symptom_10==1 & (symptom_1==1 | symptom_2==1 |  symptom_3==1 | symptom_5==1 |  symptom_6==1 |  symptom_7==1 |  symptom_8==1 |  symptom_9==1 |  symptom_15==1 |  symptom_18==1 |   symptom_22==1 |    symptom_52==1 |  symptom_12==1| symptom_21==1 |  symptom_13==1 | symptom_20==1 | symptom_23==1 | symptom_29==1 | symptom_30==1 | symptom_31==1 | symptom_32==1 | symptom_34==1 | symptom_36==1 | symptom_37==1 | symptom_38==1 | symptom_40==1 | symptom_48==1 | symptom_51==1 | symptom_53==1 | symptom_56==1 | symptom_57==1 | symptom_19==1 )
gen symptom_combo_8=0
replace symptom_combo_8=1 if symptom_9==1 & (symptom_1==1 | symptom_2==1 |  symptom_3==1 | symptom_5==1 |  symptom_6==1 |  symptom_7==1 |  symptom_8==1 |  symptom_19==1 |  symptom_10==1 |  symptom_15==1 |  symptom_18==1 |   symptom_22==1 |    symptom_52==1 |  symptom_12==1| symptom_21==1 |  symptom_13==1 | symptom_20==1 | symptom_23==1 | symptom_29==1 | symptom_30==1 | symptom_31==1 | symptom_32==1 | symptom_34==1 | symptom_36==1 | symptom_37==1 | symptom_38==1 | symptom_40==1 | symptom_48==1 | symptom_51==1 | symptom_53==1 | symptom_56==1 | symptom_57==1)
gen symptom_combo_9=0
replace symptom_combo_9=1 if symptom_22==1 & (symptom_1==1 | symptom_2==1 |  symptom_3==1 | symptom_5==1 |  symptom_6==1 |  symptom_7==1 |  symptom_8==1 |  symptom_19==1 |  symptom_10==1 |  symptom_15==1 |  symptom_18==1 |   symptom_9==1 |    symptom_52==1 |  symptom_12==1| symptom_21==1 |  symptom_13==1 | symptom_20==1 | symptom_23==1 | symptom_29==1 | symptom_30==1 | symptom_31==1 | symptom_32==1 | symptom_34==1 | symptom_36==1 | symptom_37==1 | symptom_38==1 | symptom_40==1 | symptom_48==1 | symptom_51==1 | symptom_53==1 | symptom_56==1 | symptom_57==1)
gen symptom_combo_10=0
replace symptom_combo_10=1 if symptom_7==1 & (symptom_1==1 | symptom_2==1 |  symptom_3==1 | symptom_5==1 |  symptom_6==1 |  symptom_19==1 |  symptom_8==1 |  symptom_9==1 |  symptom_10==1 |  symptom_15==1 |  symptom_18==1 |   symptom_22==1 |    symptom_52==1 |  symptom_12==1| symptom_21==1 |  symptom_13==1 | symptom_20==1 | symptom_23==1 | symptom_29==1 | symptom_30==1 | symptom_31==1 | symptom_32==1 | symptom_34==1 | symptom_36==1 | symptom_37==1 | symptom_38==1 | symptom_40==1 | symptom_48==1 | symptom_51==1 | symptom_53==1 | symptom_56==1 | symptom_57==1)
gen symptom_combo_11=0
replace symptom_combo_11=1 if symptom_52==1 & (symptom_1==1 | symptom_2==1 |  symptom_3==1 | symptom_5==1 |  symptom_6==1 |  symptom_7==1 |  symptom_8==1 |  symptom_9==1 |  symptom_10==1 |  symptom_15==1 |  symptom_18==1 |   symptom_22==1 |    symptom_19==1 |  symptom_12==1| symptom_21==1 |  symptom_13==1 | symptom_20==1 | symptom_23==1 | symptom_29==1 | symptom_30==1 | symptom_31==1 | symptom_32==1 | symptom_34==1 | symptom_36==1 | symptom_37==1 | symptom_38==1 | symptom_40==1 | symptom_48==1 | symptom_51==1 | symptom_53==1 | symptom_56==1 | symptom_57==1)
gen symptom_combo_12=0
replace symptom_combo_12=1 if symptom_21==1 & (symptom_1==1 | symptom_2==1 |  symptom_3==1 | symptom_5==1 |  symptom_6==1 |  symptom_7==1 |  symptom_8==1 |  symptom_9==1 |  symptom_10==1 |  symptom_15==1 |  symptom_18==1 |   symptom_22==1 |    symptom_52==1 |  symptom_12==1| symptom_19==1 |  symptom_13==1 | symptom_20==1 | symptom_23==1 | symptom_29==1 | symptom_30==1 | symptom_31==1 | symptom_32==1 | symptom_34==1 | symptom_36==1 | symptom_37==1 | symptom_38==1 | symptom_40==1 | symptom_48==1 | symptom_51==1 | symptom_53==1 | symptom_56==1 | symptom_57==1)
gen symptom_combo_13=0
replace symptom_combo_13=1 if symptom_8==1 & (symptom_1==1 | symptom_2==1 |  symptom_3==1 | symptom_5==1 |  symptom_6==1 |  symptom_7==1 |  symptom_19==1 |  symptom_9==1 |  symptom_10==1 |  symptom_15==1 |  symptom_18==1 |   symptom_22==1 |    symptom_52==1 |  symptom_12==1| symptom_21==1 |  symptom_13==1 | symptom_20==1 | symptom_23==1 | symptom_29==1 | symptom_30==1 | symptom_31==1 | symptom_32==1 | symptom_34==1 | symptom_36==1 | symptom_37==1 | symptom_38==1 | symptom_40==1 | symptom_48==1 | symptom_51==1 | symptom_53==1 | symptom_56==1 | symptom_57==1)
gen symptom_combo_14=0
replace symptom_combo_14=1 if symptom_18==1 & (symptom_1==1 | symptom_2==1 |  symptom_3==1 | symptom_5==1 |  symptom_6==1 |  symptom_7==1 |  symptom_8==1 |  symptom_9==1 |  symptom_10==1 |  symptom_15==1 |  symptom_19==1 |   symptom_22==1 |    symptom_52==1 |  symptom_12==1| symptom_21==1 |  symptom_13==1 | symptom_20==1 | symptom_23==1 | symptom_29==1 | symptom_30==1 | symptom_31==1 | symptom_32==1 | symptom_34==1 | symptom_36==1 | symptom_37==1 | symptom_38==1 | symptom_40==1 | symptom_48==1 | symptom_51==1 | symptom_53==1 | symptom_56==1 | symptom_57==1)
gen symptom_combo_15=0
replace symptom_combo_15=1 if symptom_15==1 & (symptom_1==1 | symptom_2==1 |  symptom_3==1 | symptom_5==1 |  symptom_6==1 |  symptom_7==1 |  symptom_8==1 |  symptom_9==1 |  symptom_10==1 |  symptom_19==1 |  symptom_18==1 |   symptom_22==1 |    symptom_52==1 |  symptom_12==1| symptom_21==1 |  symptom_13==1 | symptom_20==1 | symptom_23==1 | symptom_29==1 | symptom_30==1 | symptom_31==1 | symptom_32==1 | symptom_34==1 | symptom_36==1 | symptom_37==1 | symptom_38==1 | symptom_40==1 | symptom_48==1 | symptom_51==1 | symptom_53==1 | symptom_56==1 | symptom_57==1)
gen symptom_combo_16=0
replace symptom_combo_16=1 if symptom_12==1 & (symptom_1==1 | symptom_2==1 |  symptom_3==1 | symptom_5==1 |  symptom_6==1 |  symptom_7==1 |  symptom_8==1 |  symptom_9==1 |  symptom_10==1 |  symptom_15==1 |  symptom_18==1 |   symptom_22==1 |    symptom_52==1 |  symptom_19==1| symptom_21==1 |  symptom_13==1 | symptom_20==1 | symptom_23==1 | symptom_29==1 | symptom_30==1 | symptom_31==1 | symptom_32==1 | symptom_34==1 | symptom_36==1 | symptom_37==1 | symptom_38==1 | symptom_40==1 | symptom_48==1 | symptom_51==1 | symptom_53==1 | symptom_56==1 | symptom_57==1)
gen symptom_combo_17=0
replace symptom_combo_17=1 if symptom_13==1 & (symptom_1==1 | symptom_2==1 |  symptom_3==1 | symptom_5==1 |  symptom_6==1 |  symptom_7==1 |  symptom_8==1 |  symptom_9==1 |  symptom_10==1 |  symptom_15==1 |  symptom_18==1 |   symptom_22==1 |    symptom_52==1 |  symptom_19==1| symptom_21==1 |  symptom_19==1 | symptom_20==1 | symptom_23==1 | symptom_29==1 | symptom_30==1 | symptom_31==1 | symptom_32==1 | symptom_34==1 | symptom_36==1 | symptom_37==1 | symptom_38==1 | symptom_40==1 | symptom_48==1 | symptom_51==1 | symptom_53==1 | symptom_56==1 | symptom_57==1)
gen symptom_combo_18=0
replace symptom_combo_18=1 if symptom_20==1 & (symptom_1==1 | symptom_2==1 |  symptom_3==1 | symptom_5==1 |  symptom_6==1 |  symptom_7==1 |  symptom_8==1 |  symptom_9==1 |  symptom_10==1 |  symptom_15==1 |  symptom_18==1 |   symptom_22==1 |    symptom_52==1 |  symptom_19==1| symptom_21==1 |  symptom_19==1 | symptom_13==1 | symptom_23==1 | symptom_29==1 | symptom_30==1 | symptom_31==1 | symptom_32==1 | symptom_34==1 | symptom_36==1 | symptom_37==1 | symptom_38==1 | symptom_40==1 | symptom_48==1 | symptom_51==1 | symptom_53==1 | symptom_56==1 | symptom_57==1)
gen symptom_combo_19=0
replace symptom_combo_19=1 if symptom_23==1 & (symptom_1==1 | symptom_2==1 |  symptom_3==1 | symptom_5==1 |  symptom_6==1 |  symptom_7==1 |  symptom_8==1 |  symptom_9==1 |  symptom_10==1 |  symptom_15==1 |  symptom_18==1 |   symptom_22==1 |    symptom_52==1 |  symptom_19==1| symptom_21==1 |  symptom_13==1 | symptom_20==1 | symptom_12==1 | symptom_29==1 | symptom_30==1 | symptom_31==1 | symptom_32==1 | symptom_34==1 | symptom_36==1 | symptom_37==1 | symptom_38==1 | symptom_40==1 | symptom_48==1 | symptom_51==1 | symptom_53==1 | symptom_56==1 | symptom_57==1)
gen symptom_combo_20=0
replace symptom_combo_20=1 if symptom_29==1 & (symptom_1==1 | symptom_2==1 |  symptom_3==1 | symptom_5==1 |  symptom_6==1 |  symptom_7==1 |  symptom_8==1 |  symptom_9==1 |  symptom_10==1 |  symptom_15==1 |  symptom_18==1 |   symptom_22==1 |    symptom_52==1 |  symptom_19==1| symptom_21==1 |  symptom_13==1 | symptom_20==1 | symptom_12==1 | symptom_23==1 | symptom_30==1 | symptom_31==1 | symptom_32==1 | symptom_34==1 | symptom_36==1 | symptom_37==1 | symptom_38==1 | symptom_40==1 | symptom_48==1 | symptom_51==1 | symptom_53==1 | symptom_56==1 | symptom_57==1)
gen symptom_combo_21=0
replace symptom_combo_21=1 if symptom_30==1 & (symptom_1==1 | symptom_2==1 |  symptom_3==1 | symptom_5==1 |  symptom_6==1 |  symptom_7==1 |  symptom_8==1 |  symptom_9==1 |  symptom_10==1 |  symptom_15==1 |  symptom_18==1 |   symptom_22==1 |    symptom_52==1 |  symptom_19==1| symptom_21==1 |  symptom_13==1 | symptom_20==1 | symptom_12==1 | symptom_23==1 | symptom_29==1 | symptom_31==1 | symptom_32==1 | symptom_34==1 | symptom_36==1 | symptom_37==1 | symptom_38==1 | symptom_40==1 | symptom_48==1 | symptom_51==1 | symptom_53==1 | symptom_56==1 | symptom_57==1)
gen symptom_combo_22=0
replace symptom_combo_22=1 if symptom_31==1 & (symptom_1==1 | symptom_2==1 |  symptom_3==1 | symptom_5==1 |  symptom_6==1 |  symptom_7==1 |  symptom_8==1 |  symptom_9==1 |  symptom_10==1 |  symptom_15==1 |  symptom_18==1 |   symptom_22==1 |    symptom_52==1 |  symptom_19==1| symptom_21==1 |  symptom_13==1 | symptom_20==1 | symptom_12==1 | symptom_23==1 | symptom_29==1 | symptom_30==1 | symptom_32==1 | symptom_34==1 | symptom_36==1 | symptom_37==1 | symptom_38==1 | symptom_40==1 | symptom_48==1 | symptom_51==1 | symptom_53==1 | symptom_56==1 | symptom_57==1)
gen symptom_combo_23=0
replace symptom_combo_23=1 if symptom_32==1 & (symptom_1==1 | symptom_2==1 |  symptom_3==1 | symptom_5==1 |  symptom_6==1 |  symptom_7==1 |  symptom_8==1 |  symptom_9==1 |  symptom_10==1 |  symptom_15==1 |  symptom_18==1 |   symptom_22==1 |    symptom_52==1 |  symptom_19==1| symptom_21==1 |  symptom_13==1 | symptom_20==1 | symptom_12==1 | symptom_23==1 | symptom_29==1 | symptom_30==1 | symptom_31==1 | symptom_34==1 | symptom_36==1 | symptom_37==1 | symptom_38==1 | symptom_40==1 | symptom_48==1 | symptom_51==1 | symptom_53==1 | symptom_56==1 | symptom_57==1)
gen symptom_combo_24=0
replace symptom_combo_24=1 if symptom_34==1 & (symptom_1==1 | symptom_2==1 |  symptom_3==1 | symptom_5==1 |  symptom_6==1 |  symptom_7==1 |  symptom_8==1 |  symptom_9==1 |  symptom_10==1 |  symptom_15==1 |  symptom_18==1 |   symptom_22==1 |    symptom_52==1 |  symptom_19==1| symptom_21==1 |  symptom_13==1 | symptom_20==1 | symptom_12==1 | symptom_23==1 | symptom_29==1 | symptom_30==1 | symptom_31==1 | symptom_32==1 | symptom_36==1 | symptom_37==1 | symptom_38==1 | symptom_40==1 | symptom_48==1 | symptom_51==1 | symptom_53==1 | symptom_56==1 | symptom_57==1)
gen symptom_combo_25=0
replace symptom_combo_25=1 if symptom_36==1 & (symptom_1==1 | symptom_2==1 |  symptom_3==1 | symptom_5==1 |  symptom_6==1 |  symptom_7==1 |  symptom_8==1 |  symptom_9==1 |  symptom_10==1 |  symptom_15==1 |  symptom_18==1 |   symptom_22==1 |    symptom_52==1 |  symptom_19==1| symptom_21==1 |  symptom_13==1 | symptom_20==1 | symptom_12==1 | symptom_23==1 | symptom_29==1 | symptom_30==1 | symptom_31==1 | symptom_32==1 | symptom_34==1 | symptom_37==1 | symptom_38==1 | symptom_40==1 | symptom_48==1 | symptom_51==1 | symptom_53==1 | symptom_56==1 | symptom_57==1)
gen symptom_combo_26=0
replace symptom_combo_26=1 if symptom_37==1 & (symptom_1==1 | symptom_2==1 |  symptom_3==1 | symptom_5==1 |  symptom_6==1 |  symptom_7==1 |  symptom_8==1 |  symptom_9==1 |  symptom_10==1 |  symptom_15==1 |  symptom_18==1 |   symptom_22==1 |    symptom_52==1 |  symptom_19==1| symptom_21==1 |  symptom_13==1 | symptom_20==1 | symptom_12==1 | symptom_23==1 | symptom_29==1 | symptom_30==1 | symptom_31==1 | symptom_32==1 | symptom_34==1 | symptom_36==1 | symptom_38==1 | symptom_40==1 | symptom_48==1 | symptom_51==1 | symptom_53==1 | symptom_56==1 | symptom_57==1)
gen symptom_combo_27=0
replace symptom_combo_27=1 if symptom_38==1 & (symptom_1==1 | symptom_2==1 |  symptom_3==1 | symptom_5==1 |  symptom_6==1 |  symptom_7==1 |  symptom_8==1 |  symptom_9==1 |  symptom_10==1 |  symptom_15==1 |  symptom_18==1 |   symptom_22==1 |    symptom_52==1 |  symptom_19==1| symptom_21==1 |  symptom_13==1 | symptom_20==1 | symptom_12==1 | symptom_23==1 | symptom_29==1 | symptom_30==1 | symptom_31==1 | symptom_32==1 | symptom_34==1 | symptom_36==1 | symptom_37==1 | symptom_40==1 | symptom_48==1 | symptom_51==1 | symptom_53==1 | symptom_56==1 | symptom_57==1)

gen symptom_combo_28=0
replace symptom_combo_28=1 if symptom_40==1 & (symptom_1==1 | symptom_2==1 |  symptom_3==1 | symptom_5==1 |  symptom_6==1 |  symptom_7==1 |  symptom_8==1 |  symptom_9==1 |  symptom_10==1 |  symptom_15==1 |  symptom_18==1 |   symptom_22==1 |    symptom_52==1 |  symptom_19==1| symptom_21==1 |  symptom_13==1 | symptom_20==1 | symptom_12==1 | symptom_23==1 | symptom_29==1 | symptom_30==1 | symptom_31==1 | symptom_32==1 | symptom_34==1 | symptom_36==1 | symptom_37==1 | symptom_38==1 | symptom_48==1 | symptom_51==1 | symptom_53==1 | symptom_56==1 | symptom_57==1)
gen symptom_combo_29=0
replace symptom_combo_29=1 if symptom_48==1 & (symptom_1==1 | symptom_2==1 |  symptom_3==1 | symptom_5==1 |  symptom_6==1 |  symptom_7==1 |  symptom_8==1 |  symptom_9==1 |  symptom_10==1 |  symptom_15==1 |  symptom_18==1 |   symptom_22==1 |    symptom_52==1 |  symptom_19==1| symptom_21==1 |  symptom_13==1 | symptom_20==1 | symptom_12==1 | symptom_23==1 | symptom_29==1 | symptom_30==1 | symptom_31==1 | symptom_32==1 | symptom_34==1 | symptom_36==1 | symptom_37==1 | symptom_38==1 | symptom_40==1 | symptom_51==1 | symptom_53==1 | symptom_56==1 | symptom_57==1)
gen symptom_combo_30=0
replace symptom_combo_30=1 if symptom_51==1 & (symptom_1==1 | symptom_2==1 |  symptom_3==1 | symptom_5==1 |  symptom_6==1 |  symptom_7==1 |  symptom_8==1 |  symptom_9==1 |  symptom_10==1 |  symptom_15==1 |  symptom_18==1 |   symptom_22==1 |    symptom_52==1 |  symptom_19==1| symptom_21==1 |  symptom_13==1 | symptom_20==1 | symptom_12==1 | symptom_23==1 | symptom_29==1 | symptom_30==1 | symptom_31==1 | symptom_32==1 | symptom_34==1 | symptom_36==1 | symptom_37==1 | symptom_38==1 | symptom_40==1 | symptom_48==1 | symptom_53==1 | symptom_56==1 | symptom_57==1)
gen symptom_combo_31=0
replace symptom_combo_31=1 if symptom_53==1 & (symptom_1==1 | symptom_2==1 |  symptom_3==1 | symptom_5==1 |  symptom_6==1 |  symptom_7==1 |  symptom_8==1 |  symptom_9==1 |  symptom_10==1 |  symptom_15==1 |  symptom_18==1 |   symptom_22==1 |    symptom_52==1 |  symptom_19==1| symptom_21==1 |  symptom_13==1 | symptom_20==1 | symptom_12==1 | symptom_23==1 | symptom_29==1 | symptom_30==1 | symptom_31==1 | symptom_32==1 | symptom_34==1 | symptom_36==1 | symptom_37==1 | symptom_38==1 | symptom_40==1 | symptom_48==1 | symptom_51==1 | symptom_56==1 | symptom_57==1)
gen symptom_combo_32=0
replace symptom_combo_32=1 if symptom_56==1 & (symptom_1==1 | symptom_2==1 |  symptom_3==1 | symptom_5==1 |  symptom_6==1 |  symptom_7==1 |  symptom_8==1 |  symptom_9==1 |  symptom_10==1 |  symptom_15==1 |  symptom_18==1 |   symptom_22==1 |    symptom_52==1 |  symptom_19==1| symptom_21==1 |  symptom_13==1 | symptom_20==1 | symptom_12==1 | symptom_23==1 | symptom_29==1 | symptom_30==1 | symptom_31==1 | symptom_32==1 | symptom_34==1 | symptom_36==1 | symptom_37==1 | symptom_38==1 | symptom_40==1 | symptom_48==1 | symptom_51==1 | symptom_53==1 | symptom_57==1)
gen symptom_combo_33=0
replace symptom_combo_33=1 if symptom_57==1 & (symptom_1==1 | symptom_2==1 |  symptom_3==1 | symptom_5==1 |  symptom_6==1 |  symptom_7==1 |  symptom_8==1 |  symptom_9==1 |  symptom_10==1 |  symptom_15==1 |  symptom_18==1 |   symptom_22==1 |    symptom_52==1 |  symptom_19==1| symptom_21==1 |  symptom_13==1 | symptom_20==1 | symptom_12==1 | symptom_23==1 | symptom_29==1 | symptom_30==1 | symptom_31==1 | symptom_32==1 | symptom_34==1 | symptom_36==1 | symptom_37==1 | symptom_38==1 | symptom_40==1 | symptom_48==1 | symptom_51==1 | symptom_53==1 | symptom_56==1)


global n 33
forval x=1/$n {
tab cancer_case symptom_combo_`x',chi2
clogit cancer_case symptom_combo_`x', group(setid) or
}


save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_combo", replace

// imputation OVERALL
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

	mi impute chained (mlogit)ethnic_2cat (ologit)town_quintile = cancer_case i.symptom_1 i.symptom_2 i.symptom_3 i.symptom_5 i.symptom_6 i.symptom_7 i.symptom_8 i.symptom_9 i.symptom_10  i.symptom_12 i.symptom_13 i.symptom_18 i.symptom_19 i.symptom_21 i.symptom_22 i.symptom_23 i.symptom_27 i.symptom_29 i.symptom_30 i.symptom_31 i.symptom_36 i.symptom_37 i.symptom_38 i.symptom_40 i.symptom_47 i.symptom_48 i.symptom_49 i.symptom_50 i.symptom_51 i.symptom_52 i.symptom_53, rseed(1234) dots add(50) augment force




timer off 1 
timer list 

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_imputed_v2_Dec_23", replace

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_imputed_v2_Dec_23", clear

global n 27

forval x=1/$n {
	tab symptom_`x' cancer_case 
}

global n 58



forval x=29/$n {
	tab symptom_`x' cancer_case 
}


mi estimate, or level(95): clogit cancer_case symptom_1 symptom_2  symptom_3  symptom_5 symptom_6 symptom_7 symptom_8 symptom_9 symptom_10 symptom_13  symptom_18 symptom_19 symptom_21 symptom_22 symptom_23 symptom_29 symptom_30 symptom_31 symptom_32  symptom_36 symptom_37 symptom_38 symptom_40 symptom_48 symptom_51 symptom_52 symptom_53 symptom_56 symptom_57 i.town_quint i.ethnic_2cat, group(setid) or



parmest, list(,) saving ("P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_multivariate_results_imputed", replace) eform label for(estimate min95 max95)





 use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_multivariate_results_imputed.dta", clear
 gen log_OR=log(estimate)
 gen log_min=log(min95)
 gen log_max=log(max95)
 format PPV %3.2f
 format estimate min95 max95 log_OR log_min log_max %12.1f

gen group=0 
replace group=1 if parm=="Organomegaly" | parm=="Limb pain" | parm=="Joint Pain" | parm=="Abnormal skin lesion" | parm=="Squint" | parm=="Weight loss" | parm=="Feels unwell" | parm=="Torticollis" | parm=="Hemiparesis" | parm=="Testicular Swelling" | parm=="Limp" | parm=="Dizziness " | parm=="Pruritus" | parm=="Haematuria" | parm=="Chest pain" 
replace group=2 if parm=="Townsend Quintile 2" | parm=="Townsend Quintile 3" |parm=="Townsend Quintile 4" | parm=="Townsend Quintile 5" | parm=="Non-White ethnic group"
label define grouplabels 0 "Already Known" 1 "New Association" 2"", replace 
label values group grouplabels
tab group, m
admetan log_OR log_min log_max, label(namevar=parm) nowt nooverall nosubgroup eform effect(Odds Ratio) rcols(PPV CI OR_early) by(group) forestplot(hetstat(p) leftj) saving(defne_all) 

use defne_all, clear 
label var _LABELS `"`"{bf:Symptoms}"'"'
replace _LABELS= `"{bf:"'+ _LABELS + `"}"' if _USE==0
label variable PPV "PPV(%)"
label variable CI "95% CI"
label variable OR_early "Odds Ratio (95%CI) (41d before diagnosis excluded)"

forestplot, useopts nostats nobox nowt rcols(_EFFECT PPV CI OR_early)



use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_imputed_v2", clear 
keep if agediag_2==1



	mi estimate, or level(95): clogit cancer_case symptom_1 symptom_2  symptom_3  symptom_5 symptom_6 symptom_7 symptom_8 symptom_9 symptom_10 symptom_13  symptom_18 symptom_19 symptom_20 symptom_21 symptom_22 symptom_23 symptom_29 symptom_30 symptom_31 symptom_32 symptom_34 symptom_36 symptom_37 symptom_38 symptom_40 symptom_48 symptom_51 symptom_52 symptom_53 symptom_56 symptom_57 i.town_quint i.ethnic_2cat, group(setid) or

 
 parmest, list(,) saving ("P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_multivariate_results_imputed_child", replace) eform label for(estimate min95 max95)

 
 
 use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_multivariate_results_imputed_child.dta", clear
 gen log_OR=log(estimate)
 gen log_min=log(min95)
 gen log_max=log(max95)
format PPV %3.2f
 format estimate min95 max95 log_OR log_min log_max %12.1f
 sort estimate in 1/25
 gen group=0 
replace group=1 if parm=="Organomegaly" | parm=="Limb pain" | parm=="Joint pain" | parm=="Abnormal skin lesion" | parm=="Squint " | parm=="Feels unwell" | parm=="Torticollis " | parm=="Hemiparesis" | parm=="Testicular swelling" | parm=="Limp" | parm=="Dizziness" | parm=="Haematuria " | parm=="Squint"
replace group=2 if parm=="Townsend Quintile 2" | parm=="Townsend Quintile 3" |parm=="Townsend Quintile 4" | parm=="Townsend Quintile 5" | parm=="Non-White ethnic group"
label define grouplabels 0 "Already Known" 1 "New Association" 2"", replace 
label values group grouplabels
tab group, m
admetan log_OR log_min log_max, label(namevar=parm) nowt nooverall nosubgroup eform effect(Odds Ratio) rcols(PPV CI OR_early) by(group) forestplot(hetstat(p) leftj) saving(defne_child_all) 


use defne_child_all, clear 
label var _LABELS `"`"{bf:Symptoms}"'"'
replace _LABELS= `"{bf:"'+ _LABELS + `"}"' if _USE==0
label variable PPV "PPV(%)"
label variable CI "95% CI"
label variable OR_early "Odds Ratio (95%CI) (38d before diagnosis excluded)"
forestplot, useopts nostats nobox nowt rcols(_EFFECT PPV CI)



use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_imputed_v2", clear 

keep if agediag_2==2


global n 27

forval x=1/$n {
	tab symptom_`x' cancer_case 
}

global n 58



forval x=29/$n {
	tab symptom_`x' cancer_case 
}


mi estimate, or level(95): clogit cancer_case symptom_1 symptom_2  symptom_3  symptom_5  symptom_10  symptom_18 symptom_19 symptom_20 symptom_21 symptom_22 symptom_23 symptom_29 symptom_30 symptom_31 symptom_32  symptom_36 symptom_40 symptom_48 symptom_51 symptom_52 symptom_53 symptom_56  i.town_quint i.ethnic_2cat, group(setid) or
 parmest, list(,) saving ("P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_multivariate_results_imputed_TYA", replace) eform label for(estimate min95 max95)

 

 
 use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_master_multivariate_results_imputed_TYA", clear

 gen log_OR=log(estimate)
 gen log_min=log(min95)
 gen log_max=log(max95)
format PPV %3.2f
 format estimate min95 max95 log_OR log_min log_max %12.1f

  gen group=0 
replace group=1 if parm=="Cough" | parm=="Limb pain" | parm=="Breathlessness" | parm=="Visual acuity problems" | parm=="constipation" | parm=="Weight loss" | parm=="Feels unwell" | parm=="Torticollis" | parm=="Hemiparesis" | parm=="Testicular swelling" | parm=="Limp" | parm=="Dizziness " | parm=="Pruritus" | parm=="Haematuria" | parm=="Chest pain" 
replace group=2 if parm=="Townsend Quintile 2" | parm=="Townsend Quintile 3" |parm=="Townsend Quintile 4" | parm=="Townsend Quintile 5" | parm=="Non-White ethnic group"
label define grouplabels 0 "Already Known" 1 "New Association" 2"", replace 
label values group grouplabels
tab group, m
admetan log_OR log_min log_max, label(namevar=parm) nowt nooverall nosubgroup eform effect(Odds Ratio) rcols(PPV CI OR_early) by(group) forestplot(hetstat(p) leftj) saving(defne_all_tya3) 

use defne_all_tya2, clear 
label var _LABELS `"`"{bf:Symptoms}"'"'
replace _LABELS= `"{bf:"'+ _LABELS + `"}"' if _USE==0
label variable PPV "PPV(%)"
label variable CI "95% CI"
label variable OR_early "Odds Ratio (95%CI) (44d before diagnosis excluded)"

forestplot, useopts nostats nobox nowt rcols(_EFFECT PPV CI OR_early)



// imputation for part 2 - early multivariate analysis


use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_early_all_child", clear

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


mi impute chained (mlogit)ethnic_2cat (ologit)town_quintile =  i.symptom_1 i.symptom_2  i.symptom_3  i.symptom_5 i.symptom_6  i.symptom_8 i.symptom_9 i.symptom_10 i.symptom_13   i.symptom_18 i.symptom_19 i.symptom_21 i.symptom_22 i.symptom_23 i.symptom_29 i.symptom_30 i.symptom_31 i.symptom_32 i.symptom_36 i.symptom_37 i.symptom_38 i.symptom_40 i.symptom_48 i.symptom_51 i.symptom_52 i.symptom_53 i.symptom_56 i.symptom_57, rseed(2526) dots add(10) augment	




timer off 1 
timer list 

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_imputed_early_child", replace

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_imputed_early_child", clear



mi estimate, or level(95): clogit cancer_case symptom_2  symptom_5 symptom_6 symptom_10 symptom_13  symptom_18  symptom_21 symptom_22 symptom_23 symptom_29 symptom_30 symptom_32   symptom_37 symptom_38 symptom_48 symptom_51  symptom_53 symptom_56 symptom_57 i.town_quint i.ethnic_2cat, group(setid) or
	
 parmest, list(,) saving ("C:\Users\Defne Saatci.QRESEARCH\Downloads\Data\OX94_casecontrol_all_early_results_imputed_all", replace) eform label for(estimate min95 max95)
 
 use "C:\Users\Defne Saatci.QRESEARCH\Downloads\Data\OX94_casecontrol_all_early_results_imputed_all", clear
 gen log_OR=log(estimate)
 gen log_min=log(min95)
 gen log_max=log(max95)
format PPV %3.2f
 format estimate min95 max95 log_OR log_min log_max %12.1f
 label variable parm "Symptoms"
 label variable PPV "PPV(%)"
 label variable CI "95% CI"
metan log_OR log_min log_max, label(namevar=parm) nowt nooverall nobox eform effect(Odds Ratio) lcols(parm) rcols(PPV CI) textsize(100)


//imputation for part 2 a -> child early symptoms 


use "C:\Users\Defne Saatci.QRESEARCH\Downloads\Data\OX94_casecontrol_early_all_child", clear
drop if agediag_2==2 

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


mi impute chained (mlogit)ethnic_2cat (ologit)town_quintile =   i.symptom_2  i.symptom_3  i.symptom_5 i.symptom_6 i.symptom_10 i.symptom_13  i.symptom_18 i.symptom_19 i.symptom_21 i.symptom_22 i.symptom_23 i.symptom_29 i.symptom_30  i.symptom_32 i.symptom_34 i.symptom_38 i.symptom_40 i.symptom_48 i.symptom_51 i.symptom_53 i.symptom_56 i.symptom_57, rseed(2526) dots add(10) augment	




timer off 1 
timer list 

save "C:\Users\Defne Saatci.QRESEARCH\Downloads\Data\OX94_casecontrol_all_imputed_early_child", replace

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_imputed_early_tya", clear

mi estimate, or level(95): clogit cancer_case symptom_2    symptom_5  symptom_10  symptom_18 symptom_19 symptom_21 symptom_22 symptom_29 symptom_30  symptom_32  symptom_40 symptom_48 symptom_56  i.town_quint i.ethnic_2cat, group(setid) or

 parmest, list(,) saving ("C:\Users\Defne Saatci.QRESEARCH\Downloads\Data\OX94_casecontrol_all_early_results_imputed_all_child", replace) eform label for(estimate min95 max95)
	

global n 60 

forval x=1/$n {
	tab symptom_`x' cancer_case 
}
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
 gen	ppv_`x'=a_tot_`x'/((a_tot_`x')+((1/0.015)*b_tot_`x'))

}

forval x=1/$n {
gen se_ppv_`x'=sqrt(ppv_`x'*(((1/0.015)*b_tot_`x')/((a_tot_`x')+((1/0.015)*b_tot_`x'))))/(a_tot_`x'+b_tot_`x')
}

preserve 
keep if patid==18332888
mi reshape long ppv_ se_ppv_, i(patid) j(event2)
save "C:\Users\Defne Saatci.QRESEARCH\Downloads\Data\OX94_casecontrol_long_all_early_child", replace
restore 

use "C:\Users\Defne Saatci.QRESEARCH\Downloads\Data\OX94_casecontrol_long_all_early_child", clear 




 
 use "C:\Users\Defne Saatci.QRESEARCH\Downloads\Data\OX94_casecontrol_all_early_results_imputed_all_child", clear
 gen log_OR=log(estimate)
 gen log_min=log(min95)
 gen log_max=log(max95)
format PPV %3.2f
 format estimate min95 max95 log_OR log_min log_max %12.1f
 label variable parm "Symptoms"
 label variable PPV "PPV(%)"
 label variable CI "95% CI"
metan log_OR log_min log_max, label(namevar=parm) nowt nooverall nobox eform effect(Odds Ratio) lcols(parm) rcols(PPV CI) textsize(100)



//imputation for part 2 a -> TYA early symptoms 


use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_early_all_tya", clear
drop if agediag_2==1

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


mi impute chained (mlogit)ethnic_2cat (ologit)town_quintile = i.symptom_2  i.symptom_3  i.symptom_5 i.symptom_6 i.symptom_10 i.symptom_13 i.symptom_18 i.symptom_19 i.symptom_21 i.symptom_22 i.symptom_23 i.symptom_29 i.symptom_30  i.symptom_32 i.symptom_34 i.symptom_48 i.symptom_51 i.symptom_53 i.symptom_56 i.symptom_57, rseed(2526) dots add(10) augment	




timer off 1 
timer list 

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_imputed_early_tya", replace


mi estimate, or level(95): clogit cancer_case symptom_2  symptom_3  symptom_5 symptom_6 symptom_10 symptom_13  symptom_18 symptom_19 symptom_21 symptom_22 symptom_23 symptom_29 symptom_30  symptom_32 symptom_34 symptom_38 symptom_40 symptom_48 symptom_51 symptom_53 symptom_56 symptom_57 i.town_quint i.ethnic_2cat, group(setid) or

 parmest, list(,) saving ("C:\Users\Defne Saatci.QRESEARCH\Downloads\Data\OX94_casecontrol_all_early_results_imputed_all_tya", replace) eform label for(estimate min95 max95)
	

	
use	"C:\Users\Defne Saatci.QRESEARCH\Downloads\Data\OX94_casecontrol_all_imputed_early_tya", clear



 
 use "C:\Users\Defne Saatci.QRESEARCH\Downloads\Data\OX94_casecontrol_all_early_results_imputed_all_tya", clear
 gen log_OR=log(estimate)
 gen log_min=log(min95)
 gen log_max=log(max95)
format PPV %3.2f
 format estimate min95 max95 log_OR log_min log_max %12.1f
 label variable parm "Symptoms"
 label variable PPV "PPV(%)"
 label variable CI "95% CI"
metan log_OR log_min log_max, label(namevar=parm) nowt nooverall nobox eform effect(Odds Ratio) lcols(parm) rcols(PPV CI) textsize(100)



// imputation for part 3 - symptom combinations 

use "C:\Users\Defne Saatci.QRESEARCH\Downloads\Data\OX94_casecontrol_all_combo", clear


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


	mi impute chained (mlogit)ethnic_2cat (ologit)town_quintile = i.symptom_combo_1 symptom_combo_2 symptom_combo_3 symptom_combo_4 symptom_combo_5 symptom_combo_6 symptom_combo_7 symptom_combo_8 symptom_combo_9 symptom_combo_10 symptom_combo_11 symptom_combo_12 symptom_combo_13 symptom_combo_14 symptom_combo_15 symptom_combo_16 symptom_combo_17 symptom_combo_18 symptom_combo_19 symptom_combo_20 symptom_combo_21 symptom_combo_22 symptom_combo_23 symptom_combo_24 symptom_combo_25 symptom_combo_26 symptom_combo_27 symptom_combo_28 symptom_combo_29 symptom_combo_30 symptom_combo_31 symptom_combo_32 symptom_combo_33 i.sha1, rseed(2526) dots add(10) augment	

	

timer off 1 
timer list 

save "C:\Users\Defne Saatci.QRESEARCH\Downloads\Data\OX94_casecontrol_all_imputed_combo", replace

//step 1: all ages 
use "C:\Users\Defne Saatci.QRESEARCH\Downloads\Data\OX94_casecontrol_all_imputed_combo", clear 


global n 33
forval x=1/$n {
	mi estimate, or level(95): clogit cancer_case symptom_combo_`x' i.town_quint i.ethnic_2cat, group(setid) or
}



parmest, list(,) saving ("C:\Users\Defne Saatci.QRESEARCH\Downloads\Data\OX94_casecontrol_combo_results_tya_imputed", replace) eform label for(estimate min95 max95)
global n 33

forval x=1/$n {
	tab symptom_combo_`x' cancer_case 
}
forval x=1/$n {
gen a_`x'=0
replace a_`x'=1 if cancer_case==1 & symptom_combo_`x'==1 
tab a_`x'
}


forval x=1/$n {
	gen b_`x'=0
replace b_`x'=1 if cancer_case==0 & symptom_combo_`x'==1 
tab b_`x'
}

forval x=1/$n {
gen a_tot_`x'=sum(a_`x')
}

forval x=1/$n {
gen b_tot_`x'=sum(b_`x')
}

forval x=1/$n {
 gen	ppv_`x'=a_tot_`x'/((a_tot_`x')+((1/0.015)*b_tot_`x'))

}

forval x=1/$n {
gen se_ppv_`x'=sqrt(ppv_`x'*(((1/0.015)*b_tot_`x')/((a_tot_`x')+((1/0.015)*b_tot_`x'))))/(a_tot_`x'+b_tot_`x')
}

preserve 
keep if patid==32432305
mi reshape long ppv_ se_ppv_, i(patid) j(event2)
save "C:\Users\Defne Saatci.QRESEARCH\Downloads\Data\OX94_casecontrol_combo_long_tya", replace
restore 

use "C:\Users\Defne Saatci.QRESEARCH\Downloads\Data\OX94_casecontrol_combo_long_tya", clear 


 use "C:\Users\Defne Saatci.QRESEARCH\Downloads\Data\OX94_casecontrol_all_combo_results_all_imputed.dta", clear


 gen log_OR=log(estimate)
 gen log_min=log(min95)
 gen log_max=log(max95)
format PPV %3.2f
 format estimate min95 max95 log_OR log_min log_max %12.1f
 label variable parm "Symptoms"
 label variable PPV "PPV(%)"
 label variable CI "95% CI"
metan log_OR log_min log_max, label(namevar=parm) nowt nooverall nobox eform effect(Odds Ratio) lcols(parm) rcols(PPV CI) textsize(160)



//step 2: children 



use "C:\Users\Defne Saatci.QRESEARCH\Downloads\Data\OX94_casecontrol_all_imputed_combo", clear 

keep if agediag_2==1 



global n 33
forval x=21/$n {
	mi estimate, or level(95): clogit cancer_case symptom_combo_`x' i.town_quint i.ethnic_2cat, group(setid) 
}



parmest, list(,) saving ("C:\Users\Defne Saatci.QRESEARCH\Downloads\Data\OX94_casecontrol_combo_results_child_imputed", replace) eform label for(estimate min95 max95)
global n 33

forval x=1/$n {
	tab symptom_combo_`x' cancer_case 
}

forval x=1/$n {
gen a_`x'=0
replace a_`x'=1 if cancer_case==1 & symptom_combo_`x'==1 
tab a_`x'
}


forval x=1/$n {
	gen b_`x'=0
replace b_`x'=1 if cancer_case==0 & symptom_combo_`x'==1 
tab b_`x'
}

forval x=1/$n {
gen a_tot_`x'=sum(a_`x')
}

forval x=1/$n {
gen b_tot_`x'=sum(b_`x')
}

forval x=1/$n {
 gen	ppv_`x'=a_tot_`x'/((a_tot_`x')+((1/0.015)*b_tot_`x'))

}

forval x=1/$n {
gen se_ppv_`x'=sqrt(ppv_`x'*(((1/0.015)*b_tot_`x')/((a_tot_`x')+((1/0.015)*b_tot_`x'))))/(a_tot_`x'+b_tot_`x')
}

preserve 
keep if patid==32432305
mi reshape long ppv_ se_ppv_, i(patid) j(event2)
save "C:\Users\Defne Saatci.QRESEARCH\Downloads\Data\OX94_casecontrol_combo_long_all_child", replace
restore 

use "C:\Users\Defne Saatci.QRESEARCH\Downloads\Data\OX94_casecontrol_combo_long_all_child", clear 

 use "C:\Users\Defne Saatci.QRESEARCH\Downloads\Data\OX94_casecontrol_combo_results_child_imputed", clear


 gen log_OR=log(estimate)
 gen log_min=log(min95)
 gen log_max=log(max95)
  format PPV %3.2f
 format estimate min95 max95 log_OR log_min log_max %12.1f
 label variable parm "Symptoms"
 label variable PPV "PPV(%)"
 label variable CI "95% CI"

metan log_OR log_min log_max, label(namevar=parm) nowt nooverall nobox eform effect(Odds Ratio) lcols(parm) rcols(PPV CI) textsize(200)

//step 3 - TYA 

use "C:\Users\Defne Saatci.QRESEARCH\Downloads\Data\OX94_casecontrol_all_imputed_combo", clear 

keep if agediag_2==2

global n 33
forval x=23/$n {
	mi estimate, or level(95): clogit cancer_case symptom_combo_`x' i.town_quint i.ethnic_2cat, group(setid) or
}
	parmest, list(,) saving ("C:\Users\Defne Saatci.QRESEARCH\Downloads\Data\OX94_casecontrol_combo_results_tya", replace) eform label for(estimate min95 max95)
 use "C:\Users\Defne Saatci.QRESEARCH\Downloads\Data\OX94_casecontrol_combo_results_tya.dta", clear


 gen log_OR=log(estimate)
 gen log_min=log(min95)
 gen log_max=log(max95)
 format PPV SE %12.4f
 format estimate min95 max95 log_OR log_min log_max %12.1f

metan log_OR log_min log_max, label(namevar=parm) nowt nooverall nobox eform effect(Odds Ratio) rcols(PPV SE) textsize(300)