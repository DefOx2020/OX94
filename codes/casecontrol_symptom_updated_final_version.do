use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_final_abdo", clear 

drop effectivedatetime_haematuria haematuria max_pres_haematuria_v2 pres_cat_haematuria_v2 effectivedatetime_organomegaly organomegaly max_pres_organo pres_cat_organo effectivedatetime_lympho lympho max_pres_lympho pres_cat_lympho effectivedatetime_fever_v2 fever_v2 max_pres_fever_v2 pres_cat_fever_v2 effectivedatetime_urti_v2 urti_v2 max_pres_urti_v2 pres_cat_urti_v2 effectivedatetime_limb_v2 limb_v2 max_pres_limb_v2 pres_cat_limb_v2 effectivedatetime_joint_v2 joint_v2 max_pres_joint_v2 pres_cat_joint_v2 effectivedatetime_limp_v2 limp_v2 max_pres_limp_v2 pres_cat_limp_v2 effectivedatetime_anpa_v2 anpa_v2 max_pres_anpa_v2 pres_cat_anpa_v2 effectivedatetime_tired_v2 tired_v2 max_pres_tired_v2 pres_cat_tired_v2 effectivedatetime_abdop_v2 abdop_v2 max_pres_abdop_v2 pres_cat_abdop_v2 effectivedatetime_anorexia_v2 anorexia_v2 max_pres_anorexia_v2 pres_cat_anorexia_v2 effectivedatetime_rash_v2 rash_v2 max_pres_rash_v2 pres_cat_rash_v2 effectivedatetime_skin_v2 skin_v2 max_pres_skin_v2 pres_cat_skin_v2 effectivedatetime_hnp_v2 hnp_v2 max_pres_hnp_v2 pres_cat_hnp_v2 effectivedatetime_hns_v2 hns_v2 max_pres_hns_v2 pres_cat_hns_v2 effectivedatetime_cl_v2 cl_v2 max_pres_cl_v2 pres_cat_cl_v2 effectivedatetime_resp resp max_pres_resp pres_cat_resp effectivedatetime_cp chest_pain max_pres_cp pres_cat_cp effectivedatetime_cough cough max_pres_cough pres_cat_cough effectivedatetime_breathless breathless max_pres_breathless pres_cat_breathless effectivedatetime_headache_v2 headache_v2 max_pres_headache_v2 pres_cat_headache_v2 effectivedatetime_bruise_v2 bruise_v2 max_pres_bruise_v2 pres_cat_bruise_v2 effectivedatetime_vomit_v2 vomit_v2 max_pres_vomit_v2 pres_cat_vomit_v2 effectivedatetime_hepatomegaly hepatomegaly_v2 max_pres_hepatomegaly_v2 pres_cat_hepatomegaly_v2 effectivedatetime_splenomegaly splenomegaly_v2 max_pres_splenomegaly_v2 pres_cat_splenomegaly_v2 effectivedatetime_hsm hepatosplenomegaly_v2 max_pres_hepatosplenomegaly_v2 pres_cat_hepatosplenomegaly_v2 effectivedatetime_abdomass abdomass_v2 max_pres_abdomass_v2 pres_cat_abdomass_v2 effectivedatetime_lump lump max_pres_lump pres_cat_lump effectivedatetime_hn_lump hn_lump max_pres_hn_lump pres_cat_hn_lump effectivedatetime_other_lump other_lump max_pres_other_lump pres_cat_other_lump effectivedatetime_wl wl_v2 max_pres_wl_v2 pres_cat_wl_v2 effectivedatetime_pruritus pruritus_v2 max_pres_pruritus_v2 pres_cat_pruritus_v2 effectivedatetime_urinary urinary max_pres_urinary_v2 pres_cat_urinary_v2 effectivedatetime_constipation constipation max_pres_constipation_v2 pres_cat_constipation_v2 effectivedatetime_pap pap_v2 max_pres_pap_v2 pres_cat_pap_v2 effectivedatetime_macro macro_v2 max_pres_macro_v2 pres_cat_macro_v2 effectivedatetime_hemi hemi_v2 max_pres_hemi_v2 pres_cat_hemi_v2 effectivedatetime_hemipa hemipa_v2 max_pres_hemipa_v2 pres_cat_hemipa_v2 effectivedatetime_tort tort_v2 max_pres_tort_v2 pres_cat_tort_v2 effectivedatetime_squint squint_v2 max_pres_squint_v2 pres_cat_squint_v2 effectivedatetime_eyem eye max_pres_eyem_v2 pres_cat_eyem_v2 effectivedatetime_acuity acuity max_pres_acuity_v2 pres_cat_acuity_v2 effectivedatetime_diplopia diplopia max_pres_diplopia_v2 pres_cat_diplopia_v2 effectivedatetime_exopthalmos exopthalmos max_pres_exopthalmos_v2 pres_cat_exopthalmos_v2 effectivedatetime_behaviour behaviour max_pres_behaviour_v2 pres_cat_behaviour_v2 effectivedatetime_irritability irritability max_pres_irritability_v2 pres_cat_irritability_v2 effectivedatetime_delay delay max_pres_delay_v2 pres_cat_delay_v2 effectivedatetime_voice voice max_pres_voice_v2 pres_cat_voice_v2 effectivedatetime_cranial cranial max_pres_cranial_v2 pres_cat_cranial_v2 effectivedatetime_seizure seizure max_pres_seizure_v2 pres_cat_seizure_v2 effectivedatetime_puberty puberty max_pres_puberty_v2 pres_cat_puberty_v2 effectivedatetime_gait gait max_pres_gait_v2 pres_cat_gait_v2 effectivedatetime_unwell unwell balance dizz syncope testicular_p testicular_s diarrhoea mood effectivedatetime_balance effectivedatetime_testicular_p knee_p effectivedatetime_testicular_s effectivedatetime_dizz effectivedatetime_syncope effectivedatetime_mood effectivedatetime_diarrhoea effectivedatetime_knee_p

// organomegaly 
global n 60
forval x=1/$n {
qui gen time_gap_organomegaly`x'=(index_date- effectivedatetime_organomegaly`x')

}

global n 60
forval x=1/$n {
qui replace organomegaly`x'=. if (time_gap_organomegaly`x'<0 | time_gap_organomegaly`x'>182)
qui replace effectivedatetime_organomegaly`x'=. if (time_gap_organomegaly`x'<0 | time_gap_organomegaly`x'>182)
qui replace time_gap_organomegaly`x'=. if (time_gap_organomegaly`x'<0 | time_gap_organomegaly`x'>182)
}


egen organomegalyr=rownonmiss(organomegaly1 organomegaly2 organomegaly3 organomegaly4 organomegaly5 organomegaly6 organomegaly7 organomegaly8 organomegaly9 organomegaly10 organomegaly11 organomegaly12 organomegaly13 organomegaly14 organomegaly15 organomegaly16 organomegaly17 organomegaly18 organomegaly19 organomegaly20 organomegaly21 organomegaly22 organomegaly23 organomegaly24 organomegaly25 organomegaly26 organomegaly27 organomegaly28 organomegaly29 organomegaly30 organomegaly31 organomegaly32 organomegaly33 organomegaly34 organomegaly35 organomegaly36 organomegaly37 organomegaly38 organomegaly39 organomegaly40 organomegaly41 organomegaly42 organomegaly43 organomegaly44 organomegaly45 organomegaly46 organomegaly47 organomegaly48 organomegaly49 organomegaly50 organomegaly51 organomegaly52 organomegaly53 organomegaly54 organomegaly55 organomegaly56 organomegaly57 organomegaly58 organomegaly59 organomegaly60)

gen time_gap_organomegaly_final=max(time_gap_organomegaly1, time_gap_organomegaly2, time_gap_organomegaly3, time_gap_organomegaly4, time_gap_organomegaly5, time_gap_organomegaly6, time_gap_organomegaly7, time_gap_organomegaly8, time_gap_organomegaly9, time_gap_organomegaly10,time_gap_organomegaly11,time_gap_organomegaly12,time_gap_organomegaly13,time_gap_organomegaly14,time_gap_organomegaly15,time_gap_organomegaly16,time_gap_organomegaly17,time_gap_organomegaly18,time_gap_organomegaly19,time_gap_organomegaly20,time_gap_organomegaly21,time_gap_organomegaly22,time_gap_organomegaly23,time_gap_organomegaly24, time_gap_organomegaly25, time_gap_organomegaly26, time_gap_organomegaly27, time_gap_organomegaly28, time_gap_organomegaly29, time_gap_organomegaly30, time_gap_organomegaly31,time_gap_organomegaly32, time_gap_organomegaly33,time_gap_organomegaly34, time_gap_organomegaly35,time_gap_organomegaly36, time_gap_organomegaly37,time_gap_organomegaly38, time_gap_organomegaly39, time_gap_organomegaly40, time_gap_organomegaly41, time_gap_organomegaly42, time_gap_organomegaly43, time_gap_organomegaly44, time_gap_organomegaly45, time_gap_organomegaly46, time_gap_organomegaly47, time_gap_organomegaly48, time_gap_organomegaly49, time_gap_organomegaly50,time_gap_organomegaly51,time_gap_organomegaly52,time_gap_organomegaly53,time_gap_organomegaly54,time_gap_organomegaly55,time_gap_organomegaly56,time_gap_organomegaly57,time_gap_organomegaly58,time_gap_organomegaly59,time_gap_organomegaly60)

tab organomegalyr
gen organomegalyr_final=0 
replace organomegalyr_final=1 if organomegalyr>1

gen organomegalyf=0
replace organomegalyf=1 if time_gap_organomegaly_final!=.

global n 60
forval x=1/$n {
drop time_gap_organomegaly`x' organomegaly`x' effectivedatetime_organomegaly`x'
}



//2 lympho


global n 56
forval x=1/$n {
qui gen time_gap_lympho`x'=(index_date- effectivedatetime_lympho`x')

}

global n 56
forval x=1/$n {
qui replace lympho`x'=. if (time_gap_lympho`x'<0 | time_gap_lympho`x'>182)
qui replace effectivedatetime_lympho`x'=. if (time_gap_lympho`x'<0 | time_gap_lympho`x'>182)
qui replace time_gap_lympho`x'=. if (time_gap_lympho`x'<0 | time_gap_lympho`x'>182)
}

egen lymphor=rownonmiss(lympho1  lympho2  lympho3  lympho4  lympho5  lympho6  lympho7  lympho8  lympho9  lympho10 lympho11 lympho12 lympho13 lympho14 lympho15 lympho16 lympho17 lympho18 lympho19 lympho20 lympho21 lympho22 lympho23 lympho24  lympho25  lympho26  lympho27  lympho28  lympho29  lympho30  lympho31 lympho32  lympho33 lympho34  lympho35 lympho36  lympho37 lympho38  lympho39  lympho40  lympho41  lympho42  lympho43  lympho44  lympho45  lympho46  lympho47  lympho48  lympho49  lympho50 lympho51 lympho52 lympho53 lympho54 lympho55 lympho56)

gen lymphor_final=0 
replace lymphor_final=1 if lymphor>1 

gen time_gap_lympho_final=max(time_gap_lympho1, time_gap_lympho2, time_gap_lympho3, time_gap_lympho4, time_gap_lympho5, time_gap_lympho6, time_gap_lympho7, time_gap_lympho8, time_gap_lympho9, time_gap_lympho10,time_gap_lympho11,time_gap_lympho12,time_gap_lympho13,time_gap_lympho14,time_gap_lympho15,time_gap_lympho16,time_gap_lympho17,time_gap_lympho18,time_gap_lympho19,time_gap_lympho20,time_gap_lympho21,time_gap_lympho22,time_gap_lympho23,time_gap_lympho24, time_gap_lympho25, time_gap_lympho26, time_gap_lympho27, time_gap_lympho28, time_gap_lympho29, time_gap_lympho30, time_gap_lympho31,time_gap_lympho32, time_gap_lympho33,time_gap_lympho34, time_gap_lympho35,time_gap_lympho36, time_gap_lympho37,time_gap_lympho38, time_gap_lympho39, time_gap_lympho40, time_gap_lympho41, time_gap_lympho42, time_gap_lympho43, time_gap_lympho44, time_gap_lympho45, time_gap_lympho46, time_gap_lympho47, time_gap_lympho48, time_gap_lympho49, time_gap_lympho50,time_gap_lympho51,time_gap_lympho52,time_gap_lympho53,time_gap_lympho54,time_gap_lympho55,time_gap_lympho56)

gen lymphof=0
replace lymphof=1 if time_gap_lympho_final!=.

global n 56
forval x=1/$n {
drop time_gap_lympho`x' lympho`x' effectivedatetime_lympho`x'
}


//3 fever_v2


global n 50
forval x=1/$n {
qui gen time_gap_fever_v2`x'=(index_date- effectivedatetime_fever_v2`x')

}

global n 50
forval x=1/$n {
qui replace fever_v2`x'=. if (time_gap_fever_v2`x'<0 | time_gap_fever_v2`x'>182)
qui replace effectivedatetime_fever_v2`x'=. if (time_gap_fever_v2`x'<0 | time_gap_fever_v2`x'>182)
qui replace time_gap_fever_v2`x'=. if (time_gap_fever_v2`x'<0 | time_gap_fever_v2`x'>182)
}

egen feverr=rownonmiss( fever_v21    fever_v22    fever_v23    fever_v24    fever_v25    fever_v26    fever_v27    fever_v28    fever_v29    fever_v210   fever_v211   fever_v212   fever_v213   fever_v214   fever_v215   fever_v216   fever_v217   fever_v218   fever_v219   fever_v220   fever_v221   fever_v222   fever_v223   fever_v224    fever_v225    fever_v226    fever_v227    fever_v228    fever_v229    fever_v230    fever_v231   fever_v232    fever_v233   fever_v234    fever_v235   fever_v236    fever_v237   fever_v238    fever_v239    fever_v240    fever_v241    fever_v242    fever_v243    fever_v244    fever_v245    fever_v246    fever_v247    fever_v248    fever_v249    fever_v250)

gen feverr_final=0 
replace feverr_final=1 if feverr>1

gen time_gap_fever_v2_final=max(time_gap_fever_v21, time_gap_fever_v22, time_gap_fever_v23, time_gap_fever_v24, time_gap_fever_v25, time_gap_fever_v26, time_gap_fever_v27, time_gap_fever_v28, time_gap_fever_v29, time_gap_fever_v210,time_gap_fever_v211,time_gap_fever_v212,time_gap_fever_v213,time_gap_fever_v214,time_gap_fever_v215,time_gap_fever_v216,time_gap_fever_v217,time_gap_fever_v218,time_gap_fever_v219,time_gap_fever_v220,time_gap_fever_v221,time_gap_fever_v222,time_gap_fever_v223,time_gap_fever_v224, time_gap_fever_v225, time_gap_fever_v226, time_gap_fever_v227, time_gap_fever_v228, time_gap_fever_v229, time_gap_fever_v230, time_gap_fever_v231,time_gap_fever_v232, time_gap_fever_v233,time_gap_fever_v234, time_gap_fever_v235,time_gap_fever_v236, time_gap_fever_v237,time_gap_fever_v238, time_gap_fever_v239, time_gap_fever_v240, time_gap_fever_v241, time_gap_fever_v242, time_gap_fever_v243, time_gap_fever_v244, time_gap_fever_v245, time_gap_fever_v246, time_gap_fever_v247, time_gap_fever_v248, time_gap_fever_v249, time_gap_fever_v250)

gen fever_v2f=0
replace fever_v2f=1 if time_gap_fever_v2_final!=.

global n 50
forval x=1/$n {
drop time_gap_fever_v2`x' fever_v2`x' effectivedatetime_fever_v2`x'
}


//4 urti 


global n 50
forval x=1/$n {
qui gen time_gap_urti_v2`x'=(index_date- effectivedatetime_urti_v2`x')

}

global n 50
forval x=1/$n {
qui replace urti_v2`x'=. if (time_gap_urti_v2`x'<0 | time_gap_urti_v2`x'>182)
qui replace effectivedatetime_urti_v2`x'=. if (time_gap_urti_v2`x'<0 | time_gap_urti_v2`x'>182)
qui replace time_gap_urti_v2`x'=. if (time_gap_urti_v2`x'<0 | time_gap_urti_v2`x'>182)
}

egen urtir=rownonmiss(  urti_v21   urti_v22   urti_v23   urti_v24   urti_v25   urti_v26   urti_v27   urti_v28   urti_v29   urti_v210  urti_v211  urti_v212  urti_v213  urti_v214  urti_v215  urti_v216  urti_v217  urti_v218  urti_v219  urti_v220  urti_v221  urti_v222  urti_v223  urti_v224   urti_v225   urti_v226   urti_v227   urti_v228   urti_v229   urti_v230   urti_v231  urti_v232   urti_v233  urti_v234   urti_v235  urti_v236   urti_v237  urti_v238   urti_v239   urti_v240   urti_v241   urti_v242   urti_v243   urti_v244   urti_v245   urti_v246   urti_v247   urti_v248   urti_v249   urti_v250)

gen urtir_final=0
replace urtir_final=1 if urtir>1


gen time_gap_urti_v2_final=max(time_gap_urti_v21, time_gap_urti_v22, time_gap_urti_v23, time_gap_urti_v24, time_gap_urti_v25, time_gap_urti_v26, time_gap_urti_v27, time_gap_urti_v28, time_gap_urti_v29, time_gap_urti_v210,time_gap_urti_v211,time_gap_urti_v212,time_gap_urti_v213,time_gap_urti_v214,time_gap_urti_v215,time_gap_urti_v216,time_gap_urti_v217,time_gap_urti_v218,time_gap_urti_v219,time_gap_urti_v220,time_gap_urti_v221,time_gap_urti_v222,time_gap_urti_v223,time_gap_urti_v224, time_gap_urti_v225, time_gap_urti_v226, time_gap_urti_v227, time_gap_urti_v228, time_gap_urti_v229, time_gap_urti_v230, time_gap_urti_v231,time_gap_urti_v232, time_gap_urti_v233,time_gap_urti_v234, time_gap_urti_v235,time_gap_urti_v236, time_gap_urti_v237,time_gap_urti_v238, time_gap_urti_v239, time_gap_urti_v240, time_gap_urti_v241, time_gap_urti_v242, time_gap_urti_v243, time_gap_urti_v244, time_gap_urti_v245, time_gap_urti_v246, time_gap_urti_v247, time_gap_urti_v248, time_gap_urti_v249, time_gap_urti_v250)

gen urti_v2f=0
replace urti_v2f=1 if time_gap_urti_v2_final!=.

global n 50
forval x=1/$n {
drop time_gap_urti_v2`x' urti_v2`x' effectivedatetime_urti_v2`x'
}


//5 limb pain 


global n 125
forval x=1/$n {
qui gen time_gap_limb_v2`x'=(index_date- effectivedatetime_limb_v2`x')

}

global n 125
forval x=1/$n {
qui replace limb_v2`x'=. if (time_gap_limb_v2`x'<0 | time_gap_limb_v2`x'>182)
qui replace effectivedatetime_limb_v2`x'=. if (time_gap_limb_v2`x'<0 | time_gap_limb_v2`x'>182)
qui replace time_gap_limb_v2`x'=. if (time_gap_limb_v2`x'<0 | time_gap_limb_v2`x'>182)
}

egen limbr=rownonmiss(limb_v21  limb_v22  limb_v23  limb_v24  limb_v25  limb_v26  limb_v27  limb_v28  limb_v29  limb_v210 limb_v211 limb_v212 limb_v213 limb_v214 limb_v215 limb_v216 limb_v217 limb_v218 limb_v219 limb_v220 limb_v221 limb_v222 limb_v223 limb_v224  limb_v225  limb_v226  limb_v227  limb_v228  limb_v229  limb_v230  limb_v231 limb_v232  limb_v233 limb_v234  limb_v235 limb_v236  limb_v237 limb_v238  limb_v239  limb_v240  limb_v241  limb_v242  limb_v243  limb_v244  limb_v245  limb_v246  limb_v247  limb_v248  limb_v249  limb_v250  limb_v251  limb_v252  limb_v253  limb_v254  limb_v255  limb_v256  limb_v257  limb_v258  limb_v259  limb_v260 limb_v261 limb_v262 limb_v263 limb_v264 limb_v265 limb_v266 limb_v267 limb_v268 limb_v269 limb_v270 limb_v271 limb_v272 limb_v273 limb_v274  limb_v275  limb_v276  limb_v277  limb_v278  limb_v279  limb_v280  limb_v281 limb_v282  limb_v283 limb_v284  limb_v285 limb_v286  limb_v287 limb_v288  limb_v289  limb_v290  limb_v291  limb_v292  limb_v293  limb_v299  limb_v295  limb_v296  limb_v297  limb_v298  limb_v299  limb_v2100  limb_v2101  limb_v2102  limb_v2103  limb_v2104  limb_v2105  limb_v2106  limb_v2107  limb_v2108  limb_v2109  limb_v2110 limb_v2111 limb_v2112 limb_v2113 limb_v2114 limb_v2115 limb_v2116 limb_v2117 limb_v2118 limb_v2119 limb_v2120 limb_v2121 limb_v2122 limb_v2123 limb_v2124  limb_v2125)

gen limbr_final=0
replace limbr_final=1 if limbr>1

gen time_gap_limb_v2_final=max(time_gap_limb_v21, time_gap_limb_v22, time_gap_limb_v23, time_gap_limb_v24, time_gap_limb_v25, time_gap_limb_v26, time_gap_limb_v27, time_gap_limb_v28, time_gap_limb_v29, time_gap_limb_v210,time_gap_limb_v211,time_gap_limb_v212,time_gap_limb_v213,time_gap_limb_v214,time_gap_limb_v215,time_gap_limb_v216,time_gap_limb_v217,time_gap_limb_v218,time_gap_limb_v219,time_gap_limb_v220,time_gap_limb_v221,time_gap_limb_v222,time_gap_limb_v223,time_gap_limb_v224, time_gap_limb_v225, time_gap_limb_v226, time_gap_limb_v227, time_gap_limb_v228, time_gap_limb_v229, time_gap_limb_v230, time_gap_limb_v231,time_gap_limb_v232, time_gap_limb_v233,time_gap_limb_v234, time_gap_limb_v235,time_gap_limb_v236, time_gap_limb_v237,time_gap_limb_v238, time_gap_limb_v239, time_gap_limb_v240, time_gap_limb_v241, time_gap_limb_v242, time_gap_limb_v243, time_gap_limb_v244, time_gap_limb_v245, time_gap_limb_v246, time_gap_limb_v247, time_gap_limb_v248, time_gap_limb_v249, time_gap_limb_v250, time_gap_limb_v251, time_gap_limb_v252, time_gap_limb_v253, time_gap_limb_v254, time_gap_limb_v255, time_gap_limb_v256, time_gap_limb_v257, time_gap_limb_v258, time_gap_limb_v259, time_gap_limb_v260,time_gap_limb_v261,time_gap_limb_v262,time_gap_limb_v263,time_gap_limb_v264,time_gap_limb_v265,time_gap_limb_v266,time_gap_limb_v267,time_gap_limb_v268,time_gap_limb_v269,time_gap_limb_v270,time_gap_limb_v271,time_gap_limb_v272,time_gap_limb_v273,time_gap_limb_v274, time_gap_limb_v275, time_gap_limb_v276, time_gap_limb_v277, time_gap_limb_v278, time_gap_limb_v279, time_gap_limb_v280, time_gap_limb_v281,time_gap_limb_v282, time_gap_limb_v283,time_gap_limb_v284, time_gap_limb_v285,time_gap_limb_v286, time_gap_limb_v287,time_gap_limb_v288, time_gap_limb_v289, time_gap_limb_v290, time_gap_limb_v291, time_gap_limb_v292, time_gap_limb_v293, time_gap_limb_v299, time_gap_limb_v295, time_gap_limb_v296, time_gap_limb_v297, time_gap_limb_v298, time_gap_limb_v299, time_gap_limb_v2100, time_gap_limb_v2101, time_gap_limb_v2102, time_gap_limb_v2103, time_gap_limb_v2104, time_gap_limb_v2105, time_gap_limb_v2106, time_gap_limb_v2107, time_gap_limb_v2108, time_gap_limb_v2109, time_gap_limb_v2110,time_gap_limb_v2111,time_gap_limb_v2112,time_gap_limb_v2113,time_gap_limb_v2114,time_gap_limb_v2115,time_gap_limb_v2116,time_gap_limb_v2117,time_gap_limb_v2118,time_gap_limb_v2119,time_gap_limb_v2120,time_gap_limb_v2121,time_gap_limb_v2122,time_gap_limb_v2123,time_gap_limb_v2124, time_gap_limb_v2125)

gen limb_v2f=0
replace limb_v2f=1 if time_gap_limb_v2_final!=.

global n 125
forval x=1/$n {
drop time_gap_limb_v2`x' limb_v2`x' effectivedatetime_limb_v2`x'
}

//5 joint pain 


global n 87
forval x=1/$n {
qui gen time_gap_joint_v2`x'=(index_date- effectivedatetime_joint_v2`x')

}

global n 87
forval x=1/$n {
qui replace joint_v2`x'=. if (time_gap_joint_v2`x'<0 | time_gap_joint_v2`x'>182)
qui replace effectivedatetime_joint_v2`x'=. if (time_gap_joint_v2`x'<0 | time_gap_joint_v2`x'>182)
qui replace time_gap_joint_v2`x'=. if (time_gap_joint_v2`x'<0 | time_gap_joint_v2`x'>182)
}

egen jointr=rownonmiss( joint_v21   joint_v22   joint_v23   joint_v24   joint_v25   joint_v26   joint_v27   joint_v28   joint_v29   joint_v210  joint_v211  joint_v212  joint_v213  joint_v214  joint_v215  joint_v216  joint_v217  joint_v218  joint_v219  joint_v220  joint_v221  joint_v222  joint_v223  joint_v224   joint_v225   joint_v226   joint_v227   joint_v228   joint_v229   joint_v230   joint_v231  joint_v232   joint_v233  joint_v234   joint_v235  joint_v236   joint_v237  joint_v238   joint_v239   joint_v240   joint_v241   joint_v242   joint_v243   joint_v244   joint_v245   joint_v246   joint_v247   joint_v248   joint_v249   joint_v250   joint_v251   joint_v252   joint_v253   joint_v254   joint_v255   joint_v256   joint_v257   joint_v258   joint_v259   joint_v260  joint_v261  joint_v262  joint_v263  joint_v264  joint_v265  joint_v266  joint_v267  joint_v268  joint_v269  joint_v270  joint_v271  joint_v272  joint_v273  joint_v274   joint_v275   joint_v276   joint_v277   joint_v278   joint_v279   joint_v280   joint_v281  joint_v282   joint_v283  joint_v284   joint_v285  joint_v286   joint_v287)

gen jointr_final=0 
replace jointr_final=1 if jointr>1


gen time_gap_joint_v2_final=max(time_gap_joint_v21, time_gap_joint_v22, time_gap_joint_v23, time_gap_joint_v24, time_gap_joint_v25, time_gap_joint_v26, time_gap_joint_v27, time_gap_joint_v28, time_gap_joint_v29, time_gap_joint_v210,time_gap_joint_v211,time_gap_joint_v212,time_gap_joint_v213,time_gap_joint_v214,time_gap_joint_v215,time_gap_joint_v216,time_gap_joint_v217,time_gap_joint_v218,time_gap_joint_v219,time_gap_joint_v220,time_gap_joint_v221,time_gap_joint_v222,time_gap_joint_v223,time_gap_joint_v224, time_gap_joint_v225, time_gap_joint_v226, time_gap_joint_v227, time_gap_joint_v228, time_gap_joint_v229, time_gap_joint_v230, time_gap_joint_v231,time_gap_joint_v232, time_gap_joint_v233,time_gap_joint_v234, time_gap_joint_v235,time_gap_joint_v236, time_gap_joint_v237,time_gap_joint_v238, time_gap_joint_v239, time_gap_joint_v240, time_gap_joint_v241, time_gap_joint_v242, time_gap_joint_v243, time_gap_joint_v244, time_gap_joint_v245, time_gap_joint_v246, time_gap_joint_v247, time_gap_joint_v248, time_gap_joint_v249, time_gap_joint_v250, time_gap_joint_v251, time_gap_joint_v252, time_gap_joint_v253, time_gap_joint_v254, time_gap_joint_v255, time_gap_joint_v256, time_gap_joint_v257, time_gap_joint_v258, time_gap_joint_v259, time_gap_joint_v260,time_gap_joint_v261,time_gap_joint_v262,time_gap_joint_v263,time_gap_joint_v264,time_gap_joint_v265,time_gap_joint_v266,time_gap_joint_v267,time_gap_joint_v268,time_gap_joint_v269,time_gap_joint_v270,time_gap_joint_v271,time_gap_joint_v272,time_gap_joint_v273,time_gap_joint_v274, time_gap_joint_v275, time_gap_joint_v276, time_gap_joint_v277, time_gap_joint_v278, time_gap_joint_v279, time_gap_joint_v280, time_gap_joint_v281,time_gap_joint_v282, time_gap_joint_v283,time_gap_joint_v284, time_gap_joint_v285,time_gap_joint_v286, time_gap_joint_v287)

gen joint_v2f=0
replace joint_v2f=1 if time_gap_joint_v2_final!=.

global n 87
forval x=1/$n {
drop time_gap_joint_v2`x' joint_v2`x' effectivedatetime_joint_v2`x'
}


//7 limp 


global n 39
forval x=1/$n {
qui gen time_gap_limp_v2`x'=(index_date- effectivedatetime_limp_v2`x')

}

global n 39
forval x=1/$n {
qui replace limp_v2`x'=. if (time_gap_limp_v2`x'<0 | time_gap_limp_v2`x'>182)
qui replace effectivedatetime_limp_v2`x'=. if (time_gap_limp_v2`x'<0 | time_gap_limp_v2`x'>182)
qui replace time_gap_limp_v2`x'=. if (time_gap_limp_v2`x'<0 | time_gap_limp_v2`x'>182)
}

egen limpr=rownonmiss( limp_v21   limp_v22   limp_v23   limp_v24   limp_v25   limp_v26   limp_v27   limp_v28   limp_v29   limp_v210  limp_v211  limp_v212  limp_v213  limp_v214  limp_v215  limp_v216  limp_v217  limp_v218  limp_v219  limp_v220  limp_v221  limp_v222  limp_v223  limp_v224   limp_v225   limp_v226   limp_v227   limp_v228   limp_v229   limp_v230   limp_v231  limp_v232   limp_v233  limp_v234   limp_v235  limp_v236   limp_v237  limp_v238   limp_v239)

