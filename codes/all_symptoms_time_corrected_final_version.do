
************************************************************************************
* Project: OX94- CTYA cancer early clinical features
* Authors: Defne
* Date: 22/12/2021
* Version: 1.0
*
* 
* Input file: multiple, from OX94 projects
* Output file: log file;
* Checked by:       
*				        
*****************************************************************************


********************************************************************************
*     TABLE OF CONTENTS: 
*			 	symptoms
*				cohort
********************************************************************************

******any symptom retreival of constipation, unwell and balance/dizziness *********

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\as.dta", clear 

gen unwell=0
replace unwell=1 if term=="Feels unwell"

gen constipation=0
replace constipation=1 if term=="Constipation"

gen balance=0 
replace balance=1 if term=="Dizziness symptom" | term=="Unsteadiness present" | term=="Unsteady symptom" | term=="Had a collapse" | term=="Faint symptom" | term=="Syncope/vasovagal faint" | term=="Syncope symptom"

gen testicular_p=0 
replace testicular_p=1 if term=="Testicular pain"

gen testicular_s=0 
replace testicular_s=1 if term=="Testicular lump" |  term=="Testicular swelling" | term=="Scrotal swelling"



gen dizz=0 
replace dizz=1 if term=="Dizziness symptom" | term=="Unsteadiness present" | term=="Unsteady symptom" 

gen syncope=0 
replace syncope=1 if term=="Had a collapse" | term=="Faint symptom" | term=="Syncope/vasovagal faint" | term=="Syncope symptom"

gen mood=0
replace mood=1 if term=="Low mood" | term=="Symptom of depression" | term=="Sad mood"

gen diarrhoea=0 
replace diarrhoea=1 if term=="Diarrhoea" | term=="Loose stool"

gen knee_p=0
replace knee_p=1 if term=="Knee pain"
//
preserve 
keep if unwell==1 




rename effectivedatetime effectivedatetime_unwell


tab unwell 

bys patid: gen seq=_n 

reshape wide unwell effectivedatetime_unwell, i(patid) j(seq)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_54.dta", replace
restore

*******

preserve 
keep if constipation==1 


rename effectivedatetime effectivedatetime_constipation

tab constipation

bys patid: gen seq=_n 

drop if seq>50

reshape wide constipation effectivedatetime_constipation, i(patid) j(seq)


save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_55.dta", replace
restore

**********

preserve 
keep if balance==1 

drop code term conceptid dizz syncope

rename effectivedatetime effectivedatetime_balance


bys patid: gen seq=_n 

reshape wide balance effectivedatetime_balance, i(patid) j(seq)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_56.dta", replace
restore

**********

preserve 
keep if testicular_p==1 


rename effectivedatetime effectivedatetime_testicular_p

bys patid: gen seq=_n 

reshape wide testicular_p effectivedatetime_testicular_p, i(patid) j(seq)


save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_57.dta", replace
restore




**********

preserve 
keep if testicular_s==1 


rename effectivedatetime effectivedatetime_testicular_s

bys patid: gen seq=_n 

reshape wide testicular_s effectivedatetime_testicular_s, i(patid) j(seq)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\symptom_58.dta", replace
restore

**********

preserve 
keep if dizz==1 


rename effectivedatetime effectivedatetime_dizz

bys patid: gen seq=_n 

drop codegroupid varname code term conceptid balance syncope

reshape wide dizz effectivedatetime_dizz, i(patid) j(seq)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_59.dta", replace
restore

***

preserve 
keep if syncope==1 


rename effectivedatetime effectivedatetime_syncope


bys patid: gen seq=_n 

drop codegroupid varname code term conceptid balance dizz

reshape wide syncope effectivedatetime_syncope, i(patid) j(seq)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_60.dta", replace
restore

*******

preserve 
keep if mood==1 


rename effectivedatetime effectivedatetime_mood

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_61.dta", replace
restore

*****
preserve 
keep if diarrhoea==1 



rename effectivedatetime effectivedatetime_diarrhoea


save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_62.dta", replace
restore

*******

preserve 
keep if knee_p==1 


rename effectivedatetime effectivedatetime_knee_p


save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_63.dta", replace
restore

******** organomegaly ***********
clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_13966.dta"

destring patid, replace


gen organomegaly=0
replace organomegaly=1 if (term== "Hepatosplenomegaly" | term=="O/E - gross splenomegaly" | term=="O/E - hepatomegaly" | term=="O/E - moderate splenomegaly" |term=="O/E - moderate splenomegaly" |term=="O/E - painful splenomegaly " |term=="O/E - spleen enlarged" |term=="O/E - spleen just palpable" |term=="O/E - splenomegaly"|term=="O/E - splenomegaly NOS"|term=="[D]Hepatomegaly"|term=="[D]Liver enlargement"|term=="[D]Hepatomegaly NOS"|term=="[D]Spleen enlargement" |term=="[D]Splenomegaly" |term=="[D]Splenomegaly NOS")

drop if organomegaly==0


//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_organo=_N
sort max_pres_organo
gen pres_cat_organo=0
replace pres_cat_organo=1 if max_pres_organo>1


rename effectivedatetime effectivedatetime_organomegaly

bys patid: gen seq=_n 


drop codegroupid code term conceptid varname