gen limpr_final=0 
replace limpr_final=1 if limpr>1


gen time_gap_limp_v2_final=max(time_gap_limp_v21, time_gap_limp_v22, time_gap_limp_v23, time_gap_limp_v24, time_gap_limp_v25, time_gap_limp_v26, time_gap_limp_v27, time_gap_limp_v28, time_gap_limp_v29, time_gap_limp_v210,time_gap_limp_v211,time_gap_limp_v212,time_gap_limp_v213,time_gap_limp_v214,time_gap_limp_v215,time_gap_limp_v216,time_gap_limp_v217,time_gap_limp_v218,time_gap_limp_v219,time_gap_limp_v220,time_gap_limp_v221,time_gap_limp_v222,time_gap_limp_v223,time_gap_limp_v224, time_gap_limp_v225, time_gap_limp_v226, time_gap_limp_v227, time_gap_limp_v228, time_gap_limp_v229, time_gap_limp_v230, time_gap_limp_v231,time_gap_limp_v232, time_gap_limp_v233,time_gap_limp_v234, time_gap_limp_v235,time_gap_limp_v236, time_gap_limp_v237,time_gap_limp_v238, time_gap_limp_v239)

gen limp_v2f=0
replace limp_v2f=1 if time_gap_limp_v2_final!=.

global n 39 
forval x=1/$n {
drop time_gap_limp_v2`x' limp_v2`x' effectivedatetime_limp_v2`x'
}


//8 anpa 


global n 27
forval x=1/$n {
qui gen time_gap_anpa_v2`x'=(index_date- effectivedatetime_anpa_v2`x')

}

global n 27
forval x=1/$n {
qui replace anpa_v2`x'=. if (time_gap_anpa_v2`x'<0 | time_gap_anpa_v2`x'>182)
qui replace effectivedatetime_anpa_v2`x'=. if (time_gap_anpa_v2`x'<0 | time_gap_anpa_v2`x'>182)
qui replace time_gap_anpa_v2`x'=. if (time_gap_anpa_v2`x'<0 | time_gap_anpa_v2`x'>182)
}

egen anpar=rownonmiss( anpa_v21   anpa_v22   anpa_v23   anpa_v24   anpa_v25   anpa_v26   anpa_v27   anpa_v28   anpa_v29   anpa_v210  anpa_v211  anpa_v212  anpa_v213  anpa_v214  anpa_v215  anpa_v216  anpa_v217  anpa_v218  anpa_v219  anpa_v220  anpa_v221  anpa_v222  anpa_v223  anpa_v224   anpa_v225   anpa_v226   anpa_v227)

gen anpar_final=0
replace anpar_final=1 if anpar>1

gen time_gap_anpa_v2_final=max(time_gap_anpa_v21, time_gap_anpa_v22, time_gap_anpa_v23, time_gap_anpa_v24, time_gap_anpa_v25, time_gap_anpa_v26, time_gap_anpa_v27, time_gap_anpa_v28, time_gap_anpa_v29, time_gap_anpa_v210,time_gap_anpa_v211,time_gap_anpa_v212,time_gap_anpa_v213,time_gap_anpa_v214,time_gap_anpa_v215,time_gap_anpa_v216,time_gap_anpa_v217,time_gap_anpa_v218,time_gap_anpa_v219,time_gap_anpa_v220,time_gap_anpa_v221,time_gap_anpa_v222,time_gap_anpa_v223,time_gap_anpa_v224, time_gap_anpa_v225, time_gap_anpa_v226, time_gap_anpa_v227)

gen anpa_v2f=0
replace anpa_v2f=1 if time_gap_anpa_v2_final!=.

global n 27 
forval x=1/$n {
drop time_gap_anpa_v2`x' anpa_v2`x' effectivedatetime_anpa_v2`x'
}


//9 tired


global n 62
forval x=1/$n {
qui gen time_gap_tired_v2`x'=(index_date- effectivedatetime_tired_v2`x')

}

global n 62
forval x=1/$n {
qui replace tired_v2`x'=. if (time_gap_tired_v2`x'<0 | time_gap_tired_v2`x'>182)
qui replace effectivedatetime_tired_v2`x'=. if (time_gap_tired_v2`x'<0 | time_gap_tired_v2`x'>182)
qui replace time_gap_tired_v2`x'=. if (time_gap_tired_v2`x'<0 | time_gap_tired_v2`x'>182)
}

egen tiredr=rownonmiss( tired_v21   tired_v22   tired_v23   tired_v24   tired_v25   tired_v26   tired_v27   tired_v28   tired_v29   tired_v210  tired_v211  tired_v212  tired_v213  tired_v214  tired_v215  tired_v216  tired_v217  tired_v218  tired_v219  tired_v220  tired_v221  tired_v222  tired_v223  tired_v224   tired_v225   tired_v226   tired_v227   tired_v228   tired_v229   tired_v230   tired_v231  tired_v232   tired_v233  tired_v234   tired_v235  tired_v236   tired_v237  tired_v238   tired_v239   tired_v240   tired_v241   tired_v242   tired_v243   tired_v244   tired_v245   tired_v246   tired_v247   tired_v248   tired_v249   tired_v250   tired_v251   tired_v252   tired_v253   tired_v254   tired_v255   tired_v256   tired_v257   tired_v258   tired_v259   tired_v260  tired_v261  tired_v262)

gen tiredr_final=0
replace tiredr_final=1 if tiredr>1 

gen time_gap_tired_v2_final=max(time_gap_tired_v21, time_gap_tired_v22, time_gap_tired_v23, time_gap_tired_v24, time_gap_tired_v25, time_gap_tired_v26, time_gap_tired_v27, time_gap_tired_v28, time_gap_tired_v29, time_gap_tired_v210,time_gap_tired_v211,time_gap_tired_v212,time_gap_tired_v213,time_gap_tired_v214,time_gap_tired_v215,time_gap_tired_v216,time_gap_tired_v217,time_gap_tired_v218,time_gap_tired_v219,time_gap_tired_v220,time_gap_tired_v221,time_gap_tired_v222,time_gap_tired_v223,time_gap_tired_v224, time_gap_tired_v225, time_gap_tired_v226, time_gap_tired_v227, time_gap_tired_v228, time_gap_tired_v229, time_gap_tired_v230, time_gap_tired_v231,time_gap_tired_v232, time_gap_tired_v233,time_gap_tired_v234, time_gap_tired_v235,time_gap_tired_v236, time_gap_tired_v237,time_gap_tired_v238, time_gap_tired_v239, time_gap_tired_v240, time_gap_tired_v241, time_gap_tired_v242, time_gap_tired_v243, time_gap_tired_v244, time_gap_tired_v245, time_gap_tired_v246, time_gap_tired_v247, time_gap_tired_v248, time_gap_tired_v249, time_gap_tired_v250, time_gap_tired_v251, time_gap_tired_v252, time_gap_tired_v253, time_gap_tired_v254, time_gap_tired_v255, time_gap_tired_v256, time_gap_tired_v257, time_gap_tired_v258, time_gap_tired_v259, time_gap_tired_v260,time_gap_tired_v261,time_gap_tired_v262)

gen tired_v2f=0
replace tired_v2f=1 if time_gap_tired_v2_final!=.

global n 62
forval x=1/$n {
drop time_gap_tired_v2`x' tired_v2`x' effectivedatetime_tired_v2`x'
}


//10 abdo pain 


global n 236
forval x=1/$n {
qui gen time_gap_abdop_v2`x'=(index_date- effectivedatetime_abdop_v2`x')

}

global n 236
forval x=1/$n {
qui replace abdop_v2`x'=. if (time_gap_abdop_v2`x'<0 | time_gap_abdop_v2`x'>182)
qui replace effectivedatetime_abdop_v2`x'=. if (time_gap_abdop_v2`x'<0 | time_gap_abdop_v2`x'>182)
qui replace time_gap_abdop_v2`x'=. if (time_gap_abdop_v2`x'<0 | time_gap_abdop_v2`x'>182)
}

egen abdopr=rownonmiss( abdop_v21   abdop_v22   abdop_v23   abdop_v24   abdop_v25   abdop_v26   abdop_v27   abdop_v28   abdop_v29   abdop_v210  abdop_v211  abdop_v212  abdop_v213  abdop_v214  abdop_v215  abdop_v216  abdop_v217  abdop_v218  abdop_v219  abdop_v220  abdop_v221  abdop_v222  abdop_v223  abdop_v224   abdop_v225   abdop_v226   abdop_v227   abdop_v228   abdop_v229   abdop_v230   abdop_v231  abdop_v232   abdop_v233  abdop_v234   abdop_v235  abdop_v236   abdop_v237  abdop_v238   abdop_v239   abdop_v240   abdop_v241   abdop_v242   abdop_v243   abdop_v244   abdop_v245   abdop_v246   abdop_v247   abdop_v248   abdop_v249   abdop_v250   abdop_v251   abdop_v252   abdop_v253   abdop_v254   abdop_v255   abdop_v256   abdop_v257   abdop_v258   abdop_v259   abdop_v260  abdop_v261  abdop_v2236  abdop_v263  abdop_v264  abdop_v265  abdop_v266  abdop_v267  abdop_v268  abdop_v269  abdop_v270  abdop_v271  abdop_v272  abdop_v273  abdop_v274   abdop_v275   abdop_v276   abdop_v277   abdop_v278   abdop_v279   abdop_v280   abdop_v281  abdop_v282   abdop_v283  abdop_v284   abdop_v285  abdop_v286   abdop_v287  abdop_v288   abdop_v289   abdop_v290   abdop_v291   abdop_v292   abdop_v293   abdop_v299   abdop_v295   abdop_v296   abdop_v297   abdop_v298   abdop_v299   abdop_v2100   abdop_v2101   abdop_v2102   abdop_v2103   abdop_v2104   abdop_v2105   abdop_v2106   abdop_v2107   abdop_v2108   abdop_v2109   abdop_v2110  abdop_v2111  abdop_v2112  abdop_v2113  abdop_v2114  abdop_v2115  abdop_v2116  abdop_v2117  abdop_v2118  abdop_v2119  abdop_v2120  abdop_v2121  abdop_v2122  abdop_v2123  abdop_v2124   abdop_v2125    abdop_v2126   abdop_v2127   abdop_v2128   abdop_v2129   abdop_v2130   abdop_v2131  abdop_v2132   abdop_v2133  abdop_v2134   abdop_v2135  abdop_v2136   abdop_v2137  abdop_v2138   abdop_v2139   abdop_v2140   abdop_v2141   abdop_v2142   abdop_v2143   abdop_v2144   abdop_v2145   abdop_v2146   abdop_v2147   abdop_v2148   abdop_v2149   abdop_v2150   abdop_v2151   abdop_v2152   abdop_v2153   abdop_v2154   abdop_v2155   abdop_v2156   abdop_v2157   abdop_v2158   abdop_v2159   abdop_v2160  abdop_v2161  abdop_v2162  abdop_v2163  abdop_v2164  abdop_v2165  abdop_v2166  abdop_v2167  abdop_v2168  abdop_v2169  abdop_v2170  abdop_v2171  abdop_v2172  abdop_v2173  abdop_v2174   abdop_v2175   abdop_v2176   abdop_v2177   abdop_v2178   abdop_v2179   abdop_v2180   abdop_v2181  abdop_v2182   abdop_v2183  abdop_v2184   abdop_v2185  abdop_v2186   abdop_v2187  abdop_v2188   abdop_v2189   abdop_v2190   abdop_v2191   abdop_v2192   abdop_v2193   abdop_v2194   abdop_v2195   abdop_v2196   abdop_v2197   abdop_v2198   abdop_v2199   abdop_v2200   abdop_v2202   abdop_v2202   abdop_v2203   abdop_v2204   abdop_v2205   abdop_v2206   abdop_v2207   abdop_v2208   abdop_v2209   abdop_v2210  abdop_v2211  abdop_v2212  abdop_v2213  abdop_v2214  abdop_v2215  abdop_v2216  abdop_v2217  abdop_v2218  abdop_v2219  abdop_v2220  abdop_v2222  abdop_v2222  abdop_v2223  abdop_v2224   abdop_v2225   abdop_v2226   abdop_v2227   abdop_v2228   abdop_v2229   abdop_v2230   abdop_v2231   abdop_v2232   abdop_v2233   abdop_v2234   abdop_v2235   abdop_v2236)


gen time_gap_abdop_v2_final=max(time_gap_abdop_v21, time_gap_abdop_v22, time_gap_abdop_v23, time_gap_abdop_v24, time_gap_abdop_v25, time_gap_abdop_v26, time_gap_abdop_v27, time_gap_abdop_v28, time_gap_abdop_v29, time_gap_abdop_v210,time_gap_abdop_v211,time_gap_abdop_v212,time_gap_abdop_v213,time_gap_abdop_v214,time_gap_abdop_v215,time_gap_abdop_v216,time_gap_abdop_v217,time_gap_abdop_v218,time_gap_abdop_v219,time_gap_abdop_v220,time_gap_abdop_v221,time_gap_abdop_v222,time_gap_abdop_v223,time_gap_abdop_v224, time_gap_abdop_v225, time_gap_abdop_v226, time_gap_abdop_v227, time_gap_abdop_v228, time_gap_abdop_v229, time_gap_abdop_v230, time_gap_abdop_v231,time_gap_abdop_v232, time_gap_abdop_v233,time_gap_abdop_v234, time_gap_abdop_v235,time_gap_abdop_v236, time_gap_abdop_v237,time_gap_abdop_v238, time_gap_abdop_v239, time_gap_abdop_v240, time_gap_abdop_v241, time_gap_abdop_v242, time_gap_abdop_v243, time_gap_abdop_v244, time_gap_abdop_v245, time_gap_abdop_v246, time_gap_abdop_v247, time_gap_abdop_v248, time_gap_abdop_v249, time_gap_abdop_v250, time_gap_abdop_v251, time_gap_abdop_v252, time_gap_abdop_v253, time_gap_abdop_v254, time_gap_abdop_v255, time_gap_abdop_v256, time_gap_abdop_v257, time_gap_abdop_v258, time_gap_abdop_v259, time_gap_abdop_v260,time_gap_abdop_v261,time_gap_abdop_v2236,time_gap_abdop_v263,time_gap_abdop_v264,time_gap_abdop_v265,time_gap_abdop_v266,time_gap_abdop_v267,time_gap_abdop_v268,time_gap_abdop_v269,time_gap_abdop_v270,time_gap_abdop_v271,time_gap_abdop_v272,time_gap_abdop_v273,time_gap_abdop_v274, time_gap_abdop_v275, time_gap_abdop_v276, time_gap_abdop_v277, time_gap_abdop_v278, time_gap_abdop_v279, time_gap_abdop_v280, time_gap_abdop_v281,time_gap_abdop_v282, time_gap_abdop_v283,time_gap_abdop_v284, time_gap_abdop_v285,time_gap_abdop_v286, time_gap_abdop_v287,time_gap_abdop_v288, time_gap_abdop_v289, time_gap_abdop_v290, time_gap_abdop_v291, time_gap_abdop_v292, time_gap_abdop_v293, time_gap_abdop_v299, time_gap_abdop_v295, time_gap_abdop_v296, time_gap_abdop_v297, time_gap_abdop_v298, time_gap_abdop_v299, time_gap_abdop_v2100, time_gap_abdop_v2101, time_gap_abdop_v2102, time_gap_abdop_v2103, time_gap_abdop_v2104, time_gap_abdop_v2105, time_gap_abdop_v2106, time_gap_abdop_v2107, time_gap_abdop_v2108, time_gap_abdop_v2109, time_gap_abdop_v2110,time_gap_abdop_v2111,time_gap_abdop_v2112,time_gap_abdop_v2113,time_gap_abdop_v2114,time_gap_abdop_v2115,time_gap_abdop_v2116,time_gap_abdop_v2117,time_gap_abdop_v2118,time_gap_abdop_v2119,time_gap_abdop_v2120,time_gap_abdop_v2121,time_gap_abdop_v2122,time_gap_abdop_v2123,time_gap_abdop_v2124, time_gap_abdop_v2125,  time_gap_abdop_v2126, time_gap_abdop_v2127, time_gap_abdop_v2128, time_gap_abdop_v2129, time_gap_abdop_v2130, time_gap_abdop_v2131,time_gap_abdop_v2132, time_gap_abdop_v2133,time_gap_abdop_v2134, time_gap_abdop_v2135,time_gap_abdop_v2136, time_gap_abdop_v2137,time_gap_abdop_v2138, time_gap_abdop_v2139, time_gap_abdop_v2140, time_gap_abdop_v2141, time_gap_abdop_v2142, time_gap_abdop_v2143, time_gap_abdop_v2144, time_gap_abdop_v2145, time_gap_abdop_v2146, time_gap_abdop_v2147, time_gap_abdop_v2148, time_gap_abdop_v2149, time_gap_abdop_v2150, time_gap_abdop_v2151, time_gap_abdop_v2152, time_gap_abdop_v2153, time_gap_abdop_v2154, time_gap_abdop_v2155, time_gap_abdop_v2156, time_gap_abdop_v2157, time_gap_abdop_v2158, time_gap_abdop_v2159, time_gap_abdop_v2160,time_gap_abdop_v2161,time_gap_abdop_v2162,time_gap_abdop_v2163,time_gap_abdop_v2164,time_gap_abdop_v2165,time_gap_abdop_v2166,time_gap_abdop_v2167,time_gap_abdop_v2168,time_gap_abdop_v2169,time_gap_abdop_v2170,time_gap_abdop_v2171,time_gap_abdop_v2172,time_gap_abdop_v2173,time_gap_abdop_v2174, time_gap_abdop_v2175, time_gap_abdop_v2176, time_gap_abdop_v2177, time_gap_abdop_v2178, time_gap_abdop_v2179, time_gap_abdop_v2180, time_gap_abdop_v2181,time_gap_abdop_v2182, time_gap_abdop_v2183,time_gap_abdop_v2184, time_gap_abdop_v2185,time_gap_abdop_v2186, time_gap_abdop_v2187,time_gap_abdop_v2188, time_gap_abdop_v2189, time_gap_abdop_v2190, time_gap_abdop_v2191, time_gap_abdop_v2192, time_gap_abdop_v2193, time_gap_abdop_v2194, time_gap_abdop_v2195, time_gap_abdop_v2196, time_gap_abdop_v2197, time_gap_abdop_v2198, time_gap_abdop_v2199, time_gap_abdop_v2200, time_gap_abdop_v2202, time_gap_abdop_v2202, time_gap_abdop_v2203, time_gap_abdop_v2204, time_gap_abdop_v2205, time_gap_abdop_v2206, time_gap_abdop_v2207, time_gap_abdop_v2208, time_gap_abdop_v2209, time_gap_abdop_v2210,time_gap_abdop_v2211,time_gap_abdop_v2212,time_gap_abdop_v2213,time_gap_abdop_v2214,time_gap_abdop_v2215,time_gap_abdop_v2216,time_gap_abdop_v2217,time_gap_abdop_v2218,time_gap_abdop_v2219,time_gap_abdop_v2220,time_gap_abdop_v2222,time_gap_abdop_v2222,time_gap_abdop_v2223,time_gap_abdop_v2224, time_gap_abdop_v2225, time_gap_abdop_v2226, time_gap_abdop_v2227, time_gap_abdop_v2228, time_gap_abdop_v2229, time_gap_abdop_v2230, time_gap_abdop_v2231, time_gap_abdop_v2232, time_gap_abdop_v2233, time_gap_abdop_v2234, time_gap_abdop_v2235, time_gap_abdop_v2236)

gen abdopr_final=0
replace abdopr_final=1 if abdopr>1

gen abdop_v2f=0
replace abdop_v2f=1 if time_gap_abdop_v2_final!=.

global n 236
forval x=1/$n {
drop time_gap_abdop_v2`x' abdop_v2`x' effectivedatetime_abdop_v2`x'
}


//11 anorexia


global n 159
forval x=1/$n {
qui gen time_gap_anorexia_v2`x'=(index_date- effectivedatetime_anorexia_v2`x')

}

global n 159
forval x=1/$n {
qui replace anorexia_v2`x'=. if (time_gap_anorexia_v2`x'<0 | time_gap_anorexia_v2`x'>182)
qui replace effectivedatetime_anorexia_v2`x'=. if (time_gap_anorexia_v2`x'<0 | time_gap_anorexia_v2`x'>182)
qui replace time_gap_anorexia_v2`x'=. if (time_gap_anorexia_v2`x'<0 | time_gap_anorexia_v2`x'>182)
}


egen anorexiar=rownonmiss(anorexia_v21  anorexia_v22  anorexia_v23  anorexia_v24  anorexia_v25  anorexia_v26  anorexia_v27  anorexia_v28  anorexia_v29  anorexia_v210 anorexia_v211 anorexia_v212 anorexia_v213 anorexia_v214 anorexia_v215 anorexia_v216 anorexia_v217 anorexia_v218 anorexia_v219 anorexia_v220 anorexia_v221 anorexia_v222 anorexia_v223 anorexia_v224  anorexia_v225  anorexia_v226  anorexia_v227  anorexia_v228  anorexia_v229  anorexia_v230  anorexia_v231 anorexia_v232  anorexia_v233 anorexia_v234  anorexia_v235 anorexia_v236  anorexia_v237 anorexia_v238  anorexia_v239  anorexia_v240  anorexia_v241  anorexia_v242  anorexia_v243  anorexia_v244  anorexia_v245  anorexia_v246  anorexia_v247  anorexia_v248  anorexia_v249  anorexia_v250  anorexia_v251  anorexia_v252  anorexia_v253  anorexia_v254  anorexia_v255  anorexia_v256  anorexia_v257  anorexia_v258  anorexia_v259  anorexia_v260 anorexia_v261 anorexia_v2159 anorexia_v263 anorexia_v264 anorexia_v265 anorexia_v266 anorexia_v267 anorexia_v268 anorexia_v269 anorexia_v270 anorexia_v271 anorexia_v272 anorexia_v273 anorexia_v274  anorexia_v275  anorexia_v276  anorexia_v277  anorexia_v278  anorexia_v279  anorexia_v280  anorexia_v281 anorexia_v282  anorexia_v283 anorexia_v284  anorexia_v285 anorexia_v286  anorexia_v287 anorexia_v288  anorexia_v289  anorexia_v290  anorexia_v291  anorexia_v292  anorexia_v293  anorexia_v299  anorexia_v295  anorexia_v296  anorexia_v297  anorexia_v298  anorexia_v299  anorexia_v2100  anorexia_v2101  anorexia_v2102  anorexia_v2103  anorexia_v2104  anorexia_v2105  anorexia_v2106  anorexia_v2107  anorexia_v2108  anorexia_v2109  anorexia_v2110 anorexia_v2111 anorexia_v2112 anorexia_v2113 anorexia_v2114 anorexia_v2115 anorexia_v2116 anorexia_v2117 anorexia_v2118 anorexia_v2119 anorexia_v2120 anorexia_v2121 anorexia_v2122 anorexia_v2123 anorexia_v2124  anorexia_v2125   anorexia_v2126  anorexia_v2127  anorexia_v2128  anorexia_v2129  anorexia_v2130  anorexia_v2131 anorexia_v2132  anorexia_v2133 anorexia_v2134  anorexia_v2135 anorexia_v2136  anorexia_v2137 anorexia_v2138  anorexia_v2139  anorexia_v2140  anorexia_v2141  anorexia_v2142  anorexia_v2143  anorexia_v2144  anorexia_v2145  anorexia_v2146  anorexia_v2147  anorexia_v2148  anorexia_v2149  anorexia_v2150  anorexia_v2151  anorexia_v2152  anorexia_v2153  anorexia_v2154  anorexia_v2155  anorexia_v2156  anorexia_v2157  anorexia_v2158  anorexia_v2159)

gen anorexiar_final=0
replace anorexiar_final=1 if anorexiar>1

gen time_gap_anorexia_v2_final=max(time_gap_anorexia_v21, time_gap_anorexia_v22, time_gap_anorexia_v23, time_gap_anorexia_v24, time_gap_anorexia_v25, time_gap_anorexia_v26, time_gap_anorexia_v27, time_gap_anorexia_v28, time_gap_anorexia_v29, time_gap_anorexia_v210,time_gap_anorexia_v211,time_gap_anorexia_v212,time_gap_anorexia_v213,time_gap_anorexia_v214,time_gap_anorexia_v215,time_gap_anorexia_v216,time_gap_anorexia_v217,time_gap_anorexia_v218,time_gap_anorexia_v219,time_gap_anorexia_v220,time_gap_anorexia_v221,time_gap_anorexia_v222,time_gap_anorexia_v223,time_gap_anorexia_v224, time_gap_anorexia_v225, time_gap_anorexia_v226, time_gap_anorexia_v227, time_gap_anorexia_v228, time_gap_anorexia_v229, time_gap_anorexia_v230, time_gap_anorexia_v231,time_gap_anorexia_v232, time_gap_anorexia_v233,time_gap_anorexia_v234, time_gap_anorexia_v235,time_gap_anorexia_v236, time_gap_anorexia_v237,time_gap_anorexia_v238, time_gap_anorexia_v239, time_gap_anorexia_v240, time_gap_anorexia_v241, time_gap_anorexia_v242, time_gap_anorexia_v243, time_gap_anorexia_v244, time_gap_anorexia_v245, time_gap_anorexia_v246, time_gap_anorexia_v247, time_gap_anorexia_v248, time_gap_anorexia_v249, time_gap_anorexia_v250, time_gap_anorexia_v251, time_gap_anorexia_v252, time_gap_anorexia_v253, time_gap_anorexia_v254, time_gap_anorexia_v255, time_gap_anorexia_v256, time_gap_anorexia_v257, time_gap_anorexia_v258, time_gap_anorexia_v259, time_gap_anorexia_v260,time_gap_anorexia_v261,time_gap_anorexia_v2159,time_gap_anorexia_v263,time_gap_anorexia_v264,time_gap_anorexia_v265,time_gap_anorexia_v266,time_gap_anorexia_v267,time_gap_anorexia_v268,time_gap_anorexia_v269,time_gap_anorexia_v270,time_gap_anorexia_v271,time_gap_anorexia_v272,time_gap_anorexia_v273,time_gap_anorexia_v274, time_gap_anorexia_v275, time_gap_anorexia_v276, time_gap_anorexia_v277, time_gap_anorexia_v278, time_gap_anorexia_v279, time_gap_anorexia_v280, time_gap_anorexia_v281,time_gap_anorexia_v282, time_gap_anorexia_v283,time_gap_anorexia_v284, time_gap_anorexia_v285,time_gap_anorexia_v286, time_gap_anorexia_v287,time_gap_anorexia_v288, time_gap_anorexia_v289, time_gap_anorexia_v290, time_gap_anorexia_v291, time_gap_anorexia_v292, time_gap_anorexia_v293, time_gap_anorexia_v299, time_gap_anorexia_v295, time_gap_anorexia_v296, time_gap_anorexia_v297, time_gap_anorexia_v298, time_gap_anorexia_v299, time_gap_anorexia_v2100, time_gap_anorexia_v2101, time_gap_anorexia_v2102, time_gap_anorexia_v2103, time_gap_anorexia_v2104, time_gap_anorexia_v2105, time_gap_anorexia_v2106, time_gap_anorexia_v2107, time_gap_anorexia_v2108, time_gap_anorexia_v2109, time_gap_anorexia_v2110,time_gap_anorexia_v2111,time_gap_anorexia_v2112,time_gap_anorexia_v2113,time_gap_anorexia_v2114,time_gap_anorexia_v2115,time_gap_anorexia_v2116,time_gap_anorexia_v2117,time_gap_anorexia_v2118,time_gap_anorexia_v2119,time_gap_anorexia_v2120,time_gap_anorexia_v2121,time_gap_anorexia_v2122,time_gap_anorexia_v2123,time_gap_anorexia_v2124, time_gap_anorexia_v2125,  time_gap_anorexia_v2126, time_gap_anorexia_v2127, time_gap_anorexia_v2128, time_gap_anorexia_v2129, time_gap_anorexia_v2130, time_gap_anorexia_v2131,time_gap_anorexia_v2132, time_gap_anorexia_v2133,time_gap_anorexia_v2134, time_gap_anorexia_v2135,time_gap_anorexia_v2136, time_gap_anorexia_v2137,time_gap_anorexia_v2138, time_gap_anorexia_v2139, time_gap_anorexia_v2140, time_gap_anorexia_v2141, time_gap_anorexia_v2142, time_gap_anorexia_v2143, time_gap_anorexia_v2144, time_gap_anorexia_v2145, time_gap_anorexia_v2146, time_gap_anorexia_v2147, time_gap_anorexia_v2148, time_gap_anorexia_v2149, time_gap_anorexia_v2150, time_gap_anorexia_v2151, time_gap_anorexia_v2152, time_gap_anorexia_v2153, time_gap_anorexia_v2154, time_gap_anorexia_v2155, time_gap_anorexia_v2156, time_gap_anorexia_v2157, time_gap_anorexia_v2158, time_gap_anorexia_v2159)

gen anorexia_v2f=0
replace anorexia_v2f=1 if time_gap_anorexia_v2_final!=.

global n 159
forval x=1/$n {
drop time_gap_anorexia_v2`x' anorexia_v2`x' effectivedatetime_anorexia_v2`x'
}


//12 rash 



global n 100
forval x=1/$n {
qui gen time_gap_rash_v2`x'=(index_date- effectivedatetime_rash_v2`x')

}

global n 100
forval x=1/$n {
qui replace rash_v2`x'=. if (time_gap_rash_v2`x'<0 | time_gap_rash_v2`x'>182)
qui replace effectivedatetime_rash_v2`x'=. if (time_gap_rash_v2`x'<0 | time_gap_rash_v2`x'>182)
qui replace time_gap_rash_v2`x'=. if (time_gap_rash_v2`x'<0 | time_gap_rash_v2`x'>182)
}


egen rashr=rownonmiss( rash_v21   rash_v22   rash_v23   rash_v24   rash_v25   rash_v26   rash_v27   rash_v28   rash_v29   rash_v210  rash_v211  rash_v212  rash_v213  rash_v214  rash_v215  rash_v216  rash_v217  rash_v218  rash_v219  rash_v220  rash_v221  rash_v222  rash_v223  rash_v224   rash_v225   rash_v226   rash_v227   rash_v228   rash_v229   rash_v230   rash_v231  rash_v232   rash_v233  rash_v234   rash_v235  rash_v236   rash_v237  rash_v238   rash_v239   rash_v240   rash_v241   rash_v242   rash_v243   rash_v244   rash_v245   rash_v246   rash_v247   rash_v248   rash_v249   rash_v250   rash_v251   rash_v252   rash_v253   rash_v254   rash_v255   rash_v256   rash_v257   rash_v258   rash_v259   rash_v260  rash_v261  rash_v262  rash_v263  rash_v264  rash_v265  rash_v266  rash_v267  rash_v268  rash_v269  rash_v270  rash_v271  rash_v272  rash_v273  rash_v274   rash_v275   rash_v276   rash_v277   rash_v278   rash_v279   rash_v280   rash_v281  rash_v282   rash_v283  rash_v284   rash_v285  rash_v286   rash_v287  rash_v288   rash_v289   rash_v290   rash_v291   rash_v292   rash_v293   rash_v299   rash_v295   rash_v296   rash_v297   rash_v298   rash_v299   rash_v2100)

gen rashr_final=0
replace rashr_final=1 if rashr>1

gen time_gap_rash_v2_final=max(time_gap_rash_v21, time_gap_rash_v22, time_gap_rash_v23, time_gap_rash_v24, time_gap_rash_v25, time_gap_rash_v26, time_gap_rash_v27, time_gap_rash_v28, time_gap_rash_v29, time_gap_rash_v210,time_gap_rash_v211,time_gap_rash_v212,time_gap_rash_v213,time_gap_rash_v214,time_gap_rash_v215,time_gap_rash_v216,time_gap_rash_v217,time_gap_rash_v218,time_gap_rash_v219,time_gap_rash_v220,time_gap_rash_v221,time_gap_rash_v222,time_gap_rash_v223,time_gap_rash_v224, time_gap_rash_v225, time_gap_rash_v226, time_gap_rash_v227, time_gap_rash_v228, time_gap_rash_v229, time_gap_rash_v230, time_gap_rash_v231,time_gap_rash_v232, time_gap_rash_v233,time_gap_rash_v234, time_gap_rash_v235,time_gap_rash_v236, time_gap_rash_v237,time_gap_rash_v238, time_gap_rash_v239, time_gap_rash_v240, time_gap_rash_v241, time_gap_rash_v242, time_gap_rash_v243, time_gap_rash_v244, time_gap_rash_v245, time_gap_rash_v246, time_gap_rash_v247, time_gap_rash_v248, time_gap_rash_v249, time_gap_rash_v250, time_gap_rash_v251, time_gap_rash_v252, time_gap_rash_v253, time_gap_rash_v254, time_gap_rash_v255, time_gap_rash_v256, time_gap_rash_v257, time_gap_rash_v258, time_gap_rash_v259, time_gap_rash_v260,time_gap_rash_v261,time_gap_rash_v262,time_gap_rash_v263,time_gap_rash_v264,time_gap_rash_v265,time_gap_rash_v266,time_gap_rash_v267,time_gap_rash_v268,time_gap_rash_v269,time_gap_rash_v270,time_gap_rash_v271,time_gap_rash_v272,time_gap_rash_v273,time_gap_rash_v274, time_gap_rash_v275, time_gap_rash_v276, time_gap_rash_v277, time_gap_rash_v278, time_gap_rash_v279, time_gap_rash_v280, time_gap_rash_v281,time_gap_rash_v282, time_gap_rash_v283,time_gap_rash_v284, time_gap_rash_v285,time_gap_rash_v286, time_gap_rash_v287,time_gap_rash_v288, time_gap_rash_v289, time_gap_rash_v290, time_gap_rash_v291, time_gap_rash_v292, time_gap_rash_v293, time_gap_rash_v299, time_gap_rash_v295, time_gap_rash_v296, time_gap_rash_v297, time_gap_rash_v298, time_gap_rash_v299, time_gap_rash_v2100)

gen rash_v2f=0
replace rash_v2f=1 if time_gap_rash_v2_final!=.

global n 100
forval x=1/$n {
drop time_gap_rash_v2`x' rash_v2`x' effectivedatetime_rash_v2`x'
}





//12 skin


global n 84
forval x=1/$n {
qui gen time_gap_skin_v2`x'=(index_date- effectivedatetime_skin_v2`x')

}

global n 84
forval x=1/$n {
qui replace skin_v2`x'=. if (time_gap_skin_v2`x'<0 | time_gap_skin_v2`x'>182)
qui replace effectivedatetime_skin_v2`x'=. if (time_gap_skin_v2`x'<0 | time_gap_skin_v2`x'>182)
qui replace time_gap_skin_v2`x'=. if (time_gap_skin_v2`x'<0 | time_gap_skin_v2`x'>182)
}

egen skinr=rownonmiss( skin_v21  skin_v22  skin_v23  skin_v24  skin_v25  skin_v26  skin_v27  skin_v28  skin_v29  skin_v210 skin_v211 skin_v212 skin_v213 skin_v214 skin_v215 skin_v216 skin_v217 skin_v218 skin_v219 skin_v220 skin_v221 skin_v222 skin_v223 skin_v224  skin_v225  skin_v226  skin_v227  skin_v228  skin_v229  skin_v230  skin_v231 skin_v232  skin_v233 skin_v234  skin_v235 skin_v236  skin_v237 skin_v238  skin_v239  skin_v240  skin_v241  skin_v242  skin_v243  skin_v244  skin_v245  skin_v246  skin_v247  skin_v248  skin_v249  skin_v250  skin_v251  skin_v252  skin_v253  skin_v254  skin_v255  skin_v256  skin_v257  skin_v258  skin_v259  skin_v260 skin_v261 skin_v262 skin_v263 skin_v264 skin_v265 skin_v266 skin_v267 skin_v268 skin_v269 skin_v270 skin_v271 skin_v272 skin_v273 skin_v274  skin_v275  skin_v276  skin_v277  skin_v278  skin_v279  skin_v280  skin_v281 skin_v282  skin_v283 skin_v284)


gen skinr_final=0
replace skinr_final=1 if skinr>1

gen time_gap_skin_v2_final=max(time_gap_skin_v21, time_gap_skin_v22, time_gap_skin_v23, time_gap_skin_v24, time_gap_skin_v25, time_gap_skin_v26, time_gap_skin_v27, time_gap_skin_v28, time_gap_skin_v29, time_gap_skin_v210,time_gap_skin_v211,time_gap_skin_v212,time_gap_skin_v213,time_gap_skin_v214,time_gap_skin_v215,time_gap_skin_v216,time_gap_skin_v217,time_gap_skin_v218,time_gap_skin_v219,time_gap_skin_v220,time_gap_skin_v221,time_gap_skin_v222,time_gap_skin_v223,time_gap_skin_v224, time_gap_skin_v225, time_gap_skin_v226, time_gap_skin_v227, time_gap_skin_v228, time_gap_skin_v229, time_gap_skin_v230, time_gap_skin_v231,time_gap_skin_v232, time_gap_skin_v233,time_gap_skin_v234, time_gap_skin_v235,time_gap_skin_v236, time_gap_skin_v237,time_gap_skin_v238, time_gap_skin_v239, time_gap_skin_v240, time_gap_skin_v241, time_gap_skin_v242, time_gap_skin_v243, time_gap_skin_v244, time_gap_skin_v245, time_gap_skin_v246, time_gap_skin_v247, time_gap_skin_v248, time_gap_skin_v249, time_gap_skin_v250, time_gap_skin_v251, time_gap_skin_v252, time_gap_skin_v253, time_gap_skin_v254, time_gap_skin_v255, time_gap_skin_v256, time_gap_skin_v257, time_gap_skin_v258, time_gap_skin_v259, time_gap_skin_v260,time_gap_skin_v261,time_gap_skin_v262,time_gap_skin_v263,time_gap_skin_v264,time_gap_skin_v265,time_gap_skin_v266,time_gap_skin_v267,time_gap_skin_v268,time_gap_skin_v269,time_gap_skin_v270,time_gap_skin_v271,time_gap_skin_v272,time_gap_skin_v273,time_gap_skin_v274, time_gap_skin_v275, time_gap_skin_v276, time_gap_skin_v277, time_gap_skin_v278, time_gap_skin_v279, time_gap_skin_v280, time_gap_skin_v281,time_gap_skin_v282, time_gap_skin_v283,time_gap_skin_v284)

gen skin_v2f=0
replace skin_v2f=1 if time_gap_skin_v2_final!=.

global n 84
forval x=1/$n {
drop time_gap_skin_v2`x' skin_v2`x' effectivedatetime_skin_v2`x'
}


//14 hnp



global n 340
forval x=1/$n {
qui gen time_gap_hnp_v2`x'=(index_date- effectivedatetime_hnp_v2`x')

}

global n 340
forval x=1/$n {
qui replace hnp_v2`x'=. if (time_gap_hnp_v2`x'<0 | time_gap_hnp_v2`x'>182)
qui replace effectivedatetime_hnp_v2`x'=. if (time_gap_hnp_v2`x'<0 | time_gap_hnp_v2`x'>182)
qui replace time_gap_hnp_v2`x'=. if (time_gap_hnp_v2`x'<0 | time_gap_hnp_v2`x'>182)
}

egen hnpr=rownonmiss(hnp_v21  hnp_v22  hnp_v23  hnp_v24  hnp_v25  hnp_v26  hnp_v27  hnp_v28  hnp_v29  hnp_v210 hnp_v211 hnp_v212 hnp_v213 hnp_v214 hnp_v215 hnp_v216 hnp_v217 hnp_v218 hnp_v219 hnp_v220 hnp_v221 hnp_v222 hnp_v223 hnp_v224  hnp_v225  hnp_v226  hnp_v227  hnp_v228  hnp_v229  hnp_v230  hnp_v231 hnp_v232  hnp_v233 hnp_v234  hnp_v235 hnp_v236  hnp_v237 hnp_v238  hnp_v239  hnp_v240  hnp_v241  hnp_v242  hnp_v243  hnp_v244  hnp_v245  hnp_v246  hnp_v247  hnp_v248  hnp_v249  hnp_v250  hnp_v251  hnp_v252  hnp_v253  hnp_v254  hnp_v255  hnp_v256  hnp_v257  hnp_v258  hnp_v259  hnp_v260 hnp_v261 hnp_v2236 hnp_v263 hnp_v264 hnp_v265 hnp_v266 hnp_v267 hnp_v268 hnp_v269 hnp_v270 hnp_v271 hnp_v272 hnp_v273 hnp_v274  hnp_v275  hnp_v276  hnp_v277  hnp_v278  hnp_v279  hnp_v280  hnp_v281 hnp_v282  hnp_v283 hnp_v284  hnp_v285 hnp_v286  hnp_v287 hnp_v288  hnp_v289  hnp_v290  hnp_v291  hnp_v292  hnp_v293  hnp_v299  hnp_v295  hnp_v296  hnp_v297  hnp_v298  hnp_v299  hnp_v2100  hnp_v2101  hnp_v2102  hnp_v2103  hnp_v2104  hnp_v2105  hnp_v2106  hnp_v2107  hnp_v2108  hnp_v2109  hnp_v2110 hnp_v2111 hnp_v2112 hnp_v2113 hnp_v2114 hnp_v2115 hnp_v2116 hnp_v2117 hnp_v2118 hnp_v2119 hnp_v2120 hnp_v2121 hnp_v2122 hnp_v2123 hnp_v2124  hnp_v2125   hnp_v2126  hnp_v2127  hnp_v2128  hnp_v2129  hnp_v2130  hnp_v2131 hnp_v2132  hnp_v2133 hnp_v2134  hnp_v2135 hnp_v2136  hnp_v2137 hnp_v2138  hnp_v2139  hnp_v2140  hnp_v2141  hnp_v2142  hnp_v2143  hnp_v2144  hnp_v2145  hnp_v2146  hnp_v2147  hnp_v2148  hnp_v2149  hnp_v2150  hnp_v2151  hnp_v2152  hnp_v2153  hnp_v2154  hnp_v2155  hnp_v2156  hnp_v2157  hnp_v2158  hnp_v2159  hnp_v2160 hnp_v2161 hnp_v2162 hnp_v2163 hnp_v2164 hnp_v2165 hnp_v2166 hnp_v2167 hnp_v2168 hnp_v2169 hnp_v2170 hnp_v2171 hnp_v2172 hnp_v2173 hnp_v2174  hnp_v2175  hnp_v2176  hnp_v2177  hnp_v2178  hnp_v2179  hnp_v2180  hnp_v2181 hnp_v2182  hnp_v2183 hnp_v2184  hnp_v2185 hnp_v2186  hnp_v2187 hnp_v2188  hnp_v2189  hnp_v2190  hnp_v2191  hnp_v2192  hnp_v2193  hnp_v2194  hnp_v2195  hnp_v2196  hnp_v2197  hnp_v2198  hnp_v2199  hnp_v2200  hnp_v2202  hnp_v2202  hnp_v2203  hnp_v2204  hnp_v2205  hnp_v2206  hnp_v2207  hnp_v2208  hnp_v2209  hnp_v2210 hnp_v2211 hnp_v2212 hnp_v2213 hnp_v2214 hnp_v2215 hnp_v2216 hnp_v2217 hnp_v2218 hnp_v2219 hnp_v2220 hnp_v2222 hnp_v2222 hnp_v2223 hnp_v2224  hnp_v2225  hnp_v2226  hnp_v2227  hnp_v2228  hnp_v2229  hnp_v2230  hnp_v2231)



gen hnpr_final=0
replace hnpr_final=1 if hnpr>1

gen time_gap_hnp_v2_1=max(time_gap_hnp_v21, time_gap_hnp_v22, time_gap_hnp_v23, time_gap_hnp_v24, time_gap_hnp_v25, time_gap_hnp_v26, time_gap_hnp_v27, time_gap_hnp_v28, time_gap_hnp_v29, time_gap_hnp_v210,time_gap_hnp_v211,time_gap_hnp_v212,time_gap_hnp_v213,time_gap_hnp_v214,time_gap_hnp_v215,time_gap_hnp_v216,time_gap_hnp_v217,time_gap_hnp_v218,time_gap_hnp_v219,time_gap_hnp_v220,time_gap_hnp_v221,time_gap_hnp_v222,time_gap_hnp_v223,time_gap_hnp_v224, time_gap_hnp_v225, time_gap_hnp_v226, time_gap_hnp_v227, time_gap_hnp_v228, time_gap_hnp_v229, time_gap_hnp_v230, time_gap_hnp_v231,time_gap_hnp_v232, time_gap_hnp_v233,time_gap_hnp_v234, time_gap_hnp_v235,time_gap_hnp_v236, time_gap_hnp_v237,time_gap_hnp_v238, time_gap_hnp_v239, time_gap_hnp_v240, time_gap_hnp_v241, time_gap_hnp_v242, time_gap_hnp_v243, time_gap_hnp_v244, time_gap_hnp_v245, time_gap_hnp_v246, time_gap_hnp_v247, time_gap_hnp_v248, time_gap_hnp_v249, time_gap_hnp_v250, time_gap_hnp_v251, time_gap_hnp_v252, time_gap_hnp_v253, time_gap_hnp_v254, time_gap_hnp_v255, time_gap_hnp_v256, time_gap_hnp_v257, time_gap_hnp_v258, time_gap_hnp_v259, time_gap_hnp_v260,time_gap_hnp_v261,time_gap_hnp_v2236,time_gap_hnp_v263,time_gap_hnp_v264,time_gap_hnp_v265,time_gap_hnp_v266,time_gap_hnp_v267,time_gap_hnp_v268,time_gap_hnp_v269,time_gap_hnp_v270,time_gap_hnp_v271,time_gap_hnp_v272,time_gap_hnp_v273,time_gap_hnp_v274, time_gap_hnp_v275, time_gap_hnp_v276, time_gap_hnp_v277, time_gap_hnp_v278, time_gap_hnp_v279, time_gap_hnp_v280, time_gap_hnp_v281,time_gap_hnp_v282, time_gap_hnp_v283,time_gap_hnp_v284, time_gap_hnp_v285,time_gap_hnp_v286, time_gap_hnp_v287,time_gap_hnp_v288, time_gap_hnp_v289, time_gap_hnp_v290, time_gap_hnp_v291, time_gap_hnp_v292, time_gap_hnp_v293, time_gap_hnp_v299, time_gap_hnp_v295, time_gap_hnp_v296, time_gap_hnp_v297, time_gap_hnp_v298, time_gap_hnp_v299, time_gap_hnp_v2100, time_gap_hnp_v2101, time_gap_hnp_v2102, time_gap_hnp_v2103, time_gap_hnp_v2104, time_gap_hnp_v2105, time_gap_hnp_v2106, time_gap_hnp_v2107, time_gap_hnp_v2108, time_gap_hnp_v2109, time_gap_hnp_v2110,time_gap_hnp_v2111,time_gap_hnp_v2112,time_gap_hnp_v2113,time_gap_hnp_v2114,time_gap_hnp_v2115,time_gap_hnp_v2116,time_gap_hnp_v2117,time_gap_hnp_v2118,time_gap_hnp_v2119,time_gap_hnp_v2120,time_gap_hnp_v2121,time_gap_hnp_v2122,time_gap_hnp_v2123,time_gap_hnp_v2124, time_gap_hnp_v2125,  time_gap_hnp_v2126, time_gap_hnp_v2127, time_gap_hnp_v2128, time_gap_hnp_v2129, time_gap_hnp_v2130, time_gap_hnp_v2131,time_gap_hnp_v2132, time_gap_hnp_v2133,time_gap_hnp_v2134, time_gap_hnp_v2135,time_gap_hnp_v2136, time_gap_hnp_v2137,time_gap_hnp_v2138, time_gap_hnp_v2139, time_gap_hnp_v2140, time_gap_hnp_v2141, time_gap_hnp_v2142, time_gap_hnp_v2143, time_gap_hnp_v2144, time_gap_hnp_v2145, time_gap_hnp_v2146, time_gap_hnp_v2147, time_gap_hnp_v2148, time_gap_hnp_v2149, time_gap_hnp_v2150, time_gap_hnp_v2151, time_gap_hnp_v2152, time_gap_hnp_v2153, time_gap_hnp_v2154, time_gap_hnp_v2155, time_gap_hnp_v2156, time_gap_hnp_v2157, time_gap_hnp_v2158, time_gap_hnp_v2159, time_gap_hnp_v2160,time_gap_hnp_v2161,time_gap_hnp_v2162,time_gap_hnp_v2163,time_gap_hnp_v2164,time_gap_hnp_v2165,time_gap_hnp_v2166,time_gap_hnp_v2167,time_gap_hnp_v2168,time_gap_hnp_v2169,time_gap_hnp_v2170,time_gap_hnp_v2171,time_gap_hnp_v2172,time_gap_hnp_v2173,time_gap_hnp_v2174, time_gap_hnp_v2175, time_gap_hnp_v2176, time_gap_hnp_v2177, time_gap_hnp_v2178, time_gap_hnp_v2179, time_gap_hnp_v2180, time_gap_hnp_v2181,time_gap_hnp_v2182, time_gap_hnp_v2183,time_gap_hnp_v2184, time_gap_hnp_v2185,time_gap_hnp_v2186, time_gap_hnp_v2187,time_gap_hnp_v2188, time_gap_hnp_v2189, time_gap_hnp_v2190, time_gap_hnp_v2191, time_gap_hnp_v2192, time_gap_hnp_v2193, time_gap_hnp_v2194, time_gap_hnp_v2195, time_gap_hnp_v2196, time_gap_hnp_v2197, time_gap_hnp_v2198, time_gap_hnp_v2199, time_gap_hnp_v2200, time_gap_hnp_v2202, time_gap_hnp_v2202, time_gap_hnp_v2203, time_gap_hnp_v2204, time_gap_hnp_v2205, time_gap_hnp_v2206, time_gap_hnp_v2207, time_gap_hnp_v2208, time_gap_hnp_v2209, time_gap_hnp_v2210,time_gap_hnp_v2211,time_gap_hnp_v2212,time_gap_hnp_v2213,time_gap_hnp_v2214,time_gap_hnp_v2215,time_gap_hnp_v2216,time_gap_hnp_v2217,time_gap_hnp_v2218,time_gap_hnp_v2219,time_gap_hnp_v2220,time_gap_hnp_v2222,time_gap_hnp_v2222,time_gap_hnp_v2223,time_gap_hnp_v2224, time_gap_hnp_v2225, time_gap_hnp_v2226, time_gap_hnp_v2227, time_gap_hnp_v2228, time_gap_hnp_v2229, time_gap_hnp_v2230, time_gap_hnp_v2231)

gen time_gap_hnp_v2_2=max(time_gap_hnp_v2232, time_gap_hnp_v2233, time_gap_hnp_v2234, time_gap_hnp_v2235, time_gap_hnp_v2236, time_gap_hnp_v2237,time_gap_hnp_v2238, time_gap_hnp_v2239, time_gap_hnp_v2240, time_gap_hnp_v2241, time_gap_hnp_v2242, time_gap_hnp_v2243, time_gap_hnp_v2244, time_gap_hnp_v2245, time_gap_hnp_v2246, time_gap_hnp_v2247, time_gap_hnp_v2248, time_gap_hnp_v2249, time_gap_hnp_v2250, time_gap_hnp_v2251, time_gap_hnp_v2252, time_gap_hnp_v2253, time_gap_hnp_v2254, time_gap_hnp_v2255, time_gap_hnp_v2256, time_gap_hnp_v2257, time_gap_hnp_v2258, time_gap_hnp_v2259, time_gap_hnp_v2260,time_gap_hnp_v2261,time_gap_hnp_v2262,time_gap_hnp_v2263,time_gap_hnp_v2264,time_gap_hnp_v2265,time_gap_hnp_v2266,time_gap_hnp_v2267,time_gap_hnp_v2268,time_gap_hnp_v2269,time_gap_hnp_v2270,time_gap_hnp_v2271,time_gap_hnp_v2272,time_gap_hnp_v2273,time_gap_hnp_v2274, time_gap_hnp_v2275, time_gap_hnp_v2276, time_gap_hnp_v2277, time_gap_hnp_v2278, time_gap_hnp_v2279, time_gap_hnp_v2280, time_gap_hnp_v2281,time_gap_hnp_v2282, time_gap_hnp_v2283,time_gap_hnp_v2284, time_gap_hnp_v2285,time_gap_hnp_v2286, time_gap_hnp_v2287,time_gap_hnp_v2288, time_gap_hnp_v2289, time_gap_hnp_v2290, time_gap_hnp_v2291, time_gap_hnp_v2292, time_gap_hnp_v2293, time_gap_hnp_v2294, time_gap_hnp_v2295, time_gap_hnp_v2296, time_gap_hnp_v2297, time_gap_hnp_v2298, time_gap_hnp_v2299, time_gap_hnp_v2300, time_gap_hnp_v2301, time_gap_hnp_v2302, time_gap_hnp_v2303, time_gap_hnp_v2304, time_gap_hnp_v2305, time_gap_hnp_v2306, time_gap_hnp_v2307, time_gap_hnp_v2308, time_gap_hnp_v2309, time_gap_hnp_v2310,time_gap_hnp_v2311,time_gap_hnp_v2312,time_gap_hnp_v2313,time_gap_hnp_v2314,time_gap_hnp_v2315,time_gap_hnp_v2316,time_gap_hnp_v2317,time_gap_hnp_v2318,time_gap_hnp_v2319,time_gap_hnp_v2320,time_gap_hnp_v2322,time_gap_hnp_v2322,time_gap_hnp_v2323,time_gap_hnp_v2324, time_gap_hnp_v2325, time_gap_hnp_v2326, time_gap_hnp_v2327, time_gap_hnp_v2328, time_gap_hnp_v2329, time_gap_hnp_v2330, time_gap_hnp_v2331, time_gap_hnp_v2332, time_gap_hnp_v2333, time_gap_hnp_v2334, time_gap_hnp_v2335, time_gap_hnp_v2336 , time_gap_hnp_v2337 , time_gap_hnp_v2338 , time_gap_hnp_v2339 , time_gap_hnp_v2340)

gen time_gap_hnp_v2_final= max(time_gap_hnp_v2_1, time_gap_hnp_v2_2)

gen hnp_v2f=0
replace hnp_v2f=1 if time_gap_hnp_v2_final!=.

global n 340
forval x=1/$n {
drop time_gap_hnp_v2`x' hnp_v2`x' effectivedatetime_hnp_v2`x'
}


//15 hns



global n 40
forval x=1/$n {
qui gen time_gap_hns_v2`x'=(index_date- effectivedatetime_hns_v2`x')

}

global n 40
forval x=1/$n {
qui replace hns_v2`x'=. if (time_gap_hns_v2`x'<0 | time_gap_hns_v2`x'>182)
qui replace effectivedatetime_hns_v2`x'=. if (time_gap_hns_v2`x'<0 | time_gap_hns_v2`x'>182)
qui replace time_gap_hns_v2`x'=. if (time_gap_hns_v2`x'<0 | time_gap_hns_v2`x'>182)
}

egen hnsr=rownonmiss(hns_v21  hns_v22  hns_v23  hns_v24  hns_v25  hns_v26  hns_v27  hns_v28  hns_v29  hns_v210 hns_v211 hns_v212 hns_v213 hns_v214 hns_v215 hns_v216 hns_v217 hns_v218 hns_v219 hns_v220 hns_v221 hns_v222 hns_v223 hns_v224  hns_v225  hns_v226  hns_v227  hns_v228  hns_v229  hns_v230  hns_v231 hns_v232  hns_v233 hns_v234  hns_v235 hns_v236  hns_v237 hns_v238  hns_v239  hns_v240)

gen hnsr_final=0
replace hnsr_final=1 if hnsr>1


gen time_gap_hns_v2_final=max(time_gap_hns_v21, time_gap_hns_v22, time_gap_hns_v23, time_gap_hns_v24, time_gap_hns_v25, time_gap_hns_v26, time_gap_hns_v27, time_gap_hns_v28, time_gap_hns_v29, time_gap_hns_v210,time_gap_hns_v211,time_gap_hns_v212,time_gap_hns_v213,time_gap_hns_v214,time_gap_hns_v215,time_gap_hns_v216,time_gap_hns_v217,time_gap_hns_v218,time_gap_hns_v219,time_gap_hns_v220,time_gap_hns_v221,time_gap_hns_v222,time_gap_hns_v223,time_gap_hns_v224, time_gap_hns_v225, time_gap_hns_v226, time_gap_hns_v227, time_gap_hns_v228, time_gap_hns_v229, time_gap_hns_v230, time_gap_hns_v231,time_gap_hns_v232, time_gap_hns_v233,time_gap_hns_v234, time_gap_hns_v235,time_gap_hns_v236, time_gap_hns_v237,time_gap_hns_v238, time_gap_hns_v239, time_gap_hns_v240)

gen hns_v2f=0
replace hns_v2f=1 if time_gap_hns_v2_final!=.

global n 40
forval x=1/$n {
drop time_gap_hns_v2`x' hns_v2`x' effectivedatetime_hns_v2`x'
}



//16 cl



global n 28
forval x=1/$n {
qui gen time_gap_cl_v2`x'=(index_date- effectivedatetime_cl_v2`x')

}

global n 28
forval x=1/$n {
qui replace cl_v2`x'=. if (time_gap_cl_v2`x'<0 | time_gap_cl_v2`x'>182)
qui replace effectivedatetime_cl_v2`x'=. if (time_gap_cl_v2`x'<0 | time_gap_cl_v2`x'>182)
qui replace time_gap_cl_v2`x'=. if (time_gap_cl_v2`x'<0 | time_gap_cl_v2`x'>182)
}

egen clr=rownonmiss(cl_v21  cl_v22  cl_v23  cl_v24  cl_v25  cl_v26  cl_v27  cl_v28  cl_v29  cl_v210 cl_v211 cl_v212 cl_v213 cl_v214 cl_v215 cl_v216 cl_v217 cl_v218 cl_v219 cl_v220 cl_v221 cl_v222 cl_v223 cl_v224  cl_v225  cl_v226  cl_v227  cl_v228)

gen clr_final=0
replace clr_final=1 if clr>1


gen time_gap_cl_v2_final=max(time_gap_cl_v21, time_gap_cl_v22, time_gap_cl_v23, time_gap_cl_v24, time_gap_cl_v25, time_gap_cl_v26, time_gap_cl_v27, time_gap_cl_v28, time_gap_cl_v29, time_gap_cl_v210,time_gap_cl_v211,time_gap_cl_v212,time_gap_cl_v213,time_gap_cl_v214,time_gap_cl_v215,time_gap_cl_v216,time_gap_cl_v217,time_gap_cl_v218,time_gap_cl_v219,time_gap_cl_v220,time_gap_cl_v221,time_gap_cl_v222,time_gap_cl_v223,time_gap_cl_v224, time_gap_cl_v225, time_gap_cl_v226, time_gap_cl_v227, time_gap_cl_v228)

gen cl_v2f=0
replace cl_v2f=1 if time_gap_cl_v2_final!=.

global n 28
forval x=1/$n {
drop time_gap_cl_v2`x' cl_v2`x' effectivedatetime_cl_v2`x'
}


//17 resp


global n 127
forval x=1/$n {
qui gen time_gap_resp`x'=(index_date- effectivedatetime_resp`x')

}

global n 127
forval x=1/$n {
qui replace resp`x'=. if (time_gap_resp`x'<0 | time_gap_resp`x'>182)
qui replace effectivedatetime_resp`x'=. if (time_gap_resp`x'<0 | time_gap_resp`x'>182)
qui replace time_gap_resp`x'=. if (time_gap_resp`x'<0 | time_gap_resp`x'>182)
}

egen respr=rownonmiss(resp1  resp2  resp3  resp4  resp5  resp6  resp7  resp8  resp9  resp10 resp11 resp12 resp13 resp14 resp15 resp16 resp17 resp18 resp19 resp20 resp21 resp22 resp23 resp24  resp25  resp26  resp27  resp28  resp29  resp30  resp31 resp32  resp33 resp34  resp35 resp36  resp37 resp38  resp39  resp40  resp41  resp42  resp43  resp44  resp45  resp46  resp47  resp48  resp49  resp50  resp51  resp52  resp53  resp54  resp55  resp56  resp57  resp58  resp59  resp60 resp61 resp62 resp63 resp64 resp65 resp66 resp67 resp68 resp69 resp70 resp71 resp72 resp73 resp74  resp75  resp76  resp77  resp78  resp79  resp80  resp81 resp82  resp83 resp84  resp85 resp86  resp87 resp88  resp89  resp90  resp91  resp92  resp93  resp99  resp95  resp96  resp97  resp98  resp99  resp100  resp101  resp102  resp103  resp104  resp105  resp106  resp107  resp108  resp109  resp110 resp111 resp112 resp113 resp114 resp115 resp116 resp117 resp118 resp119 resp120 resp121 resp122 resp123 resp124  resp125   resp126  resp127)