reshape wide organomegaly effectivedatetime_organomegaly, i(patid) j(seq)



save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_1.dta", replace

******** lymphadenopathy ***********
clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_13977.dta"

destring patid, replace

tab term


gen lympho=0
replace lympho=1 if codegroupid==13977


//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_lympho=_N
sort max_pres_lympho
gen pres_cat_lympho=0
replace pres_cat_lympho=1 if max_pres_lympho>1

rename effectivedatetime effectivedatetime_lympho

bys patid: gen seq=_n 

drop codegroupid code term conceptid varname

reshape wide lympho effectivedatetime_lympho, i(patid) j(seq)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_2.dta", replace

******** fever ***********
clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_13982.dta"

destring patid, replace
tab term


gen fever_v2=0
replace fever_v2=1 if codegroupid==13982


//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_fever_v2=_N
sort max_pres_fever_v2
gen pres_cat_fever_v2=0
replace pres_cat_fever_v2=1 if max_pres_fever_v2>1

rename effectivedatetime effectivedatetime_fever_v2

bys patid: gen seq=_n 

drop if seq>50


drop codegroupid code term conceptid varname

reshape wide fever_v2 effectivedatetime_fever_v2, i(patid) j(seq)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_3.dta", replace

******** urti ***********
clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_13983.dta"

destring patid, replace

tab term


gen urti_v2=0
replace urti_v2=1 if codegroupid==13983

//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_urti_v2=_N
sort max_pres_urti_v2
gen pres_cat_urti_v2=0
replace pres_cat_urti_v2=1 if max_pres_urti_v2>1

rename effectivedatetime effectivedatetime_urti_v2

bys patid: gen seq=_n

drop if seq>50 


drop codegroupid code term conceptid varname

reshape wide urti_v2 effectivedatetime_urti_v2, i(patid) j(seq)


save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_4.dta", replace

******** limb ***********
clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_13984.dta"

destring patid, replace
tab term


gen limb_v2=0
replace limb_v2=1 if codegroupid==13984


//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_limb_v2=_N
sort max_pres_limb_v2
gen pres_cat_limb_v2=0
replace pres_cat_limb_v2=1 if max_pres_limb_v2>1

rename effectivedatetime effectivedatetime_limb_v2

bys patid: gen seq=_n 


drop codegroupid code term conceptid varname

reshape wide limb_v2 effectivedatetime_limb_v2, i(patid) j(seq)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_5.dta", replace


******** joint ***********
clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_13986.dta"

destring patid, replace

tab term


gen joint_v2=0
replace joint_v2=1 if codegroupid==13986

//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_joint_v2=_N
sort max_pres_joint_v2
gen pres_cat_joint_v2=0
replace pres_cat_joint_v2=1 if max_pres_joint_v2>1

rename effectivedatetime effectivedatetime_joint_v2

bys patid: gen seq=_n 


drop codegroupid code term conceptid varname

reshape wide joint_v2 effectivedatetime_joint_v2, i(patid) j(seq)


save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_6.dta", replace

******** limp ***********
clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_13987.dta"

destring patid, replace

tab term


gen limp_v2=0
replace limp_v2=1 if codegroupid==13987

//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_limp_v2=_N
sort max_pres_limp_v2
gen pres_cat_limp_v2=0
replace pres_cat_limp_v2=1 if max_pres_limp_v2>1

rename effectivedatetime effectivedatetime_limp_v2

bys patid: gen seq=_n 


drop codegroupid code term conceptid varname

reshape wide limp_v2 effectivedatetime_limp_v2, i(patid) j(seq)


save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_7.dta", replace

******** anpa ***********
clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_13988.dta"

destring patid, replace

tab term


gen anpa_v2=0
replace anpa_v2=1 if codegroupid==13988


//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_anpa_v2=_N
sort max_pres_anpa_v2
gen pres_cat_anpa_v2=0
replace pres_cat_anpa_v2=1 if max_pres_anpa_v2>1

rename effectivedatetime effectivedatetime_anpa_v2

bys patid: gen seq=_n 

drop codegroupid code term conceptid varname

reshape wide anpa_v2 effectivedatetime_anpa_v2, i(patid) j(seq)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_8.dta", replace

******** tired ***********
clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_13989.dta"

destring patid, replace

tab term


gen tired_v2=0
replace tired_v2=1 if codegroupid==13989


//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_tired_v2=_N
sort max_pres_tired_v2
gen pres_cat_tired_v2=0
replace pres_cat_tired_v2=1 if max_pres_tired_v2>1

rename effectivedatetime effectivedatetime_tired_v2

bys patid: gen seq=_n 


drop codegroupid code term conceptid varname

reshape wide tired_v2 effectivedatetime_tired_v2, i(patid) j(seq)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_9.dta", replace

******** abdop ***********
clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_13991.dta"

destring patid, replace

tab term


gen abdop_v2=0
replace abdop_v2=1 if codegroupid==13991

//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_abdop_v2=_N
sort max_pres_abdop_v2
gen pres_cat_abdop_v2=0
replace pres_cat_abdop_v2=1 if max_pres_abdop_v2>1

rename effectivedatetime effectivedatetime_abdop_v2

bys patid: gen seq=_n 

drop codegroupid code term conceptid varname