gen respr_final=0
replace respr_final=1 if respr>1


gen time_gap_resp_final=max(time_gap_resp1, time_gap_resp2, time_gap_resp3, time_gap_resp4, time_gap_resp5, time_gap_resp6, time_gap_resp7, time_gap_resp8, time_gap_resp9, time_gap_resp10,time_gap_resp11,time_gap_resp12,time_gap_resp13,time_gap_resp14,time_gap_resp15,time_gap_resp16,time_gap_resp17,time_gap_resp18,time_gap_resp19,time_gap_resp20,time_gap_resp21,time_gap_resp22,time_gap_resp23,time_gap_resp24, time_gap_resp25, time_gap_resp26, time_gap_resp27, time_gap_resp28, time_gap_resp29, time_gap_resp30, time_gap_resp31,time_gap_resp32, time_gap_resp33,time_gap_resp34, time_gap_resp35,time_gap_resp36, time_gap_resp37,time_gap_resp38, time_gap_resp39, time_gap_resp40, time_gap_resp41, time_gap_resp42, time_gap_resp43, time_gap_resp44, time_gap_resp45, time_gap_resp46, time_gap_resp47, time_gap_resp48, time_gap_resp49, time_gap_resp50, time_gap_resp51, time_gap_resp52, time_gap_resp53, time_gap_resp54, time_gap_resp55, time_gap_resp56, time_gap_resp57, time_gap_resp58, time_gap_resp59, time_gap_resp60,time_gap_resp61,time_gap_resp62,time_gap_resp63,time_gap_resp64,time_gap_resp65,time_gap_resp66,time_gap_resp67,time_gap_resp68,time_gap_resp69,time_gap_resp70,time_gap_resp71,time_gap_resp72,time_gap_resp73,time_gap_resp74, time_gap_resp75, time_gap_resp76, time_gap_resp77, time_gap_resp78, time_gap_resp79, time_gap_resp80, time_gap_resp81,time_gap_resp82, time_gap_resp83,time_gap_resp84, time_gap_resp85,time_gap_resp86, time_gap_resp87,time_gap_resp88, time_gap_resp89, time_gap_resp90, time_gap_resp91, time_gap_resp92, time_gap_resp93, time_gap_resp99, time_gap_resp95, time_gap_resp96, time_gap_resp97, time_gap_resp98, time_gap_resp99, time_gap_resp100, time_gap_resp101, time_gap_resp102, time_gap_resp103, time_gap_resp104, time_gap_resp105, time_gap_resp106, time_gap_resp107, time_gap_resp108, time_gap_resp109, time_gap_resp110,time_gap_resp111,time_gap_resp112,time_gap_resp113,time_gap_resp114,time_gap_resp115,time_gap_resp116,time_gap_resp117,time_gap_resp118,time_gap_resp119,time_gap_resp120,time_gap_resp121,time_gap_resp122,time_gap_resp123,time_gap_resp124, time_gap_resp125,  time_gap_resp126, time_gap_resp127)

gen respf=0
replace respf=1 if time_gap_resp_final!=.

global n 127
forval x=1/$n {
drop time_gap_resp`x' resp`x' effectivedatetime_resp`x'
}


//18 chest pain


global n 87
forval x=1/$n {
qui gen time_gap_chest_pain`x'=(index_date- effectivedatetime_cp`x')

}

global n 87
forval x=1/$n {
qui replace chest_pain`x'=. if (time_gap_chest_pain`x'<0 | time_gap_chest_pain`x'>182)
qui replace effectivedatetime_cp`x'=. if (time_gap_chest_pain`x'<0 | time_gap_chest_pain`x'>182)
qui replace time_gap_chest_pain`x'=. if (time_gap_chest_pain`x'<0 | time_gap_chest_pain`x'>182)
}

egen chest_painr=rownonmiss( chest_pain1  chest_pain2  chest_pain3  chest_pain4  chest_pain5  chest_pain6  chest_pain7  chest_pain8  chest_pain9  chest_pain10 chest_pain11 chest_pain12 chest_pain13 chest_pain14 chest_pain15 chest_pain16 chest_pain17 chest_pain18 chest_pain19 chest_pain20 chest_pain21 chest_pain22 chest_pain23 chest_pain24  chest_pain25  chest_pain26  chest_pain27  chest_pain28  chest_pain29  chest_pain30  chest_pain31 chest_pain32  chest_pain33 chest_pain34  chest_pain35 chest_pain36  chest_pain37 chest_pain38  chest_pain39  chest_pain40  chest_pain41  chest_pain42  chest_pain43  chest_pain44  chest_pain45  chest_pain46  chest_pain47  chest_pain48  chest_pain49  chest_pain50  chest_pain51  chest_pain52  chest_pain53  chest_pain54  chest_pain55  chest_pain56  chest_pain57  chest_pain58  chest_pain59  chest_pain60 chest_pain61 chest_pain62 chest_pain63 chest_pain64 chest_pain65 chest_pain66 chest_pain67 chest_pain68 chest_pain69 chest_pain70 chest_pain71 chest_pain72 chest_pain73 chest_pain74  chest_pain75  chest_pain76  chest_pain77  chest_pain78  chest_pain79  chest_pain80  chest_pain81 chest_pain82  chest_pain83 chest_pain84  chest_pain85 chest_pain86  chest_pain87)

gen chest_painr_final=0
replace chest_painr_final=1 if chest_painr>1

gen time_gap_chest_pain_final=max(time_gap_chest_pain1, time_gap_chest_pain2, time_gap_chest_pain3, time_gap_chest_pain4, time_gap_chest_pain5, time_gap_chest_pain6, time_gap_chest_pain7, time_gap_chest_pain8, time_gap_chest_pain9, time_gap_chest_pain10,time_gap_chest_pain11,time_gap_chest_pain12,time_gap_chest_pain13,time_gap_chest_pain14,time_gap_chest_pain15,time_gap_chest_pain16,time_gap_chest_pain17,time_gap_chest_pain18,time_gap_chest_pain19,time_gap_chest_pain20,time_gap_chest_pain21,time_gap_chest_pain22,time_gap_chest_pain23,time_gap_chest_pain24, time_gap_chest_pain25, time_gap_chest_pain26, time_gap_chest_pain27, time_gap_chest_pain28, time_gap_chest_pain29, time_gap_chest_pain30, time_gap_chest_pain31,time_gap_chest_pain32, time_gap_chest_pain33,time_gap_chest_pain34, time_gap_chest_pain35,time_gap_chest_pain36, time_gap_chest_pain37,time_gap_chest_pain38, time_gap_chest_pain39, time_gap_chest_pain40, time_gap_chest_pain41, time_gap_chest_pain42, time_gap_chest_pain43, time_gap_chest_pain44, time_gap_chest_pain45, time_gap_chest_pain46, time_gap_chest_pain47, time_gap_chest_pain48, time_gap_chest_pain49, time_gap_chest_pain50, time_gap_chest_pain51, time_gap_chest_pain52, time_gap_chest_pain53, time_gap_chest_pain54, time_gap_chest_pain55, time_gap_chest_pain56, time_gap_chest_pain57, time_gap_chest_pain58, time_gap_chest_pain59, time_gap_chest_pain60,time_gap_chest_pain61,time_gap_chest_pain62,time_gap_chest_pain63,time_gap_chest_pain64,time_gap_chest_pain65,time_gap_chest_pain66,time_gap_chest_pain67,time_gap_chest_pain68,time_gap_chest_pain69,time_gap_chest_pain70,time_gap_chest_pain71,time_gap_chest_pain72,time_gap_chest_pain73,time_gap_chest_pain74, time_gap_chest_pain75, time_gap_chest_pain76, time_gap_chest_pain77, time_gap_chest_pain78, time_gap_chest_pain79, time_gap_chest_pain80, time_gap_chest_pain81,time_gap_chest_pain82, time_gap_chest_pain83,time_gap_chest_pain84, time_gap_chest_pain85,time_gap_chest_pain86, time_gap_chest_pain87)

gen chest_painf=0
replace chest_painf=1 if time_gap_chest_pain_final!=.

global n 87
forval x=1/$n {
drop time_gap_chest_pain`x' chest_pain`x' effectivedatetime_cp`x'
}


//19 cough



global n 100
forval x=1/$n {
qui gen time_gap_cough`x'=(index_date- effectivedatetime_cough`x')

}

global n 100
forval x=1/$n {
qui replace cough`x'=. if (time_gap_cough`x'<0 | time_gap_cough`x'>182)
qui replace effectivedatetime_cough`x'=. if (time_gap_cough`x'<0 | time_gap_cough`x'>182)
qui replace time_gap_cough`x'=. if (time_gap_cough`x'<0 | time_gap_cough`x'>182)
}

egen coughr=rownonmiss(cough1  cough2  cough3  cough4  cough5  cough6  cough7  cough8  cough9  cough10 cough11 cough12 cough13 cough14 cough15 cough16 cough17 cough18 cough19 cough20 cough21 cough22 cough23 cough24  cough25  cough26  cough27  cough28  cough29  cough30  cough31 cough32  cough33 cough34  cough35 cough36  cough37 cough38  cough39  cough40  cough41  cough42  cough43  cough44  cough45  cough46  cough47  cough48  cough49  cough50  cough51  cough52  cough53  cough54  cough55  cough56  cough57  cough58  cough59  cough60 cough61 cough62 cough63 cough64 cough65 cough66 cough67 cough68 cough69 cough70 cough71 cough72 cough73 cough74  cough75  cough76  cough77  cough78  cough79  cough80  cough81 cough82  cough83 cough84  cough85 cough86  cough87 cough88  cough89  cough90  cough91  cough92  cough93  cough99  cough95  cough96  cough97  cough98  cough99  cough100)

gen coughr_final=0
replace coughr_final=1 if coughr>1


gen time_gap_cough_final=max(time_gap_cough1, time_gap_cough2, time_gap_cough3, time_gap_cough4, time_gap_cough5, time_gap_cough6, time_gap_cough7, time_gap_cough8, time_gap_cough9, time_gap_cough10,time_gap_cough11,time_gap_cough12,time_gap_cough13,time_gap_cough14,time_gap_cough15,time_gap_cough16,time_gap_cough17,time_gap_cough18,time_gap_cough19,time_gap_cough20,time_gap_cough21,time_gap_cough22,time_gap_cough23,time_gap_cough24, time_gap_cough25, time_gap_cough26, time_gap_cough27, time_gap_cough28, time_gap_cough29, time_gap_cough30, time_gap_cough31,time_gap_cough32, time_gap_cough33,time_gap_cough34, time_gap_cough35,time_gap_cough36, time_gap_cough37,time_gap_cough38, time_gap_cough39, time_gap_cough40, time_gap_cough41, time_gap_cough42, time_gap_cough43, time_gap_cough44, time_gap_cough45, time_gap_cough46, time_gap_cough47, time_gap_cough48, time_gap_cough49, time_gap_cough50, time_gap_cough51, time_gap_cough52, time_gap_cough53, time_gap_cough54, time_gap_cough55, time_gap_cough56, time_gap_cough57, time_gap_cough58, time_gap_cough59, time_gap_cough60,time_gap_cough61,time_gap_cough62,time_gap_cough63,time_gap_cough64,time_gap_cough65,time_gap_cough66,time_gap_cough67,time_gap_cough68,time_gap_cough69,time_gap_cough70,time_gap_cough71,time_gap_cough72,time_gap_cough73,time_gap_cough74, time_gap_cough75, time_gap_cough76, time_gap_cough77, time_gap_cough78, time_gap_cough79, time_gap_cough80, time_gap_cough81,time_gap_cough82, time_gap_cough83,time_gap_cough84, time_gap_cough85,time_gap_cough86, time_gap_cough87,time_gap_cough88, time_gap_cough89, time_gap_cough90, time_gap_cough91, time_gap_cough92, time_gap_cough93, time_gap_cough99, time_gap_cough95, time_gap_cough96, time_gap_cough97, time_gap_cough98, time_gap_cough99, time_gap_cough100)

gen coughf=0
replace coughf=1 if time_gap_cough_final!=.

global n 100
forval x=1/$n {
drop time_gap_cough`x' cough`x' effectivedatetime_cough`x'
}


//20 breathless



global n 74
forval x=1/$n {
qui gen time_gap_breathless`x'=(index_date- effectivedatetime_breathless`x')

}

global n 74
forval x=1/$n {
qui replace breathless`x'=. if (time_gap_breathless`x'<0 | time_gap_breathless`x'>182)
qui replace effectivedatetime_breathless`x'=. if (time_gap_breathless`x'<0 | time_gap_breathless`x'>182)
qui replace time_gap_breathless`x'=. if (time_gap_breathless`x'<0 | time_gap_breathless`x'>182)
}

egen breathlessr=rownonmiss( breathless1  breathless2  breathless3  breathless4  breathless5  breathless6  breathless7  breathless8  breathless9  breathless10 breathless11 breathless12 breathless13 breathless14 breathless15 breathless16 breathless17 breathless18 breathless19 breathless20 breathless21 breathless22 breathless23 breathless24  breathless25  breathless26  breathless27  breathless28  breathless29  breathless30  breathless31 breathless32  breathless33 breathless34  breathless35 breathless36  breathless37 breathless38  breathless39  breathless40  breathless41  breathless42  breathless43  breathless44  breathless45  breathless46  breathless47  breathless48  breathless49  breathless50  breathless51  breathless52  breathless53  breathless54  breathless55  breathless56  breathless57  breathless58  breathless59  breathless60 breathless61 breathless62 breathless63 breathless64 breathless65 breathless66 breathless67 breathless68 breathless69 breathless70 breathless71 breathless72 breathless73 breathless74)

gen breathlessr_final=0
replace breathlessr_final=1 if breathlessr>1


gen time_gap_breathless_final=max(time_gap_breathless1, time_gap_breathless2, time_gap_breathless3, time_gap_breathless4, time_gap_breathless5, time_gap_breathless6, time_gap_breathless7, time_gap_breathless8, time_gap_breathless9, time_gap_breathless10,time_gap_breathless11,time_gap_breathless12,time_gap_breathless13,time_gap_breathless14,time_gap_breathless15,time_gap_breathless16,time_gap_breathless17,time_gap_breathless18,time_gap_breathless19,time_gap_breathless20,time_gap_breathless21,time_gap_breathless22,time_gap_breathless23,time_gap_breathless24, time_gap_breathless25, time_gap_breathless26, time_gap_breathless27, time_gap_breathless28, time_gap_breathless29, time_gap_breathless30, time_gap_breathless31,time_gap_breathless32, time_gap_breathless33,time_gap_breathless34, time_gap_breathless35,time_gap_breathless36, time_gap_breathless37,time_gap_breathless38, time_gap_breathless39, time_gap_breathless40, time_gap_breathless41, time_gap_breathless42, time_gap_breathless43, time_gap_breathless44, time_gap_breathless45, time_gap_breathless46, time_gap_breathless47, time_gap_breathless48, time_gap_breathless49, time_gap_breathless50, time_gap_breathless51, time_gap_breathless52, time_gap_breathless53, time_gap_breathless54, time_gap_breathless55, time_gap_breathless56, time_gap_breathless57, time_gap_breathless58, time_gap_breathless59, time_gap_breathless60,time_gap_breathless61,time_gap_breathless62,time_gap_breathless63,time_gap_breathless64,time_gap_breathless65,time_gap_breathless66,time_gap_breathless67,time_gap_breathless68,time_gap_breathless69,time_gap_breathless70,time_gap_breathless71,time_gap_breathless72,time_gap_breathless73,time_gap_breathless74)

gen breathlessf=0
replace breathlessf=1 if time_gap_breathless_final!=.

global n 74
forval x=1/$n {
drop time_gap_breathless`x' breathless`x' effectivedatetime_breathless`x'
}


//21 headache



global n 170
forval x=1/$n {
qui gen time_gap_headache_v2`x'=(index_date- effectivedatetime_headache_v2`x')

}

global n 170
forval x=1/$n {
qui replace headache_v2`x'=. if (time_gap_headache_v2`x'<0 | time_gap_headache_v2`x'>182)
qui replace effectivedatetime_headache_v2`x'=. if (time_gap_headache_v2`x'<0 | time_gap_headache_v2`x'>182)
qui replace time_gap_headache_v2`x'=. if (time_gap_headache_v2`x'<0 | time_gap_headache_v2`x'>182)
}

egen headacher=rownonmiss(headache_v21  headache_v22  headache_v23  headache_v24  headache_v25  headache_v26  headache_v27  headache_v28  headache_v29  headache_v210 headache_v211 headache_v212 headache_v213 headache_v214 headache_v215 headache_v216 headache_v217 headache_v218 headache_v219 headache_v220 headache_v221 headache_v222 headache_v223 headache_v224  headache_v225  headache_v226  headache_v227  headache_v228  headache_v229  headache_v230  headache_v231 headache_v232  headache_v233 headache_v234  headache_v235 headache_v236  headache_v237 headache_v238  headache_v239  headache_v240  headache_v241  headache_v242  headache_v243  headache_v244  headache_v245  headache_v246  headache_v247  headache_v248  headache_v249  headache_v250  headache_v251  headache_v252  headache_v253  headache_v254  headache_v255  headache_v256  headache_v257  headache_v258  headache_v259  headache_v260 headache_v261 headache_v262 headache_v263 headache_v264 headache_v265 headache_v266 headache_v267 headache_v268 headache_v269 headache_v270 headache_v271 headache_v272 headache_v273 headache_v274  headache_v275  headache_v276  headache_v277  headache_v278  headache_v279  headache_v280  headache_v281 headache_v282  headache_v283 headache_v284  headache_v285 headache_v286  headache_v287 headache_v288  headache_v289  headache_v290  headache_v291  headache_v292  headache_v293  headache_v299  headache_v295  headache_v296  headache_v297  headache_v298  headache_v299  headache_v2100  headache_v2101  headache_v2102  headache_v2103  headache_v2104  headache_v2105  headache_v2106  headache_v2107  headache_v2108  headache_v2109  headache_v2110 headache_v2111 headache_v2112 headache_v2113 headache_v2114 headache_v2115 headache_v2116 headache_v2117 headache_v2118 headache_v2119 headache_v2120 headache_v2121 headache_v2122 headache_v2123 headache_v2124  headache_v2125   headache_v2126  headache_v2127  headache_v2128  headache_v2129  headache_v2130  headache_v2131 headache_v2132  headache_v2133 headache_v2134  headache_v2135 headache_v2136  headache_v2137 headache_v2138  headache_v2139  headache_v2140  headache_v2141  headache_v2142  headache_v2143  headache_v2144  headache_v2145  headache_v2146  headache_v2147  headache_v2148  headache_v2149  headache_v2150  headache_v2151  headache_v2152  headache_v2153  headache_v2154  headache_v2155  headache_v2156  headache_v2157  headache_v2158  headache_v2159  headache_v2160 headache_v2161 headache_v2162 headache_v2163 headache_v2164 headache_v2165 headache_v2166 headache_v2167 headache_v2168 headache_v2169 headache_v2170)

gen headacher_final=0
replace headacher_final=1 if headacher_final>1

gen time_gap_headache_v2_final=max(time_gap_headache_v21, time_gap_headache_v22, time_gap_headache_v23, time_gap_headache_v24, time_gap_headache_v25, time_gap_headache_v26, time_gap_headache_v27, time_gap_headache_v28, time_gap_headache_v29, time_gap_headache_v210,time_gap_headache_v211,time_gap_headache_v212,time_gap_headache_v213,time_gap_headache_v214,time_gap_headache_v215,time_gap_headache_v216,time_gap_headache_v217,time_gap_headache_v218,time_gap_headache_v219,time_gap_headache_v220,time_gap_headache_v221,time_gap_headache_v222,time_gap_headache_v223,time_gap_headache_v224, time_gap_headache_v225, time_gap_headache_v226, time_gap_headache_v227, time_gap_headache_v228, time_gap_headache_v229, time_gap_headache_v230, time_gap_headache_v231,time_gap_headache_v232, time_gap_headache_v233,time_gap_headache_v234, time_gap_headache_v235,time_gap_headache_v236, time_gap_headache_v237,time_gap_headache_v238, time_gap_headache_v239, time_gap_headache_v240, time_gap_headache_v241, time_gap_headache_v242, time_gap_headache_v243, time_gap_headache_v244, time_gap_headache_v245, time_gap_headache_v246, time_gap_headache_v247, time_gap_headache_v248, time_gap_headache_v249, time_gap_headache_v250, time_gap_headache_v251, time_gap_headache_v252, time_gap_headache_v253, time_gap_headache_v254, time_gap_headache_v255, time_gap_headache_v256, time_gap_headache_v257, time_gap_headache_v258, time_gap_headache_v259, time_gap_headache_v260,time_gap_headache_v261,time_gap_headache_v262,time_gap_headache_v263,time_gap_headache_v264,time_gap_headache_v265,time_gap_headache_v266,time_gap_headache_v267,time_gap_headache_v268,time_gap_headache_v269,time_gap_headache_v270,time_gap_headache_v271,time_gap_headache_v272,time_gap_headache_v273,time_gap_headache_v274, time_gap_headache_v275, time_gap_headache_v276, time_gap_headache_v277, time_gap_headache_v278, time_gap_headache_v279, time_gap_headache_v280, time_gap_headache_v281,time_gap_headache_v282, time_gap_headache_v283,time_gap_headache_v284, time_gap_headache_v285,time_gap_headache_v286, time_gap_headache_v287,time_gap_headache_v288, time_gap_headache_v289, time_gap_headache_v290, time_gap_headache_v291, time_gap_headache_v292, time_gap_headache_v293, time_gap_headache_v299, time_gap_headache_v295, time_gap_headache_v296, time_gap_headache_v297, time_gap_headache_v298, time_gap_headache_v299, time_gap_headache_v2100, time_gap_headache_v2101, time_gap_headache_v2102, time_gap_headache_v2103, time_gap_headache_v2104, time_gap_headache_v2105, time_gap_headache_v2106, time_gap_headache_v2107, time_gap_headache_v2108, time_gap_headache_v2109, time_gap_headache_v2110,time_gap_headache_v2111,time_gap_headache_v2112,time_gap_headache_v2113,time_gap_headache_v2114,time_gap_headache_v2115,time_gap_headache_v2116,time_gap_headache_v2117,time_gap_headache_v2118,time_gap_headache_v2119,time_gap_headache_v2120,time_gap_headache_v2121,time_gap_headache_v2122,time_gap_headache_v2123,time_gap_headache_v2124, time_gap_headache_v2125,  time_gap_headache_v2126, time_gap_headache_v2127, time_gap_headache_v2128, time_gap_headache_v2129, time_gap_headache_v2130, time_gap_headache_v2131,time_gap_headache_v2132, time_gap_headache_v2133,time_gap_headache_v2134, time_gap_headache_v2135,time_gap_headache_v2136, time_gap_headache_v2137,time_gap_headache_v2138, time_gap_headache_v2139, time_gap_headache_v2140, time_gap_headache_v2141, time_gap_headache_v2142, time_gap_headache_v2143, time_gap_headache_v2144, time_gap_headache_v2145, time_gap_headache_v2146, time_gap_headache_v2147, time_gap_headache_v2148, time_gap_headache_v2149, time_gap_headache_v2150, time_gap_headache_v2151, time_gap_headache_v2152, time_gap_headache_v2153, time_gap_headache_v2154, time_gap_headache_v2155, time_gap_headache_v2156, time_gap_headache_v2157, time_gap_headache_v2158, time_gap_headache_v2159, time_gap_headache_v2160,time_gap_headache_v2161,time_gap_headache_v2162,time_gap_headache_v2163,time_gap_headache_v2164,time_gap_headache_v2165,time_gap_headache_v2166,time_gap_headache_v2167,time_gap_headache_v2168,time_gap_headache_v2169,time_gap_headache_v2170)

gen headache_v2f=0
replace headache_v2f=1 if time_gap_headache_v2_final!=.

global n 170
forval x=1/$n {
drop time_gap_headache_v2`x' headache_v2`x' effectivedatetime_headache_v2`x'
}

//22 bruising



global n 41
forval x=1/$n {
qui gen time_gap_bruise_v2`x'=(index_date- effectivedatetime_bruise_v2`x')

}

global n 41
forval x=1/$n {
qui replace bruise_v2`x'=. if (time_gap_bruise_v2`x'<0 | time_gap_bruise_v2`x'>182)
qui replace effectivedatetime_bruise_v2`x'=. if (time_gap_bruise_v2`x'<0 | time_gap_bruise_v2`x'>182)
qui replace time_gap_bruise_v2`x'=. if (time_gap_bruise_v2`x'<0 | time_gap_bruise_v2`x'>182)
}

egen bruiser=rownonmiss( bruise_v21   bruise_v22   bruise_v23   bruise_v24   bruise_v25   bruise_v26   bruise_v27   bruise_v28   bruise_v29   bruise_v210  bruise_v211  bruise_v212  bruise_v213  bruise_v214  bruise_v215  bruise_v216  bruise_v217  bruise_v218  bruise_v219  bruise_v220  bruise_v221  bruise_v222  bruise_v223  bruise_v224   bruise_v225   bruise_v226   bruise_v227   bruise_v228   bruise_v229   bruise_v230   bruise_v231  bruise_v232   bruise_v233  bruise_v234   bruise_v235  bruise_v236   bruise_v237  bruise_v238   bruise_v239   bruise_v240   bruise_v241)

gen bruiser_final=0
replace bruiser_final=1 if bruiser>1


gen time_gap_bruise_v2_final=max(time_gap_bruise_v21, time_gap_bruise_v22, time_gap_bruise_v23, time_gap_bruise_v24, time_gap_bruise_v25, time_gap_bruise_v26, time_gap_bruise_v27, time_gap_bruise_v28, time_gap_bruise_v29, time_gap_bruise_v210,time_gap_bruise_v211,time_gap_bruise_v212,time_gap_bruise_v213,time_gap_bruise_v214,time_gap_bruise_v215,time_gap_bruise_v216,time_gap_bruise_v217,time_gap_bruise_v218,time_gap_bruise_v219,time_gap_bruise_v220,time_gap_bruise_v221,time_gap_bruise_v222,time_gap_bruise_v223,time_gap_bruise_v224, time_gap_bruise_v225, time_gap_bruise_v226, time_gap_bruise_v227, time_gap_bruise_v228, time_gap_bruise_v229, time_gap_bruise_v230, time_gap_bruise_v231,time_gap_bruise_v232, time_gap_bruise_v233,time_gap_bruise_v234, time_gap_bruise_v235,time_gap_bruise_v236, time_gap_bruise_v237,time_gap_bruise_v238, time_gap_bruise_v239, time_gap_bruise_v240, time_gap_bruise_v241)

gen bruise_v2f=0
replace bruise_v2f=1 if time_gap_bruise_v2_final!=.

global n 41
forval x=1/$n {
drop time_gap_bruise_v2`x' bruise_v2`x' effectivedatetime_bruise_v2`x'
}


//23 vomiting



global n 100
forval x=1/$n {
qui gen time_gap_vomit_v2`x'=(index_date- effectivedatetime_vomit_v2`x')

}

global n 100
forval x=1/$n {
qui replace vomit_v2`x'=. if (time_gap_vomit_v2`x'<0 | time_gap_vomit_v2`x'>182)
qui replace effectivedatetime_vomit_v2`x'=. if (time_gap_vomit_v2`x'<0 | time_gap_vomit_v2`x'>182)
qui replace time_gap_vomit_v2`x'=. if (time_gap_vomit_v2`x'<0 | time_gap_vomit_v2`x'>182)
}

egen vomitr=rownonmiss( vomit_v21  vomit_v22  vomit_v23  vomit_v24  vomit_v25  vomit_v26  vomit_v27  vomit_v28  vomit_v29  vomit_v210 vomit_v211 vomit_v212 vomit_v213 vomit_v214 vomit_v215 vomit_v216 vomit_v217 vomit_v218 vomit_v219 vomit_v220 vomit_v221 vomit_v222 vomit_v223 vomit_v224  vomit_v225  vomit_v226  vomit_v227  vomit_v228  vomit_v229  vomit_v230  vomit_v231 vomit_v232  vomit_v233 vomit_v234  vomit_v235 vomit_v236  vomit_v237 vomit_v238  vomit_v239  vomit_v240  vomit_v241  vomit_v242  vomit_v243  vomit_v244  vomit_v245  vomit_v246  vomit_v247  vomit_v248  vomit_v249  vomit_v250  vomit_v251  vomit_v252  vomit_v253  vomit_v254  vomit_v255  vomit_v256  vomit_v257  vomit_v258  vomit_v259  vomit_v260 vomit_v261 vomit_v262 vomit_v263 vomit_v264 vomit_v265 vomit_v266 vomit_v267 vomit_v268 vomit_v269 vomit_v270 vomit_v271 vomit_v272 vomit_v273 vomit_v274  vomit_v275  vomit_v276  vomit_v277  vomit_v278  vomit_v279  vomit_v280  vomit_v281 vomit_v282  vomit_v283 vomit_v284  vomit_v285 vomit_v286  vomit_v287 vomit_v288  vomit_v289  vomit_v290  vomit_v291  vomit_v292  vomit_v293  vomit_v299  vomit_v295  vomit_v296  vomit_v297  vomit_v298  vomit_v299  vomit_v2100)

gen vomitr_final=0
replace vomitr_final=1 if vomitr>1

gen time_gap_vomit_v2_final=max(time_gap_vomit_v21, time_gap_vomit_v22, time_gap_vomit_v23, time_gap_vomit_v24, time_gap_vomit_v25, time_gap_vomit_v26, time_gap_vomit_v27, time_gap_vomit_v28, time_gap_vomit_v29, time_gap_vomit_v210,time_gap_vomit_v211,time_gap_vomit_v212,time_gap_vomit_v213,time_gap_vomit_v214,time_gap_vomit_v215,time_gap_vomit_v216,time_gap_vomit_v217,time_gap_vomit_v218,time_gap_vomit_v219,time_gap_vomit_v220,time_gap_vomit_v221,time_gap_vomit_v222,time_gap_vomit_v223,time_gap_vomit_v224, time_gap_vomit_v225, time_gap_vomit_v226, time_gap_vomit_v227, time_gap_vomit_v228, time_gap_vomit_v229, time_gap_vomit_v230, time_gap_vomit_v231,time_gap_vomit_v232, time_gap_vomit_v233,time_gap_vomit_v234, time_gap_vomit_v235,time_gap_vomit_v236, time_gap_vomit_v237,time_gap_vomit_v238, time_gap_vomit_v239, time_gap_vomit_v240, time_gap_vomit_v241, time_gap_vomit_v242, time_gap_vomit_v243, time_gap_vomit_v244, time_gap_vomit_v245, time_gap_vomit_v246, time_gap_vomit_v247, time_gap_vomit_v248, time_gap_vomit_v249, time_gap_vomit_v250, time_gap_vomit_v251, time_gap_vomit_v252, time_gap_vomit_v253, time_gap_vomit_v254, time_gap_vomit_v255, time_gap_vomit_v256, time_gap_vomit_v257, time_gap_vomit_v258, time_gap_vomit_v259, time_gap_vomit_v260,time_gap_vomit_v261,time_gap_vomit_v262,time_gap_vomit_v263,time_gap_vomit_v264,time_gap_vomit_v265,time_gap_vomit_v266,time_gap_vomit_v267,time_gap_vomit_v268,time_gap_vomit_v269,time_gap_vomit_v270,time_gap_vomit_v271,time_gap_vomit_v272,time_gap_vomit_v273,time_gap_vomit_v274, time_gap_vomit_v275, time_gap_vomit_v276, time_gap_vomit_v277, time_gap_vomit_v278, time_gap_vomit_v279, time_gap_vomit_v280, time_gap_vomit_v281,time_gap_vomit_v282, time_gap_vomit_v283,time_gap_vomit_v284, time_gap_vomit_v285,time_gap_vomit_v286, time_gap_vomit_v287,time_gap_vomit_v288, time_gap_vomit_v289, time_gap_vomit_v290, time_gap_vomit_v291, time_gap_vomit_v292, time_gap_vomit_v293, time_gap_vomit_v299, time_gap_vomit_v295, time_gap_vomit_v296, time_gap_vomit_v297, time_gap_vomit_v298, time_gap_vomit_v299, time_gap_vomit_v2100)

gen vomit_v2f=0
replace vomit_v2f=1 if time_gap_vomit_v2_final!=.

global n 100
forval x=1/$n {
drop time_gap_vomit_v2`x' vomit_v2`x' effectivedatetime_vomit_v2`x'
}



//24 hepatomegaly



global n 15
forval x=1/$n {
qui gen time_gap_hepatomegaly`x'=(index_date- effectivedatetime_hepatomegaly`x')

}

global n 15
forval x=1/$n {
qui replace hepatomegaly_v2`x'=. if (time_gap_hepatomegaly`x'<0 | time_gap_hepatomegaly`x'>182)
qui replace effectivedatetime_hepatomegaly`x'=. if (time_gap_hepatomegaly`x'<0 | time_gap_hepatomegaly`x'>182)
qui replace time_gap_hepatomegaly`x'=. if (time_gap_hepatomegaly`x'<0 | time_gap_hepatomegaly`x'>182)
}

egen hepatomegalyr=rownonmiss(hepatomegaly_v21  hepatomegaly_v22  hepatomegaly_v23  hepatomegaly_v24  hepatomegaly_v25  hepatomegaly_v26  hepatomegaly_v27  hepatomegaly_v28  hepatomegaly_v29  hepatomegaly_v210 hepatomegaly_v211 hepatomegaly_v212 hepatomegaly_v213 hepatomegaly_v214 hepatomegaly_v215)

gen hepatomegalyr_final=0
replace hepatomegalyr_final=1 if hepatomegalyr>1

gen time_gap_hepatomegaly_final=max(time_gap_hepatomegaly1, time_gap_hepatomegaly2, time_gap_hepatomegaly3, time_gap_hepatomegaly4, time_gap_hepatomegaly5, time_gap_hepatomegaly6, time_gap_hepatomegaly7, time_gap_hepatomegaly8, time_gap_hepatomegaly9, time_gap_hepatomegaly10,time_gap_hepatomegaly11,time_gap_hepatomegaly12,time_gap_hepatomegaly13,time_gap_hepatomegaly14,time_gap_hepatomegaly15)

gen hepatomegalyf=0
replace hepatomegalyf=1 if time_gap_hepatomegaly_final!=.

global n 15
forval x=1/$n {
drop time_gap_hepatomegaly`x' hepatomegaly_v2`x' effectivedatetime_hepatomegaly`x'
}

//25 splenomegaly



global n 29
forval x=1/$n {
qui gen time_gap_splenomegaly_v2`x'=(index_date- effectivedatetime_splenomegaly`x')

}

global n 29
forval x=1/$n {
qui replace splenomegaly_v2`x'=. if (time_gap_splenomegaly_v2`x'<0 | time_gap_splenomegaly_v2`x'>182)
qui replace effectivedatetime_splenomegaly`x'=. if (time_gap_splenomegaly_v2`x'<0 | time_gap_splenomegaly_v2`x'>182)
qui replace time_gap_splenomegaly_v2`x'=. if (time_gap_splenomegaly_v2`x'<0 | time_gap_splenomegaly_v2`x'>182)
}

egen splenomegalyr=rownonmiss(splenomegaly_v21  splenomegaly_v22  splenomegaly_v23  splenomegaly_v24  splenomegaly_v25  splenomegaly_v26  splenomegaly_v27  splenomegaly_v28  splenomegaly_v29  splenomegaly_v210 splenomegaly_v211 splenomegaly_v212 splenomegaly_v213 splenomegaly_v214 splenomegaly_v215 splenomegaly_v216 splenomegaly_v217 splenomegaly_v218 splenomegaly_v219 splenomegaly_v220 splenomegaly_v221 splenomegaly_v222 splenomegaly_v223 splenomegaly_v224  splenomegaly_v225  splenomegaly_v226  splenomegaly_v227  splenomegaly_v228  splenomegaly_v229)

gen splenomegalyr_final=0
replace splenomegalyr_final=1 if splenomegalyr>1

gen time_gap_splenomegaly_v2_final=max(time_gap_splenomegaly_v21, time_gap_splenomegaly_v22, time_gap_splenomegaly_v23, time_gap_splenomegaly_v24, time_gap_splenomegaly_v25, time_gap_splenomegaly_v26, time_gap_splenomegaly_v27, time_gap_splenomegaly_v28, time_gap_splenomegaly_v29, time_gap_splenomegaly_v210,time_gap_splenomegaly_v211,time_gap_splenomegaly_v212,time_gap_splenomegaly_v213,time_gap_splenomegaly_v214,time_gap_splenomegaly_v215,time_gap_splenomegaly_v216,time_gap_splenomegaly_v217,time_gap_splenomegaly_v218,time_gap_splenomegaly_v219,time_gap_splenomegaly_v220,time_gap_splenomegaly_v221,time_gap_splenomegaly_v222,time_gap_splenomegaly_v223,time_gap_splenomegaly_v224, time_gap_splenomegaly_v225, time_gap_splenomegaly_v226, time_gap_splenomegaly_v227, time_gap_splenomegaly_v228, time_gap_splenomegaly_v229)

gen splenomegaly_v2f=0
replace splenomegaly_v2f=1 if time_gap_splenomegaly_v2_final!=.

global n 29
forval x=1/$n {
drop time_gap_splenomegaly_v2`x' splenomegaly_v2`x' effectivedatetime_splenomegaly`x'
}


//26 hepatosplenomegaly



global n 57
forval x=1/$n {
qui gen time_gap_hsm_v2`x'=(index_date- effectivedatetime_hsm`x')

}

global n 57
forval x=1/$n {
qui replace hepatosplenomegaly_v2`x'=. if (time_gap_hsm_v2`x'<0 | time_gap_hsm_v2`x'>182)
qui replace effectivedatetime_hsm`x'=. if (time_gap_hsm_v2`x'<0 | time_gap_hsm_v2`x'>182)
qui replace time_gap_hsm_v2`x'=. if (time_gap_hsm_v2`x'<0 | time_gap_hsm_v2`x'>182)
}

egen hsmr=rownonmiss( hepatosplenomegaly_v21  hepatosplenomegaly_v22  hepatosplenomegaly_v23  hepatosplenomegaly_v24  hepatosplenomegaly_v25  hepatosplenomegaly_v26  hepatosplenomegaly_v27  hepatosplenomegaly_v28  hepatosplenomegaly_v29  hepatosplenomegaly_v210 hepatosplenomegaly_v211 hepatosplenomegaly_v212 hepatosplenomegaly_v213 hepatosplenomegaly_v214 hepatosplenomegaly_v215 hepatosplenomegaly_v216 hepatosplenomegaly_v217 hepatosplenomegaly_v218 hepatosplenomegaly_v219 hepatosplenomegaly_v220 hepatosplenomegaly_v221 hepatosplenomegaly_v222 hepatosplenomegaly_v223 hepatosplenomegaly_v224  hepatosplenomegaly_v225  hepatosplenomegaly_v226  hepatosplenomegaly_v227  hepatosplenomegaly_v228  hepatosplenomegaly_v229  hepatosplenomegaly_v230  hepatosplenomegaly_v231 hepatosplenomegaly_v232  hepatosplenomegaly_v233 hepatosplenomegaly_v234  hepatosplenomegaly_v235 hepatosplenomegaly_v236  hepatosplenomegaly_v237 hepatosplenomegaly_v238  hepatosplenomegaly_v239  hepatosplenomegaly_v240  hepatosplenomegaly_v241  hepatosplenomegaly_v242  hepatosplenomegaly_v243  hepatosplenomegaly_v244  hepatosplenomegaly_v245  hepatosplenomegaly_v246  hepatosplenomegaly_v247  hepatosplenomegaly_v248  hepatosplenomegaly_v249  hepatosplenomegaly_v250  hepatosplenomegaly_v251  hepatosplenomegaly_v252  hepatosplenomegaly_v253  hepatosplenomegaly_v254  hepatosplenomegaly_v255  hepatosplenomegaly_v256  hepatosplenomegaly_v257)

gen hsmr_final=0
replace hsmr_final=1 if hsmr>1


gen time_gap_hsm_v2_final=max(time_gap_hsm_v21, time_gap_hsm_v22, time_gap_hsm_v23, time_gap_hsm_v24, time_gap_hsm_v25, time_gap_hsm_v26, time_gap_hsm_v27, time_gap_hsm_v28, time_gap_hsm_v29, time_gap_hsm_v210,time_gap_hsm_v211,time_gap_hsm_v212,time_gap_hsm_v213,time_gap_hsm_v214,time_gap_hsm_v215,time_gap_hsm_v216,time_gap_hsm_v217,time_gap_hsm_v218,time_gap_hsm_v219,time_gap_hsm_v220,time_gap_hsm_v221,time_gap_hsm_v222,time_gap_hsm_v223,time_gap_hsm_v224, time_gap_hsm_v225, time_gap_hsm_v226, time_gap_hsm_v227, time_gap_hsm_v228, time_gap_hsm_v229, time_gap_hsm_v230, time_gap_hsm_v231,time_gap_hsm_v232, time_gap_hsm_v233,time_gap_hsm_v234, time_gap_hsm_v235,time_gap_hsm_v236, time_gap_hsm_v237,time_gap_hsm_v238, time_gap_hsm_v239, time_gap_hsm_v240, time_gap_hsm_v241, time_gap_hsm_v242, time_gap_hsm_v243, time_gap_hsm_v244, time_gap_hsm_v245, time_gap_hsm_v246, time_gap_hsm_v247, time_gap_hsm_v248, time_gap_hsm_v249, time_gap_hsm_v250, time_gap_hsm_v251, time_gap_hsm_v252, time_gap_hsm_v253, time_gap_hsm_v254, time_gap_hsm_v255, time_gap_hsm_v256, time_gap_hsm_v257)

gen hsm_v2f=0
replace hsm_v2f=1 if time_gap_hsm_v2_final!=.

global n 57
forval x=1/$n {
drop time_gap_hsm_v2`x' hepatosplenomegaly_v2`x' effectivedatetime_hsm`x'
}

//27 abdo mass



global n 24
forval x=1/$n {
qui gen time_gap_abdomass`x'=(index_date- effectivedatetime_abdomass`x')

}

global n 24
forval x=1/$n {
qui replace abdomass_v2`x'=. if (time_gap_abdomass`x'<0 | time_gap_abdomass`x'>182)
qui replace effectivedatetime_abdomass`x'=. if (time_gap_abdomass`x'<0 | time_gap_abdomass`x'>182)
qui replace time_gap_abdomass`x'=. if (time_gap_abdomass`x'<0 | time_gap_abdomass`x'>182)
}


egen abdomassr=rownonmiss(abdomass_v21  abdomass_v22  abdomass_v23  abdomass_v24  abdomass_v25  abdomass_v26  abdomass_v27  abdomass_v28  abdomass_v29  abdomass_v210 abdomass_v211 abdomass_v212 abdomass_v213 abdomass_v214 abdomass_v215 abdomass_v216 abdomass_v217 abdomass_v218 abdomass_v219 abdomass_v220 abdomass_v221 abdomass_v222 abdomass_v223 abdomass_v224)


gen abdomassr_final=0
replace abdomassr_final=1 if abdomassr>1

gen time_gap_abdomass_final=max(time_gap_abdomass1, time_gap_abdomass2, time_gap_abdomass3, time_gap_abdomass4, time_gap_abdomass5, time_gap_abdomass6, time_gap_abdomass7, time_gap_abdomass8, time_gap_abdomass9, time_gap_abdomass10,time_gap_abdomass11,time_gap_abdomass12,time_gap_abdomass13,time_gap_abdomass14,time_gap_abdomass15,time_gap_abdomass16,time_gap_abdomass17,time_gap_abdomass18,time_gap_abdomass19,time_gap_abdomass20,time_gap_abdomass21,time_gap_abdomass22,time_gap_abdomass23,time_gap_abdomass24)

gen abdomassf=0
replace abdomassf=1 if time_gap_abdomass_final!=.

global n 24
forval x=1/$n {
drop time_gap_abdomass`x' abdomass_v2`x' effectivedatetime_abdomass`x'
}


//28 lump



global n 59
forval x=1/$n {
qui gen time_gap_lump`x'=(index_date- effectivedatetime_lump`x')

}

global n 59
forval x=1/$n {
qui replace lump`x'=. if (time_gap_lump`x'<0 | time_gap_lump`x'>182)
qui replace effectivedatetime_lump`x'=. if (time_gap_lump`x'<0 | time_gap_lump`x'>182)
qui replace time_gap_lump`x'=. if (time_gap_lump`x'<0 | time_gap_lump`x'>182)
}

egen lumpr=rownonmiss(lump1  lump2  lump3  lump4  lump5  lump6  lump7  lump8  lump9  lump10 lump11 lump12 lump13 lump14 lump15 lump16 lump17 lump18 lump19 lump20 lump21 lump22 lump23 lump24  lump25  lump26  lump27  lump28  lump29  lump30  lump31 lump32  lump33 lump34  lump35 lump36  lump37 lump38  lump39  lump40  lump41  lump42  lump43  lump44  lump45  lump46  lump47  lump48  lump49  lump50  lump51  lump52  lump53  lump54  lump55  lump56  lump57)

gen lumpr_final=0
replace lumpr_final=1 if lumpr>1


gen time_gap_lump_final=max(time_gap_lump1, time_gap_lump2, time_gap_lump3, time_gap_lump4, time_gap_lump5, time_gap_lump6, time_gap_lump7, time_gap_lump8, time_gap_lump9, time_gap_lump10,time_gap_lump11,time_gap_lump12,time_gap_lump13,time_gap_lump14,time_gap_lump15,time_gap_lump16,time_gap_lump17,time_gap_lump18,time_gap_lump19,time_gap_lump20,time_gap_lump21,time_gap_lump22,time_gap_lump23,time_gap_lump24, time_gap_lump25, time_gap_lump26, time_gap_lump27, time_gap_lump28, time_gap_lump29, time_gap_lump30, time_gap_lump31,time_gap_lump32, time_gap_lump33,time_gap_lump34, time_gap_lump35,time_gap_lump36, time_gap_lump37,time_gap_lump38, time_gap_lump39, time_gap_lump40, time_gap_lump41, time_gap_lump42, time_gap_lump43, time_gap_lump44, time_gap_lump45, time_gap_lump46, time_gap_lump47, time_gap_lump48, time_gap_lump49, time_gap_lump50, time_gap_lump51, time_gap_lump52, time_gap_lump53, time_gap_lump54, time_gap_lump55, time_gap_lump56, time_gap_lump57)

gen lumpf=0
replace lumpf=1 if time_gap_lump_final!=.

global n 59
forval x=1/$n {
drop  lump`x' effectivedatetime_lump`x' other_lump`x' effectivedatetime_other_lump`x' hn_lump`x' effectivedatetime_hn_lump`x'
}

//29 hn_lump



global n 59
forval x=1/$n {
qui gen time_gap_hn_lump`x'=(index_date- effectivedatetime_hn_lump`x')

}

global n 59
forval x=1/$n {
qui replace hn_lump`x'=. if (time_gap_hn_lump`x'<0 | time_gap_hn_lump`x'>182)
qui replace effectivedatetime_hn_lump`x'=. if (time_gap_hn_lump`x'<0 | time_gap_hn_lump`x'>182)
qui replace time_gap_hn_lump`x'=. if (time_gap_hn_lump`x'<0 | time_gap_hn_lump`x'>182)
}

egen hn_lumpr=rownonmiss( hn_lump1   hn_lump2   hn_lump3   hn_lump4   hn_lump5   hn_lump6   hn_lump7   hn_lump8   hn_lump9   hn_lump10  hn_lump11  hn_lump12  hn_lump13  hn_lump14  hn_lump15  hn_lump16  hn_lump17  hn_lump18  hn_lump19  hn_lump20  hn_lump21  hn_lump22  hn_lump23  hn_lump24   hn_lump25   hn_lump26   hn_lump27   hn_lump28   hn_lump29   hn_lump30   hn_lump31  hn_lump32   hn_lump33  hn_lump34   hn_lump35  hn_lump36   hn_lump37  hn_lump38   hn_lump39   hn_lump40   hn_lump41   hn_lump42   hn_lump43   hn_lump44   hn_lump45   hn_lump46   hn_lump47   hn_lump48   hn_lump49   hn_lump50   hn_lump51   hn_lump52   hn_lump53   hn_lump54   hn_lump55   hn_lump56   hn_lump57)

gen hn_lumpr_final=0
replace hn_lumpr_final=1 if hn_lumpr>1


gen time_gap_hn_lump_final=max(time_gap_hn_lump1, time_gap_hn_lump2, time_gap_hn_lump3, time_gap_hn_lump4, time_gap_hn_lump5, time_gap_hn_lump6, time_gap_hn_lump7, time_gap_hn_lump8, time_gap_hn_lump9, time_gap_hn_lump10,time_gap_hn_lump11,time_gap_hn_lump12,time_gap_hn_lump13,time_gap_hn_lump14,time_gap_hn_lump15,time_gap_hn_lump16,time_gap_hn_lump17,time_gap_hn_lump18,time_gap_hn_lump19,time_gap_hn_lump20,time_gap_hn_lump21,time_gap_hn_lump22,time_gap_hn_lump23,time_gap_hn_lump24, time_gap_hn_lump25, time_gap_hn_lump26, time_gap_hn_lump27, time_gap_hn_lump28, time_gap_hn_lump29, time_gap_hn_lump30, time_gap_hn_lump31,time_gap_hn_lump32, time_gap_hn_lump33,time_gap_hn_lump34, time_gap_hn_lump35,time_gap_hn_lump36, time_gap_hn_lump37,time_gap_hn_lump38, time_gap_hn_lump39, time_gap_hn_lump40, time_gap_hn_lump41, time_gap_hn_lump42, time_gap_hn_lump43, time_gap_hn_lump44, time_gap_hn_lump45, time_gap_hn_lump46, time_gap_hn_lump47, time_gap_hn_lump48, time_gap_hn_lump49, time_gap_hn_lump50, time_gap_hn_lump51, time_gap_hn_lump52, time_gap_hn_lump53, time_gap_hn_lump54, time_gap_hn_lump55, time_gap_hn_lump56, time_gap_hn_lump57)

gen hn_lumpf=0
replace hn_lumpf=1 if time_gap_hn_lump_final!=.

global n 59
forval x=1/$n {
drop time_gap_hn_lump`x' hn_lump`x' effectivedatetime_hn_lump`x'
}



//30 other_lump



global n 47
forval x=1/$n {
qui gen time_gap_other_lump`x'=(index_date- effectivedatetime_other_lump`x')

}

global n 47
forval x=1/$n {
qui replace other_lump`x'=. if (time_gap_other_lump`x'<0 | time_gap_other_lump`x'>182)
qui replace effectivedatetime_other_lump`x'=. if (time_gap_other_lump`x'<0 | time_gap_other_lump`x'>182)
qui replace time_gap_other_lump`x'=. if (time_gap_other_lump`x'<0 | time_gap_other_lump`x'>182)
}

egen other_lumpr=rownonmiss( other_lump1   other_lump2   other_lump3   other_lump4   other_lump5   other_lump6   other_lump7   other_lump8   other_lump9   other_lump10  other_lump11  other_lump12  other_lump13  other_lump14  other_lump15  other_lump16  other_lump17  other_lump18  other_lump19  other_lump20  other_lump21  other_lump22  other_lump23  other_lump24   other_lump25   other_lump26   other_lump27   other_lump28   other_lump29   other_lump30   other_lump31  other_lump32   other_lump33  other_lump34   other_lump35  other_lump36   other_lump37  other_lump38   other_lump39   other_lump40   other_lump41   other_lump42   other_lump43   other_lump44   other_lump45   other_lump46   other_lump47 )

gen other_lumpr_final=0
replace other_lumpr_final=1 if other_lumpr>1 


gen time_gap_other_lump_final=max(time_gap_other_lump1, time_gap_other_lump2, time_gap_other_lump3, time_gap_other_lump4, time_gap_other_lump5, time_gap_other_lump6, time_gap_other_lump7, time_gap_other_lump8, time_gap_other_lump9, time_gap_other_lump10,time_gap_other_lump11,time_gap_other_lump12,time_gap_other_lump13,time_gap_other_lump14,time_gap_other_lump15,time_gap_other_lump16,time_gap_other_lump17,time_gap_other_lump18,time_gap_other_lump19,time_gap_other_lump20,time_gap_other_lump21,time_gap_other_lump22,time_gap_other_lump23,time_gap_other_lump24, time_gap_other_lump25, time_gap_other_lump26, time_gap_other_lump27, time_gap_other_lump28, time_gap_other_lump29, time_gap_other_lump30, time_gap_other_lump31,time_gap_other_lump32, time_gap_other_lump33,time_gap_other_lump34, time_gap_other_lump35,time_gap_other_lump36, time_gap_other_lump37,time_gap_other_lump38, time_gap_other_lump39, time_gap_other_lump40, time_gap_other_lump41, time_gap_other_lump42, time_gap_other_lump43, time_gap_other_lump44, time_gap_other_lump45, time_gap_other_lump46, time_gap_other_lump47)

gen other_lumpf=0
replace other_lumpf=1 if time_gap_other_lump_final!=.

global n 47
forval x=1/$n {
	drop time_gap_other_lump`x' other_lump`x' effectivedatetime_other_lump`x'
}


//31 wl 



global n 95
forval x=1/$n {
qui gen time_gap_wl_v2`x'=(index_date- effectivedatetime_wl`x')

}

global n 95
forval x=1/$n {
qui replace wl_v2`x'=. if (time_gap_wl_v2`x'<0 | time_gap_wl_v2`x'>182)
qui replace effectivedatetime_wl`x'=. if (time_gap_wl_v2`x'<0 | time_gap_wl_v2`x'>182)
qui replace time_gap_wl_v2`x'=. if (time_gap_wl_v2`x'<0 | time_gap_wl_v2`x'>182)
}

egen wlr=rownonmiss( wl_v21   wl_v22   wl_v23   wl_v24   wl_v25   wl_v26   wl_v27   wl_v28   wl_v29   wl_v210  wl_v211  wl_v212  wl_v213  wl_v214  wl_v215  wl_v216  wl_v217  wl_v218  wl_v219  wl_v220  wl_v221  wl_v222  wl_v223  wl_v224   wl_v225   wl_v226   wl_v227   wl_v228   wl_v229   wl_v230   wl_v231  wl_v232   wl_v233  wl_v234   wl_v235  wl_v236   wl_v237  wl_v238   wl_v239   wl_v240   wl_v241   wl_v242   wl_v243   wl_v244   wl_v245   wl_v246   wl_v247   wl_v248   wl_v249   wl_v250   wl_v251   wl_v252   wl_v253   wl_v254   wl_v255   wl_v256   wl_v257   wl_v258   wl_v259   wl_v260  wl_v261  wl_v262  wl_v263  wl_v264  wl_v265  wl_v266  wl_v267  wl_v268  wl_v269  wl_v270  wl_v271  wl_v272  wl_v273  wl_v274   wl_v275   wl_v276   wl_v277   wl_v278   wl_v279   wl_v280   wl_v281  wl_v282   wl_v283  wl_v284   wl_v285  wl_v286   wl_v287  wl_v288   wl_v289   wl_v290   wl_v291   wl_v292   wl_v293   wl_v294   wl_v295)

gen wlr_final=0
replace wlr_final=1 if wlr>1


gen time_gap_wl_v2_final=max(time_gap_wl_v21, time_gap_wl_v22, time_gap_wl_v23, time_gap_wl_v24, time_gap_wl_v25, time_gap_wl_v26, time_gap_wl_v27, time_gap_wl_v28, time_gap_wl_v29, time_gap_wl_v210,time_gap_wl_v211,time_gap_wl_v212,time_gap_wl_v213,time_gap_wl_v214,time_gap_wl_v215,time_gap_wl_v216,time_gap_wl_v217,time_gap_wl_v218,time_gap_wl_v219,time_gap_wl_v220,time_gap_wl_v221,time_gap_wl_v222,time_gap_wl_v223,time_gap_wl_v224, time_gap_wl_v225, time_gap_wl_v226, time_gap_wl_v227, time_gap_wl_v228, time_gap_wl_v229, time_gap_wl_v230, time_gap_wl_v231,time_gap_wl_v232, time_gap_wl_v233,time_gap_wl_v234, time_gap_wl_v235,time_gap_wl_v236, time_gap_wl_v237,time_gap_wl_v238, time_gap_wl_v239, time_gap_wl_v240, time_gap_wl_v241, time_gap_wl_v242, time_gap_wl_v243, time_gap_wl_v244, time_gap_wl_v245, time_gap_wl_v246, time_gap_wl_v247, time_gap_wl_v248, time_gap_wl_v249, time_gap_wl_v250, time_gap_wl_v251, time_gap_wl_v252, time_gap_wl_v253, time_gap_wl_v254, time_gap_wl_v255, time_gap_wl_v256, time_gap_wl_v257, time_gap_wl_v258, time_gap_wl_v259, time_gap_wl_v260,time_gap_wl_v261,time_gap_wl_v262,time_gap_wl_v263,time_gap_wl_v264,time_gap_wl_v265,time_gap_wl_v266,time_gap_wl_v267,time_gap_wl_v268,time_gap_wl_v269,time_gap_wl_v270,time_gap_wl_v271,time_gap_wl_v272,time_gap_wl_v273,time_gap_wl_v274, time_gap_wl_v275, time_gap_wl_v276, time_gap_wl_v277, time_gap_wl_v278, time_gap_wl_v279, time_gap_wl_v280, time_gap_wl_v281,time_gap_wl_v282, time_gap_wl_v283,time_gap_wl_v284, time_gap_wl_v285,time_gap_wl_v286, time_gap_wl_v287,time_gap_wl_v288, time_gap_wl_v289, time_gap_wl_v290, time_gap_wl_v291, time_gap_wl_v292, time_gap_wl_v293, time_gap_wl_v294, time_gap_wl_v295)


gen wl_v2f=0
replace wl_v2f=1 if time_gap_wl_v2_final!=.

global n 95
forval x=1/$n {
drop time_gap_wl_v2`x' wl_v2`x' effectivedatetime_wl`x'
}

//32 pruritus 



global n 31
forval x=1/$n {
qui gen time_gap_pruritus_v2`x'=(index_date- effectivedatetime_pruritus`x')

}

global n 31
forval x=1/$n {
qui replace pruritus_v2`x'=. if (time_gap_pruritus_v2`x'<0 | time_gap_pruritus_v2`x'>182)
qui replace effectivedatetime_pruritus`x'=. if (time_gap_pruritus_v2`x'<0 | time_gap_pruritus_v2`x'>182)
qui replace time_gap_pruritus_v2`x'=. if (time_gap_pruritus_v2`x'<0 | time_gap_pruritus_v2`x'>182)
}


egen pruritusr=rownonmiss( pruritus_v21   pruritus_v22   pruritus_v23   pruritus_v24   pruritus_v25   pruritus_v26   pruritus_v27   pruritus_v28   pruritus_v29   pruritus_v210  pruritus_v211  pruritus_v212  pruritus_v213  pruritus_v214  pruritus_v215  pruritus_v216  pruritus_v217  pruritus_v218  pruritus_v219  pruritus_v220  pruritus_v221  pruritus_v222  pruritus_v223  pruritus_v224   pruritus_v225   pruritus_v226   pruritus_v227   pruritus_v228   pruritus_v229   pruritus_v230   pruritus_v231)

gen pruritusr_final=0
replace pruritusr_final=1 if pruritusr>1

gen time_gap_pruritus_v2_final=max(time_gap_pruritus_v21, time_gap_pruritus_v22, time_gap_pruritus_v23, time_gap_pruritus_v24, time_gap_pruritus_v25, time_gap_pruritus_v26, time_gap_pruritus_v27, time_gap_pruritus_v28, time_gap_pruritus_v29, time_gap_pruritus_v210,time_gap_pruritus_v211,time_gap_pruritus_v212,time_gap_pruritus_v213,time_gap_pruritus_v214,time_gap_pruritus_v215,time_gap_pruritus_v216,time_gap_pruritus_v217,time_gap_pruritus_v218,time_gap_pruritus_v219,time_gap_pruritus_v220,time_gap_pruritus_v221,time_gap_pruritus_v222,time_gap_pruritus_v223,time_gap_pruritus_v224, time_gap_pruritus_v225, time_gap_pruritus_v226, time_gap_pruritus_v227, time_gap_pruritus_v228, time_gap_pruritus_v229, time_gap_pruritus_v230, time_gap_pruritus_v231)


gen pruritus_v2f=0
replace pruritus_v2f=1 if time_gap_pruritus_v2_final!=.