reshape wide abdop_v2 effectivedatetime_abdop_v2, i(patid) j(seq)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_10.dta", replace

******** anorexia ***********
clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_13993.dta"

destring patid, replace
tab term


gen anorexia_v2=0
replace anorexia_v2=1 if codegroupid==13993


//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_anorexia_v2=_N
sort max_pres_anorexia_v2
gen pres_cat_anorexia_v2=0
replace pres_cat_anorexia_v2=1 if max_pres_anorexia_v2>1

rename effectivedatetime effectivedatetime_anorexia_v2

bys patid: gen seq=_n 

drop codegroupid code term conceptid varname

reshape wide anorexia_v2 effectivedatetime_anorexia_v2, i(patid) j(seq)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_11.dta", replace

******** rash ***********
clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_13994.dta"

destring patid, replace

tab term

drop if term=="Child exam.: skin" | term=="[D]Spots"  | term=="O/E - no skin plaque" | term=="History of pressure ulcer"

gen rash_v2=0
replace rash_v2=1 if codegroupid==13994

//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_rash_v2=_N
sort max_pres_rash_v2
gen pres_cat_rash_v2=0
replace pres_cat_rash_v2=1 if max_pres_rash_v2>1

rename effectivedatetime effectivedatetime_rash_v2

bys patid: gen seq=_n 

drop if seq>100

drop codegroupid code term conceptid varname

reshape wide rash_v2 effectivedatetime_rash_v2, i(patid) j(seq)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_12.dta", replace


******** skin ***********
clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_13996.dta"

destring patid, replace

tab term


gen skin_v2=0
replace skin_v2=1 if codegroupid==13996


//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_skin_v2=_N
sort max_pres_skin_v2
gen pres_cat_skin_v2=0
replace pres_cat_skin_v2=1 if max_pres_skin_v2>1

rename effectivedatetime effectivedatetime_skin_v2

bys patid: gen seq=_n 

drop codegroupid code term conceptid varname

reshape wide skin_v2 effectivedatetime_skin_v2, i(patid) j(seq)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_13.dta", replace


******** hnp ***********
clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_13997.dta"

destring patid, replace

tab term


gen hnp_v2=0
replace hnp_v2=1 if codegroupid==13997


//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_hnp_v2=_N
sort max_pres_hnp_v2
gen pres_cat_hnp_v2=0
replace pres_cat_hnp_v2=1 if max_pres_hnp_v2>1

rename effectivedatetime effectivedatetime_hnp_v2

bys patid: gen seq=_n 

drop codegroupid code term conceptid varname

reshape wide hnp_v2 effectivedatetime_hnp_v2, i(patid) j(seq)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_14.dta", replace


******** hns ***********
clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_13998.dta"

destring patid, replace

 


drop if (term=="[D]Intracranial lesion" | term=="[D]Space-occupying intracranial lesion NOS" )

gen hns_v2=0
replace hns_v2=1 if codegroupid==13998


//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_hns_v2=_N
sort max_pres_hns_v2
gen pres_cat_hns_v2=0
replace pres_cat_hns_v2=1 if max_pres_hns_v2>1

rename effectivedatetime effectivedatetime_hns_v2

bys patid: gen seq=_n 

drop codegroupid code term conceptid varname

reshape wide hns_v2 effectivedatetime_hns_v2, i(patid) j(seq)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_15.dta", replace

******** cl ***********
clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_14003.dta"

destring patid, replace

 

tab term


gen cl_v2=0
replace cl_v2=1 if codegroupid==14003

//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_cl_v2=_N
sort max_pres_cl_v2
gen pres_cat_cl_v2=0
replace pres_cat_cl_v2=1 if max_pres_cl_v2>1

rename effectivedatetime effectivedatetime_cl_v2

bys patid: gen seq=_n 


drop codegroupid code term conceptid varname

reshape wide cl effectivedatetime_cl, i(patid) j(seq)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_16.dta", replace




******** SR features 3 - resp symptoms***********

clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_14012.dta"

destring patid, replace

 

tab term


drop if term=="Night cough absent" 

preserve
gen resp=0
replace resp=1 if codegroupid==14012
tab resp

//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_resp=_N
sort max_pres_resp
gen pres_cat_resp=0
replace pres_cat_resp=1 if max_pres_resp>1

rename effectivedatetime effectivedatetime_resp

bys patid: gen seq=_n 


drop codegroupid code term conceptid varname

reshape wide resp effectivedatetime_resp, i(patid) j(seq)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_17.dta", replace
restore

gen chest_pain=0
replace chest_pain=1 if strpos(lower(term), "pain" )>0
tab chest_pain

preserve
drop if chest_pain==0


//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_cp=_N
sort max_pres_cp
gen pres_cat_cp=0
replace pres_cat_cp=1 if max_pres_cp>1

rename effectivedatetime effectivedatetime_cp

bys patid: gen seq=_n 


drop codegroupid code term conceptid varname

reshape wide chest_pain effectivedatetime_cp, i(patid) j(seq)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_18.dta", replace
restore

gen cough=0
replace cough=1 if strpos(lower(term), "cough")>0
tab cough

preserve 

drop if cough==0

//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_cough=_N
sort max_pres_cough
gen pres_cat_cough=0
replace pres_cat_cough=1 if max_pres_cough>1