global n 31
forval x=1/$n {
drop time_gap_pruritus_v2`x' pruritus_v2`x' effectivedatetime_pruritus`x'
}

//33 pap



global n 16
forval x=1/$n {
qui gen time_gap_pap_v2`x'=(index_date- effectivedatetime_pap`x')

}

global n 16
forval x=1/$n {
qui replace pap_v2`x'=. if (time_gap_pap_v2`x'<0 | time_gap_pap_v2`x'>182)
qui replace effectivedatetime_pap`x'=. if (time_gap_pap_v2`x'<0 | time_gap_pap_v2`x'>182)
qui replace time_gap_pap_v2`x'=. if (time_gap_pap_v2`x'<0 | time_gap_pap_v2`x'>182)
}

egen papr=rownonmiss( pap_v21   pap_v22   pap_v23   pap_v24   pap_v25   pap_v26   pap_v27   pap_v28   pap_v29   pap_v210  pap_v211  pap_v212  pap_v213  pap_v214  pap_v215  pap_v216)

gen papr_final=0
replace papr_final=1 if papr>1 


gen time_gap_pap_v2_final=max(time_gap_pap_v21, time_gap_pap_v22, time_gap_pap_v23, time_gap_pap_v24, time_gap_pap_v25, time_gap_pap_v26, time_gap_pap_v27, time_gap_pap_v28, time_gap_pap_v29, time_gap_pap_v210,time_gap_pap_v211,time_gap_pap_v212,time_gap_pap_v213,time_gap_pap_v214,time_gap_pap_v215,time_gap_pap_v216)


gen pap_v2f=0
replace pap_v2f=1 if time_gap_pap_v2_final!=.

global n 16
forval x=1/$n {
drop time_gap_pap_v2`x' pap_v2`x' effectivedatetime_pap`x'
}

//34 macro  



global n 36
forval x=1/$n {
qui gen time_gap_macro_v2`x'=(index_date- effectivedatetime_macro`x')

}

global n 36
forval x=1/$n {
qui replace macro_v2`x'=. if (time_gap_macro_v2`x'<0 | time_gap_macro_v2`x'>182)
qui replace effectivedatetime_macro`x'=. if (time_gap_macro_v2`x'<0 | time_gap_macro_v2`x'>182)
qui replace time_gap_macro_v2`x'=. if (time_gap_macro_v2`x'<0 | time_gap_macro_v2`x'>182)
}

egen macror=rownonmiss( macro_v21   macro_v22   macro_v23   macro_v24   macro_v25   macro_v26   macro_v27   macro_v28   macro_v29   macro_v210  macro_v211  macro_v212  macro_v213  macro_v214  macro_v215  macro_v216  macro_v217  macro_v218  macro_v219  macro_v220  macro_v221  macro_v222  macro_v223  macro_v224   macro_v225   macro_v226   macro_v227   macro_v228   macro_v229   macro_v230   macro_v231  macro_v232   macro_v233  macro_v234   macro_v235  macro_v236)

gen macror_final=0
replace macror_final=1 if macror>1


gen time_gap_macro_v2_final=max(time_gap_macro_v21, time_gap_macro_v22, time_gap_macro_v23, time_gap_macro_v24, time_gap_macro_v25, time_gap_macro_v26, time_gap_macro_v27, time_gap_macro_v28, time_gap_macro_v29, time_gap_macro_v210,time_gap_macro_v211,time_gap_macro_v212,time_gap_macro_v213,time_gap_macro_v214,time_gap_macro_v215,time_gap_macro_v216,time_gap_macro_v217,time_gap_macro_v218,time_gap_macro_v219,time_gap_macro_v220,time_gap_macro_v221,time_gap_macro_v222,time_gap_macro_v223,time_gap_macro_v224, time_gap_macro_v225, time_gap_macro_v226, time_gap_macro_v227, time_gap_macro_v228, time_gap_macro_v229, time_gap_macro_v230, time_gap_macro_v231,time_gap_macro_v232, time_gap_macro_v233,time_gap_macro_v234, time_gap_macro_v235,time_gap_macro_v236)


gen macro_v2f=0
replace macro_v2f=1 if time_gap_macro_v2_final!=.

global n 36
forval x=1/$n {
drop time_gap_macro_v2`x' macro_v2`x' effectivedatetime_macro`x'
}

//35 hemi_v2   



global n 100
forval x=1/$n {
qui gen time_gap_hemi_v2`x'=(index_date- effectivedatetime_hemi`x')

}

global n 100
forval x=1/$n {
qui replace hemi_v2`x'=. if (time_gap_hemi_v2`x'<0 | time_gap_hemi_v2`x'>182)
qui replace effectivedatetime_hemi`x'=. if (time_gap_hemi_v2`x'<0 | time_gap_hemi_v2`x'>182)
qui replace time_gap_hemi_v2`x'=. if (time_gap_hemi_v2`x'<0 | time_gap_hemi_v2`x'>182)
}

egen hemir=rownonmiss( hemi_v21   hemi_v22   hemi_v23   hemi_v24   hemi_v25   hemi_v26   hemi_v27   hemi_v28   hemi_v29   hemi_v210  hemi_v211  hemi_v212  hemi_v213  hemi_v214  hemi_v215  hemi_v216  hemi_v217  hemi_v218  hemi_v219  hemi_v220  hemi_v221  hemi_v222  hemi_v223  hemi_v224   hemi_v225   hemi_v226   hemi_v227   hemi_v228   hemi_v229   hemi_v230   hemi_v231  hemi_v232   hemi_v233  hemi_v234   hemi_v235  hemi_v236   hemi_v237  hemi_v238   hemi_v239   hemi_v240   hemi_v241   hemi_v242   hemi_v243   hemi_v244   hemi_v245   hemi_v246   hemi_v247   hemi_v248   hemi_v249   hemi_v250   hemi_v251   hemi_v252   hemi_v253   hemi_v254   hemi_v255   hemi_v256   hemi_v257   hemi_v258   hemi_v259   hemi_v260  hemi_v261  hemi_v262  hemi_v263  hemi_v264  hemi_v265  hemi_v266  hemi_v267  hemi_v268  hemi_v269  hemi_v270  hemi_v271  hemi_v272  hemi_v273  hemi_v274   hemi_v275   hemi_v276   hemi_v277   hemi_v278   hemi_v279   hemi_v280   hemi_v281  hemi_v282   hemi_v283  hemi_v284   hemi_v285  hemi_v286   hemi_v287  hemi_v288   hemi_v289   hemi_v290   hemi_v291   hemi_v292   hemi_v293   hemi_v299   hemi_v295   hemi_v296   hemi_v297   hemi_v298   hemi_v299   hemi_v2100)

gen hemir_final=0
replace hemir_final=1 if hemir>1 


gen time_gap_hemi_v2_final=max(time_gap_hemi_v21, time_gap_hemi_v22, time_gap_hemi_v23, time_gap_hemi_v24, time_gap_hemi_v25, time_gap_hemi_v26, time_gap_hemi_v27, time_gap_hemi_v28, time_gap_hemi_v29, time_gap_hemi_v210,time_gap_hemi_v211,time_gap_hemi_v212,time_gap_hemi_v213,time_gap_hemi_v214,time_gap_hemi_v215,time_gap_hemi_v216,time_gap_hemi_v217,time_gap_hemi_v218,time_gap_hemi_v219,time_gap_hemi_v220,time_gap_hemi_v221,time_gap_hemi_v222,time_gap_hemi_v223,time_gap_hemi_v224, time_gap_hemi_v225, time_gap_hemi_v226, time_gap_hemi_v227, time_gap_hemi_v228, time_gap_hemi_v229, time_gap_hemi_v230, time_gap_hemi_v231,time_gap_hemi_v232, time_gap_hemi_v233,time_gap_hemi_v234, time_gap_hemi_v235,time_gap_hemi_v236, time_gap_hemi_v237,time_gap_hemi_v238, time_gap_hemi_v239, time_gap_hemi_v240, time_gap_hemi_v241, time_gap_hemi_v242, time_gap_hemi_v243, time_gap_hemi_v244, time_gap_hemi_v245, time_gap_hemi_v246, time_gap_hemi_v247, time_gap_hemi_v248, time_gap_hemi_v249, time_gap_hemi_v250, time_gap_hemi_v251, time_gap_hemi_v252, time_gap_hemi_v253, time_gap_hemi_v254, time_gap_hemi_v255, time_gap_hemi_v256, time_gap_hemi_v257, time_gap_hemi_v258, time_gap_hemi_v259, time_gap_hemi_v260,time_gap_hemi_v261,time_gap_hemi_v262,time_gap_hemi_v263,time_gap_hemi_v264,time_gap_hemi_v265,time_gap_hemi_v266,time_gap_hemi_v267,time_gap_hemi_v268,time_gap_hemi_v269,time_gap_hemi_v270,time_gap_hemi_v271,time_gap_hemi_v272,time_gap_hemi_v273,time_gap_hemi_v274, time_gap_hemi_v275, time_gap_hemi_v276, time_gap_hemi_v277, time_gap_hemi_v278, time_gap_hemi_v279, time_gap_hemi_v280, time_gap_hemi_v281,time_gap_hemi_v282, time_gap_hemi_v283,time_gap_hemi_v284, time_gap_hemi_v285,time_gap_hemi_v286, time_gap_hemi_v287,time_gap_hemi_v288, time_gap_hemi_v289, time_gap_hemi_v290, time_gap_hemi_v291, time_gap_hemi_v292, time_gap_hemi_v293, time_gap_hemi_v299, time_gap_hemi_v295, time_gap_hemi_v296, time_gap_hemi_v297, time_gap_hemi_v298, time_gap_hemi_v299, time_gap_hemi_v2100)


gen hemi_v2f=0
replace hemi_v2f=1 if time_gap_hemi_v2_final!=.

global n 100
forval x=1/$n {
drop time_gap_hemi_v2`x' hemi_v2`x' effectivedatetime_hemi`x'
}


//36 hemipa  



global n 104
forval x=1/$n {
qui gen time_gap_hemipa_v2`x'=(index_date- effectivedatetime_hemipa`x')

}

global n 104
forval x=1/$n {
qui replace hemipa_v2`x'=. if (time_gap_hemipa_v2`x'<0 | time_gap_hemipa_v2`x'>182)
qui replace effectivedatetime_hemipa`x'=. if (time_gap_hemipa_v2`x'<0 | time_gap_hemipa_v2`x'>182)
qui replace time_gap_hemipa_v2`x'=. if (time_gap_hemipa_v2`x'<0 | time_gap_hemipa_v2`x'>182)
}

egen hemipar=rownonmiss( hemipa_v21   hemipa_v22   hemipa_v23   hemipa_v24   hemipa_v25   hemipa_v26   hemipa_v27   hemipa_v28   hemipa_v29   hemipa_v210  hemipa_v211  hemipa_v212  hemipa_v213  hemipa_v214  hemipa_v215  hemipa_v216  hemipa_v217  hemipa_v218  hemipa_v219  hemipa_v220  hemipa_v221  hemipa_v222  hemipa_v223  hemipa_v224   hemipa_v225   hemipa_v226   hemipa_v227   hemipa_v228   hemipa_v229   hemipa_v230   hemipa_v231  hemipa_v232   hemipa_v233  hemipa_v234   hemipa_v235  hemipa_v236   hemipa_v237  hemipa_v238   hemipa_v239   hemipa_v240   hemipa_v241   hemipa_v242   hemipa_v243   hemipa_v244   hemipa_v245   hemipa_v246   hemipa_v247   hemipa_v248   hemipa_v249   hemipa_v250   hemipa_v251   hemipa_v252   hemipa_v253   hemipa_v254   hemipa_v255   hemipa_v256   hemipa_v257   hemipa_v258   hemipa_v259   hemipa_v260  hemipa_v261  hemipa_v262  hemipa_v263  hemipa_v264  hemipa_v265  hemipa_v266  hemipa_v267  hemipa_v268  hemipa_v269  hemipa_v270  hemipa_v271  hemipa_v272  hemipa_v273  hemipa_v274   hemipa_v275   hemipa_v276   hemipa_v277   hemipa_v278   hemipa_v279   hemipa_v280   hemipa_v281  hemipa_v282   hemipa_v283  hemipa_v284   hemipa_v285  hemipa_v286   hemipa_v287  hemipa_v288   hemipa_v289   hemipa_v290   hemipa_v291   hemipa_v292   hemipa_v293   hemipa_v299   hemipa_v295   hemipa_v296   hemipa_v297   hemipa_v298   hemipa_v299   hemipa_v2100   hemipa_v2101   hemipa_v2102   hemipa_v2103   hemipa_v2104)

gen hemipar_final=0
replace hemipar_final=1 if hemipar>1


gen time_gap_hemipa_v2_final=max(time_gap_hemipa_v21, time_gap_hemipa_v22, time_gap_hemipa_v23, time_gap_hemipa_v24, time_gap_hemipa_v25, time_gap_hemipa_v26, time_gap_hemipa_v27, time_gap_hemipa_v28, time_gap_hemipa_v29, time_gap_hemipa_v210,time_gap_hemipa_v211,time_gap_hemipa_v212,time_gap_hemipa_v213,time_gap_hemipa_v214,time_gap_hemipa_v215,time_gap_hemipa_v216,time_gap_hemipa_v217,time_gap_hemipa_v218,time_gap_hemipa_v219,time_gap_hemipa_v220,time_gap_hemipa_v221,time_gap_hemipa_v222,time_gap_hemipa_v223,time_gap_hemipa_v224, time_gap_hemipa_v225, time_gap_hemipa_v226, time_gap_hemipa_v227, time_gap_hemipa_v228, time_gap_hemipa_v229, time_gap_hemipa_v230, time_gap_hemipa_v231,time_gap_hemipa_v232, time_gap_hemipa_v233,time_gap_hemipa_v234, time_gap_hemipa_v235,time_gap_hemipa_v236, time_gap_hemipa_v237,time_gap_hemipa_v238, time_gap_hemipa_v239, time_gap_hemipa_v240, time_gap_hemipa_v241, time_gap_hemipa_v242, time_gap_hemipa_v243, time_gap_hemipa_v244, time_gap_hemipa_v245, time_gap_hemipa_v246, time_gap_hemipa_v247, time_gap_hemipa_v248, time_gap_hemipa_v249, time_gap_hemipa_v250, time_gap_hemipa_v251, time_gap_hemipa_v252, time_gap_hemipa_v253, time_gap_hemipa_v254, time_gap_hemipa_v255, time_gap_hemipa_v256, time_gap_hemipa_v257, time_gap_hemipa_v258, time_gap_hemipa_v259, time_gap_hemipa_v260,time_gap_hemipa_v261,time_gap_hemipa_v262,time_gap_hemipa_v263,time_gap_hemipa_v264,time_gap_hemipa_v265,time_gap_hemipa_v266,time_gap_hemipa_v267,time_gap_hemipa_v268,time_gap_hemipa_v269,time_gap_hemipa_v270,time_gap_hemipa_v271,time_gap_hemipa_v272,time_gap_hemipa_v273,time_gap_hemipa_v274, time_gap_hemipa_v275, time_gap_hemipa_v276, time_gap_hemipa_v277, time_gap_hemipa_v278, time_gap_hemipa_v279, time_gap_hemipa_v280, time_gap_hemipa_v281,time_gap_hemipa_v282, time_gap_hemipa_v283,time_gap_hemipa_v284, time_gap_hemipa_v285,time_gap_hemipa_v286, time_gap_hemipa_v287,time_gap_hemipa_v288, time_gap_hemipa_v289, time_gap_hemipa_v290, time_gap_hemipa_v291, time_gap_hemipa_v292, time_gap_hemipa_v293, time_gap_hemipa_v299, time_gap_hemipa_v295, time_gap_hemipa_v296, time_gap_hemipa_v297, time_gap_hemipa_v298, time_gap_hemipa_v299, time_gap_hemipa_v2100, time_gap_hemipa_v2101, time_gap_hemipa_v2102, time_gap_hemipa_v2103, time_gap_hemipa_v2104)


gen hemipa_v2f=0
replace hemipa_v2f=1 if time_gap_hemipa_v2_final!=.

global n 104
forval x=1/$n {
drop time_gap_hemipa_v2`x' hemipa_v2`x' effectivedatetime_hemipa`x'
}


//37 torticollis 



global n 62
forval x=1/$n {
qui gen time_gap_tort_v2`x'=(index_date- effectivedatetime_tort`x')

}

global n 62
forval x=1/$n {
qui replace tort_v2`x'=. if (time_gap_tort_v2`x'<0 | time_gap_tort_v2`x'>182)
qui replace effectivedatetime_tort`x'=. if (time_gap_tort_v2`x'<0 | time_gap_tort_v2`x'>182)
qui replace time_gap_tort_v2`x'=. if (time_gap_tort_v2`x'<0 | time_gap_tort_v2`x'>182)
}


egen tortr=rownonmiss( tort_v21   tort_v22   tort_v23   tort_v24   tort_v25   tort_v26   tort_v27   tort_v28   tort_v29   tort_v210  tort_v211  tort_v212  tort_v213  tort_v214  tort_v215  tort_v216  tort_v217  tort_v218  tort_v219  tort_v220  tort_v221  tort_v222  tort_v223  tort_v224   tort_v225   tort_v226   tort_v227   tort_v228   tort_v229   tort_v230   tort_v231  tort_v232   tort_v233  tort_v234   tort_v235  tort_v236   tort_v237  tort_v238   tort_v239   tort_v240   tort_v241   tort_v242   tort_v243   tort_v244   tort_v245   tort_v246   tort_v247   tort_v248   tort_v249   tort_v250   tort_v251   tort_v252   tort_v253   tort_v254   tort_v255   tort_v256   tort_v257   tort_v258   tort_v259   tort_v260  tort_v261  tort_v262)

gen tortr_final=0
replace tortr_final=1 if tortr>1


gen time_gap_tort_v2_final=max(time_gap_tort_v21, time_gap_tort_v22, time_gap_tort_v23, time_gap_tort_v24, time_gap_tort_v25, time_gap_tort_v26, time_gap_tort_v27, time_gap_tort_v28, time_gap_tort_v29, time_gap_tort_v210,time_gap_tort_v211,time_gap_tort_v212,time_gap_tort_v213,time_gap_tort_v214,time_gap_tort_v215,time_gap_tort_v216,time_gap_tort_v217,time_gap_tort_v218,time_gap_tort_v219,time_gap_tort_v220,time_gap_tort_v221,time_gap_tort_v222,time_gap_tort_v223,time_gap_tort_v224, time_gap_tort_v225, time_gap_tort_v226, time_gap_tort_v227, time_gap_tort_v228, time_gap_tort_v229, time_gap_tort_v230, time_gap_tort_v231,time_gap_tort_v232, time_gap_tort_v233,time_gap_tort_v234, time_gap_tort_v235,time_gap_tort_v236, time_gap_tort_v237,time_gap_tort_v238, time_gap_tort_v239, time_gap_tort_v240, time_gap_tort_v241, time_gap_tort_v242, time_gap_tort_v243, time_gap_tort_v244, time_gap_tort_v245, time_gap_tort_v246, time_gap_tort_v247, time_gap_tort_v248, time_gap_tort_v249, time_gap_tort_v250, time_gap_tort_v251, time_gap_tort_v252, time_gap_tort_v253, time_gap_tort_v254, time_gap_tort_v255, time_gap_tort_v256, time_gap_tort_v257, time_gap_tort_v258, time_gap_tort_v259, time_gap_tort_v260,time_gap_tort_v261,time_gap_tort_v262)


gen tort_v2f=0
replace tort_v2f=1 if time_gap_tort_v2_final!=.

global n 62
forval x=1/$n {
drop time_gap_tort_v2`x' tort_v2`x' effectivedatetime_tort`x'
}



//38 squint


global n 38
forval x=1/$n {
qui gen time_gap_squint_v2`x'=(index_date- effectivedatetime_squint`x')

}

global n 38
forval x=1/$n {
qui replace squint_v2`x'=. if (time_gap_squint_v2`x'<0 | time_gap_squint_v2`x'>182)
qui replace effectivedatetime_squint`x'=. if (time_gap_squint_v2`x'<0 | time_gap_squint_v2`x'>182)
qui replace time_gap_squint_v2`x'=. if (time_gap_squint_v2`x'<0 | time_gap_squint_v2`x'>182)
}


egen squintr=rownonmiss( squint_v21   squint_v22   squint_v23   squint_v24   squint_v25   squint_v26   squint_v27   squint_v28   squint_v29   squint_v210  squint_v211  squint_v212  squint_v213  squint_v214  squint_v215  squint_v216  squint_v217  squint_v218  squint_v219  squint_v220  squint_v221  squint_v222  squint_v223  squint_v224   squint_v225   squint_v226   squint_v227   squint_v228   squint_v229   squint_v230   squint_v231  squint_v232   squint_v233  squint_v234   squint_v235  squint_v236   squint_v237  squint_v238)

gen squintr_final=0
replace squintr_final=1 if squintr>1

gen time_gap_squint_v2_final=max(time_gap_squint_v21, time_gap_squint_v22, time_gap_squint_v23, time_gap_squint_v24, time_gap_squint_v25, time_gap_squint_v26, time_gap_squint_v27, time_gap_squint_v28, time_gap_squint_v29, time_gap_squint_v210,time_gap_squint_v211,time_gap_squint_v212,time_gap_squint_v213,time_gap_squint_v214,time_gap_squint_v215,time_gap_squint_v216,time_gap_squint_v217,time_gap_squint_v218,time_gap_squint_v219,time_gap_squint_v220,time_gap_squint_v221,time_gap_squint_v222,time_gap_squint_v223,time_gap_squint_v224, time_gap_squint_v225, time_gap_squint_v226, time_gap_squint_v227, time_gap_squint_v228, time_gap_squint_v229, time_gap_squint_v230, time_gap_squint_v231,time_gap_squint_v232, time_gap_squint_v233,time_gap_squint_v234, time_gap_squint_v235,time_gap_squint_v236, time_gap_squint_v237,time_gap_squint_v238)


gen squint_v2f=0
replace squint_v2f=1 if time_gap_squint_v2_final!=.

global n 38
forval x=1/$n {
drop time_gap_squint_v2`x' squint_v2`x' effectivedatetime_squint`x'
}



//39 eye movements



global n 29
forval x=1/$n {
qui gen time_gap_eye`x'=(index_date- effectivedatetime_eyem`x')

}

global n 29
forval x=1/$n {
qui replace eye`x'=. if (time_gap_eye`x'<0 | time_gap_eye`x'>182)
qui replace effectivedatetime_eyem`x'=. if (time_gap_eye`x'<0 | time_gap_eye`x'>182)
qui replace time_gap_eye`x'=. if (time_gap_eye`x'<0 | time_gap_eye`x'>182)
}


egen eyer=rownonmiss( eye1   eye2   eye3   eye4   eye5   eye6   eye7   eye8   eye9   eye10  eye11  eye12  eye13  eye14  eye15  eye16  eye17  eye18  eye19  eye20  eye21  eye22  eye23  eye24   eye25   eye26   eye27   eye28   eye29)

gen eyer_final=0
replace eyer_final=1 if eyer>1

gen time_gap_eye_final=max(time_gap_eye1, time_gap_eye2, time_gap_eye3, time_gap_eye4, time_gap_eye5, time_gap_eye6, time_gap_eye7, time_gap_eye8, time_gap_eye9, time_gap_eye10,time_gap_eye11,time_gap_eye12,time_gap_eye13,time_gap_eye14,time_gap_eye15,time_gap_eye16,time_gap_eye17,time_gap_eye18,time_gap_eye19,time_gap_eye20,time_gap_eye21,time_gap_eye22,time_gap_eye23,time_gap_eye24, time_gap_eye25, time_gap_eye26, time_gap_eye27, time_gap_eye28, time_gap_eye29)


gen eyef=0
replace eyef=1 if time_gap_eye_final!=.

global n 29
forval x=1/$n {
drop time_gap_eye`x' eye`x' effectivedatetime_eyem`x'
}



//40 acuity 



global n 73
forval x=1/$n {
qui gen time_gap_acuity`x'=(index_date- effectivedatetime_acuity`x')

}

global n 73
forval x=1/$n {
qui replace acuity`x'=. if (time_gap_acuity`x'<0 | time_gap_acuity`x'>182)
qui replace effectivedatetime_acuity`x'=. if (time_gap_acuity`x'<0 | time_gap_acuity`x'>182)
qui replace time_gap_acuity`x'=. if (time_gap_acuity`x'<0 | time_gap_acuity`x'>182)
}

egen acuityr=rownonmiss( acuity1   acuity2   acuity3   acuity4   acuity5   acuity6   acuity7   acuity8   acuity9   acuity10  acuity11  acuity12  acuity13  acuity14  acuity15  acuity16  acuity17  acuity18  acuity19  acuity20  acuity21  acuity22  acuity23  acuity24   acuity25   acuity26   acuity27   acuity28   acuity29   acuity30   acuity31  acuity32   acuity33  acuity34   acuity35  acuity36   acuity37  acuity38   acuity39   acuity40   acuity41   acuity42   acuity43   acuity44   acuity45   acuity46   acuity47   acuity48   acuity49   acuity50   acuity51   acuity52   acuity53   acuity54   acuity55   acuity56   acuity57   acuity58   acuity59   acuity60  acuity61  acuity62  acuity63  acuity64  acuity65  acuity66  acuity67  acuity68  acuity69  acuity70  acuity71  acuity72  acuity73)

gen acuityr_final=0
replace acuityr_final=1 if acuityr>1


gen time_gap_acuity_final=max(time_gap_acuity1, time_gap_acuity2, time_gap_acuity3, time_gap_acuity4, time_gap_acuity5, time_gap_acuity6, time_gap_acuity7, time_gap_acuity8, time_gap_acuity9, time_gap_acuity10,time_gap_acuity11,time_gap_acuity12,time_gap_acuity13,time_gap_acuity14,time_gap_acuity15,time_gap_acuity16,time_gap_acuity17,time_gap_acuity18,time_gap_acuity19,time_gap_acuity20,time_gap_acuity21,time_gap_acuity22,time_gap_acuity23,time_gap_acuity24, time_gap_acuity25, time_gap_acuity26, time_gap_acuity27, time_gap_acuity28, time_gap_acuity29, time_gap_acuity30, time_gap_acuity31,time_gap_acuity32, time_gap_acuity33,time_gap_acuity34, time_gap_acuity35,time_gap_acuity36, time_gap_acuity37,time_gap_acuity38, time_gap_acuity39, time_gap_acuity40, time_gap_acuity41, time_gap_acuity42, time_gap_acuity43, time_gap_acuity44, time_gap_acuity45, time_gap_acuity46, time_gap_acuity47, time_gap_acuity48, time_gap_acuity49, time_gap_acuity50, time_gap_acuity51, time_gap_acuity52, time_gap_acuity53, time_gap_acuity54, time_gap_acuity55, time_gap_acuity56, time_gap_acuity57, time_gap_acuity58, time_gap_acuity59, time_gap_acuity60,time_gap_acuity61,time_gap_acuity62,time_gap_acuity63,time_gap_acuity64,time_gap_acuity65,time_gap_acuity66,time_gap_acuity67,time_gap_acuity68,time_gap_acuity69,time_gap_acuity70,time_gap_acuity71,time_gap_acuity72,time_gap_acuity73)


gen acuityf=0
replace acuityf=1 if time_gap_acuity_final!=.

global n 73
forval x=1/$n {
drop time_gap_acuity`x' acuity`x' effectivedatetime_acuity`x'
}


//41 diplopia



global n 16
forval x=1/$n {
qui gen time_gap_diplopia`x'=(index_date- effectivedatetime_diplopia`x')

}

global n 16
forval x=1/$n {
qui replace diplopia`x'=. if (time_gap_diplopia`x'<0 | time_gap_diplopia`x'>182)
qui replace effectivedatetime_diplopia`x'=. if (time_gap_diplopia`x'<0 | time_gap_diplopia`x'>182)
qui replace time_gap_diplopia`x'=. if (time_gap_diplopia`x'<0 | time_gap_diplopia`x'>182)
}


egen diplopiar=rownonmiss( diplopia1   diplopia2   diplopia3   diplopia4   diplopia5   diplopia6   diplopia7   diplopia8   diplopia9   diplopia10  diplopia11  diplopia12  diplopia13  diplopia14  diplopia15  diplopia16)

gen diplopiar_final=0
replace diplopiar_final=1 if diplopiar>1

gen time_gap_diplopia_final=max(time_gap_diplopia1, time_gap_diplopia2, time_gap_diplopia3, time_gap_diplopia4, time_gap_diplopia5, time_gap_diplopia6, time_gap_diplopia7, time_gap_diplopia8, time_gap_diplopia9, time_gap_diplopia10,time_gap_diplopia11,time_gap_diplopia12,time_gap_diplopia13,time_gap_diplopia14,time_gap_diplopia15,time_gap_diplopia16)


gen diplopiaf=0
replace diplopiaf=1 if time_gap_diplopia_final!=.

global n 16
forval x=1/$n {
drop time_gap_diplopia`x' diplopia`x' effectivedatetime_diplopia`x'
}


//40 exopthalmos 



global n 7
forval x=1/$n {
qui gen time_gap_exopthalmos`x'=(index_date- effectivedatetime_exopthalmos`x')

}

global n 7
forval x=1/$n {
qui replace exopthalmos`x'=. if (time_gap_exopthalmos`x'<0 | time_gap_exopthalmos`x'>182)
qui replace effectivedatetime_exopthalmos`x'=. if (time_gap_exopthalmos`x'<0 | time_gap_exopthalmos`x'>182)
qui replace time_gap_exopthalmos`x'=. if (time_gap_exopthalmos`x'<0 | time_gap_exopthalmos`x'>182)
}


egen exopthalmosr=rownonmiss( exopthalmos1   exopthalmos2   exopthalmos3   exopthalmos4   exopthalmos5   exopthalmos6   exopthalmos7)

gen exopthalmosr_final=0
replace exopthalmosr_final=1 if exopthalmosr>1 

gen time_gap_exopthalmos_final=max(time_gap_exopthalmos1, time_gap_exopthalmos2, time_gap_exopthalmos3, time_gap_exopthalmos4, time_gap_exopthalmos5, time_gap_exopthalmos6, time_gap_exopthalmos7)


gen exopthalmosf=0
replace exopthalmosf=1 if time_gap_exopthalmos_final!=.

global n 7
forval x=1/$n {
drop time_gap_exopthalmos`x' exopthalmos`x' effectivedatetime_exopthalmos`x'
}

//42 behaviour 