rename effectivedatetime effectivedatetime_cough

bys patid: gen seq=_n 


drop codegroupid code term conceptid varname

reshape wide cough effectivedatetime_cough, i(patid) j(seq)


save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_19.dta", replace
restore

gen breathless=0 
replace breathless=1 if cough==0 & chest_pain==0
tab breathless
sort breathless
by breathless: tab term

preserve 
drop if breathless==0


//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_breathless=_N
sort max_pres_breathless
gen pres_cat_breathless=0
replace pres_cat_breathless=1 if max_pres_breathless>1

rename effectivedatetime effectivedatetime_breathless

bys patid: gen seq=_n 


drop codegroupid code term conceptid varname

reshape wide breathless effectivedatetime_breathless, i(patid) j(seq)


save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_20.dta", replace
restore

******** headache ***********
clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_11344.dta"

destring patid, replace

 

tab term

drop if term=="H/O migraine with aura" | term==" H/O: migraine" | term=="H/O: migraine without aura"

gen headache_v2=0
replace headache_v2=1 if codegroupid==11344


//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_headache_v2=_N
sort max_pres_headache_v2
gen pres_cat_headache_v2=0
replace pres_cat_headache_v2=1 if max_pres_headache_v2>1

rename effectivedatetime effectivedatetime_headache_v2

bys patid: gen seq=_n 


drop codegroupid code term conceptid varname

reshape wide headache_v2 effectivedatetime_headache_v2, i(patid) j(seq)



save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_21.dta", replace



****bleeding/bruising*****

clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_11337.dta"

destring patid, replace

 

tab term


gen bruise_v2=0
replace bruise_v2=1 if codegroupid==11337


//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_bruise_v2=_N
sort max_pres_bruise_v2
gen pres_cat_bruise_v2=0
replace pres_cat_bruise_v2=1 if max_pres_bruise_v2>1

rename effectivedatetime effectivedatetime_bruise_v2

bys patid: gen seq=_n 


drop codegroupid code term conceptid varname

reshape wide bruise_v2 effectivedatetime_bruise_v2, i(patid) j(seq)



save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_22.dta", replace

****vomiting*****

clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_11346.dta"

destring patid, replace

 

tab term


gen vomit_v2=0
replace vomit_v2=1 if codegroupid==11346


//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_vomit_v2=_N
sort max_pres_vomit_v2
gen pres_cat_vomit_v2=0
replace pres_cat_vomit_v2=1 if max_pres_vomit_v2>1

rename effectivedatetime effectivedatetime_vomit_v2

bys patid: gen seq=_n 

drop if seq>100
drop codegroupid code term conceptid varname

reshape wide vomit_v2 effectivedatetime_vomit_v2, i(patid) j(seq)



save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_23.dta", replace

****hepatomegaly*****

clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_13974.dta"

destring patid, replace

 

tab term


drop if (term=="O/E - liver character NOS" | term=="O/E - liver character normal" | term=="O/E - liver character")

gen hepatomegaly_v2=0
replace hepatomegaly_v2=1 if codegroupid==13974


//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_hepatomegaly_v2=_N
sort max_pres_hepatomegaly_v2
gen pres_cat_hepatomegaly_v2=0
replace pres_cat_hepatomegaly_v2=1 if max_pres_hepatomegaly_v2>1

rename effectivedatetime effectivedatetime_hepatomegaly

bys patid: gen seq=_n 


drop codegroupid code term conceptid varname

reshape wide hepatomegaly_v2 effectivedatetime_hepatomegaly, i(patid) j(seq)


save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_24.dta", replace

****splenomegaly*****

clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_13975.dta"

destring patid, replace

 

tab term


gen splenomegaly_v2=0
replace splenomegaly_v2=1 if codegroupid==13975

//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_splenomegaly_v2=_N
sort max_pres_splenomegaly_v2
gen pres_cat_splenomegaly_v2=0
replace pres_cat_splenomegaly_v2=1 if max_pres_splenomegaly_v2>1

rename effectivedatetime effectivedatetime_splenomegaly

bys patid: gen seq=_n 


drop codegroupid code term conceptid varname

reshape wide splenomegaly effectivedatetime_splenomegaly, i(patid) j(seq)


save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_25.dta", replace

****hepatosplenomegaly*****

clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_13976.dta"

destring patid, replace

 

tab term


gen hepatosplenomegaly_v2=0
replace hepatosplenomegaly_v2=1 if codegroupid==13976


//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_hepatosplenomegaly_v2=_N
sort max_pres_hepatosplenomegaly_v2
gen pres_cat_hepatosplenomegaly_v2=0
replace pres_cat_hepatosplenomegaly_v2=1 if max_pres_hepatosplenomegaly_v2>1

rename effectivedatetime effectivedatetime_hsm


bys patid: gen seq=_n 


drop codegroupid code term conceptid varname

reshape wide hepatosplenomegaly_v2 effectivedatetime_hsm, i(patid) j(seq)



save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_26.dta", replace

****abdomass*****

clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_13978.dta"

destring patid, replace

 

tab term


gen abdomass_v2=0
replace abdomass_v2=1 if codegroupid==13978


//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_abdomass_v2=_N
sort max_pres_abdomass_v2
gen pres_cat_abdomass_v2=0
replace pres_cat_abdomass_v2=1 if max_pres_abdomass_v2>1

rename effectivedatetime effectivedatetime_abdomass

bys patid: gen seq=_n 


drop codegroupid code term conceptid varname

reshape wide abdomass_v2 effectivedatetime_abdomass, i(patid) j(seq)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_27.dta", replace

***** lumps/bumps*****************

clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_11350.dta"

destring patid, replace

 

tab term 

preserve
gen lump=0
replace lump=1 if codegroupid==14012
tab lump


//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_lump=_N
sort max_pres_lump
gen pres_cat_lump=0
replace pres_cat_lump=1 if max_pres_lump>1

rename effectivedatetime effectivedatetime_lump

bys patid: gen seq=_n 


drop codegroupid code term conceptid varname

reshape wide lump effectivedatetime_lump, i(patid) j(seq)


save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_28.dta", replace

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_11350.dta", clear

destring patid, replace

gen hn_lump=0
replace hn_lump=1 if strpos((term), "head" )>0
replace hn_lump=1 if strpos((term), "neck" )>0
replace hn_lump=1 if strpos((term), "mandibular" )>0
replace hn_lump=1 if strpos((term), "parotid" )>0
replace hn_lump=1 if strpos((term), "nose" )>0
replace hn_lump=1 if strpos((term), "subungual" )>0
replace hn_lump=1 if strpos((term), "face" )>0
replace hn_lump=1 if strpos((term), "ear" )>0


preserve
keep if hn_lump==1
//4) calculate number of presentations in total 

sort patid effectivedatetime
by patid: gen max_pres_hn_lump=_N
sort max_pres_hn_lump
gen pres_cat_hn_lump=0
replace pres_cat_hn_lump=1 if max_pres_hn_lump>1

rename effectivedatetime effectivedatetime_hn_lump

bys patid: gen seq=_n 


drop codegroupid code term conceptid varname

reshape wide hn_lump effectivedatetime_hn_lump, i(patid) j(seq)


save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_29.dta", replace

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_29.dta", clear
restore


preserve

gen other_lump=0
replace other_lump=1 if hn_lump==0


keep if other_lump==1
//4) calculate number of presentations in total 
destring patid, replace
sort patid effectivedatetime
by patid: gen max_pres_other_lump=_N
sort max_pres_other_lump
gen pres_cat_other_lump=0
replace pres_cat_other_lump=1 if max_pres_other_lump>1

rename effectivedatetime effectivedatetime_other_lump

bys patid: gen seq=_n 

drop if other_lump==0
drop codegroupid code term conceptid varname hn_lump 

reshape wide other_lump effectivedatetime_other_lump, i(patid) j(seq)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_30.dta", replace
restore

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_30.dta", clear



****weight loss*****

clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_13992.dta"

destring patid, replace

 

tab term


gen wl_v2=0
replace wl_v2=1 if codegroupid==13992

//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_wl_v2=_N
sort max_pres_wl_v2
gen pres_cat_wl_v2=0
replace pres_cat_wl_v2=1 if max_pres_wl_v2>1

rename effectivedatetime effectivedatetime_wl

bys patid: gen seq=_n 


drop codegroupid code term conceptid varname

reshape wide wl_v2 effectivedatetime_wl, i(patid) j(seq)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_31.dta", replace


****pruritus*****

clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_11342.dta"

destring patid, replace

 

tab term


gen pruritus_v2=0
replace pruritus_v2=1 if codegroupid==11342


//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_pruritus_v2=_N
sort max_pres_pruritus_v2
gen pres_cat_pruritus_v2=0
replace pres_cat_pruritus_v2=1 if max_pres_pruritus_v2>1

rename effectivedatetime effectivedatetime_pruritus

bys patid: gen seq=_n 


drop codegroupid code term conceptid varname

reshape wide pruritus_v2 effectivedatetime_pruritus, i(patid) j(seq)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_32.dta", replace



****pap*****

clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_13945.dta"

destring patid, replace

 

tab term


gen pap_v2=0
replace pap_v2=1 if codegroupid==13945


//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_pap_v2=_N
sort max_pres_pap_v2
gen pres_cat_pap_v2=0
replace pres_cat_pap_v2=1 if max_pres_pap_v2>1

rename effectivedatetime effectivedatetime_pap

bys patid: gen seq=_n 


drop codegroupid code term conceptid varname

reshape wide pap effectivedatetime_pap, i(patid) j(seq)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_35.dta", replace

****macro*****

clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_13946.dta"

destring patid, replace

 

tab term

drop if strpos(lower(term), "hydrocephalus")>0 

gen macro_v2=0
replace macro_v2=1 if codegroupid==13946


//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_macro_v2=_N
sort max_pres_macro_v2
gen pres_cat_macro_v2=0
replace pres_cat_macro_v2=1 if max_pres_macro_v2>1

rename effectivedatetime effectivedatetime_macro

bys patid: gen seq=_n 


drop codegroupid code term conceptid varname

reshape wide macro_v2 effectivedatetime_macro, i(patid) j(seq)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_36.dta", replace


****hemi*****

clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_13947.dta"

destring patid, replace

 

tab term


gen hemi_v2=0
replace hemi_v2=1 if codegroupid==13947