global n 132
forval x=1/$n {
qui gen time_gap_behaviour`x'=(index_date- effectivedatetime_behaviour`x')

}

global n 132
forval x=1/$n {
qui replace behaviour`x'=. if (time_gap_behaviour`x'<0 | time_gap_behaviour`x'>182)
qui replace effectivedatetime_behaviour`x'=. if (time_gap_behaviour`x'<0 | time_gap_behaviour`x'>182)
qui replace time_gap_behaviour`x'=. if (time_gap_behaviour`x'<0 | time_gap_behaviour`x'>182)
}

egen behaviour_r=rownonmiss( behaviour1   behaviour2   behaviour3   behaviour4   behaviour5   behaviour6   behaviour7   behaviour8   behaviour9   behaviour10  behaviour11  behaviour12  behaviour13  behaviour14  behaviour15  behaviour16  behaviour17  behaviour18  behaviour19  behaviour20  behaviour21  behaviour22  behaviour23  behaviour24   behaviour25   behaviour26   behaviour27   behaviour28   behaviour29   behaviour30   behaviour31  behaviour32   behaviour33  behaviour34   behaviour35  behaviour36   behaviour37  behaviour38   behaviour39   behaviour40   behaviour41   behaviour42   behaviour43   behaviour44   behaviour45   behaviour46   behaviour47   behaviour48   behaviour49   behaviour50   behaviour51   behaviour52   behaviour53   behaviour54   behaviour55   behaviour56   behaviour57   behaviour58   behaviour59   behaviour60  behaviour61  behaviour62  behaviour63  behaviour64  behaviour65  behaviour66  behaviour67  behaviour68  behaviour69  behaviour70  behaviour71  behaviour72  behaviour73  behaviour74   behaviour75   behaviour76   behaviour77   behaviour78   behaviour79   behaviour80   behaviour81  behaviour82   behaviour83  behaviour84   behaviour85  behaviour86   behaviour87  behaviour88   behaviour89   behaviour90   behaviour91   behaviour92   behaviour93   behaviour99   behaviour95   behaviour96   behaviour97   behaviour98   behaviour99   behaviour100   behaviour101   behaviour102   behaviour103   behaviour104   behaviour105   behaviour106   behaviour107   behaviour108   behaviour109   behaviour110  behaviour111  behaviour112  behaviour113  behaviour114  behaviour115  behaviour116  behaviour117  behaviour118  behaviour119  behaviour120  behaviour121  behaviour122  behaviour123  behaviour124   behaviour125    behaviour126   behaviour127   behaviour128   behaviour129   behaviour130   behaviour131  behaviour132)

gen behaviour_r_final=0
replace behaviour_r_final=1 if behaviour_r>1


gen time_gap_behaviour_final=max(time_gap_behaviour1, time_gap_behaviour2, time_gap_behaviour3, time_gap_behaviour4, time_gap_behaviour5, time_gap_behaviour6, time_gap_behaviour7, time_gap_behaviour8, time_gap_behaviour9, time_gap_behaviour10,time_gap_behaviour11,time_gap_behaviour12,time_gap_behaviour13,time_gap_behaviour14,time_gap_behaviour15,time_gap_behaviour16,time_gap_behaviour17,time_gap_behaviour18,time_gap_behaviour19,time_gap_behaviour20,time_gap_behaviour21,time_gap_behaviour22,time_gap_behaviour23,time_gap_behaviour24, time_gap_behaviour25, time_gap_behaviour26, time_gap_behaviour27, time_gap_behaviour28, time_gap_behaviour29, time_gap_behaviour30, time_gap_behaviour31,time_gap_behaviour32, time_gap_behaviour33,time_gap_behaviour34, time_gap_behaviour35,time_gap_behaviour36, time_gap_behaviour37,time_gap_behaviour38, time_gap_behaviour39, time_gap_behaviour40, time_gap_behaviour41, time_gap_behaviour42, time_gap_behaviour43, time_gap_behaviour44, time_gap_behaviour45, time_gap_behaviour46, time_gap_behaviour47, time_gap_behaviour48, time_gap_behaviour49, time_gap_behaviour50, time_gap_behaviour51, time_gap_behaviour52, time_gap_behaviour53, time_gap_behaviour54, time_gap_behaviour55, time_gap_behaviour56, time_gap_behaviour57, time_gap_behaviour58, time_gap_behaviour59, time_gap_behaviour60,time_gap_behaviour61,time_gap_behaviour62,time_gap_behaviour63,time_gap_behaviour64,time_gap_behaviour65,time_gap_behaviour66,time_gap_behaviour67,time_gap_behaviour68,time_gap_behaviour69,time_gap_behaviour70,time_gap_behaviour71,time_gap_behaviour72,time_gap_behaviour73,time_gap_behaviour74, time_gap_behaviour75, time_gap_behaviour76, time_gap_behaviour77, time_gap_behaviour78, time_gap_behaviour79, time_gap_behaviour80, time_gap_behaviour81,time_gap_behaviour82, time_gap_behaviour83,time_gap_behaviour84, time_gap_behaviour85,time_gap_behaviour86, time_gap_behaviour87,time_gap_behaviour88, time_gap_behaviour89, time_gap_behaviour90, time_gap_behaviour91, time_gap_behaviour92, time_gap_behaviour93, time_gap_behaviour99, time_gap_behaviour95, time_gap_behaviour96, time_gap_behaviour97, time_gap_behaviour98, time_gap_behaviour99, time_gap_behaviour100, time_gap_behaviour101, time_gap_behaviour102, time_gap_behaviour103, time_gap_behaviour104, time_gap_behaviour105, time_gap_behaviour106, time_gap_behaviour107, time_gap_behaviour108, time_gap_behaviour109, time_gap_behaviour110,time_gap_behaviour111,time_gap_behaviour112,time_gap_behaviour113,time_gap_behaviour114,time_gap_behaviour115,time_gap_behaviour116,time_gap_behaviour117,time_gap_behaviour118,time_gap_behaviour119,time_gap_behaviour120,time_gap_behaviour121,time_gap_behaviour122,time_gap_behaviour123,time_gap_behaviour124, time_gap_behaviour125,  time_gap_behaviour126, time_gap_behaviour127, time_gap_behaviour128, time_gap_behaviour129, time_gap_behaviour130, time_gap_behaviour131,time_gap_behaviour132)

gen behaviourf=0
replace behaviourf=1 if time_gap_behaviour_final!=.

global n 132
forval x=1/$n {
drop time_gap_behaviour`x' behaviour`x' effectivedatetime_behaviour`x'
}


//43 irritability 



global n 68
forval x=1/$n {
qui gen time_gap_irritability`x'=(index_date- effectivedatetime_irritability`x')

}

global n 68
forval x=1/$n {
qui replace irritability`x'=. if (time_gap_irritability`x'<0 | time_gap_irritability`x'>182)
qui replace effectivedatetime_irritability`x'=. if (time_gap_irritability`x'<0 | time_gap_irritability`x'>182)
qui replace time_gap_irritability`x'=. if (time_gap_irritability`x'<0 | time_gap_irritability`x'>182)
}

egen irritabilityr=rownonmiss( irritability1   irritability2   irritability3   irritability4   irritability5   irritability6   irritability7   irritability8   irritability9   irritability10  irritability11  irritability12  irritability13  irritability14  irritability15  irritability16  irritability17  irritability18  irritability19  irritability20  irritability21  irritability22  irritability23  irritability24   irritability25   irritability26   irritability27   irritability28   irritability29   irritability30   irritability31  irritability32   irritability33  irritability34   irritability35  irritability36   irritability37  irritability38   irritability39   irritability40   irritability41   irritability42   irritability43   irritability44   irritability45   irritability46   irritability47   irritability48   irritability49   irritability50   irritability51   irritability52   irritability53   irritability54   irritability55   irritability56   irritability57   irritability58   irritability59   irritability60  irritability61  irritability62  irritability63  irritability64  irritability65  irritability66  irritability67  irritability68)

gen irritabilityr_final=0
replace irritabilityr_final=1 if irritabilityr>1


gen time_gap_irritability_final=max(time_gap_irritability1, time_gap_irritability2, time_gap_irritability3, time_gap_irritability4, time_gap_irritability5, time_gap_irritability6, time_gap_irritability7, time_gap_irritability8, time_gap_irritability9, time_gap_irritability10,time_gap_irritability11,time_gap_irritability12,time_gap_irritability13,time_gap_irritability14,time_gap_irritability15,time_gap_irritability16,time_gap_irritability17,time_gap_irritability18,time_gap_irritability19,time_gap_irritability20,time_gap_irritability21,time_gap_irritability22,time_gap_irritability23,time_gap_irritability24, time_gap_irritability25, time_gap_irritability26, time_gap_irritability27, time_gap_irritability28, time_gap_irritability29, time_gap_irritability30, time_gap_irritability31,time_gap_irritability32, time_gap_irritability33,time_gap_irritability34, time_gap_irritability35,time_gap_irritability36, time_gap_irritability37,time_gap_irritability38, time_gap_irritability39, time_gap_irritability40, time_gap_irritability41, time_gap_irritability42, time_gap_irritability43, time_gap_irritability44, time_gap_irritability45, time_gap_irritability46, time_gap_irritability47, time_gap_irritability48, time_gap_irritability49, time_gap_irritability50, time_gap_irritability51, time_gap_irritability52, time_gap_irritability53, time_gap_irritability54, time_gap_irritability55, time_gap_irritability56, time_gap_irritability57, time_gap_irritability58, time_gap_irritability59, time_gap_irritability60,time_gap_irritability61,time_gap_irritability62,time_gap_irritability63,time_gap_irritability64,time_gap_irritability65,time_gap_irritability66,time_gap_irritability67,time_gap_irritability68)

gen irritabilityf=0
replace irritabilityf=1 if time_gap_irritability_final!=.

global n 68
forval x=1/$n {
drop time_gap_irritability`x' irritability`x' effectivedatetime_irritability`x'
}

//45 delay



global n 102
forval x=1/$n {
qui gen time_gap_delay`x'=(index_date- effectivedatetime_delay`x')

}

global n 102
forval x=1/$n {
qui replace delay`x'=. if (time_gap_delay`x'<0 | time_gap_delay`x'>182)
qui replace effectivedatetime_delay`x'=. if (time_gap_delay`x'<0 | time_gap_delay`x'>182)
qui replace time_gap_delay`x'=. if (time_gap_delay`x'<0 | time_gap_delay`x'>182)
}

egen delayr=rownonmiss( delay1   delay2   delay3   delay4   delay5   delay6   delay7   delay8   delay9   delay10  delay11  delay12  delay13  delay14  delay15  delay16  delay17  delay18  delay19  delay20  delay21  delay22  delay23  delay24   delay25   delay26   delay27   delay28   delay29   delay30   delay31  delay32   delay33  delay34   delay35  delay36   delay37  delay38   delay39   delay40   delay41   delay42   delay43   delay44   delay45   delay46   delay47   delay48   delay49   delay50   delay51   delay52   delay53   delay54   delay55   delay56   delay57   delay58   delay59   delay60  delay61  delay62  delay63  delay64  delay65  delay66  delay67  delay68  delay69  delay70  delay71  delay72  delay73  delay74   delay75   delay76   delay77   delay78   delay79   delay80   delay81  delay82   delay83  delay84   delay85  delay86   delay87  delay88   delay89   delay90   delay91   delay92   delay93   delay99   delay95   delay96   delay97   delay98   delay99   delay100   delay101   delay102)

gen delayr_final=0
replace delayr_final=1 if delayr>1


gen time_gap_delay_final=max(time_gap_delay1, time_gap_delay2, time_gap_delay3, time_gap_delay4, time_gap_delay5, time_gap_delay6, time_gap_delay7, time_gap_delay8, time_gap_delay9, time_gap_delay10,time_gap_delay11,time_gap_delay12,time_gap_delay13,time_gap_delay14,time_gap_delay15,time_gap_delay16,time_gap_delay17,time_gap_delay18,time_gap_delay19,time_gap_delay20,time_gap_delay21,time_gap_delay22,time_gap_delay23,time_gap_delay24, time_gap_delay25, time_gap_delay26, time_gap_delay27, time_gap_delay28, time_gap_delay29, time_gap_delay30, time_gap_delay31,time_gap_delay32, time_gap_delay33,time_gap_delay34, time_gap_delay35,time_gap_delay36, time_gap_delay37,time_gap_delay38, time_gap_delay39, time_gap_delay40, time_gap_delay41, time_gap_delay42, time_gap_delay43, time_gap_delay44, time_gap_delay45, time_gap_delay46, time_gap_delay47, time_gap_delay48, time_gap_delay49, time_gap_delay50, time_gap_delay51, time_gap_delay52, time_gap_delay53, time_gap_delay54, time_gap_delay55, time_gap_delay56, time_gap_delay57, time_gap_delay58, time_gap_delay59, time_gap_delay60,time_gap_delay61,time_gap_delay62,time_gap_delay63,time_gap_delay64,time_gap_delay65,time_gap_delay66,time_gap_delay67,time_gap_delay68,time_gap_delay69,time_gap_delay70,time_gap_delay71,time_gap_delay72,time_gap_delay73,time_gap_delay74, time_gap_delay75, time_gap_delay76, time_gap_delay77, time_gap_delay78, time_gap_delay79, time_gap_delay80, time_gap_delay81,time_gap_delay82, time_gap_delay83,time_gap_delay84, time_gap_delay85,time_gap_delay86, time_gap_delay87,time_gap_delay88, time_gap_delay89, time_gap_delay90, time_gap_delay91, time_gap_delay92, time_gap_delay93, time_gap_delay99, time_gap_delay95, time_gap_delay96, time_gap_delay97, time_gap_delay98, time_gap_delay99, time_gap_delay100, time_gap_delay101, time_gap_delay102)

gen delayf=0
replace delayf=1 if time_gap_delay_final!=.

global n 102
forval x=1/$n {
drop time_gap_delay`x' delay`x' effectivedatetime_delay`x'
}

//46 voice


global n 24
forval x=1/$n {
qui gen time_gap_voice`x'=(index_date- effectivedatetime_voice`x')

}

global n 24
forval x=1/$n {
qui replace voice`x'=. if (time_gap_voice`x'<0 | time_gap_voice`x'>182)
qui replace effectivedatetime_voice`x'=. if (time_gap_voice`x'<0 | time_gap_voice`x'>182)
qui replace time_gap_voice`x'=. if (time_gap_voice`x'<0 | time_gap_voice`x'>182)
}

egen voicer=rownonmiss( voice1   voice2   voice3   voice4   voice5   voice6   voice7   voice8   voice9   voice10  voice11  voice12  voice13  voice14  voice15  voice16  voice17  voice18  voice19  voice20  voice21  voice22  voice23  voice24)

gen voicer_final=0
replace voicer_final=1 if voicer>1


gen time_gap_voice_final=max(time_gap_voice1, time_gap_voice2, time_gap_voice3, time_gap_voice4, time_gap_voice5, time_gap_voice6, time_gap_voice7, time_gap_voice8, time_gap_voice9, time_gap_voice10,time_gap_voice11,time_gap_voice12,time_gap_voice13,time_gap_voice14,time_gap_voice15,time_gap_voice16,time_gap_voice17,time_gap_voice18,time_gap_voice19,time_gap_voice20,time_gap_voice21,time_gap_voice22,time_gap_voice23,time_gap_voice24)

gen voicef=0
replace voicef=1 if time_gap_voice_final!=.

global n 24
forval x=1/$n {
drop time_gap_voice`x' voice`x' effectivedatetime_voice`x'
}


//47 cranial



global n 48
forval x=1/$n {
qui gen time_gap_cranial`x'=(index_date- effectivedatetime_cranial`x')

}

global n 48
forval x=1/$n {
qui replace cranial`x'=. if (time_gap_cranial`x'<0 | time_gap_cranial`x'>182)
qui replace effectivedatetime_cranial`x'=. if (time_gap_cranial`x'<0 | time_gap_cranial`x'>182)
qui replace time_gap_cranial`x'=. if (time_gap_cranial`x'<0 | time_gap_cranial`x'>182)
}

egen cranialr=rownonmiss( cranial1   cranial2   cranial3   cranial4   cranial5   cranial6   cranial7   cranial8   cranial9   cranial10  cranial11  cranial12  cranial13  cranial14  cranial15  cranial16  cranial17  cranial18  cranial19  cranial20  cranial21  cranial22  cranial23  cranial24   cranial25   cranial26   cranial27   cranial28   cranial29   cranial30   cranial31  cranial32   cranial33  cranial34   cranial35  cranial36   cranial37  cranial38   cranial39   cranial40   cranial41   cranial42   cranial43   cranial44   cranial45   cranial46   cranial47   cranial48)

gen cranialr_final=0
replace cranialr_final=1 if cranialr>1

gen time_gap_cranial_final=max(time_gap_cranial1, time_gap_cranial2, time_gap_cranial3, time_gap_cranial4, time_gap_cranial5, time_gap_cranial6, time_gap_cranial7, time_gap_cranial8, time_gap_cranial9, time_gap_cranial10,time_gap_cranial11,time_gap_cranial12,time_gap_cranial13,time_gap_cranial14,time_gap_cranial15,time_gap_cranial16,time_gap_cranial17,time_gap_cranial18,time_gap_cranial19,time_gap_cranial20,time_gap_cranial21,time_gap_cranial22,time_gap_cranial23,time_gap_cranial24, time_gap_cranial25, time_gap_cranial26, time_gap_cranial27, time_gap_cranial28, time_gap_cranial29, time_gap_cranial30, time_gap_cranial31,time_gap_cranial32, time_gap_cranial33,time_gap_cranial34, time_gap_cranial35,time_gap_cranial36, time_gap_cranial37,time_gap_cranial38, time_gap_cranial39, time_gap_cranial40, time_gap_cranial41, time_gap_cranial42, time_gap_cranial43, time_gap_cranial44, time_gap_cranial45, time_gap_cranial46, time_gap_cranial47, time_gap_cranial48)

gen cranialf=0
replace cranialf=1 if time_gap_cranial_final!=.

global n 48
forval x=1/$n {
drop time_gap_cranial`x' cranial`x' effectivedatetime_cranial`x'
}


//48 seizure



global n 119
forval x=1/$n {
qui gen time_gap_seizure`x'=(index_date- effectivedatetime_seizure`x')

}

global n 119
forval x=1/$n {
qui replace seizure`x'=. if (time_gap_seizure`x'<0 | time_gap_seizure`x'>182)
qui replace effectivedatetime_seizure`x'=. if (time_gap_seizure`x'<0 | time_gap_seizure`x'>182)
qui replace time_gap_seizure`x'=. if (time_gap_seizure`x'<0 | time_gap_seizure`x'>182)
}

egen seizurer=rownonmiss( seizure1   seizure2   seizure3   seizure4   seizure5   seizure6   seizure7   seizure8   seizure9   seizure10  seizure11  seizure12  seizure13  seizure14  seizure15  seizure16  seizure17  seizure18  seizure19  seizure20  seizure21  seizure22  seizure23  seizure24   seizure25   seizure26   seizure27   seizure28   seizure29   seizure30   seizure31  seizure32   seizure33  seizure34   seizure35  seizure36   seizure37  seizure38   seizure39   seizure40   seizure41   seizure42   seizure43   seizure44   seizure45   seizure46   seizure47   seizure48   seizure49   seizure50   seizure51   seizure52   seizure53   seizure54   seizure55   seizure56   seizure57   seizure58   seizure59   seizure60  seizure61  seizure62  seizure63  seizure64  seizure65  seizure66  seizure67  seizure68  seizure69  seizure70  seizure71  seizure72  seizure73  seizure74   seizure75   seizure76   seizure77   seizure78   seizure79   seizure80   seizure81  seizure82   seizure83  seizure84   seizure85  seizure86   seizure87  seizure88   seizure89   seizure90   seizure91   seizure92   seizure93   seizure99   seizure95   seizure96   seizure97   seizure98   seizure99   seizure100   seizure101   seizure102   seizure103   seizure104   seizure105   seizure106   seizure107   seizure108   seizure109   seizure110  seizure111  seizure112  seizure113  seizure114  seizure115  seizure116  seizure117  seizure118  seizure119)

gen seizurer_final=0
replace seizurer_final=1 if seizurer>1

gen time_gap_seizure_final=max(time_gap_seizure1, time_gap_seizure2, time_gap_seizure3, time_gap_seizure4, time_gap_seizure5, time_gap_seizure6, time_gap_seizure7, time_gap_seizure8, time_gap_seizure9, time_gap_seizure10,time_gap_seizure11,time_gap_seizure12,time_gap_seizure13,time_gap_seizure14,time_gap_seizure15,time_gap_seizure16,time_gap_seizure17,time_gap_seizure18,time_gap_seizure19,time_gap_seizure20,time_gap_seizure21,time_gap_seizure22,time_gap_seizure23,time_gap_seizure24, time_gap_seizure25, time_gap_seizure26, time_gap_seizure27, time_gap_seizure28, time_gap_seizure29, time_gap_seizure30, time_gap_seizure31,time_gap_seizure32, time_gap_seizure33,time_gap_seizure34, time_gap_seizure35,time_gap_seizure36, time_gap_seizure37,time_gap_seizure38, time_gap_seizure39, time_gap_seizure40, time_gap_seizure41, time_gap_seizure42, time_gap_seizure43, time_gap_seizure44, time_gap_seizure45, time_gap_seizure46, time_gap_seizure47, time_gap_seizure48, time_gap_seizure49, time_gap_seizure50, time_gap_seizure51, time_gap_seizure52, time_gap_seizure53, time_gap_seizure54, time_gap_seizure55, time_gap_seizure56, time_gap_seizure57, time_gap_seizure58, time_gap_seizure59, time_gap_seizure60,time_gap_seizure61,time_gap_seizure62,time_gap_seizure63,time_gap_seizure64,time_gap_seizure65,time_gap_seizure66,time_gap_seizure67,time_gap_seizure68,time_gap_seizure69,time_gap_seizure70,time_gap_seizure71,time_gap_seizure72,time_gap_seizure73,time_gap_seizure74, time_gap_seizure75, time_gap_seizure76, time_gap_seizure77, time_gap_seizure78, time_gap_seizure79, time_gap_seizure80, time_gap_seizure81,time_gap_seizure82, time_gap_seizure83,time_gap_seizure84, time_gap_seizure85,time_gap_seizure86, time_gap_seizure87,time_gap_seizure88, time_gap_seizure89, time_gap_seizure90, time_gap_seizure91, time_gap_seizure92, time_gap_seizure93, time_gap_seizure99, time_gap_seizure95, time_gap_seizure96, time_gap_seizure97, time_gap_seizure98, time_gap_seizure99, time_gap_seizure100, time_gap_seizure101, time_gap_seizure102, time_gap_seizure103, time_gap_seizure104, time_gap_seizure105, time_gap_seizure106, time_gap_seizure107, time_gap_seizure108, time_gap_seizure109, time_gap_seizure110,time_gap_seizure111,time_gap_seizure112,time_gap_seizure113,time_gap_seizure114,time_gap_seizure115,time_gap_seizure116,time_gap_seizure117,time_gap_seizure118,time_gap_seizure119)

gen seizuref=0
replace seizuref=1 if time_gap_seizure_final!=.

global n 119
forval x=1/$n {
drop time_gap_seizure`x' seizure`x' effectivedatetime_seizure`x'
}

//49  puberty 



global n 125
forval x=1/$n {
qui gen time_gap_puberty`x'=(index_date- effectivedatetime_puberty`x')

}

global n 125
forval x=1/$n {
qui replace puberty`x'=. if (time_gap_puberty`x'<0 | time_gap_puberty`x'>182)
qui replace effectivedatetime_puberty`x'=. if (time_gap_puberty`x'<0 | time_gap_puberty`x'>182)
qui replace time_gap_puberty`x'=. if (time_gap_puberty`x'<0 | time_gap_puberty`x'>182)
}

egen pubertyr=rownonmiss( puberty1   puberty2   puberty3   puberty4   puberty5   puberty6   puberty7   puberty8   puberty9   puberty10  puberty11  puberty12  puberty13  puberty14  puberty15  puberty16  puberty17  puberty18  puberty19  puberty20  puberty21  puberty22  puberty23  puberty24   puberty25   puberty26   puberty27   puberty28   puberty29   puberty30   puberty31  puberty32   puberty33  puberty34   puberty35  puberty36   puberty37  puberty38   puberty39   puberty40   puberty41   puberty42   puberty43   puberty44   puberty45   puberty46   puberty47   puberty48   puberty49   puberty50   puberty51   puberty52   puberty53   puberty54   puberty55   puberty56   puberty57   puberty58   puberty59   puberty60  puberty61  puberty62  puberty63  puberty64  puberty65  puberty66  puberty67  puberty68  puberty69  puberty70  puberty71  puberty72  puberty73  puberty74   puberty75   puberty76   puberty77   puberty78   puberty79   puberty80   puberty81  puberty82   puberty83  puberty84   puberty85  puberty86   puberty87  puberty88   puberty89   puberty90   puberty91   puberty92   puberty93   puberty99   puberty95   puberty96   puberty97   puberty98   puberty99   puberty100   puberty101   puberty102   puberty103   puberty104   puberty105   puberty106   puberty107   puberty108   puberty109   puberty110  puberty111  puberty112  puberty113  puberty114  puberty115  puberty116  puberty117  puberty118  puberty119  puberty120  puberty121  puberty122  puberty123  puberty124  puberty125)

gen pubertyr_final=0
replace pubertyr_final=1 if pubertyr>1

gen time_gap_puberty_final=max(time_gap_puberty1, time_gap_puberty2, time_gap_puberty3, time_gap_puberty4, time_gap_puberty5, time_gap_puberty6, time_gap_puberty7, time_gap_puberty8, time_gap_puberty9, time_gap_puberty10,time_gap_puberty11,time_gap_puberty12,time_gap_puberty13,time_gap_puberty14,time_gap_puberty15,time_gap_puberty16,time_gap_puberty17,time_gap_puberty18,time_gap_puberty19,time_gap_puberty20,time_gap_puberty21,time_gap_puberty22,time_gap_puberty23,time_gap_puberty24, time_gap_puberty25, time_gap_puberty26, time_gap_puberty27, time_gap_puberty28, time_gap_puberty29, time_gap_puberty30, time_gap_puberty31,time_gap_puberty32, time_gap_puberty33,time_gap_puberty34, time_gap_puberty35,time_gap_puberty36, time_gap_puberty37,time_gap_puberty38, time_gap_puberty39, time_gap_puberty40, time_gap_puberty41, time_gap_puberty42, time_gap_puberty43, time_gap_puberty44, time_gap_puberty45, time_gap_puberty46, time_gap_puberty47, time_gap_puberty48, time_gap_puberty49, time_gap_puberty50, time_gap_puberty51, time_gap_puberty52, time_gap_puberty53, time_gap_puberty54, time_gap_puberty55, time_gap_puberty56, time_gap_puberty57, time_gap_puberty58, time_gap_puberty59, time_gap_puberty60,time_gap_puberty61,time_gap_puberty62,time_gap_puberty63,time_gap_puberty64,time_gap_puberty65,time_gap_puberty66,time_gap_puberty67,time_gap_puberty68,time_gap_puberty69,time_gap_puberty70,time_gap_puberty71,time_gap_puberty72,time_gap_puberty73,time_gap_puberty74, time_gap_puberty75, time_gap_puberty76, time_gap_puberty77, time_gap_puberty78, time_gap_puberty79, time_gap_puberty80, time_gap_puberty81,time_gap_puberty82, time_gap_puberty83,time_gap_puberty84, time_gap_puberty85,time_gap_puberty86, time_gap_puberty87,time_gap_puberty88, time_gap_puberty89, time_gap_puberty90, time_gap_puberty91, time_gap_puberty92, time_gap_puberty93, time_gap_puberty99, time_gap_puberty95, time_gap_puberty96, time_gap_puberty97, time_gap_puberty98, time_gap_puberty99, time_gap_puberty100, time_gap_puberty101, time_gap_puberty102, time_gap_puberty103, time_gap_puberty104, time_gap_puberty105, time_gap_puberty106, time_gap_puberty107, time_gap_puberty108, time_gap_puberty109, time_gap_puberty110,time_gap_puberty111,time_gap_puberty112,time_gap_puberty113,time_gap_puberty114,time_gap_puberty115,time_gap_puberty116,time_gap_puberty117,time_gap_puberty118,time_gap_puberty119,time_gap_puberty120,time_gap_puberty121,time_gap_puberty122,time_gap_puberty123,time_gap_puberty124,time_gap_puberty125)


gen pubertyf=0
replace pubertyf=1 if time_gap_puberty_final!=.

global n 125
forval x=1/$n {
drop time_gap_puberty`x' puberty`x' effectivedatetime_puberty`x'
}


//50 gait


global n 90
forval x=1/$n {
qui gen time_gap_gait`x'=(index_date- effectivedatetime_gait`x')

}

global n 90
forval x=1/$n {
qui replace gait`x'=. if (time_gap_gait`x'<0 | time_gap_gait`x'>182)
qui replace effectivedatetime_gait`x'=. if (time_gap_gait`x'<0 | time_gap_gait`x'>182)
qui replace time_gap_gait`x'=. if (time_gap_gait`x'<0 | time_gap_gait`x'>182)
}

egen gaitr= rownonmiss( gait1   gait2   gait3   gait4   gait5   gait6   gait7   gait8   gait9   gait10  gait11  gait12  gait13  gait14  gait15  gait16  gait17  gait18  gait19  gait20  gait21  gait22  gait23  gait24   gait25   gait26   gait27   gait28   gait29   gait30   gait31  gait32   gait33  gait34   gait35  gait36   gait37  gait38   gait39   gait40   gait41   gait42   gait43   gait44   gait45   gait46   gait47   gait48   gait49   gait50   gait51   gait52   gait53   gait54   gait55   gait56   gait57   gait58   gait59   gait60  gait61  gait62  gait63  gait64  gait65  gait66  gait67  gait68  gait69  gait70  gait71  gait72  gait73  gait74   gait75   gait76   gait77   gait78   gait79   gait80   gait81  gait82   gait83  gait84   gait85  gait86   gait87  gait88   gait89   gait90)

gen gaitr_final=0
replace gaitr_final=1 if gaitr>1 