//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_hemi_v2=_N
sort max_pres_hemi_v2
gen pres_cat_hemi_v2=0
replace pres_cat_hemi_v2=1 if max_pres_hemi_v2>1

rename effectivedatetime effectivedatetime_hemi

bys patid: gen seq=_n 

drop if seq>100
drop codegroupid code term conceptid varname

reshape wide hemi_v2 effectivedatetime_hemi, i(patid) j(seq)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_37.dta", replace

****hemipa*****

clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_13950.dta"

destring patid, replace

 

tab term


gen hemipa_v2=0
replace hemipa_v2=1 if codegroupid==13950


//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_hemipa_v2=_N
sort max_pres_hemipa_v2
gen pres_cat_hemipa_v2=0
replace pres_cat_hemipa_v2=1 if max_pres_hemipa_v2>1

rename effectivedatetime effectivedatetime_hemipa

bys patid: gen seq=_n 


drop codegroupid code term conceptid varname

reshape wide hemipa_v2 effectivedatetime_hemipa, i(patid) j(seq)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_38.dta", replace

****tort*****

clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_13951.dta"

destring patid, replace

 

tab term


gen tort_v2=0
replace tort_v2=1 if codegroupid==13951


//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_tort_v2=_N
sort max_pres_tort_v2
gen pres_cat_tort_v2=0
replace pres_cat_tort_v2=1 if max_pres_tort_v2>1

rename effectivedatetime effectivedatetime_tort

bys patid: gen seq=_n 


drop codegroupid code term conceptid varname

reshape wide tort_v2 effectivedatetime_tort, i(patid) j(seq)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_39.dta", replace

****squint*****

clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_13952.dta"

destring patid, replace

 

tab term


gen squint_v2=0
replace squint_v2=1 if codegroupid==13952

//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_squint_v2=_N
sort max_pres_squint_v2
gen pres_cat_squint_v2=0
replace pres_cat_squint_v2=1 if max_pres_squint_v2>1

rename effectivedatetime effectivedatetime_squint

bys patid: gen seq=_n 


drop codegroupid code term conceptid varname

reshape wide squint_v2 effectivedatetime_squint, i(patid) j(seq)


save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_40.dta", replace



****eyem*****

clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_13953.dta"

destring patid, replace

 

tab term

drop if term=="O/E - eye movement NOS" | term=="O/E - eye movements" | term=="O/E - eye movements normal"

gen eye=0
replace eye=1 if codegroupid==13953


//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_eyem_v2=_N
sort max_pres_eyem_v2
gen pres_cat_eyem_v2=0
replace pres_cat_eyem_v2=1 if max_pres_eyem_v2>1

rename effectivedatetime effectivedatetime_eyem

bys patid: gen seq=_n 


drop codegroupid code term conceptid varname

reshape wide eye effectivedatetime_eyem, i(patid) j(seq)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_41.dta", replace



****acuity*****

clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_13954.dta"

destring patid, replace

 

tab term

drop if term=="O/E - visual acuity R-eye" | term=="Child exam.: vision" 

gen acuity=0
replace acuity=1 if codegroupid==13954


//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_acuity_v2=_N
sort max_pres_acuity_v2
gen pres_cat_acuity_v2=0
replace pres_cat_acuity_v2=1 if max_pres_acuity_v2>1

rename effectivedatetime effectivedatetime_acuity

bys patid: gen seq=_n 


drop codegroupid code term conceptid varname

reshape wide acuity effectivedatetime_acuity, i(patid) j(seq)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_42.dta", replace

****diplopia*****

clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_13954.dta"

destring patid, replace

 

tab term

keep if term=="Double vision" | term=="Diplopia/double vision" | term=="Diplopia" 

gen diplopia=0
replace diplopia=1 if codegroupid==13954

//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_diplopia_v2=_N
sort max_pres_diplopia_v2
gen pres_cat_diplopia_v2=0
replace pres_cat_diplopia_v2=1 if max_pres_diplopia_v2>1

rename effectivedatetime effectivedatetime_diplopia

bys patid: gen seq=_n 


drop codegroupid code term conceptid varname

reshape wide diplopia effectivedatetime_diplopia, i(patid) j(seq)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_43.dta", replace

****exopthalmos*****

clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_13956.dta"

destring patid, replace

 

tab term


gen exopthalmos=0
replace exopthalmos=1 if codegroupid==13956


//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_exopthalmos_v2=_N
sort max_pres_exopthalmos_v2
gen pres_cat_exopthalmos_v2=0
replace pres_cat_exopthalmos_v2=1 if max_pres_exopthalmos_v2>1

rename effectivedatetime effectivedatetime_exopthalmos

bys patid: gen seq=_n 


drop codegroupid code term conceptid varname

reshape wide exopthalmos effectivedatetime_exopthalmos, i(patid) j(seq)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_44.dta", replace

****behaviour*****

clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_13957.dta"

destring patid, replace

 

tab term

drop if term=="Child exam.: general behaviour"

gen behaviour=0
replace behaviour=1 if codegroupid==13957


//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_behaviour_v2=_N
sort max_pres_behaviour_v2
gen pres_cat_behaviour_v2=0
replace pres_cat_behaviour_v2=1 if max_pres_behaviour_v2>1

rename effectivedatetime effectivedatetime_behaviour

bys patid: gen seq=_n 


drop codegroupid code term conceptid varname

reshape wide behaviour effectivedatetime_behaviour, i(patid) j(seq)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_45.dta", replace

****irritability*****

clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_13958.dta"

destring patid, replace

 

tab term


gen irritability=0
replace irritability=1 if codegroupid==13958


//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_irritability_v2=_N
sort max_pres_irritability_v2
gen pres_cat_irritability_v2=0
replace pres_cat_irritability_v2=1 if max_pres_irritability_v2>1

rename effectivedatetime effectivedatetime_irritability

bys patid: gen seq=_n 


drop codegroupid code term conceptid varname

reshape wide irritability effectivedatetime_irritability, i(patid) j(seq)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_46.dta", replace

****delay*****

clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_13961.dta"

destring patid, replace

 

tab term


gen delay=0
replace delay=1 if codegroupid==13961


//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_delay_v2=_N
sort max_pres_delay_v2
gen pres_cat_delay_v2=0
replace pres_cat_delay_v2=1 if max_pres_delay_v2>1

rename effectivedatetime effectivedatetime_delay

bys patid: gen seq=_n 


drop codegroupid code term conceptid varname

reshape wide delay effectivedatetime_delay, i(patid) j(seq)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_47.dta", replace


****voice*****

clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_13962.dta"

destring patid, replace

 

tab term


gen voice=0
replace voice=1 if codegroupid==13962

//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_voice_v2=_N
sort max_pres_voice_v2
gen pres_cat_voice_v2=0
replace pres_cat_voice_v2=1 if max_pres_voice_v2>1

rename effectivedatetime effectivedatetime_voice

bys patid: gen seq=_n 


drop codegroupid code term conceptid varname

reshape wide voice effectivedatetime_voice, i(patid) j(seq)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_48.dta", replace

****cranial*****

clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_13963.dta"

destring patid, replace

 

tab term


gen cranial=0
replace cranial=1 if codegroupid==13963


//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_cranial_v2=_N
sort max_pres_cranial_v2
gen pres_cat_cranial_v2=0
replace pres_cat_cranial_v2=1 if max_pres_cranial_v2>1

rename effectivedatetime effectivedatetime_cranial

bys patid: gen seq=_n 


drop codegroupid code term conceptid varname

reshape wide cranial effectivedatetime_cranial, i(patid) j(seq)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_49.dta", replace

****seizure*****

clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_13964.dta"

destring patid, replace

 

tab term

drop if term=="1 to 12 seizures a year" | term=="1 to 7 seizures a week" | term=="2 to 4 seizures a month" | term=="Daily seizures"

gen seizure=0
replace seizure=1 if codegroupid==13964


//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_seizure_v2=_N
sort max_pres_seizure_v2
gen pres_cat_seizure_v2=0
replace pres_cat_seizure_v2=1 if max_pres_seizure_v2>1

rename effectivedatetime effectivedatetime_seizure

bys patid: gen seq=_n 


drop codegroupid code term conceptid varname

reshape wide seizure effectivedatetime_seizure, i(patid) j(seq)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_50.dta", replace

****puberty*****

clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_13965.dta"

destring patid, replace

 

tab term

drop if term=="Delayed puberty NEC"

gen puberty=0
replace puberty=1 if codegroupid==13965


//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_puberty_v2=_N
sort max_pres_puberty_v2
gen pres_cat_puberty_v2=0
replace pres_cat_puberty_v2=1 if max_pres_puberty_v2>1

rename effectivedatetime effectivedatetime_puberty

bys patid: gen seq=_n 


drop codegroupid code term conceptid varname

reshape wide puberty effectivedatetime_puberty, i(patid) j(seq)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_51.dta", replace

****gait*****

clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_11347.dta"

destring patid, replace

 

tab term

drop if term=="O/E - gait" | term=="O/E - gait NOS" | term=="O/E - coordination NOS" | term=="O/E - coordination" | term=="O/E - Romberg negative" | term=="No incoordination"


gen gait=0
replace gait=1 if codegroupid==11347



//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_gait_v2=_N
sort max_pres_gait_v2
gen pres_cat_gait_v2=0
replace pres_cat_gait_v2=1 if max_pres_gait_v2>1

rename effectivedatetime effectivedatetime_gait

bys patid: gen seq=_n 


drop codegroupid code term conceptid varname

reshape wide gait effectivedatetime_gait, i(patid) j(seq)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_52.dta", replace

****haematuria*****

clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_11351.dta"

destring patid, replace

 

tab term

drop if term=="H/O: haematuria" | term=="RBCs- red blood cells in urine" | term== "IgA nephropathy" | term=="Urine dipstick for blood" | term=="Urine blood test"

gen haematuria=0
replace haematuria=1 if codegroupid==11351


//4) calculate number of presentations in total 
sort patid effectivedatetime
by patid: gen max_pres_haematuria_v2=_N
sort max_pres_haematuria_v2
gen pres_cat_haematuria_v2=0
replace pres_cat_haematuria_v2=1 if max_pres_haematuria_v2>1

rename effectivedatetime effectivedatetime_haematuria
bys patid: gen seq=_n 


drop codegroupid code term conceptid varname