gen time_gap_gait_final=max(time_gap_gait1, time_gap_gait2, time_gap_gait3, time_gap_gait4, time_gap_gait5, time_gap_gait6, time_gap_gait7, time_gap_gait8, time_gap_gait9, time_gap_gait10,time_gap_gait11,time_gap_gait12,time_gap_gait13,time_gap_gait14,time_gap_gait15,time_gap_gait16,time_gap_gait17,time_gap_gait18,time_gap_gait19,time_gap_gait20,time_gap_gait21,time_gap_gait22,time_gap_gait23,time_gap_gait24, time_gap_gait25, time_gap_gait26, time_gap_gait27, time_gap_gait28, time_gap_gait29, time_gap_gait30, time_gap_gait31,time_gap_gait32, time_gap_gait33,time_gap_gait34, time_gap_gait35,time_gap_gait36, time_gap_gait37,time_gap_gait38, time_gap_gait39, time_gap_gait40, time_gap_gait41, time_gap_gait42, time_gap_gait43, time_gap_gait44, time_gap_gait45, time_gap_gait46, time_gap_gait47, time_gap_gait48, time_gap_gait49, time_gap_gait50, time_gap_gait51, time_gap_gait52, time_gap_gait53, time_gap_gait54, time_gap_gait55, time_gap_gait56, time_gap_gait57, time_gap_gait58, time_gap_gait59, time_gap_gait60,time_gap_gait61,time_gap_gait62,time_gap_gait63,time_gap_gait64,time_gap_gait65,time_gap_gait66,time_gap_gait67,time_gap_gait68,time_gap_gait69,time_gap_gait70,time_gap_gait71,time_gap_gait72,time_gap_gait73,time_gap_gait74, time_gap_gait75, time_gap_gait76, time_gap_gait77, time_gap_gait78, time_gap_gait79, time_gap_gait80, time_gap_gait81,time_gap_gait82, time_gap_gait83,time_gap_gait84, time_gap_gait85,time_gap_gait86, time_gap_gait87,time_gap_gait88, time_gap_gait89, time_gap_gait90)

gen gaitf=0
replace gaitf=1 if time_gap_gait_final!=.

global n 90
forval x=1/$n {
drop time_gap_gait`x' gait`x' effectivedatetime_gait`x'
}

//51 haematuria 



global n 120
forval x=1/$n {
qui gen time_gap_haematuria`x'=(index_date- effectivedatetime_haematuria`x')

}

global n 120
forval x=1/$n {
qui replace haematuria`x'=. if (time_gap_haematuria`x'<0 | time_gap_haematuria`x'>182)
qui replace effectivedatetime_haematuria`x'=. if (time_gap_haematuria`x'<0 | time_gap_haematuria`x'>182)
qui replace time_gap_haematuria`x'=. if (time_gap_haematuria`x'<0 | time_gap_haematuria`x'>182)
}


egen haematuriar=rownonmiss( haematuria1   haematuria2   haematuria3   haematuria4   haematuria5   haematuria6   haematuria7   haematuria8   haematuria9   haematuria10  haematuria11  haematuria12  haematuria13  haematuria14  haematuria15  haematuria16  haematuria17  haematuria18  haematuria19  haematuria20  haematuria21  haematuria22  haematuria23  haematuria24   haematuria25   haematuria26   haematuria27   haematuria28   haematuria29   haematuria30   haematuria31  haematuria32   haematuria33  haematuria34   haematuria35  haematuria36   haematuria37  haematuria38   haematuria39   haematuria40   haematuria41   haematuria42   haematuria43   haematuria44   haematuria45   haematuria46   haematuria47   haematuria48   haematuria49   haematuria50   haematuria51   haematuria52   haematuria53   haematuria54   haematuria55   haematuria56   haematuria57   haematuria58   haematuria59   haematuria60  haematuria61  haematuria62  haematuria63  haematuria64  haematuria65  haematuria66  haematuria67  haematuria68  haematuria69  haematuria70  haematuria71  haematuria72  haematuria73  haematuria74   haematuria75   haematuria76   haematuria77   haematuria78   haematuria79   haematuria80   haematuria81  haematuria82   haematuria83  haematuria84   haematuria85  haematuria86   haematuria87  haematuria88   haematuria89   haematuria90   haematuria91   haematuria92   haematuria93   haematuria99   haematuria95   haematuria96   haematuria97   haematuria98   haematuria99   haematuria100   haematuria101   haematuria102   haematuria103   haematuria104   haematuria105   haematuria106   haematuria107   haematuria108   haematuria109   haematuria110  haematuria111  haematuria112  haematuria113  haematuria114  haematuria115  haematuria116  haematuria117  haematuria118  haematuria119  haematuria120)

gen haematuriar_final=0
replace haematuriar_final=1 if haematuriar>1

gen time_gap_haematuria_final=max(time_gap_haematuria1, time_gap_haematuria2, time_gap_haematuria3, time_gap_haematuria4, time_gap_haematuria5, time_gap_haematuria6, time_gap_haematuria7, time_gap_haematuria8, time_gap_haematuria9, time_gap_haematuria10,time_gap_haematuria11,time_gap_haematuria12,time_gap_haematuria13,time_gap_haematuria14,time_gap_haematuria15,time_gap_haematuria16,time_gap_haematuria17,time_gap_haematuria18,time_gap_haematuria19,time_gap_haematuria20,time_gap_haematuria21,time_gap_haematuria22,time_gap_haematuria23,time_gap_haematuria24, time_gap_haematuria25, time_gap_haematuria26, time_gap_haematuria27, time_gap_haematuria28, time_gap_haematuria29, time_gap_haematuria30, time_gap_haematuria31,time_gap_haematuria32, time_gap_haematuria33,time_gap_haematuria34, time_gap_haematuria35,time_gap_haematuria36, time_gap_haematuria37,time_gap_haematuria38, time_gap_haematuria39, time_gap_haematuria40, time_gap_haematuria41, time_gap_haematuria42, time_gap_haematuria43, time_gap_haematuria44, time_gap_haematuria45, time_gap_haematuria46, time_gap_haematuria47, time_gap_haematuria48, time_gap_haematuria49, time_gap_haematuria50, time_gap_haematuria51, time_gap_haematuria52, time_gap_haematuria53, time_gap_haematuria54, time_gap_haematuria55, time_gap_haematuria56, time_gap_haematuria57, time_gap_haematuria58, time_gap_haematuria59, time_gap_haematuria60,time_gap_haematuria61,time_gap_haematuria62,time_gap_haematuria63,time_gap_haematuria64,time_gap_haematuria65,time_gap_haematuria66,time_gap_haematuria67,time_gap_haematuria68,time_gap_haematuria69,time_gap_haematuria70,time_gap_haematuria71,time_gap_haematuria72,time_gap_haematuria73,time_gap_haematuria74, time_gap_haematuria75, time_gap_haematuria76, time_gap_haematuria77, time_gap_haematuria78, time_gap_haematuria79, time_gap_haematuria80, time_gap_haematuria81,time_gap_haematuria82, time_gap_haematuria83,time_gap_haematuria84, time_gap_haematuria85,time_gap_haematuria86, time_gap_haematuria87,time_gap_haematuria88, time_gap_haematuria89, time_gap_haematuria90, time_gap_haematuria91, time_gap_haematuria92, time_gap_haematuria93, time_gap_haematuria99, time_gap_haematuria95, time_gap_haematuria96, time_gap_haematuria97, time_gap_haematuria98, time_gap_haematuria99, time_gap_haematuria100, time_gap_haematuria101, time_gap_haematuria102, time_gap_haematuria103, time_gap_haematuria104, time_gap_haematuria105, time_gap_haematuria106, time_gap_haematuria107, time_gap_haematuria108, time_gap_haematuria109, time_gap_haematuria110,time_gap_haematuria111,time_gap_haematuria112,time_gap_haematuria113,time_gap_haematuria114,time_gap_haematuria115,time_gap_haematuria116,time_gap_haematuria117,time_gap_haematuria118,time_gap_haematuria119,time_gap_haematuria120)

gen haematuriaf=0
replace haematuriaf=1 if time_gap_haematuria_final!=.

global n 120
forval x=1/$n {
drop time_gap_haematuria`x' haematuria`x' effectivedatetime_haematuria`x'
}

//52  unwell 



global n 32
forval x=1/$n {
qui gen time_gap_unwell`x'=(index_date- effectivedatetime_unwell`x')

}

global n 32
forval x=1/$n {
qui replace unwell`x'=. if (time_gap_unwell`x'<0 | time_gap_unwell`x'>182)
qui replace effectivedatetime_unwell`x'=. if (time_gap_unwell`x'<0 | time_gap_unwell`x'>182)
qui replace time_gap_unwell`x'=. if (time_gap_unwell`x'<0 | time_gap_unwell`x'>182)
}

egen unwellr=rownonmiss( unwell1   unwell2   unwell3   unwell4   unwell5   unwell6   unwell7   unwell8   unwell9   unwell10  unwell11  unwell12  unwell13  unwell14  unwell15  unwell16  unwell17  unwell18  unwell19  unwell20  unwell21  unwell22  unwell23  unwell24   unwell25   unwell26   unwell27   unwell28   unwell29   unwell30   unwell31  unwell32)

gen unwellr_final=0
replace unwellr_final=1 if unwellr>1

gen time_gap_unwell_final=max(time_gap_unwell1, time_gap_unwell2, time_gap_unwell3, time_gap_unwell4, time_gap_unwell5, time_gap_unwell6, time_gap_unwell7, time_gap_unwell8, time_gap_unwell9, time_gap_unwell10,time_gap_unwell11,time_gap_unwell12,time_gap_unwell13,time_gap_unwell14,time_gap_unwell15,time_gap_unwell16,time_gap_unwell17,time_gap_unwell18,time_gap_unwell19,time_gap_unwell20,time_gap_unwell21,time_gap_unwell22,time_gap_unwell23,time_gap_unwell24, time_gap_unwell25, time_gap_unwell26, time_gap_unwell27, time_gap_unwell28, time_gap_unwell29, time_gap_unwell30, time_gap_unwell31,time_gap_unwell32)

gen unwellf=0
replace unwellf=1 if time_gap_unwell_final!=.

global n 32
forval x=1/$n {
drop time_gap_unwell`x' unwell`x' effectivedatetime_unwell`x'
}


//53 constipation



global n 50
forval x=1/$n {
qui gen time_gap_constipation`x'=(index_date- effectivedatetime_constipation`x')

}

global n 50
forval x=1/$n {
qui replace constipation`x'=. if (time_gap_constipation`x'<0 | time_gap_constipation`x'>182)
qui replace effectivedatetime_constipation`x'=. if (time_gap_constipation`x'<0 | time_gap_constipation`x'>182)
qui replace time_gap_constipation`x'=. if (time_gap_constipation`x'<0 | time_gap_constipation`x'>182)
}

egen constipationr=rownonmiss( constipation1   constipation2   constipation3   constipation4   constipation5   constipation6   constipation7   constipation8   constipation9   constipation10  constipation11  constipation12  constipation13  constipation14  constipation15  constipation16  constipation17  constipation18  constipation19  constipation20  constipation21  constipation22  constipation23  constipation24   constipation25   constipation26   constipation27   constipation28   constipation29   constipation30   constipation31  constipation32   constipation33  constipation34   constipation35  constipation36   constipation37  constipation38   constipation39   constipation40   constipation41   constipation42   constipation43   constipation44   constipation45   constipation46   constipation47   constipation48   constipation49   constipation50)

gen constipationr_final=0
replace constipationr_final=1 if constipationr>1

gen time_gap_constipation_final=max(time_gap_constipation1, time_gap_constipation2, time_gap_constipation3, time_gap_constipation4, time_gap_constipation5, time_gap_constipation6, time_gap_constipation7, time_gap_constipation8, time_gap_constipation9, time_gap_constipation10,time_gap_constipation11,time_gap_constipation12,time_gap_constipation13,time_gap_constipation14,time_gap_constipation15,time_gap_constipation16,time_gap_constipation17,time_gap_constipation18,time_gap_constipation19,time_gap_constipation20,time_gap_constipation21,time_gap_constipation22,time_gap_constipation23,time_gap_constipation24, time_gap_constipation25, time_gap_constipation26, time_gap_constipation27, time_gap_constipation28, time_gap_constipation29, time_gap_constipation30, time_gap_constipation31,time_gap_constipation32, time_gap_constipation33,time_gap_constipation34, time_gap_constipation35,time_gap_constipation36, time_gap_constipation37,time_gap_constipation38, time_gap_constipation39, time_gap_constipation40, time_gap_constipation41, time_gap_constipation42, time_gap_constipation43, time_gap_constipation44, time_gap_constipation45, time_gap_constipation46, time_gap_constipation47, time_gap_constipation48, time_gap_constipation49, time_gap_constipation50)

gen constipationf=0
replace constipationf=1 if time_gap_constipation_final!=.

global n 50
forval x=1/$n {
drop time_gap_constipation`x' constipation`x' effectivedatetime_constipation`x'
}

//54 balance  



global n 56
forval x=1/$n {
qui gen time_gap_balance`x'=(index_date- effectivedatetime_balance`x')

}

global n 56
forval x=1/$n {
qui replace balance`x'=. if (time_gap_balance`x'<0 | time_gap_balance`x'>182)
qui replace effectivedatetime_balance`x'=. if (time_gap_balance`x'<0 | time_gap_balance`x'>182)
qui replace time_gap_balance`x'=. if (time_gap_balance`x'<0 | time_gap_balance`x'>182)
}


egen balancer=rownonmiss( balance1   balance2   balance3   balance4   balance5   balance6   balance7   balance8   balance9   balance10  balance11  balance12  balance13  balance14  balance15  balance16  balance17  balance18  balance19  balance20  balance21  balance22  balance23  balance24   balance25   balance26   balance27   balance28   balance29   balance30   balance31  balance32   balance33  balance34   balance35  balance36   balance37  balance38   balance39   balance40   balance41   balance42   balance43   balance44   balance45   balance46   balance47   balance48   balance49   balance50   balance51   balance52   balance53   balance54   balance55   balance56)

gen balancer_final=0
replace balancer_final=1 if balancer>1


gen time_gap_balance_final=max(time_gap_balance1, time_gap_balance2, time_gap_balance3, time_gap_balance4, time_gap_balance5, time_gap_balance6, time_gap_balance7, time_gap_balance8, time_gap_balance9, time_gap_balance10,time_gap_balance11,time_gap_balance12,time_gap_balance13,time_gap_balance14,time_gap_balance15,time_gap_balance16,time_gap_balance17,time_gap_balance18,time_gap_balance19,time_gap_balance20,time_gap_balance21,time_gap_balance22,time_gap_balance23,time_gap_balance24, time_gap_balance25, time_gap_balance26, time_gap_balance27, time_gap_balance28, time_gap_balance29, time_gap_balance30, time_gap_balance31,time_gap_balance32, time_gap_balance33,time_gap_balance34, time_gap_balance35,time_gap_balance36, time_gap_balance37,time_gap_balance38, time_gap_balance39, time_gap_balance40, time_gap_balance41, time_gap_balance42, time_gap_balance43, time_gap_balance44, time_gap_balance45, time_gap_balance46, time_gap_balance47, time_gap_balance48, time_gap_balance49, time_gap_balance50, time_gap_balance51, time_gap_balance52, time_gap_balance53, time_gap_balance54, time_gap_balance55, time_gap_balance56)

gen balancef=0
replace balancef=1 if time_gap_balance_final!=.

global n 56
forval x=1/$n {
drop time_gap_balance`x' balance`x' effectivedatetime_balance`x'
}


//55 testicular_p



global n 37
forval x=1/$n {
qui gen time_gap_testicular_p`x'=(index_date- effectivedatetime_testicular_p`x')

}

global n 37
forval x=1/$n {
qui replace testicular_p`x'=. if (time_gap_testicular_p`x'<0 | time_gap_testicular_p`x'>182)
qui replace effectivedatetime_testicular_p`x'=. if (time_gap_testicular_p`x'<0 | time_gap_testicular_p`x'>182)
qui replace time_gap_testicular_p`x'=. if (time_gap_testicular_p`x'<0 | time_gap_testicular_p`x'>182)
}

egen testicular_pr=rownonmiss( testicular_p1   testicular_p2   testicular_p3   testicular_p4   testicular_p5   testicular_p6   testicular_p7   testicular_p8   testicular_p9   testicular_p10  testicular_p11  testicular_p12  testicular_p13  testicular_p14  testicular_p15  testicular_p16  testicular_p17  testicular_p18  testicular_p19  testicular_p20  testicular_p21  testicular_p22  testicular_p23  testicular_p24   testicular_p25   testicular_p26   testicular_p27   testicular_p28   testicular_p29   testicular_p30   testicular_p31  testicular_p32   testicular_p33  testicular_p34   testicular_p35  testicular_p36   testicular_p37)

gen testicular_pr_final=0
replace testicular_pr_final=1 if testicular_pr>1

gen time_gap_testicular_p_final=max(time_gap_testicular_p1, time_gap_testicular_p2, time_gap_testicular_p3, time_gap_testicular_p4, time_gap_testicular_p5, time_gap_testicular_p6, time_gap_testicular_p7, time_gap_testicular_p8, time_gap_testicular_p9, time_gap_testicular_p10,time_gap_testicular_p11,time_gap_testicular_p12,time_gap_testicular_p13,time_gap_testicular_p14,time_gap_testicular_p15,time_gap_testicular_p16,time_gap_testicular_p17,time_gap_testicular_p18,time_gap_testicular_p19,time_gap_testicular_p20,time_gap_testicular_p21,time_gap_testicular_p22,time_gap_testicular_p23,time_gap_testicular_p24, time_gap_testicular_p25, time_gap_testicular_p26, time_gap_testicular_p27, time_gap_testicular_p28, time_gap_testicular_p29, time_gap_testicular_p30, time_gap_testicular_p31,time_gap_testicular_p32, time_gap_testicular_p33,time_gap_testicular_p34, time_gap_testicular_p35,time_gap_testicular_p36, time_gap_testicular_p37)

gen testicular_pf=0
replace testicular_pf=1 if time_gap_testicular_p_final!=.

global n 37
forval x=1/$n {
drop time_gap_testicular_p`x' testicular_p`x' effectivedatetime_testicular_p`x'
}


//56  testicular_s



global n 16
forval x=1/$n {
qui gen time_gap_testicular_s`x'=(index_date- effectivedatetime_testicular_s`x')

}

global n 16
forval x=1/$n {
qui replace testicular_s`x'=. if (time_gap_testicular_s`x'<0 | time_gap_testicular_s`x'>182)
qui replace effectivedatetime_testicular_s`x'=. if (time_gap_testicular_s`x'<0 | time_gap_testicular_s`x'>182)
qui replace time_gap_testicular_s`x'=. if (time_gap_testicular_s`x'<0 | time_gap_testicular_s`x'>182)
}

egen testicular_sp=rownonmiss( testicular_s1   testicular_s2   testicular_s3   testicular_s4   testicular_s5   testicular_s6   testicular_s7   testicular_s8   testicular_s9   testicular_s10  testicular_s11  testicular_s12  testicular_s13  testicular_s14  testicular_s15  testicular_s16)

gen testicular_sp_final=0
replace testicular_sp_final=1 if testicular_sp>1

gen time_gap_testicular_s_final=max(time_gap_testicular_s1, time_gap_testicular_s2, time_gap_testicular_s3, time_gap_testicular_s4, time_gap_testicular_s5, time_gap_testicular_s6, time_gap_testicular_s7, time_gap_testicular_s8, time_gap_testicular_s9, time_gap_testicular_s10,time_gap_testicular_s11,time_gap_testicular_s12,time_gap_testicular_s13,time_gap_testicular_s14,time_gap_testicular_s15,time_gap_testicular_s16)

gen testicular_sf=0
replace testicular_sf=1 if time_gap_testicular_s_final!=.

global n 16
forval x=1/$n {
drop time_gap_testicular_s`x' testicular_s`x' effectivedatetime_testicular_s`x'
}

//57 dizziness



global n  40
forval x=1/$n {
qui gen time_gap_dizz`x'=(index_date- effectivedatetime_dizz`x')

}

global n 40
forval x=1/$n {
qui replace dizz`x'=. if (time_gap_dizz`x'<0 | time_gap_dizz`x'>182)
qui replace effectivedatetime_dizz`x'=. if (time_gap_dizz`x'<0 | time_gap_dizz`x'>182)
qui replace time_gap_dizz`x'=. if (time_gap_dizz`x'<0 | time_gap_dizz`x'>182)
}

egen dizzr=rownonmiss( dizz1   dizz2   dizz3   dizz4   dizz5   dizz6   dizz7   dizz8   dizz9   dizz10  dizz11  dizz12  dizz13  dizz14  dizz15  dizz16  dizz17  dizz18  dizz19  dizz20  dizz21  dizz22  dizz23  dizz24   dizz25   dizz26   dizz27   dizz28   dizz29   dizz30   dizz31  dizz32   dizz33  dizz34   dizz35  dizz36   dizz37  dizz38   dizz39   dizz40)

gen dizzr_final=0
replace dizzr_final=1 if dizzr>1

gen time_gap_dizz_final=max(time_gap_dizz1, time_gap_dizz2, time_gap_dizz3, time_gap_dizz4, time_gap_dizz5, time_gap_dizz6, time_gap_dizz7, time_gap_dizz8, time_gap_dizz9, time_gap_dizz10,time_gap_dizz11,time_gap_dizz12,time_gap_dizz13,time_gap_dizz14,time_gap_dizz15,time_gap_dizz16,time_gap_dizz17,time_gap_dizz18,time_gap_dizz19,time_gap_dizz20,time_gap_dizz21,time_gap_dizz22,time_gap_dizz23,time_gap_dizz24, time_gap_dizz25, time_gap_dizz26, time_gap_dizz27, time_gap_dizz28, time_gap_dizz29, time_gap_dizz30, time_gap_dizz31,time_gap_dizz32, time_gap_dizz33,time_gap_dizz34, time_gap_dizz35,time_gap_dizz36, time_gap_dizz37,time_gap_dizz38, time_gap_dizz39, time_gap_dizz40)

gen dizzf=0
replace dizzf=1 if time_gap_dizz_final!=.

global n 40
forval x=1/$n {
 drop time_gap_dizz`x' dizz`x' effectivedatetime_dizz`x'
}


//58 syncope



global n 56
forval x=1/$n {
qui gen time_gap_syncope`x'=(index_date- effectivedatetime_syncope`x')

}

global n 56
forval x=1/$n {
qui replace syncope`x'=. if (time_gap_syncope`x'<0 | time_gap_syncope`x'>182)
qui replace effectivedatetime_syncope`x'=. if (time_gap_syncope`x'<0 | time_gap_syncope`x'>182)
qui replace time_gap_syncope`x'=. if (time_gap_syncope`x'<0 | time_gap_syncope`x'>182)
}

egen syncoper=rownonmiss( syncope1   syncope2   syncope3   syncope4   syncope5   syncope6   syncope7   syncope8   syncope9   syncope10  syncope11  syncope12  syncope13  syncope14  syncope15  syncope16  syncope17  syncope18  syncope19  syncope20  syncope21  syncope22  syncope23  syncope24   syncope25   syncope26   syncope27   syncope28   syncope29   syncope30   syncope31  syncope32   syncope33  syncope34   syncope35  syncope36   syncope37  syncope38   syncope39   syncope40   syncope41   syncope42   syncope43   syncope44   syncope45   syncope46   syncope47   syncope48   syncope49   syncope50   syncope51   syncope52   syncope53   syncope54   syncope55   syncope56)

gen syncoper_final=0
replace syncoper_final=1 if syncoper>1


gen time_gap_syncope_final=max(time_gap_syncope1, time_gap_syncope2, time_gap_syncope3, time_gap_syncope4, time_gap_syncope5, time_gap_syncope6, time_gap_syncope7, time_gap_syncope8, time_gap_syncope9, time_gap_syncope10,time_gap_syncope11,time_gap_syncope12,time_gap_syncope13,time_gap_syncope14,time_gap_syncope15,time_gap_syncope16,time_gap_syncope17,time_gap_syncope18,time_gap_syncope19,time_gap_syncope20,time_gap_syncope21,time_gap_syncope22,time_gap_syncope23,time_gap_syncope24, time_gap_syncope25, time_gap_syncope26, time_gap_syncope27, time_gap_syncope28, time_gap_syncope29, time_gap_syncope30, time_gap_syncope31,time_gap_syncope32, time_gap_syncope33,time_gap_syncope34, time_gap_syncope35,time_gap_syncope36, time_gap_syncope37,time_gap_syncope38, time_gap_syncope39, time_gap_syncope40, time_gap_syncope41, time_gap_syncope42, time_gap_syncope43, time_gap_syncope44, time_gap_syncope45, time_gap_syncope46, time_gap_syncope47, time_gap_syncope48, time_gap_syncope49, time_gap_syncope50, time_gap_syncope51, time_gap_syncope52, time_gap_syncope53, time_gap_syncope54, time_gap_syncope55, time_gap_syncope56)

gen syncopef=0
replace syncopef=1 if time_gap_syncope_final!=.

global n 56
forval x=1/$n {
drop time_gap_`x' 
}

////




drop lumpr lumpr_final time_gap_lump_final lumpf hn_lumpr hn_lumpr_final time_gap_hn_lump_final hn_lumpf other_lumpr other_lumpr_final time_gap_other_lump_final other_lumpf

drop effectivedatetime_tired_v263 tired_v263 effectivedatetime_tired_v264 tired_v264 effectivedatetime_tired_v265 tired_v265 effectivedatetime_tired_v266 tired_v266 effectivedatetime_tired_v267 tired_v267 effectivedatetime_tired_v268 tired_v268 effectivedatetime_tired_v269 tired_v269 effectivedatetime_tired_v270 tired_v270 effectivedatetime_tired_v271 tired_v271 effectivedatetime_tired_v272 tired_v272 effectivedatetime_tired_v273 tired_v273 effectivedatetime_tired_v274 tired_v274 effectivedatetime_tired_v275 tired_v275 effectivedatetime_tired_v276 tired_v276 effectivedatetime_tired_v277 tired_v277 effectivedatetime_tired_v278 tired_v278 effectivedatetime_tired_v279 tired_v279 effectivedatetime_tired_v280 tired_v280 effectivedatetime_tired_v281 tired_v281 effectivedatetime_tired_v282 tired_v282 effectivedatetime_tired_v283 tired_v283 effectivedatetime_tired_v284 tired_v284 effectivedatetime_tired_v285 tired_v285 effectivedatetime_tired_v286 tired_v286 effectivedatetime_tired_v287 tired_v287 effectivedatetime_tired_v288 tired_v288 effectivedatetime_tired_v289 tired_v289 effectivedatetime_tired_v290 tired_v290 effectivedatetime_tired_v291 tired_v291 effectivedatetime_tired_v292 tired_v292 effectivedatetime_tired_v293 tired_v293 effectivedatetime_tired_v294 tired_v294 effectivedatetime_tired_v295 tired_v295 effectivedatetime_tired_v296 tired_v296 effectivedatetime_tired_v297 tired_v297 effectivedatetime_tired_v298 tired_v298 effectivedatetime_tired_v299 tired_v299 effectivedatetime_tired_v2100 tired_v2100 effectivedatetime_tired_v2101 tired_v2101 effectivedatetime_tired_v2102 tired_v2102 effectivedatetime_tired_v2103 tired_v2103 effectivedatetime_tired_v2104 tired_v2104 effectivedatetime_tired_v2105 tired_v2105 effectivedatetime_tired_v2106 tired_v2106 effectivedatetime_tired_v2107 tired_v2107 effectivedatetime_tired_v2108 tired_v2108 effectivedatetime_tired_v2109 tired_v2109 effectivedatetime_tired_v2110 tired_v2110 effectivedatetime_tired_v2111 tired_v2111 effectivedatetime_tired_v2112 tired_v2112 effectivedatetime_tired_v2113 tired_v2113 effectivedatetime_tired_v2114 tired_v2114 effectivedatetime_tired_v2115 tired_v2115 effectivedatetime_tired_v2116 tired_v2116 effectivedatetime_tired_v2117 tired_v2117 effectivedatetime_tired_v2118 tired_v2118 effectivedatetime_tired_v2119 tired_v2119 effectivedatetime_tired_v2120 tired_v2120 effectivedatetime_tired_v2121 tired_v2121 effectivedatetime_tired_v2122 tired_v2122 effectivedatetime_tired_v2123 tired_v2123 effectivedatetime_tired_v2124 tired_v2124 effectivedatetime_tired_v2125 tired_v2125 effectivedatetime_tired_v2126 tired_v2126 effectivedatetime_tired_v2127 tired_v2127 effectivedatetime_tired_v2128 tired_v2128 effectivedatetime_tired_v2129 tired_v2129 effectivedatetime_tired_v2130 tired_v2130 effectivedatetime_tired_v2131 tired_v2131 effectivedatetime_tired_v2132 tired_v2132 effectivedatetime_tired_v2133 tired_v2133 effectivedatetime_tired_v2134 tired_v2134 effectivedatetime_tired_v2135 tired_v2135 effectivedatetime_tired_v2136 tired_v2136 effectivedatetime_tired_v2137 tired_v2137 effectivedatetime_tired_v2138 tired_v2138 effectivedatetime_tired_v2139 tired_v2139 effectivedatetime_tired_v2140 tired_v2140 effectivedatetime_tired_v2141 tired_v2141 effectivedatetime_tired_v2142 tired_v2142 effectivedatetime_tired_v2143 tired_v2143 effectivedatetime_tired_v2144 tired_v2144 effectivedatetime_tired_v2145 tired_v2145 effectivedatetime_tired_v2146 tired_v2146 effectivedatetime_tired_v2147 tired_v2147 effectivedatetime_tired_v2148 tired_v2148 effectivedatetime_tired_v2149 tired_v2149 effectivedatetime_tired_v2150 tired_v2150 effectivedatetime_tired_v2151 tired_v2151 effectivedatetime_tired_v2152 tired_v2152 effectivedatetime_tired_v2153 tired_v2153 effectivedatetime_tired_v2154 tired_v2154 effectivedatetime_tired_v2155 tired_v2155 effectivedatetime_tired_v2156 tired_v2156 effectivedatetime_tired_v2157 tired_v2157 effectivedatetime_tired_v2158 tired_v2158 effectivedatetime_tired_v2159 tired_v2159 effectivedatetime_tired_v2160 tired_v2160 effectivedatetime_tired_v2161 tired_v2161 effectivedatetime_tired_v2162 tired_v2162 


save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_master_final_all_dec_2023_abdo_final_version", replace


////
use  "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_master_final_all_dec_2023", clear

drop _merge

merge m:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\symptom_all_3.dta"

drop if _merge==2

tab cancer_type, m

save  "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_master_final_all_dec_2023", replace
//// 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\symptom_all_3.dta", clear