reshape wide haematuria effectivedatetime_haematuria, i(patid) j(seq)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_53.dta", replace




**** append all relevant symptom files *********

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_1.dta", clear
global n 63
forval x=2/$n {
	
merge 1:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_`x'.dta"
drop _merge
}
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\symptom_all.dta", replace


use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_29.dta", clear
global n 30
forval x=29/$n {
	
merge 1:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\Symptom_`x'.dta"
drop _merge
}

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\symptom_all_3.dta", replace


use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\symptom_all_3.dta", clear

*** CC set up *** 
clear
clear matrix
set maxvar 10000
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_v2.dta", clear
 
 merge m:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\symptom_all.dta"
 
 drop if _merge==2
 
 save  "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_p1_v2.dta", replace
 
 
 
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_p1_v2.dta", clear

drop _merge

merge m:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\symptom_all_2.dta"

drop if _merge==2

tab cancer_type, m

save  "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_final_v2", replace


use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_final_v2.dta", clear

drop _merge

merge m:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\symptom_all_3.dta"

drop if _merge==2

tab cancer_type, m

save  "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_final", replace


***************************

** CC set up Cancer subtypes *** 
clear
clear matrix
set maxvar 10000
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_v2_leuk.dta", clear
 
 merge m:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\symptom_all.dta"
 
 drop if _merge==2
 
 save  "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_p1_v2_leuk.dta", replace
 
 
 
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_p1_v2_leuk.dta", clear

drop _merge

merge m:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\symptom_all_2.dta"

drop if _merge==2

tab cancer_type, m

save  "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_final_v2_leuk", replace


use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_final_v2_leuk.dta", clear

drop _merge

merge m:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\symptom_all_3.dta"

drop if _merge==2

tab cancer_type, m

save  "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_final_leuk", replace

************Lymphoma


clear
clear matrix
set maxvar 10000
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_v2_lymph.dta", clear
 
 merge m:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\symptom_all.dta"
 
 drop if _merge==2
 
 save  "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_p1_v2_lymph.dta", replace
 
 
 
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_p1_v2_lymph.dta", clear

drop _merge

merge m:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\symptom_all_2.dta"

drop if _merge==2

tab cancer_type, m

save  "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_final_v2_lymph", replace


use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_final_v2_lymph.dta", clear

drop _merge

merge m:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\symptom_all_3.dta"

drop if _merge==2

tab cancer_type, m

save  "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_final_lymph", replace


************CNS


clear
clear matrix
set maxvar 10000
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_v2_CNS.dta", clear
 
 merge m:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\symptom_all.dta"
 
 drop if _merge==2
 
 save  "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_p1_v2_CNS.dta", replace
 
 
 
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_p1_v2_CNS.dta", clear

drop _merge

merge m:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\symptom_all_2.dta"

drop if _merge==2

tab cancer_type, m

save  "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_final_v2_CNS", replace


use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_final_v2_CNS.dta", clear

drop _merge

merge m:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\symptom_all_3.dta"

drop if _merge==2

tab cancer_type, m

save  "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_final_CNS", replace


************Sarcoma


clear
clear mata
clear matrix
set maxvar 10000
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_v2_sarcoma.dta", clear
 
 merge m:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\symptom_all.dta"
 
 drop if _merge==2
 
 save  "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_p1_v2_sarcoma.dta", replace
 
 
 
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_p1_v2_sarcoma.dta", clear

drop _merge

merge m:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\symptom_all_2.dta"

drop if _merge==2

tab cancer_type, m

save  "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_final_v2_sarcoma", replace


use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_final_v2_sarcoma.dta", clear

drop _merge

merge m:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\symptom_all_3.dta"

drop if _merge==2

tab cancer_type, m

save  "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_final_sarcoma", replace




************abdo


clear
clear mata
clear matrix
set maxvar 10000
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_v2_abdo.dta", clear
 
 merge m:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\symptom_all.dta"
 
 drop if _merge==2
 
 save  "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_p1_v2_abdo.dta", replace
 
 
 
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_p1_v2_abdo.dta", clear

drop _merge

merge m:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\symptom_all_2.dta"

drop if _merge==2

tab cancer_type, m

save  "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_final_v2_abdo", replace


use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_final_v2_abdo.dta", clear

drop _merge

merge m:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\symptom_all_3.dta"

drop if _merge==2

tab cancer_type, m

save  "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_final_abdo", replace


 **************germ


clear
clear mata
clear matrix
set maxvar 10000
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_v2_germ.dta", clear
 
 merge m:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\symptom_all.dta"
 
 drop if _merge==2
 
 save  "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_p1_v2_germ.dta", replace
 


 
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_p1_v2_germ.dta", clear

drop _merge

merge m:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\symptom_all_2.dta"

drop if _merge==2

tab cancer_type, m

save  "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_final_v2_germ", replace


use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_final_v2_germ.dta", clear

drop _merge

merge m:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\symptom_all_3.dta"

drop if _merge==2

tab cancer_type, m

save  "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_final_germ", replace




*************Cohort Set up *********************

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_full_cohort_clean_final_revised.dta", clear 

merge 1:m patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\symptom_all.dta"

drop if _merge==2

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_final_cohort_symptoms.dta", replace


use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\symptom_all_3.dta", clear

