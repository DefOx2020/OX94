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
********************************************************************************



********************************************************************************
*     TABLE OF CONTENTS: 
*			Data cleaning and preparation 
*			Generation of cases & controls
********************************************************************************

log using "C:\Users\Defne Saatci.QRESEARCH\Downloads\ox94\log\cleaning_v2_DS.smcl", replace 

********************************************************************************
*                   1) DATA CLEAN AND INITIAL PREP                             *
********************************************************************************

***Cleaning files****

**the cohort file** 
clear

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_cohort1.dta" 

gen test=0 
replace test=1 if enter3>=exitdate

drop if test==1 


tab sex1



save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_cohort1_clean.dta",replace

**Cohort with cancer events file**

clear all

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\cancer_target.dta"

gen patid_n=real(patid)

drop patid

rename patid_n patid


//rule:if diagnosis in same year keep as duplicate and remove duplicate, if different years - remove latter as secondary cancer or relapse//

bys patid: gen dup= cond(_N==1,0, _n)
sort patid dup

bysort patid (cancer_date): gen seq=_n
sort dup seq
drop if seq>1


tab cancer_sex,m 


gen cancer_remove=0
replace cancer_remove=1 if (cancer_histology_coded=="80000" | cancer_histology_coded=="80001" | cancer_histology_coded=="80003" | cancer_histology_coded=="80006" | cancer_histology_coded=="80011"| cancer_histology_coded=="80013"| cancer_histology_coded=="80033" | cancer_histology_coded=="80043" | cancer_histology_coded=="80101" | cancer_histology_coded=="80102" | cancer_histology_coded=="80103" | cancer_histology_coded=="80105" | cancer_histology_coded=="80106" | cancer_histology_coded=="80113" | cancer_histology_coded=="80123" | cancer_histology_coded=="80133" | cancer_histology_coded=="80203" | cancer_histology_coded=="80206" | cancer_histology_coded=="80213" | cancer_histology_coded=="80223" |cancer_histology_coded=="80226" | cancer_histology_coded=="80311" |cancer_histology_coded=="80321" |cancer_histology_coded=="80323" | cancer_histology_coded=="80413" | cancer_histology_coded=="80416" |cancer_histology_coded=="80443" | cancer_histology_coded=="80463" | cancer_histology_coded=="80466" | cancer_histology_coded=="80502" | cancer_histology_coded=="80503" | cancer_histology_coded=="80702" |cancer_histology_coded=="80703" | cancer_histology_coded=="80705" |cancer_histology_coded=="80706" | cancer_histology_coded=="80712" | cancer_histology_coded=="80713" | cancer_histology_coded=="80722" | cancer_histology_coded=="80723" | cancer_histology_coded=="80733" | cancer_histology_coded=="80762" | cancer_histology_coded=="80763" | cancer_histology_coded=="80765" | cancer_histology_coded=="80772" | cancer_histology_coded=="80812" | cancer_histology_coded=="80823" | cancer_histology_coded=="80833" | cancer_histology_coded=="80863" | cancer_histology_coded=="80903" | cancer_histology_coded=="80913" | cancer_histology_coded=="80923" | cancer_histology_coded=="80933" | cancer_histology_coded=="80943" |cancer_histology_coded=="80973" | cancer_histology_coded=="81103" | cancer_histology_coded=="81201" | cancer_histology_coded=="81202" | cancer_histology_coded=="81203" | cancer_histology_coded=="81211" | cancer_histology_coded=="81301" | cancer_histology_coded=="81302" | cancer_histology_coded=="81303" | cancer_histology_coded=="81400" | cancer_histology_coded=="81402" | cancer_histology_coded=="81403" | cancer_histology_coded=="81405" | cancer_histology_coded=="81406" | cancer_histology_coded=="81409" | cancer_histology_coded=="81443" | cancer_histology_coded=="81453" | cancer_histology_coded=="81482" | cancer_histology_coded=="81603" | cancer_histology_coded=="82003" | cancer_histology_coded=="82103" | cancer_histology_coded=="82113" | cancer_histology_coded=="82153" | cancer_histology_coded=="82401" | cancer_histology_coded=="82403" | cancer_histology_coded=="82406" | cancer_histology_coded=="82433" | cancer_histology_coded=="82453" | cancer_histology_coded=="82463" | cancer_histology_coded=="82466" | cancer_histology_coded=="82493" | cancer_histology_coded=="82553" | cancer_histology_coded=="82612" | cancer_histology_coded=="82613" | cancer_histology_coded=="82632" | cancer_histology_coded=="82633" |  cancer_histology_coded=="83203" | cancer_histology_coded=="83233" | cancer_histology_coded=="83301" | cancer_histology_coded=="83303" | cancer_histology_coded=="83305" | cancer_histology_coded=="83333" | cancer_histology_coded=="83353" | cancer_histology_coded=="83403" | cancer_histology_coded=="83413" | cancer_histology_coded=="83433" | cancer_histology_coded=="83443" | cancer_histology_coded=="83453" | cancer_histology_coded=="83503" | cancer_histology_coded=="83703" | cancer_histology_coded=="83801" | cancer_histology_coded=="83803" | cancer_histology_coded=="83843" | cancer_histology_coded=="83903" | cancer_histology_coded=="84003" | cancer_histology_coded=="84023" | cancer_histology_coded=="84073" |cancer_histology_coded=="84083" | cancer_histology_coded=="84103" | cancer_histology_coded=="84301" |cancer_histology_coded=="84303" | cancer_histology_coded=="84403" | cancer_histology_coded=="84411" |cancer_histology_coded=="84413" | cancer_histology_coded=="84421" |cancer_histology_coded=="84423" | cancer_histology_coded=="84425" | cancer_histology_coded=="84503" | cancer_histology_coded=="84511" | cancer_histology_coded=="84521" | cancer_histology_coded=="84523" | cancer_histology_coded=="84532" | cancer_histology_coded=="84602" | cancer_histology_coded=="84603" | cancer_histology_coded=="84613" | cancer_histology_coded=="84621" | cancer_histology_coded=="84623" | cancer_histology_coded=="84631" |cancer_histology_coded=="84702" | cancer_histology_coded=="84703" | cancer_histology_coded=="84713" | cancer_histology_coded=="84721" | cancer_histology_coded=="84722" | cancer_histology_coded=="84723" | cancer_histology_coded=="84725" | cancer_histology_coded=="84731" | cancer_histology_coded=="84733" |cancer_histology_coded=="84741" | cancer_histology_coded=="84801" |cancer_histology_coded=="84803" | cancer_histology_coded=="84813" | cancer_histology_coded=="84816" | cancer_histology_coded=="84822" | cancer_histology_coded=="84903" |cancer_histology_coded=="84906" | cancer_histology_coded=="85002" | cancer_histology_coded=="85003" | cancer_histology_coded=="85005" |cancer_histology_coded=="85012" | cancer_histology_coded=="85032" | cancer_histology_coded=="85073" |cancer_histology_coded=="85103" | cancer_histology_coded=="85202" | cancer_histology_coded=="85203" |cancer_histology_coded=="85223" | cancer_histology_coded=="85233" |cancer_histology_coded=="85413" | cancer_histology_coded=="85433" | cancer_histology_coded=="85501" | cancer_histology_coded=="85503" | cancer_histology_coded=="85602" | cancer_histology_coded=="85603" | cancer_histology_coded=="85623" | cancer_histology_coded=="85743" | cancer_histology_coded=="85753" | cancer_histology_coded=="85803" | cancer_histology_coded=="85823" | cancer_histology_coded=="85831" | cancer_histology_coded=="85833" |cancer_histology_coded=="85843" | cancer_histology_coded=="85853" | cancer_histology_coded=="85901" | cancer_histology_coded=="87003" | cancer_histology_coded=="87201" |  cancer_histology_coded=="87205" | cancer_histology_coded=="87206" |cancer_histology_coded=="87209" | cancer_histology_coded=="87292" | cancer_histology_coded=="87401" | cancer_histology_coded=="87403" | cancer_histology_coded=="87422" | cancer_histology_coded=="87423" |cancer_histology_coded=="87435" | cancer_histology_coded=="87442" | cancer_histology_coded=="87500" | cancer_histology_coded=="87613" |cancer_histology_coded=="87701" | cancer_histology_coded=="87703" |cancer_histology_coded=="87706" | cancer_histology_coded=="87713" | cancer_histology_coded=="87723" | cancer_histology_coded=="87743" | cancer_histology_coded=="87803" |cancer_histology_coded=="87432" |cancer_histology_coded=="99923" | cancer_histology_coded=="99833"| cancer_histology_coded=="99831" |cancer_histology_coded=="99801" |cancer_histology_coded=="99753" |cancer_histology_coded=="99713" |cancer_histology_coded=="99711")

drop if cancer_remove==1

tab cancer_sex,m //n=21494

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\cancer_target_1_revised.dta", replace

clear

**Cohort with HES events file**

clear all

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\hes_admissions_target.dta"

gen patid_n=real(patid)

drop patid

rename patid_n patid

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\hes_admissions_target_1.dta", replace

clear

***\merging files***

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_cohort1_clean.dta" 






//2)Exclusions (underlying conditions)
//need to merge cohort file with down's, TS, AT, NF, fanconi anemia, bloom, li fraumeni diagnosis files//


//1)Downs
clear all
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_14013.dta"

gen patid_n=real(patid)
drop patid
rename patid_n patid 

sort patid
quietly by patid: gen dup_downs= cond(_N==1,0, _n)
bysort patid (effectivedatetime): gen seq=_n
drop if seq>1

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\downs_clean.dta", replace

clear
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\hes_admissions_target.dta"

icd10 search down
gen down_icd=0
replace down_icd=1 if diag3=="Q90" | diag4=="Q909"
keep if down_icd==1
sort patid
quietly by patid: gen dup_downs= cond(_N==1,0, _n)
bysort patid (hes_disdate): gen seq=_n
drop if seq>1
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\downs_icd_clean.dta", replace

clear
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\downs_icd_clean.dta"
gen patid_n=real(patid)
drop patid
rename patid_n patid 
merge 1:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\downs_clean.dta"
drop _merge
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\downs_merged_clean.dta", replace


//2)TS
clear
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_14015.dta"
gen patid_n=real(patid)
drop patid
rename patid_n patid 

sort patid
quietly by patid: gen dup_downs= cond(_N==1,0, _n)
bysort patid (effectivedatetime): gen seq=_n
drop if seq>1
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\ts_clean.dta", replace


//3)AT
clear
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_14016.dta"
gen patid_n=real(patid)
drop patid
rename patid_n patid 

sort patid
quietly by patid: gen dup_downs= cond(_N==1,0, _n)
bysort patid (effectivedatetime): gen seq=_n
drop if seq>1
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\at_gp_clean.dta", replace

clear
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\hes_admissions_target.dta"

icd10 search ataxia
gen at_icd=0
replace at_icd=1 if diag3=="G11" 
keep if at_icd==1
sort patid
quietly by patid: gen dup_downs= cond(_N==1,0, _n)
bysort patid (hes_disdate): gen seq=_n
drop if seq>1
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\at_icd_clean.dta", replace

clear
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\at_icd_clean.dta"
gen patid_n=real(patid)
drop patid
rename patid_n patid 
merge 1:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\at_gp_clean.dta"
drop _merge
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\at_merged_clean.dta", replace


//4)NF
clear
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_14018.dta"
gen patid_n=real(patid)
drop patid
rename patid_n patid 

sort patid
quietly by patid: gen dup_downs= cond(_N==1,0, _n)
bysort patid (effectivedatetime): gen seq=_n
drop if seq>1
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\nf_gp_clean.dta", replace

clear
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\hes_admissions_target.dta"

icd10 search neurofibro
gen at_icd=0
replace at_icd=1 if diag3=="Q85" 
keep if at_icd==1
gen patid_n=real(patid)
drop patid
rename patid_n patid 

sort patid
quietly by patid: gen dup_downs= cond(_N==1,0, _n)
bysort patid (hes_disdate): gen seq=_n
drop if seq>1

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\nf_icd_clean.dta", replace

clear
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\nf_icd_clean.dta"
merge 1:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\nf_gp_clean.dta"
drop _merge
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\nf_merged_clean.dta", replace

//5)FA
clear
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_14020.dta"
gen patid_n=real(patid)
drop patid
rename patid_n patid 

sort patid
quietly by patid: gen dup_downs= cond(_N==1,0, _n)
bysort patid (effectivedatetime): gen seq=_n
drop if seq>1
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\fa_gp_clean.dta", replace

clear
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\hes_admissions_target.dta"

icd10 search anaemia
gen at_icd=0
replace at_icd=1 if diag3=="Q85" 
keep if at_icd==1
gen patid_n=real(patid)
drop patid
rename patid_n patid 

sort patid
quietly by patid: gen dup_downs= cond(_N==1,0, _n)
bysort patid (hes_disdate): gen seq=_n
drop if seq>1

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\fa_icd_clean.dta", replace

clear
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\fa_icd_clean.dta"
merge 1:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\fa_gp_clean.dta"
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\fa_merged_clean.dta", replace

//6)LF
clear
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_14017.dta"
gen patid_n=real(patid)
drop patid
rename patid_n patid 

sort patid
quietly by patid: gen dup_downs= cond(_N==1,0, _n)
bysort patid (effectivedatetime): gen seq=_n
drop if seq>1
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\lf_clean.dta", replace

//7)Bloom
clear
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_14019.dta"
gen patid_n=real(patid)
drop patid
rename patid_n patid 

sort patid
quietly by patid: gen dup_downs= cond(_N==1,0, _n)
bysort patid (effectivedatetime): gen seq=_n
drop if seq>1
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\bloom_clean.dta", replace

//step 2 merge diagnosis files with cohort//
//1)downs
clear 
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_cohort1_clean.dta"
merge 1:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\downs_merged_clean.dta"
gen downs=0
replace downs=1 if _merge==3
drop if _merge==2
drop _merge
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_exclusion_3.dta",replace

//2)TS
clear 
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_exclusion_3.dta"
merge 1:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\ts_clean.dta"
gen ts=0
replace ts=1 if _merge==3
drop if _merge==2
drop _merge
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_exclusion_4.dta", replace

//3) AT
clear 
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_exclusion_4.dta"
merge 1:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\at_merged_clean.dta"
gen at=0
replace at=1 if _merge==3
drop if _merge==2

drop _merge
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_exclusion_5.dta", replace

//4)NF
clear 
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_exclusion_5.dta"
merge 1:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\nf_merged_clean.dta"
gen nf=0
replace nf=1 if _merge==3
drop if _merge==2
drop _merge
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_exclusion_6.dta", replace

//5)LF
clear 
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_exclusion_6.dta"
merge 1:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\lf_clean.dta"
gen lf=0
replace lf=1 if _merge==3
drop if _merge==2
drop _merge
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_exclusion_7.dta", replace

//6)Bloom
clear 
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_exclusion_7.dta"
merge 1:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\bloom_clean.dta"
gen bloom=0
replace bloom=1 if _merge==3
drop if _merge==2
drop _merge
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_exclusion_8.dta", replace

//6)FA
clear 
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_exclusion_8.dta"
merge 1:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\fa_merged_clean.dta"
gen fa=0
replace fa=1 if _merge==3
drop _merge
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_exclusion_9.dta",replace


//step 3 remove diagnoses from cohort//

clear 
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_exclusion_9.dta"

drop if downs==1 | ts==1 | nf==1 | at==1 | lf==1 | bloom==1 | fa==1 //n=7978

drop dup ethnos hes_classpat hes_admisorc hes_admimeth hes_dismeth hes_disdest diag_01 diag3 diag4 hes_tretspef epiorder startage hes_epistat hes_epitype opertn_01 opertn3 hes_sex hes_admidate hes_disdate opdate_01  down_icd dup_downs codegroupid varname code term conceptid effectivedatetime downs ts at_icd at nf lf bloom

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_cohort_final_revised.dta",replace

//merging cancers//


//leukaemias//
//1.GP data
clear

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_14176.dta"

gen patid_n=real(patid)

drop patid

rename patid_n patid

sort patid
by patid: gen dup= cond(_N==1,0, _n)
bysort patid (effectivedatetime): gen seq=_n
drop if seq>1

tab term

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_leuk", replace


//2. hes data

clear 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\hes_admissions_target_1.dta"
icd10 search leuk
gen leuk_icd=0
replace leuk_icd=1 if diag3=="C91" | diag3=="C92" | diag3=="C93" | diag3=="C94" | diag3=="C95" 
keep if leuk_icd==1
tab leuk_icd
sort patid
by patid: gen dup= cond(_N==1,0, _n)
bysort patid (hes_disdate): gen seq=_n
drop if seq>1


save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\hes_leuk.dta", replace

//3. merge leuk datasets

clear 
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\hes_leuk.dta"
merge 1:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_leuk"
drop _merge
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\merged_leuk.dta", replace

//lymphoma//
//1.GP data
clear

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_14181.dta"

gen patid_n=real(patid)

drop patid

rename patid_n patid

sort patid
by patid: gen dup= cond(_N==1,0, _n)
bysort patid (effectivedatetime): gen seq=_n
drop if seq>1


tab term

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_lymph", replace


//2. hes data

clear 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\hes_admissions_target_1.dta"
icd10 search lymphoma
gen lymphoma_icd=0
replace lymphoma_icd=1 if diag3=="C81" | diag3=="C82" | diag3=="C83" | diag3=="C84" | diag3=="C85" | diag3=="C86" | diag4=="C884" 
keep if lymphoma_icd==1

sort patid
by patid: gen dup= cond(_N==1,0, _n)
bysort patid (hes_disdate): gen seq=_n
drop if seq>1

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\hes_lymph.dta", replace

//3. merge lymph datasets

clear 
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\hes_lymph.dta"
merge 1:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_lymph"
drop _merge
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\merged_lymph.dta", replace

//CNS//
//1.GP data
clear

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_14183.dta"

gen patid_n=real(patid)

drop patid

rename patid_n patid

sort patid
by patid: gen dup= cond(_N==1,0, _n)
bysort patid (effectivedatetime): gen seq=_n
drop if seq>1


drop if term=="Pituitary adenoma"
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_cns", replace


//2. hes data

clear 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\hes_admissions_target_1.dta"
icd10 search neoplasm
gen cnsoma_icd=0
replace cnsoma_icd=1 if diag3=="C70" | diag3=="C71" | diag3=="C72" | diag3=="D42" | diag3=="D43" 
keep if cnsoma_icd==1

sort patid
by patid: gen dup= cond(_N==1,0, _n)
bysort patid (hes_disdate): gen seq=_n
drop if seq>1


save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\hes_cns.dta", replace

//3. merge cns datasets

clear 
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\hes_cns.dta"
merge 1:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_cns"
drop _merge
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\merged_cns.dta", replace

//Neuroblastoma//
//1.GP data
clear

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_14184.dta"

gen patid_n=real(patid)

drop patid

rename patid_n patid

sort patid
by patid: gen dup= cond(_N==1,0, _n)
bysort patid (effectivedatetime): gen seq=_n
drop if seq>1


save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_nb", replace


//2. hes data

clear 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\hes_admissions_target_1.dta"
icd10 search neoplasm
gen neuroblastoma_icd=0
replace neuroblastoma_icd=1 if diag4=="C749" | diag3=="C47"
keep if neuroblastoma_icd==1

sort patid
by patid: gen dup= cond(_N==1,0, _n)
bysort patid (hes_disdate): gen seq=_n
drop if seq>1


save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\hes_nb.dta", replace

//3. merge nb datasets

clear 
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\hes_nb.dta"
merge 1:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_nb"
drop _merge
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\merged_nb.dta", replace

//nephro//
//1.GP data
clear

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_14190.dta"

gen patid_n=real(patid)

drop patid

rename patid_n patid

sort patid
by patid: gen dup= cond(_N==1,0, _n)
bysort patid (effectivedatetime): gen seq=_n
drop if seq>1


tab term

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_nephro", replace


//2. hes data

clear 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\hes_admissions_target_1.dta"
icd10 search neoplasm
gen nephrooma_icd=0
replace nephrooma_icd=1 if diag3=="C64" 
keep if nephrooma_icd==1

sort patid
by patid: gen dup= cond(_N==1,0, _n)
bysort patid (hes_disdate): gen seq=_n
drop if seq>1

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\hes_nephro.dta", replace

//3. merge nephro datasets

clear 
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\hes_nephro.dta"
merge 1:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_nephro"
drop _merge

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\merged_nephro.dta", replace

//sarc//
//1.GP data
clear

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_14193.dta"

gen patid_n=real(patid)

drop patid

rename patid_n patid

sort patid
by patid: gen dup= cond(_N==1,0, _n)
bysort patid (effectivedatetime): gen seq=_n
drop if seq>1

tab term

drop if (term=="[M]Abdominal desmoid" | term=="[M]Abdominal fibroma" | term=="[M]Atypical fibrous histiocytoma" |term=="[M]Atypical fibroxanthoma" |term=="Dermatofibroma NOS" |term=="[M]Dermatofibroma NOS" |term=="[M]Dermatofibroma lenticulare" |term=="[M]Desmoid NOS" |term=="[M]Desmoplastic fibroma" |term=="[M]Elastofibroma" |term=="[M]Extra-abdominal desmoid" |term=="[M]Fascial fibroma" |term=="[M]Fibroma NOS" |term=="[M]Fibroma durum" |term=="[M]Fibrous histiocytoma NOS" |term=="[M]Histiocytoma NOS" |term=="[M]Neurofibroma NOS" |term=="[M]Neurofibromas" |term=="[M]Plexiform neurofibroma" |term=="[M]Sclerosing haemangioma" |term=="[M]Soft tissue tumour, benign") 
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_sarc", replace
	 


//2. hes data

clear 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\hes_admissions_target_1.dta"
icd10 search neoplasm
gen sarcoma_icd=0
replace sarcoma_icd=1 if diag3=="C40" | diag3=="C41" | diag3=="C49"
keep if sarcoma_icd==1

sort patid
by patid: gen dup= cond(_N==1,0, _n)
bysort patid (hes_disdate): gen seq=_n
drop if seq>1


save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\hes_sarc.dta", replace

//3. merge sarc datasets

clear 
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\hes_sarc.dta"
merge 1:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_sarc"
drop _merge
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\merged_sarc.dta", replace

//hepato//
//1.GP data


use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_14191.dta", clear

gen patid_n=real(patid)

drop patid

rename patid_n patid

sort patid
by patid: gen dup= cond(_N==1,0, _n)
bysort patid (effectivedatetime): gen seq=_n
drop if seq>1


tab term

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_hepato", replace


//2. hes data

clear 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\hes_admissions_target_1.dta"
icd10 search neoplasm
gen hepatooma_icd=0
replace hepatooma_icd=1 if diag3=="C22"
keep if hepatooma_icd==1

sort patid
by patid: gen dup= cond(_N==1,0, _n)
bysort patid (hes_disdate): gen seq=_n
drop if seq>1


save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\hes_hepato.dta", replace

//3. merge hepato datasets

clear 
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\hes_hepato.dta"
merge 1:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_hepato"
drop _merge
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\merged_hepato.dta", replace


//germ//
//1.GP data
clear

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_14196.dta"

gen patid_n=real(patid)

drop patid

rename patid_n patid

sort patid
by patid: gen dup2= cond(_N==1,0, _n)
bysort patid (effectivedatetime): gen seq=_n
drop if seq>1


save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_germ", replace


//2. hes data

clear 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\hes_admissions_target_1.dta"
icd10 search neoplasm
gen germoma_icd=0
replace germoma_icd=1 if diag3=="C56" | diag3=="C62"
keep if germoma_icd==1

sort patid
by patid: gen dup= cond(_N==1,0, _n)
bysort patid (hes_disdate): gen seq=_n
drop if seq>1


save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\hes_germ.dta", replace

//3. merge germ datasets

clear 
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\hes_germ.dta"
merge 1:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_germ"
drop _merge
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\merged_germ.dta", replace




//melanoma//
//1.GP data
clear

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_clinical_events_target_14200.dta"

gen patid_n=real(patid)

drop patid

rename patid_n patid

sort patid
by patid: gen dup2= cond(_N==1,0, _n)
bysort patid (effectivedatetime): gen seq=_n
drop if seq>1


tab term 

gen melanoma=0
replace melanoma=1 if strpos(lower(term), "melanoma" )>0

drop if melanoma==0

tab term

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_melanoma", replace


//2. hes data

clear 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\hes_admissions_target_1.dta"
icd10 search neoplasm
gen melanoma_icd=0
replace melanoma_icd=1 if diag3=="C43" 
keep if melanoma_icd==1

sort patid
by patid: gen dup= cond(_N==1,0, _n)
bysort patid (hes_disdate): gen seq=_n
drop if seq>1


tab diag3

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\hes_melanoma.dta", replace

//3. merge melanoma datasets

clear 
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\hes_melanoma.dta"
merge 1:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\gp_melanoma"
drop _merge
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\merged_melanoma.dta", replace

***merge datasets***
clear
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\merged_leuk.dta" 

merge 1:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\merged_lymph.dta" 

gen leuk_lymph=0
replace leuk_lymph=1 if _merge==3
drop _merge

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\merged_leuk_lymph.dta", replace 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\merged_leuk_lymph.dta", clear 
merge 1:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\merged_cns.dta"
gen cns_ll=0
replace cns_ll=1 if _merge==3
drop _merge
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\merged_leuk_lymph_cns.dta", replace 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\merged_leuk_lymph_cns.dta", clear
merge 1:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\merged_sarc.dta" 
gen sarc_llc=0
replace sarc_llc=1 if _merge==3
drop _merge
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\merged_leuk_lymph_cns_sarc.dta", replace 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\merged_leuk_lymph_cns_sarc.dta", clear
merge 1:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\merged_nephro.dta" 
gen nephro_llcs=0
replace nephro_llcs=1 if _merge==3
drop _merge
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\merged_leuk_lymph_cns_sarc_nephro.dta", replace 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\merged_leuk_lymph_cns_sarc_nephro.dta", clear
merge 1:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\merged_hepato.dta" 
gen hep_llcsn=0
replace hep_llcsn=1 if _merge==3
drop _merge
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\merged_leuk_lymph_cns_sarc_nephro_hepato.dta", replace 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\merged_leuk_lymph_cns_sarc_nephro_hepato.dta", clear
merge 1:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\merged_germ.dta" 
gen germ_llcsnh=0
replace germ_llcsnh=1 if _merge==3
drop _merge
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\merged_leuk_lymph_cns_sarc_nephro_hepato_germ.dta", replace 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\merged_leuk_lymph_cns_sarc_nephro_hepato_germ.dta", clear
merge 1:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\merged_melanoma.dta" 
gen melanoma_llcsnhg=0
replace melanoma_llcsnhg=1 if _merge==3
drop _merge
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\merged_leuk_lymph_cns_sarc_nephro_hepato_germ_melanoma.dta", replace 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\merged_leuk_lymph_cns_sarc_nephro_hepato_germ_melanoma.dta", clear
merge 1:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\merged_nb.dta" 
gen nb_llcsnhm=0
replace nb_llcsnhm=1 if _merge==3
drop _merge


sort patid
by patid: gen dup_f= cond(_N==1,0, _n)
tab dup_f
drop if dup_f>1


**generate gp diagnoses**
gen leuk_gp=.
replace leuk_gp=1 if varname=="_leuk_ox94"
gen lymph_gp=.
replace lymph_gp=1 if varname=="_neoplasms_ox94"
gen cns_gp=.
replace cns_gp=1 if varname=="_cns_ox94"
gen nb_gp=.
replace nb_gp=1 if varname=="_neuroblast_ox94"
gen sarc_gp=.
replace sarc_gp=1 if varname=="_sarcomas_ox94"
gen nephro_gp=.
replace nephro_gp=1 if varname=="_renal_ox94"
gen hepato_gp=.
replace hepato_gp=1 if varname=="_hepatic_ox94"
gen germ_gp=.
replace germ_gp=1 if varname=="_gonads_ox94"
gen melanoma_gp=.
replace melanoma_gp=1 if varname=="_melan_ox94"



save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\merged_cancers.dta", replace  

**merge with cancer registry cohort**
clear
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\cancer_target_1_revised.dta"
merge 1:1 patid using  "P:\OX94\OX94_backup_Dec_2023\ox94\Data\merged_cancers.dta"

gen ctya_cancer_registry=0
replace ctya_cancer_registry=1 if cancer_remove==0 

drop _merge
gen cancer_gp=0
replace cancer_gp=1 if (leuk_gp==1 | lymph_gp==1  | cns_gp==1 |  sarc_gp==1 | nephro_gp==1 | hepato_gp==1 | germ_gp==1 | melanoma_gp==1 | nb_gp==1)

gen cancer_hes=0
replace cancer_hes=1 if (leuk_icd==1 | lymphoma_icd==1 | cnsoma_icd==1 | sarcoma_icd==1 | nephrooma_icd==1 | hepatooma_icd==1 | germoma_icd==1 | melanoma_icd==1 | neuroblastoma_icd==1)

sort ctya_cancer_registry
by ctya_cancer_registry: tab cancer_gp cancer_hes




gen nephro_check=0 
replace nephro_check=1 if strpos(lower(cancer_histology_desc), "renal" ) | strpos(lower(cancer_histology_desc), "kidney" ) | strpos(lower(cancer_histology_desc), "calyces") | strpos(lower(cancer_histology_desc), "nephro")>0
replace nephro_check=. if nephro_check==0
tab cancer_histology_desc nephro_check 


gen hepato_check=0 
replace hepato_check=1 if strpos(lower(cancer_histology_desc), "liver" ) | strpos(lower(cancer_histology_desc), "hepat" ) >0
replace hepato_check=. if hepato_check==0
tab cancer_histology_desc hepato_check 


gen germ_check=0 
replace germ_check=1 if strpos(lower(cancer_histology_desc), "seminoma" ) | strpos(lower(cancer_histology_desc), "germ") | strpos(lower(cancer_histology_desc), "yolk") | strpos(lower(cancer_histology_desc), "embryonal carcinoma")  | strpos(lower(cancer_histology_desc), "terato" ) >0
replace germ_check=. if germ_check==0
tab cancer_histology_desc germ_check 


gen melanoma_check=0 
replace melanoma_check=1 if strpos(lower(cancer_histology_desc), "melanoma") >0
replace melanoma_check=. if melanoma_check==0
tab cancer_histology_desc melanoma_check 



gen leuk_histo=0
replace leuk_histo=1 if (cancer_histology_coded=="99893" | cancer_histology_coded=="98003" | cancer_histology_coded=="98013"| cancer_histology_coded=="98053" | cancer_histology_coded=="98073" | cancer_histology_coded=="98083" | cancer_histology_coded=="98113" | cancer_histology_coded=="98143"| cancer_histology_coded=="98153"| cancer_histology_coded=="98163"| cancer_histology_coded=="98183"| cancer_histology_coded=="98203"| cancer_histology_coded=="98213"| cancer_histology_coded=="98233"| cancer_histology_coded=="98253"| cancer_histology_coded=="98263"| cancer_histology_coded=="98273"| cancer_histology_coded=="98311" | cancer_histology_coded=="98313" | cancer_histology_coded=="98323" | cancer_histology_coded=="98353" | cancer_histology_coded=="98363" | cancer_histology_coded=="98373" | cancer_histology_coded=="98403"| cancer_histology_coded=="98603"| cancer_histology_coded=="98633"| cancer_histology_coded=="98653" | cancer_histology_coded=="98663"| cancer_histology_coded=="98673" | cancer_histology_coded=="98683" | cancer_histology_coded=="98703"| cancer_histology_coded=="98713"| cancer_histology_coded=="98723"| cancer_histology_coded=="98733" | cancer_histology_coded=="98743" | cancer_histology_coded=="98753" | cancer_histology_coded=="98913" | cancer_histology_coded=="98953"| cancer_histology_coded=="98963"| cancer_histology_coded=="98973" | cancer_histology_coded=="99103"| cancer_histology_coded=="99113"| cancer_histology_coded=="99203"| cancer_histology_coded=="99303"| cancer_histology_coded=="99313"| cancer_histology_coded=="99403"| cancer_histology_coded=="99453"| cancer_histology_coded=="99463"| cancer_histology_coded=="99503"| cancer_histology_coded=="99603"| cancer_histology_coded=="99613" | cancer_histology_coded=="99623"| cancer_histology_coded=="99633"| cancer_histology_coded=="99803"| cancer_histology_coded=="99843"| cancer_histology_coded=="99853"| cancer_histology_coded=="99863")


gen lymph_histo=0
replace lymph_histo=1 if (cancer_histology_coded=="95903" | cancer_histology_coded=="95913" | cancer_histology_coded=="95933"| cancer_histology_coded=="95953" | cancer_histology_coded=="95963" | cancer_histology_coded=="95973" | cancer_histology_coded=="96023" | cancer_histology_coded=="96203"| cancer_histology_coded=="96303"| cancer_histology_coded=="96323"| cancer_histology_coded=="96353"| cancer_histology_coded=="96403"| cancer_histology_coded=="96503"| cancer_histology_coded=="96513"| cancer_histology_coded=="96523"| cancer_histology_coded=="96533"| cancer_histology_coded=="96553"| cancer_histology_coded=="96563" | cancer_histology_coded=="96573" | cancer_histology_coded=="96583" | cancer_histology_coded=="96593" | cancer_histology_coded=="96613" | cancer_histology_coded=="96633" | cancer_histology_coded=="96643"| cancer_histology_coded=="96653"| cancer_histology_coded=="96663"| cancer_histology_coded=="96673" | cancer_histology_coded=="96703"| cancer_histology_coded=="96713" | cancer_histology_coded=="96733" | cancer_histology_coded=="96763"| cancer_histology_coded=="96783"| cancer_histology_coded=="96793"| cancer_histology_coded=="96803" | cancer_histology_coded=="96833" | cancer_histology_coded=="96843" | cancer_histology_coded=="96853" | cancer_histology_coded=="96863"| cancer_histology_coded=="96873"| cancer_histology_coded=="96883" | cancer_histology_coded=="96933"| cancer_histology_coded=="96903"| cancer_histology_coded=="96913"| cancer_histology_coded=="96923"| cancer_histology_coded=="96953"| cancer_histology_coded=="96983"| cancer_histology_coded=="96993"| cancer_histology_coded=="97003"| cancer_histology_coded=="97023"| cancer_histology_coded=="97053"| cancer_histology_coded=="97093" | cancer_histology_coded=="97113"| cancer_histology_coded=="97143"| cancer_histology_coded=="97163"| cancer_histology_coded=="97183"| cancer_histology_coded=="97193"| cancer_histology_coded=="97203"| cancer_histology_coded=="97223"| cancer_histology_coded=="97263"| cancer_histology_coded=="97273"| cancer_histology_coded=="97283"| cancer_histology_coded=="97293"| cancer_histology_coded=="97313"| cancer_histology_coded=="97323"| cancer_histology_coded=="97333"| cancer_histology_coded=="97343"| cancer_histology_coded=="97373"| cancer_histology_coded=="97383")


gen cns_histo=0
replace cns_histo=1 if  (cancer_histology_coded=="93501" | cancer_histology_coded=="93503" | cancer_histology_coded=="93511"| cancer_histology_coded=="93521" | cancer_histology_coded=="93601" | cancer_histology_coded=="93611" | cancer_histology_coded=="93623" | cancer_histology_coded=="93643"| cancer_histology_coded=="93643"| cancer_histology_coded=="93653"| cancer_histology_coded=="93703"| cancer_histology_coded=="93803"| cancer_histology_coded=="93813"| cancer_histology_coded=="93823"| cancer_histology_coded=="93831"| cancer_histology_coded=="93841"| cancer_histology_coded=="93853"| cancer_histology_coded=="93901" | cancer_histology_coded=="93913" | cancer_histology_coded=="93923" | cancer_histology_coded=="93941" | cancer_histology_coded=="94003" | cancer_histology_coded=="94013" | cancer_histology_coded=="94113"| cancer_histology_coded=="94121"| cancer_histology_coded=="94203"| cancer_histology_coded=="94211" | cancer_histology_coded=="94213"| cancer_histology_coded=="94243" | cancer_histology_coded=="94253" | cancer_histology_coded=="94303"| cancer_histology_coded=="94403"| cancer_histology_coded=="94413"| cancer_histology_coded=="94423" | cancer_histology_coded=="94441" | cancer_histology_coded=="94453" | cancer_histology_coded=="94503" | cancer_histology_coded=="94513"| cancer_histology_coded=="94703"| cancer_histology_coded=="94713" | cancer_histology_coded=="94723"| cancer_histology_coded=="94733"| cancer_histology_coded=="94743"| cancer_histology_coded=="94773"|  cancer_histology_coded=="95013"| cancer_histology_coded=="95033"| cancer_histology_coded=="95051"| cancer_histology_coded=="95053"| cancer_histology_coded=="95083" | cancer_histology_coded=="95091"|  cancer_histology_coded=="95301"| cancer_histology_coded=="95303"| cancer_histology_coded=="95371"| cancer_histology_coded=="95381"| cancer_histology_coded=="95383"| cancer_histology_coded=="95391" | cancer_histology_coded=="82700" | cancer_histology_coded=="82710" | cancer_histology_coded=="82720" | cancer_histology_coded=="82800" | cancer_histology_coded=="83000" | cancer_histology_coded=="93501"| cancer_histology_coded=="93503"| cancer_histology_coded=="93511"| cancer_histology_coded=="93521")



gen sarc_histo=0
replace sarc_histo=1 if  (cancer_histology_coded=="91803" | cancer_histology_coded=="91813" | cancer_histology_coded=="91823"| cancer_histology_coded=="91833" | cancer_histology_coded=="91853" | cancer_histology_coded=="91863" | cancer_histology_coded=="91923" | cancer_histology_coded=="91933"| cancer_histology_coded=="92001"| cancer_histology_coded=="92101"| cancer_histology_coded=="92103"| cancer_histology_coded=="92201"| cancer_histology_coded=="92203"| cancer_histology_coded=="92221"| cancer_histology_coded=="92303"| cancer_histology_coded=="92313"| cancer_histology_coded=="92403"| cancer_histology_coded=="92423"| cancer_histology_coded=="92501"| cancer_histology_coded=="92503"| cancer_histology_coded=="92511"| cancer_histology_coded=="92513"| cancer_histology_coded=="92523"| cancer_histology_coded=="92603"| cancer_histology_coded=="92613"| cancer_histology_coded=="92701"| cancer_histology_coded=="92703"| cancer_histology_coded=="93103"| cancer_histology_coded=="93601"| cancer_histology_coded=="93611"| cancer_histology_coded=="93623"| cancer_histology_coded=="93643"| cancer_histology_coded=="93646"| cancer_histology_coded=="93653"| cancer_histology_coded=="93703"| cancer_histology_coded=="89003"| cancer_histology_coded=="89013"| cancer_histology_coded=="89023"| cancer_histology_coded=="89103"| cancer_histology_coded=="89123"| cancer_histology_coded=="89203"| cancer_histology_coded=="89206"| cancer_histology_coded=="89913"| cancer_histology_coded=="95401"| cancer_histology_coded=="95403"| cancer_histology_coded=="95603"| cancer_histology_coded=="95606"| cancer_histology_coded=="95613"| cancer_histology_coded=="95703"| cancer_histology_coded=="87143"| cancer_histology_coded=="88063"| cancer_histology_coded=="88321"| cancer_histology_coded=="88323"| cancer_histology_coded=="88331"| cancer_histology_coded=="88333"| cancer_histology_coded=="88351"| cancer_histology_coded=="88361"| cancer_histology_coded=="88403"| cancer_histology_coded=="88411"| cancer_histology_coded=="88501"| cancer_histology_coded=="88503"| cancer_histology_coded=="88513"| cancer_histology_coded=="88523"| cancer_histology_coded=="88533"| cancer_histology_coded=="88543"| cancer_histology_coded=="88553"| cancer_histology_coded=="88583"| cancer_histology_coded=="88901"| cancer_histology_coded=="88903"| cancer_histology_coded=="88911"| cancer_histology_coded=="88913"| cancer_histology_coded=="88943"| cancer_histology_coded=="88971"| cancer_histology_coded=="89213"| cancer_histology_coded=="89901"| cancer_histology_coded=="89903"| cancer_histology_coded=="89913"| cancer_histology_coded=="90403"| cancer_histology_coded=="90413"| cancer_histology_coded=="90433"| cancer_histology_coded=="90443")



gen nb_histo=0
replace nb_histo=1 if (cancer_histology_coded=="94903" | cancer_histology_coded=="95003" | cancer_histology_coded=="95006"| cancer_histology_coded=="95013" | cancer_histology_coded=="95033" | cancer_histology_coded=="95051" | cancer_histology_coded=="95103" | cancer_histology_coded=="95113"| cancer_histology_coded=="95123"| cancer_histology_coded=="95223"| cancer_histology_coded=="95233")



//4) remove double diagnoses 

replace leuk_icd=. if (leuk_lymph==1| cns_ll==1 | sarc_llc==1 | nb_llcsnhm==1 | nephro_llcs==1 | hep_llcsn==1 | germ_llcsnh==1 | melanoma_llcsnhg==1) & (lymph_histo==1 | cns_histo==1 | sarc_histo==1 | nb_histo==1 | nephro_check==1 | hepato_check==1 | germ_check==1 | melanoma_check==1)


replace lymphoma_icd=. if ((leuk_lymph==1| cns_ll==1 | sarc_llc==1 | nb_llcsnhm==1 | nephro_llcs==1 | hep_llcsn==1 | germ_llcsnh==1 | melanoma_llcsnhg==1) & (leuk_histo==1 | cns_histo==1 | sarc_histo==1 | nb_histo==1 | nephro_check==1 | hepato_check==1 | germ_check==1 | melanoma_check==1))

replace cnsoma_icd=. if ((leuk_lymph==1| cns_ll==1 | sarc_llc==1 | nb_llcsnhm==1 | nephro_llcs==1 | hep_llcsn==1 | germ_llcsnh==1 | melanoma_llcsnhg==1) & (leuk_histo==1 | lymph_histo==1 | sarc_histo==1 | nb_histo==1 | nephro_check==1 | hepato_check==1 | germ_check==1 | melanoma_check==1))

replace sarcoma_icd=. if ((leuk_lymph==1| cns_ll==1 | sarc_llc==1 | nb_llcsnhm==1 | nephro_llcs==1 | hep_llcsn==1 | germ_llcsnh==1 | melanoma_llcsnhg==1) & (leuk_histo==1 | lymph_histo==1 | cns_histo==1 | nb_histo==1 | nephro_check==1 | hepato_check==1 | germ_check==1 | melanoma_check==1))

replace neuroblastoma_icd=. if ((leuk_lymph==1| cns_ll==1 | sarc_llc==1 | nb_llcsnhm==1 | nephro_llcs==1 | hep_llcsn==1 | germ_llcsnh==1 | melanoma_llcsnhg==1) & (leuk_histo==1 | lymph_histo==1 | cns_histo==1 | sarc_histo==1 | nephro_check==1 | hepato_check==1 | germ_check==1 | melanoma_check==1))

replace nephrooma_icd=. if ((leuk_lymph==1| cns_ll==1 | sarc_llc==1 | nb_llcsnhm==1 | nephro_llcs==1 | hep_llcsn==1 | germ_llcsnh==1 | melanoma_llcsnhg==1) & (leuk_histo==1 | lymph_histo==1 | cns_histo==1 | sarc_histo==1 | nb_histo==1 | hepato_check==1 | germ_check==1 | melanoma_check==1))

replace hepatooma_icd=. if ((leuk_lymph==1| cns_ll==1 | sarc_llc==1 | nb_llcsnhm==1 | nephro_llcs==1 | hep_llcsn==1 | germ_llcsnh==1 | melanoma_llcsnhg==1) & (leuk_histo==1 | lymph_histo==1 | cns_histo==1 | sarc_histo==1 | nb_histo==1 | nephro_check==1 |  germ_check==1 | melanoma_check==1))

replace germoma_icd=. if ((leuk_lymph==1| cns_ll==1 | sarc_llc==1 | nb_llcsnhm==1 | nephro_llcs==1 | hep_llcsn==1 | germ_llcsnh==1 | melanoma_llcsnhg==1) & (leuk_histo==1 | lymph_histo==1 | cns_histo==1 | sarc_histo==1 | nb_histo==1 | nephro_check==1 |  hepato_check==1 | melanoma_check==1))

replace melanoma_icd=. if ((leuk_lymph==1| cns_ll==1 | sarc_llc==1 | nb_llcsnhm==1 | nephro_llcs==1 | hep_llcsn==1 | germ_llcsnh==1 | melanoma_llcsnhg==1) & (leuk_histo==1 | lymph_histo==1 | cns_histo==1 | sarc_histo==1 | nb_histo==1 | nephro_check==1 |  hepato_check==1 | germ_check==1))

replace leuk_gp=. if (leuk_lymph==1| cns_ll==1 | sarc_llc==1 | nb_llcsnhm==1 | nephro_llcs==1 | hep_llcsn==1 | germ_llcsnh==1 | melanoma_llcsnhg==1) & (lymph_histo==1 | cns_histo==1 | sarc_histo==1 | nb_histo==1 | nephro_check==1 | hepato_check==1 | germ_check==1 | melanoma_check==1)


replace lymph_gp=. if ((leuk_lymph==1| cns_ll==1 | sarc_llc==1 | nb_llcsnhm==1 | nephro_llcs==1 | hep_llcsn==1 | germ_llcsnh==1 | melanoma_llcsnhg==1) & (leuk_histo==1 | cns_histo==1 | sarc_histo==1 | nb_histo==1 | nephro_check==1 | hepato_check==1 | germ_check==1 | melanoma_check==1))

replace cns_gp=. if ((leuk_lymph==1| cns_ll==1 | sarc_llc==1 | nb_llcsnhm==1 | nephro_llcs==1 | hep_llcsn==1 | germ_llcsnh==1 | melanoma_llcsnhg==1) & (leuk_histo==1 | lymph_histo==1 | sarc_histo==1 | nb_histo==1 | nephro_check==1 | hepato_check==1 | germ_check==1 | melanoma_check==1))

replace sarc_gp=. if ((leuk_lymph==1| cns_ll==1 | sarc_llc==1 | nb_llcsnhm==1 | nephro_llcs==1 | hep_llcsn==1 | germ_llcsnh==1 | melanoma_llcsnhg==1) & (leuk_histo==1 | lymph_histo==1 | cns_histo==1 | nb_histo==1 | nephro_check==1 | hepato_check==1 | germ_check==1 | melanoma_check==1))

replace nb_gp=. if ((leuk_lymph==1| cns_ll==1 | sarc_llc==1 | nb_llcsnhm==1 | nephro_llcs==1 | hep_llcsn==1 | germ_llcsnh==1 | melanoma_llcsnhg==1) & (leuk_histo==1 | lymph_histo==1 | cns_histo==1 | sarc_histo==1 | nephro_check==1 | hepato_check==1 | germ_check==1 | melanoma_check==1))

replace nephro_gp=. if ((leuk_lymph==1| cns_ll==1 | sarc_llc==1 | nb_llcsnhm==1 | nephro_llcs==1 | hep_llcsn==1 | germ_llcsnh==1 | melanoma_llcsnhg==1) & (leuk_histo==1 | lymph_histo==1 | cns_histo==1 | sarc_histo==1 | nb_histo==1 | hepato_check==1 | germ_check==1 | melanoma_check==1))

replace hepato_gp=. if ((leuk_lymph==1| cns_ll==1 | sarc_llc==1 | nb_llcsnhm==1 | nephro_llcs==1 | hep_llcsn==1 | germ_llcsnh==1 | melanoma_llcsnhg==1) & (leuk_histo==1 | lymph_histo==1 | cns_histo==1 | sarc_histo==1 | nb_histo==1 | nephro_check==1 |  germ_check==1 | melanoma_check==1))

replace germ_gp=. if ((leuk_lymph==1| cns_ll==1 | sarc_llc==1 | nb_llcsnhm==1 | nephro_llcs==1 | hep_llcsn==1 | germ_llcsnh==1 | melanoma_llcsnhg==1) & (leuk_histo==1 | lymph_histo==1 | cns_histo==1 | sarc_histo==1 | nb_histo==1 | nephro_check==1 |  hepato_check==1 | melanoma_check==1))

replace melanoma_gp=. if ((leuk_lymph==1| cns_ll==1 | sarc_llc==1 | nb_llcsnhm==1 | nephro_llcs==1 | hep_llcsn==1 | germ_llcsnh==1 | melanoma_llcsnhg==1) & (leuk_histo==1 | lymph_histo==1 | cns_histo==1 | sarc_histo==1 | nb_histo==1 | nephro_check==1 |  hepato_check==1 | germ_check==1))

**generate cancer types**
gen cancer_type=0 //there should be none
replace cancer_type=1 if leuk_icd==1 | leuk_gp==1 
replace cancer_type=2 if lymphoma_icd==1 | lymph_gp==1 
replace cancer_type=3 if cnsoma_icd==1 | cns_gp==1 
replace cancer_type=4 if sarcoma_icd==1 | sarc_gp==1 
replace cancer_type=5 if neuroblastoma_icd==1 | nb_gp==1 
replace cancer_type=6 if nephrooma_icd==1 | nephro_gp==1 
replace cancer_type=7 if hepatooma_icd==1 | hepato_gp==1 
replace cancer_type=8 if germoma_icd==1 | germ_gp==1 
replace cancer_type=9 if melanoma_icd==1 | melanoma_gp==1 
label define cancerlabels 1 "Leuk" 2 "Lymphoma" 3 "CNS" 4 "Sarcoma" 5 "Neuroblastoma" 6 "Nephro" 7 "Hepatic" 8 "Germ Cell" 9 "Melanoma" , replace
label values cancer_type cancerlabels
tab cancer_type

**clean histology codes on registry**

replace cancer_type=6 if nephro_check==1 
replace cancer_type=7 if hepato_check==1 
replace cancer_type=8 if germ_check==1 
replace cancer_type=9 if melanoma_check==1 
replace cancer_type=1 if leuk_histo==1 
replace cancer_type=2 if lymph_histo==1 
replace cancer_type=3 if cns_histo==1 
replace cancer_type=4 if sarc_histo==1 
replace cancer_type=5 if nb_histo==1



replace cancer_type=1 if (cancer_histology_coded=="99893" | cancer_histology_coded=="98003" | cancer_histology_coded=="98013"| cancer_histology_coded=="98053" | cancer_histology_coded=="98073" | cancer_histology_coded=="98083" | cancer_histology_coded=="98113" | cancer_histology_coded=="98143"| cancer_histology_coded=="98153"| cancer_histology_coded=="98163"| cancer_histology_coded=="98183"| cancer_histology_coded=="98203"| cancer_histology_coded=="98213"| cancer_histology_coded=="98233"| cancer_histology_coded=="98253"| cancer_histology_coded=="98263"| cancer_histology_coded=="98273"| cancer_histology_coded=="98311" | cancer_histology_coded=="98313" | cancer_histology_coded=="98323" | cancer_histology_coded=="98353" | cancer_histology_coded=="98363" | cancer_histology_coded=="98373" | cancer_histology_coded=="98403"| cancer_histology_coded=="98603"| cancer_histology_coded=="98633"| cancer_histology_coded=="98653" | cancer_histology_coded=="98663"| cancer_histology_coded=="98673" | cancer_histology_coded=="98683" | cancer_histology_coded=="98703"| cancer_histology_coded=="98713"| cancer_histology_coded=="98723"| cancer_histology_coded=="98733" | cancer_histology_coded=="98743" | cancer_histology_coded=="98753" | cancer_histology_coded=="98913" | cancer_histology_coded=="98953"| cancer_histology_coded=="98963"| cancer_histology_coded=="98973" | cancer_histology_coded=="99103"| cancer_histology_coded=="99113"| cancer_histology_coded=="99203"| cancer_histology_coded=="99303"| cancer_histology_coded=="99313"| cancer_histology_coded=="99403"| cancer_histology_coded=="99453"| cancer_histology_coded=="99463"| cancer_histology_coded=="99503"| cancer_histology_coded=="99603"| cancer_histology_coded=="99613" | cancer_histology_coded=="99623"| cancer_histology_coded=="99633"| cancer_histology_coded=="99803"| cancer_histology_coded=="99843"| cancer_histology_coded=="99853"| cancer_histology_coded=="99863")
replace cancer_type=2 if (cancer_histology_coded=="95903" | cancer_histology_coded=="95913" | cancer_histology_coded=="95933"| cancer_histology_coded=="95953" | cancer_histology_coded=="95963" | cancer_histology_coded=="95973" | cancer_histology_coded=="96023" | cancer_histology_coded=="96203"| cancer_histology_coded=="96303"| cancer_histology_coded=="96323"| cancer_histology_coded=="96353"| cancer_histology_coded=="96403"| cancer_histology_coded=="96503"| cancer_histology_coded=="96513"| cancer_histology_coded=="96523"| cancer_histology_coded=="96533"| cancer_histology_coded=="96553"| cancer_histology_coded=="96563" | cancer_histology_coded=="96573" | cancer_histology_coded=="96583" | cancer_histology_coded=="96593" | cancer_histology_coded=="96613" | cancer_histology_coded=="96633" | cancer_histology_coded=="96643"| cancer_histology_coded=="96653"| cancer_histology_coded=="96663"| cancer_histology_coded=="96673" | cancer_histology_coded=="96703"| cancer_histology_coded=="96713" | cancer_histology_coded=="96733" | cancer_histology_coded=="96763"| cancer_histology_coded=="96783"| cancer_histology_coded=="96793"| cancer_histology_coded=="96803" | cancer_histology_coded=="96833" | cancer_histology_coded=="96843" | cancer_histology_coded=="96853" | cancer_histology_coded=="96863"| cancer_histology_coded=="96873"| cancer_histology_coded=="96883" | cancer_histology_coded=="96933"| cancer_histology_coded=="96903"| cancer_histology_coded=="96913"| cancer_histology_coded=="96923"| cancer_histology_coded=="96953"| cancer_histology_coded=="96983"| cancer_histology_coded=="96993"| cancer_histology_coded=="97003"| cancer_histology_coded=="97023"| cancer_histology_coded=="97053"| cancer_histology_coded=="97093" | cancer_histology_coded=="97113"| cancer_histology_coded=="97143"| cancer_histology_coded=="97163"| cancer_histology_coded=="97183"| cancer_histology_coded=="97193"| cancer_histology_coded=="97203"| cancer_histology_coded=="97223"| cancer_histology_coded=="97263"| cancer_histology_coded=="97273"| cancer_histology_coded=="97283"| cancer_histology_coded=="97293"| cancer_histology_coded=="97313"| cancer_histology_coded=="97323"| cancer_histology_coded=="97333"| cancer_histology_coded=="97343"| cancer_histology_coded=="97373"| cancer_histology_coded=="97383")
replace cancer_type=3 if (cancer_histology_coded=="93501" | cancer_histology_coded=="93503" | cancer_histology_coded=="93511"| cancer_histology_coded=="93521" | cancer_histology_coded=="93601" | cancer_histology_coded=="93611" | cancer_histology_coded=="93623" | cancer_histology_coded=="93643"| cancer_histology_coded=="93643"| cancer_histology_coded=="93653"| cancer_histology_coded=="93703"| cancer_histology_coded=="93803"| cancer_histology_coded=="93813"| cancer_histology_coded=="93823"| cancer_histology_coded=="93831"| cancer_histology_coded=="93841"| cancer_histology_coded=="93853"| cancer_histology_coded=="93901" | cancer_histology_coded=="93913" | cancer_histology_coded=="93923" | cancer_histology_coded=="93941" | cancer_histology_coded=="94003" | cancer_histology_coded=="94013" | cancer_histology_coded=="94113"| cancer_histology_coded=="94121"| cancer_histology_coded=="94203"| cancer_histology_coded=="94211" | cancer_histology_coded=="94213"| cancer_histology_coded=="94243" | cancer_histology_coded=="94253" | cancer_histology_coded=="94303"| cancer_histology_coded=="94403"| cancer_histology_coded=="94413"| cancer_histology_coded=="94423" | cancer_histology_coded=="94441" | cancer_histology_coded=="94453" | cancer_histology_coded=="94503" | cancer_histology_coded=="94513"| cancer_histology_coded=="94703"| cancer_histology_coded=="94713" | cancer_histology_coded=="94723"| cancer_histology_coded=="94733"| cancer_histology_coded=="94743"| cancer_histology_coded=="94773"|  cancer_histology_coded=="95013"| cancer_histology_coded=="95033"| cancer_histology_coded=="95051"| cancer_histology_coded=="95053"| cancer_histology_coded=="95083" | cancer_histology_coded=="95091"|  cancer_histology_coded=="95301"| cancer_histology_coded=="95303"| cancer_histology_coded=="95371"| cancer_histology_coded=="95381"| cancer_histology_coded=="95383"| cancer_histology_coded=="95391" | cancer_histology_coded=="82700" | cancer_histology_coded=="82710" | cancer_histology_coded=="82720" | cancer_histology_coded=="82800" | cancer_histology_coded=="83000" | cancer_histology_coded=="93501"| cancer_histology_coded=="93503"| cancer_histology_coded=="93511"| cancer_histology_coded=="93521")
replace cancer_type=4 if (cancer_histology_coded=="91803" | cancer_histology_coded=="91813" | cancer_histology_coded=="91823"| cancer_histology_coded=="91833" | cancer_histology_coded=="91853" | cancer_histology_coded=="91863" | cancer_histology_coded=="91923" | cancer_histology_coded=="91933"| cancer_histology_coded=="92001"| cancer_histology_coded=="92101"| cancer_histology_coded=="92103"| cancer_histology_coded=="92201"| cancer_histology_coded=="92203"| cancer_histology_coded=="92221"| cancer_histology_coded=="92303"| cancer_histology_coded=="92313"| cancer_histology_coded=="92403"| cancer_histology_coded=="92423"| cancer_histology_coded=="92501"| cancer_histology_coded=="92503"| cancer_histology_coded=="92511"| cancer_histology_coded=="92513"| cancer_histology_coded=="92523"| cancer_histology_coded=="92603"| cancer_histology_coded=="92613"| cancer_histology_coded=="92701"| cancer_histology_coded=="92703"| cancer_histology_coded=="93103"| cancer_histology_coded=="93601"| cancer_histology_coded=="93611"| cancer_histology_coded=="93623"| cancer_histology_coded=="93643"| cancer_histology_coded=="93646"| cancer_histology_coded=="93653"| cancer_histology_coded=="93703"| cancer_histology_coded=="89003"| cancer_histology_coded=="89013"| cancer_histology_coded=="89023"| cancer_histology_coded=="89103"| cancer_histology_coded=="89123"| cancer_histology_coded=="89203"| cancer_histology_coded=="89206"| cancer_histology_coded=="89913"| cancer_histology_coded=="95401"| cancer_histology_coded=="95403"| cancer_histology_coded=="95603"| cancer_histology_coded=="95606"| cancer_histology_coded=="95613"| cancer_histology_coded=="95703"| cancer_histology_coded=="87143"| cancer_histology_coded=="88063"| cancer_histology_coded=="88321"| cancer_histology_coded=="88323"| cancer_histology_coded=="88331"| cancer_histology_coded=="88333"| cancer_histology_coded=="88351"| cancer_histology_coded=="88361"| cancer_histology_coded=="88403"| cancer_histology_coded=="88411"| cancer_histology_coded=="88501"| cancer_histology_coded=="88503"| cancer_histology_coded=="88513"| cancer_histology_coded=="88523"| cancer_histology_coded=="88533"| cancer_histology_coded=="88543"| cancer_histology_coded=="88553"| cancer_histology_coded=="88583"| cancer_histology_coded=="88901"| cancer_histology_coded=="88903"| cancer_histology_coded=="88911"| cancer_histology_coded=="88913"| cancer_histology_coded=="88943"| cancer_histology_coded=="88971"| cancer_histology_coded=="89213"| cancer_histology_coded=="89901"| cancer_histology_coded=="89903"| cancer_histology_coded=="89913"| cancer_histology_coded=="90403"| cancer_histology_coded=="90413"| cancer_histology_coded=="90433"| cancer_histology_coded=="90443")
replace cancer_type=5 if (cancer_histology_coded=="94903" | cancer_histology_coded=="95003" | cancer_histology_coded=="95006"| cancer_histology_coded=="95013" | cancer_histology_coded=="95033" | cancer_histology_coded=="95051" | cancer_histology_coded=="95103" | cancer_histology_coded=="95113"| cancer_histology_coded=="95123"| cancer_histology_coded=="95223"| cancer_histology_coded=="95233")

tab cancer_type


**generate minimum cancer date 
gen cancer_date_all=min(cancer_date, hes_admidate, effectivedatetime)
format cancer_date_all %td
sort cancer_date_all


**generate cancer source**
gen cancer_source=0 
replace cancer_source=1 if (ctya_cancer_registry==1 & cancer_hes==0 & cancer_gp==0)
replace cancer_source=2 if (ctya_cancer_registry==1 & cancer_hes==0 & cancer_gp==1)
replace cancer_source=3 if (ctya_cancer_registry==1 & cancer_hes==1 & cancer_gp==0)
replace cancer_source=4 if (ctya_cancer_registry==1 & cancer_hes==1 & cancer_gp==1)
replace cancer_source=5 if (ctya_cancer_registry==0 & cancer_hes==1 & cancer_gp==1)
replace cancer_source=6 if (ctya_cancer_registry==0 & cancer_hes==0 & cancer_gp==1)
replace cancer_source=7 if (ctya_cancer_registry==0 & cancer_hes==1 & cancer_gp==0)
tab cancer_source, m

sort cancer_type
by cancer_type: tab cancer_histology_desc cancer_source
sort cancer_source
by cancer_source: tab cancer_type, m

drop if (cancer_source==1 & cancer_type==0) //n=1839

gen any_cancer_source=0
replace any_cancer_source=1 if cancer_source==1 | cancer_source==2 | cancer_source==3| cancer_source==4 | cancer_source==5 | cancer_source==6 | cancer_source==7 
tab any_cancer_source,m

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_merged_all_cancer_cohort_revised.dta", replace


**merge with cohort**
clear
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_cohort_final_revised.dta",clear
merge 1:1 patid using  "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_merged_all_cancer_cohort_revised.dta"

drop if _merge==2 //n=10853
drop _merge

tab cancer_type
tab sex1
tab cancer_age
sort cancer_type 
by cancer_type: tab sex1

**remove variables **
drop  cancer_site3 cancer_site4 cancer_morph_icd10_02 cancer_hormone ethnos hes_classpat hes_admisorc hes_admimeth hes_dismeth hes_disdest diag_01 epiorder startage hes_epistat hes_epitype hes_sex dup codegroupid varname code term conceptid 


replace cancer_type=1 if strpos(lower(cancer_histology_desc), "ACUTE" )>0
replace cancer_type=1 if strpos(lower(cancer_histology_desc), "acute" )>0
replace cancer_type=1 if strpos((cancer_histology_desc), "Lymphoproliferative" )>0
replace cancer_type=1 if strpos(lower(cancer_histology_desc), "leukaemia" )>0
replace cancer_type=1 if strpos(lower(cancer_histology_desc), "Leukaemia" )>0
replace cancer_type=1 if strpos((cancer_histology_desc), "LEUKAEMIA" )>0
replace cancer_type=1 if strpos(lower(cancer_histology_desc), "Leukemia" )>0
replace cancer_type=1 if strpos(lower(cancer_histology_desc), "leukemia" )>0
replace cancer_type=1 if strpos((cancer_histology_desc), "MYELODYSPLASTIC" )>0
replace cancer_type=1 if strpos((cancer_histology_desc), "Myelodysplastic" )>0
replace cancer_type=1 if strpos((cancer_histology_desc), "lymphoblastic" )>0
replace cancer_type=1 if strpos((cancer_histology_desc), "Essential thrombocythemia" )>0
replace cancer_type=1 if strpos((cancer_histology_desc), "lymphoproliferative" )>0
replace cancer_type=1 if strpos((cancer_histology_desc), "B-cell chronic lymphocytic leukemia/" )>0
replace cancer_type=1 if strpos((cancer_histology_desc), "LYMPHOPROLIFERATIVE" )>0


replace cancer_type=2 if strpos(lower(cancer_histology_desc), "Lymphoma" )>0
replace cancer_type=2 if strpos(lower(cancer_histology_desc), "lymphoblastic lymphoma" )>0
replace cancer_type=2 if strpos((cancer_histology_desc), "LYMPHOMA" )>0
replace cancer_type=2 if strpos((cancer_histology_desc), "HODGKIN" )>0
replace cancer_type=2 if strpos((cancer_histology_desc), "Hodgkin" )>0

replace cancer_type=3 if strpos(lower(cancer_histology_desc), "astrocytoma" )>0
replace cancer_type=3 if strpos((cancer_histology_desc), "Astrocytoma" )>0
replace cancer_type=3 if strpos(lower(cancer_histology_desc), "medulloblastoma" )>0
replace cancer_type=3 if strpos((cancer_histology_desc), "Medulloblastoma" )>0
replace cancer_type=3 if strpos((cancer_histology_desc), "Meduloblastoma" )>0
replace cancer_type=3 if strpos(lower(cancer_histology_desc), "glioblastoma" )>0
replace cancer_type=3 if strpos(lower(cancer_histology_desc), "glioma" )>0
replace cancer_type=3 if strpos((cancer_histology_desc), "GLIOMA" )>0
replace cancer_type=3 if strpos((cancer_histology_desc), "Oligodendroglioma" )>0
replace cancer_type=3 if strpos((cancer_histology_desc), "meningioma" )>0
replace cancer_type=3 if strpos((cancer_histology_desc), "CRANIOPHARYNGIOMA" )>0
replace cancer_type=3 if strpos((cancer_histology_desc), "craniopharyngioma" )>0
replace cancer_type=3 if strpos((cancer_histology_desc), "EPENDYMOMA" )>0
replace cancer_type=3 if strpos((cancer_histology_desc), "Ependymoma" )>0

replace cancer_type=4 if strpos((cancer_histology_desc), "SARCOMA" )>0
replace cancer_type=4 if strpos(lower(cancer_histology_desc), "sarcoma" )>0
replace cancer_type=5 if strpos(lower(cancer_histology_desc), "nephroblastoma" )>0
replace cancer_type=8 if strpos(lower(cancer_histology_desc), "seminoma" )>0
replace cancer_type=8 if strpos(lower(cancer_histology_desc), "germ cell" )>0
replace cancer_type=8 if strpos(lower(cancer_histology_desc), "teratoma" )>0
replace cancer_type=8 if strpos((cancer_histology_desc), "Germinoma" )>0
replace cancer_type=9 if strpos(lower(cancer_histology_desc), "melanoma" )>0

replace any_cancer_source=1 if cancer_type!=.



sort cancer_source
by cancer_source: tab cancer_histology_desc
sort cancer_type
by cancer_type: tab cancer_histology_desc,m
sort cancer_type
by cancer_type: tab cancer_histology_coded


***Apply conditions***
//1) reaching age 25 in cohort and remove >24 to match PHE cohort**
gen date25= yearofbirth + 9130
format date25 %td
sort date25
drop if age>24 //n=400,915
tab sex1
//2) remove exits after exitdate 31dec2018 

gen exit_date_final=td(31dec2019)
format exit_date_final %td



gen exitdate2=min(exit_date_final, exitdate)
format exitdate2 %td

gen exit_x=0
replace exit_x=1 if exitdate>exitdate2

sort exit_x
by exit_x: tab exitstatus

drop if (exit_x==1 & (exitstatus==1|exitstatus==2)) //n=479621
tab sex1 


gen exit_final=min(exitdate2, date25)
format exit_final %td

gen entryperiod=exitdate2-enter3
gen entercat=0
replace entercat=1 if entryperiod<365.25
sort entercat
by entercat: tab cancer_type

drop if entercat==1 // n=726,115
order patid sex1 study_practice sha1 town_quintile ethriskid yearofbirth exitdate2 exitdate 


//3) remove agediag>24y or <0**

gen agediagnosis2=year(cancer_date_all)-year(yearofbirth)
tab agediagnosis2
drop if (any_cancer_source==1 & (agediagnosis2<0 | agediagnosis2>24)) // n=5059
tab cancer_type
replace any_cancer_source=0 if any_cancer_source==.
tab any_cancer_source agediagnosis2


//4) remove age_exit or cancer_fu>24years 
gen cancer_fu=min(cancer_date_all, exit_final)
format cancer_fu %td
sort cancer_fu


gen age_exit= year(cancer_fu) - year(yearofbirth)
label var age_exit "age at exit"
sort age_exit

gen age_exit_2=1 if age_exit<15 
replace age_exit_2=2 if age_exit>14 & age_exit<25



label define agelabels_2 1 "0-14 years" 2 "15-24 years", replace
label values age_exit_2 agelabels_2
tab age_exit_2, m
sort age_exit_2


//5) remove cancers before entry date 

gen test1=0
replace test1=1 if (any_cancer_source==1 & cancer_date_all<=enter3)
replace test1=2 if (any_cancer_source==1 & cancer_date_all>enter3)
tab test1
sort test1
by test1: tab cancer_type
drop if test1==1
tab cancer_type


//6) make controls if cancer after exit date
gen after_exit=0
replace after_exit=1 if (any_cancer_source==1 & cancer_date_all>exitdate2)
replace after_exit=2 if (any_cancer_source==1 & cancer_date_all<exitdate2)
replace after_exit=3 if (any_cancer_source==0 & cancer_date_all<exitdate2)


sort after_exit
by after_exit: tab cancer_type test1
sort cancer_type
by cancer_type: tab after_exit test1
replace any_cancer_source=. if after_exit==1
replace cancer_type=. if after_exit==1
replace cancer_type=. if cancer_type==0
replace cancer_date_all=. if cancer_date_all>exitdate 
replace effectivedatetime=. if effectivedatetime>exitdate
replace hes_admidate=. if hes_admidate>exitdate 
replace cancer_date=. if cancer_date>exitdate
tab any_cancer_source,m
tab cancer_type

//6) remove dates that appear wrong - date of cancer before dob 
drop if (cancer_date<yearofbirth | effectivedatetime<yearofbirth | hes_admidate<yearofbirth)
tab cancer_type

gen test2=0
replace test2=1 if exit_final<=enter3
drop if test2==1 

//7)drop gp only diagnoses**
tab cancer_source
sort cancer_source
by cancer_source: tab test1
by cancer_source: tab after_exit
drop if cancer_source==6 
tab cancer_type



save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_full_cohort_clean_final_revised_Dec_2023_v2.dta", replace



**generate survivor cohort**

**1) using NCR
gen cancer_dod1=date(cancer_dod, "YMDhms")
gen cancer_survivor=(cancer_dod1-cancer_date_all)
sort cancer_survivor
tab cancer_survivor
gen cancer_1survivor=0 if any_cancer_source==1
replace cancer_1survivor=1 if (any_cancer_source==1 & cancer_survivor<365)
replace cancer_1survivor=2 if (any_cancer_source==1 & cancer_survivor>365)
tab cancer_1survivor
gen cancer_5survivor=0 if any_cancer_source==1
replace cancer_5survivor=1 if (any_cancer_source==1 & cancer_survivor<1825)
replace cancer_5survivor=2 if (any_cancer_source==1 & cancer_survivor>1825)
tab cancer_5survivor

sort cancer_type 
by cancer_type:tab cancer_5survivor


**2) Using ONS 
clear all

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\deaths_target.dta"

gen patid_n=real(patid)
drop patid
rename patid_n patid

duplicates tag patid, gen(dup_d)
sort patid
by patid: gen dup= cond(_N==1,0, _n)
drop if dup>1

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\deaths_target_1.dta", replace

clear
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_full_cohort_clean_final.dta"
merge m:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\deaths_target_1.dta"
drop if _merge==2

//generate variable for time from cancer date to date of death//

gen cancer_survivor_ons=(onsdateofdeath-cancer_date_all)
sort cancer_survivor_ons
tab cancer_survivor_ons

gen cancer_1survivor_ons=0
replace cancer_1survivor_ons=1 if (cancer_survivor_ons>365)
tab cancer_1survivor_ons
gen cancer_5survivor_ons=0
replace cancer_5survivor_ons=1 if (cancer_survivor_ons>1825)
tab cancer_5survivor_ons

sort cancer_type 
by cancer_type:tab cancer_5survivor_ons

********************************************************************************
*                   3) DESCRIPTIVES OF COHORT                                 *
********************************************************************************
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_full_cohort_descrptives.dta", clear

**generate age categories - pre-school, school, TYA (post-school)** 

** Diagnoses per tumour per age category**

gen agecat_2=1 if age<15 
replace agecat_2=2 if age>14 & age<25


label define agelabels_2 1 "0-14 years" 2 "15-24 years", replace
label values agecat_2 agelabels_2
tab agecat_2, m

sort agecat_2
by agecat_2: tab cancer_type

gen agediag_2=1 if agediagnosis2<15 
replace agediag_2=2 if agediagnosis>14 & agediagnosis2<25
replace agediagnosis=. if after_exit==1


label define agelabels_2 1 "0-14 years" 2 "15-24 years", replace
label values agediag_2 agelabels_2
tab agediag_2, m
sort agediag_2
by agediag_2: tab cancer_type
**generate ethnic categories** 

gen ethnic_2cat=0
replace ethnic_2cat=1 if ethriskid==2 | ethriskid==3 | ethriskid==4 | ethriskid==5 | ethriskid==8 | ethriskid==6 | ethriskid==7 |ethriskid==9
replace ethnic_2cat=. if ethriskid==.
label define ethniclabels 1 "White" 2 "Other", replace 
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




save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_full_cohort_descrptives.dta", replace
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_full_cohort_clean_final.dta", replace



//incidence calcs 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_full_cohort_clean_final_revised_Dec_2023_v2.dta", clear



tab any_cancer_source cancer_type
replace any_cancer_source=0 if any_cancer_source==.
stset cancer_fu, enter(enter3) failure(any_cancer_source==1) id(patid) scale(365.25)
stptime, per(1000000)
stptime, by(age_exit_2) per(1000000)

replace cancer_type=. if cancer_type==0
gen leuk_tot=0
replace leuk_tot=1 if cancer_type==1
stset cancer_fu, enter(enter3) failure(leuk_tot==1) id(patid) scale(365.25)
stptime, per(1000000)
stptime, by(age_exit_2) per(1000000)
stptime, by(sex1) per(1000000)
stptime, by(sex1 age_exit_2) per(1000000)

gen lymph_tot=0
replace lymph_tot=1 if cancer_type==2
stset cancer_fu, enter(enter3) failure(lymph_tot==1) id(patid) scale(365.25)
stptime,  per(1000000)
stptime, by(age_exit_2) per(1000000)
stptime, by(sex1) per(1000000)

gen cns_tot=0
replace cns_tot=1 if cancer_type==3
stset cancer_fu, enter(enter3) failure(cns_tot==1) id(patid) scale(365.25)
stptime,  per(1000000)
stptime, by(age_exit_2) per(1000000)
stptime, by(sex1) per(1000000)

gen sarc_tot=0
replace sarc_tot=1 if cancer_type==4
stset cancer_fu, enter(enter3) failure(sarc_tot==1) id(patid) scale(365.25)
stptime,  per(1000000)
stptime, by(age_exit_2) per(1000000)
stptime, by(sex1) per(1000000)

gen abdo_tot=0
replace abdo_tot=1 if cancer_type==5 | cancer_type==6 | cancer_type==7
stset cancer_fu, enter(enter3) failure(abdo_tot==1) id(patid) scale(365.25)
stptime,  per(1000000)

gen germ_tot=0
replace germ_tot=1 if cancer_type==8
stset cancer_fu, enter(enter3) failure(germ_tot==1) id(patid) scale(365.25)
stptime,  per(1000000)

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_full_cohort_clean_final_v2.dta", replace



********************************************************************************
*                   3) GENERATION OF CASE CONTROL                             *
********************************************************************************
//generate gp practice with at least 1 case

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_full_cohort_clean_final_revised_Dec_2023_v2.dta", clear
drop if cancer_type==9

save  "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_cohort_all_nonskin_revised_Dec_2023_v2.dta",replace

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_cohort_all_nonskin_revised_Dec_2023_v2.dta", clear

gen case=1 if any_cancer_source==1		
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


 
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_ids_all_revised_Dec_2023_v2.dta",replace 	
erase "P:\OX94\OX94_backup_Dec_2023\ox94\Data\practice_temp.dta"
//stset cohort
 use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_ids_all_revised_Dec_2023_v2.dta",clear 
 stset cancer_fu, enter(enter3) failure(any_cancer_source==1) id(patid) scale(365.25)
global n 935
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_ids_stset_all_revised_Dec_2023_v2.dta", replace

forval x= 1/$n {
	use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_ids_stset_all_revised_Dec_2023_v2.dta",clear 
	keep if study_practice1==`x'
	set seed 12345  

	qui sttocc, match(yearofbirth sex1) number(20) gen(cancer_case set time) nodots //match by sex, age, calendar time, practice 

	qui gen index_date_case=cancer_date_all if cancer_case==1
	qui by set: egen index_date=min(index_date_case)
	qui by set: gen numset=_N
 
 save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\match_`x'_all_revised_Dec_2023_v2.dta", replace
	
}



use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\match_1_all_revised_Dec_2023_v2.dta",clear
set more off
	forval x=2/$n  {
	append using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\match_`x'_all_revised_Dec_2023_v2.dta"
	}
	tab cancer_case
 save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_0_all_revised_Dec_2023_v2",replace  

 
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_0_all_revised_Dec_2023_v2", clear

collapse (count) cancer_case, by(study_practice1 set)
	gen setid=_n
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\setid_temp.dta",replace

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_0_all_revised_Dec_2023_v2", clear
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



save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023_v2",replace 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised_Dec_2023", clear
***negative control**
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\as.dta", clear

gen earache=0
replace earache=1 if strpos(lower(term), "ear pain" )>0
replace earache=1 if strpos(lower(term), "ear ache" )>0
replace earache=1 if strpos(lower(term), "ear" )>0
replace earache=1 if strpos(lower(term), "otitis" )>0

keep if earache==1

keep if term== "Bilateral earache" |term== "Earache symptom NOS" |term== "Earache symptoms" | term=="O/E - ear auricle painful"

tab earache
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\negative_control.dta",replace


gen eczema=0
replace eczema=1 if strpos(lower(term), "eczema" )>0
preserve 
keep if eczema==1 
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\negative_control_1.dta",replace
restore

gen worm=0
replace worm=1 if strpos(lower(term), "worm" )>0
preserve
keep if worm==1
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\negative_control_2.dta",replace
restore



use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_master_final_all_dec_2023_v2", clear 

sort patid
by patid: gen k1=sum(any_cancer_source)
by patid: replace k1=. if _n<_N
by patid: gen T=sum(any_cancer_source<.)
by patid: replace T=. if _n<_N
by patid: gen dup_1= cond(_N==1,0, _n)
sort patid k1
tab dup_1
tab k1,m
tab T
sort dup_1 k1

drop if numset==1

drop agediag_2
gen agediag_2=1 if agediag<15 
replace agediag_2=2 if agediag>14 & agediag<25



label define agelabels_2 1 "0-14 years" 2 "15-24 years", replace
label values agediag_2 agelabels_2
tab agediag_2, m
sort agediag_2
by agediag_2: tab cancer_type



save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_nc", replace

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_nc", clear 
drop effectivedatetime
joinby patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\negative_control_2.dta"
sort patid


tab worm

gen time_gap_nc=(index_date- effectivedatetime)
keep if (time_gap_nc<365.25| time_gap_nc==.)
drop if time_gap_nc<0

sort patid
by patid: gen max_pres_nc1=_N
gen pres_cat_nc=0
replace pres_cat_nc=1 if max_pres_nc1>1

sort patid effectivedatetime
by patid: gen dup_blood_2= cond(_N==1,0, _n)
tab dup_blood_2
drop if dup_blood_2>1


save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\nc.dta", replace



use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\nc.dta", clear 
merge 1:m patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_nc"


replace cancer_type=0 if cancer_type==.
replace worm=0 if worm==.
sort cancer_type 
by cancer_type: tab agediag_2 eczema,m

drop if cancer_type==9 | cancer_type==8 

drop if agediag_2==2

bysort agediag_2: clogit cancer_case worm, group(setid) or



****

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_revised", clear 


tab cancer_type

sort setid
rename (effectivedatetime_organomegaly effectivedatetime_lympho effectivedatetime_fever_v2 effectivedatetime_urti_v2 effectivedatetime_limb_v2 effectivedatetime_joint_v2 effectivedatetime_limp_v2 effectivedatetime_anpa effectivedatetime_tired_v2 effectivedatetime_abdop_v2 effectivedatetime_anorexia_v2 effectivedatetime_rash_v2 effectivedatetime_skin_v2 effectivedatetime_hnp_v2 effectivedatetime_hns_v2 effectivedatetime_cl_v2 effectivedatetime_resp effectivedatetime_cp effectivedatetime_cough effectivedatetime_breathless effectivedatetime_headache_v2 effectivedatetime_bruise_v2 effectivedatetime_vomit_v2 effectivedatetime_hepatomegaly effectivedatetime_splenomegaly effectivedatetime_hsm effectivedatetime_abdomass effectivedatetime_lump effectivedatetime_hn_lump effectivedatetime_other_lump effectivedatetime_wl effectivedatetime_pruritus  effectivedatetime_pap effectivedatetime_macro effectivedatetime_hemi effectivedatetime_hemipa effectivedatetime_tort effectivedatetime_squint effectivedatetime_eyem effectivedatetime_acuity effectivedatetime_diplopia effectivedatetime_exopthalmos effectivedatetime_behaviour effectivedatetime_irritability effectivedatetime_delay effectivedatetime_voice effectivedatetime_cranial effectivedatetime_seizure effectivedatetime_puberty effectivedatetime_gait effectivedatetime_haematuria ) (effectivedatetime_1 effectivedatetime_2  effectivedatetime_3 effectivedatetime_4 effectivedatetime_5 effectivedatetime_6 effectivedatetime_7 effectivedatetime_8 effectivedatetime_9 effectivedatetime_10 effectivedatetime_11 effectivedatetime_12 effectivedatetime_13 effectivedatetime_14 effectivedatetime_15 effectivedatetime_16 effectivedatetime_17 effectivedatetime_18 effectivedatetime_19 effectivedatetime_20 effectivedatetime_21 effectivedatetime_22 effectivedatetime_23 effectivedatetime_24 effectivedatetime_25 effectivedatetime_26 effectivedatetime_27 effectivedatetime_28 effectivedatetime_29 effectivedatetime_30 effectivedatetime_31 effectivedatetime_32 effectivedatetime_33 effectivedatetime_34 effectivedatetime_35 effectivedatetime_36 effectivedatetime_37 effectivedatetime_38 effectivedatetime_39 effectivedatetime_40 effectivedatetime_41 effectivedatetime_42 effectivedatetime_43 effectivedatetime_44 effectivedatetime_45 effectivedatetime_46 effectivedatetime_47 effectivedatetime_48 effectivedatetime_49 effectivedatetime_50 effectivedatetime_51 )

rename (organomegaly lympho fever_v2 urti_v2 limb_v2 joint_v2 limp_v2 anpa tired_v2 abdop_v2 anorexia_v2 rash_v2 skin_v2 hnp_v2 hns_v2 cl_v2 resp chest_pain cough breathless headache_v2 bruise_v2 vomit_v2 hepatomegaly splenomegaly hepatosplenomegaly abdomass lump hn_lump other_lump wl pruritus  pap macro_v2 hemi_v2 hemipa tort squint eye acuity diplopia exopthalmos behaviour irritability delay voice cranial seizure puberty gait haematuria ) (symptom_1 symptom_2  symptom_3 symptom_4 symptom_5 symptom_6 symptom_7 symptom_8 symptom_9 symptom_10 symptom_11 symptom_12 symptom_13 symptom_14 symptom_15 symptom_16 symptom_17 symptom_18 symptom_19 symptom_20 symptom_21 symptom_22 symptom_23 symptom_24 symptom_25 symptom_26 symptom_27 symptom_28 symptom_29 symptom_30 symptom_31 symptom_32 symptom_33 symptom_34 symptom_35 symptom_36 symptom_37 symptom_38 symptom_39 symptom_40 symptom_41 symptom_42 symptom_43 symptom_44 symptom_45 symptom_46 symptom_47 symptom_48 symptom_49 symptom_50 symptom_51 )



global n 51
forval x=1/$n {


qui gen time_gap_`x'=(index_date- effectivedatetime_`x')
qui replace symptom_`x'=. if (time_gap_`x'<0 | time_gap_`x'>182)
qui replace effectivedatetime_`x'=. if (time_gap_`x'<0 | time_gap_`x'>182)
qui replace time_gap_`x'=. if (time_gap_`x'<0 | time_gap_`x'>182)
qui replace any_cancer_source=0 if any_cancer_source==.
qui 

qui replace symptom_`x'=0 if symptom_`x'==.

}

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_v2_revised",replace


use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all_v2_revised", clear 

//
tab cancer_type
sort patid
by patid: gen k1=sum(any_cancer_source)
by patid: replace k1=. if _n<_N
by patid: gen T=sum(any_cancer_source<.)
by patid: replace T=. if _n<_N
by patid: gen dup_1= cond(_N==1,0, _n)
sort patid k1
tab dup_1
tab k1,m
tab T
tab numset

gen case_repeat=0 
replace case_repeat=1 if cancer_case==1 & dup_1>=2 
tab case_repeat 

drop if numset==1

drop agediag_2
gen agediag_2=1 if agediag<15
replace agediag_2=2 if agediag>14 & agediag<25



label define agelabels_2 1 "0-14 years" 2 "15-24 years", replace
label values agediag_2 agelabels_2
tab agediag_2, m
sort agediag_2
by agediag_2: tab cancer_type




bys agediag_2: tab cancer_type
bys cancer_case: tab cancer_type
drop if cancer_case==0 & any_cancer_source==1

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_v2_revised", replace

// generate new variable for multiple presentation 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_v2", clear 

bys patid: gen dup= cond(_N==1,0, _n)
tab cancer_case dup
drop if dup>1
drop dup


reshape long time_gap_ symptom_ effectivedatetime_, i(patid) j(event)

keep if symptom_==1
bys patid (effectivedatetime_): gen max_pres=_N
tab max_pres
gen symptom_62=0
replace symptom_62=1 if max_pres>1
gen symptom_63=0 
replace symptom_63=1 if max_pres>2
 
reshape wide

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_v3_v2", replace

use  "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_v2", clear 
bys patid: gen dup= cond(_N==1,0, _n)
tab cancer_case dup
drop if dup>1
drop dup
merge 1:1 patid using "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_v3_v2"

replace symptom_62=0 if symptom_62==. 
replace symptom_63=0 if symptom_63==. 

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_v4_v2", replace


//total numbers per group 


use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_v2_revised", clear 

gen any_s=0
global n 60 
forval x=1/$n {
	replace any_s=1 if symptom_`x'==1
}
bys cancer_case: tab any_s 

sort any_s 

//univariable clogit 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_v2_revised", clear 

global n 15
forval x=1/$n {
	tab cancer_case symptom_`x'
	clogit cancer_case symptom_`x', group(setid) or
bys agediag_2: tab cancer_case symptom_`x'	
bys agediag_2: clogit cancer_case symptom_`x', group(setid) or
}

global n 30
forval x=15/$n {
	tab cancer_case symptom_`x'
	clogit cancer_case symptom_`x', group(setid) or
bys agediag_2: tab cancer_case symptom_`x'	
bys agediag_2: clogit cancer_case symptom_`x', group(setid) or
}

global n 45
forval x=30/$n {
	tab cancer_case symptom_`x'
	clogit cancer_case symptom_`x', group(setid) or
bys agediag_2: tab cancer_case symptom_`x'	
bys agediag_2: clogit cancer_case symptom_`x', group(setid) or
}

global n 60
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


//multivariate

clogit cancer_case symptom_1 symptom_2  symptom_3  symptom_5 symptom_6 symptom_7 symptom_8 symptom_9 symptom_10 symptom_13 symptom_15  symptom_18 symptom_19 symptom_20 symptom_21 symptom_22 symptom_23 symptom_29 symptom_30 symptom_31 symptom_32 symptom_34 symptom_36 symptom_37 symptom_38 symptom_40 symptom_48 symptom_51 , group(setid) or
bys agediag_2: clogit cancer_case symptom_1 symptom_2  symptom_3  symptom_5 symptom_6 symptom_7 symptom_8 symptom_9 symptom_10 symptom_13 symptom_15  symptom_18 symptom_19 symptom_20 symptom_21 symptom_22 symptom_23 symptom_29 symptom_30 symptom_31 symptom_32 symptom_34 symptom_36 symptom_37 symptom_38 symptom_40 symptom_48 symptom_51, group(setid) or


/////////////diagnostic intervals
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_v2", clear 


gen any_symptom=0
replace any_symptom=1 if symptom_1==1 | symptom_2==1 |   symptom_3==1 |   symptom_5==1 |  symptom_6==1 |  symptom_7==1 |  symptom_8==1 |  symptom_9==1 |  symptom_10==1 |  symptom_13==1 |  symptom_15==1 |   symptom_18==1 |  symptom_19==1 |  symptom_20==1 |  symptom_21==1 |  symptom_22==1 |  symptom_23==1 |  symptom_29==1 |  symptom_30==1 |  symptom_31==1 |  symptom_32==1 |  symptom_34==1 |  symptom_36==1 |  symptom_37==1 |  symptom_38==1 |  symptom_40==1 |  symptom_48==1 |  symptom_51==1 |  symptom_52==1 |  symptom_53==1 |  symptom_56==1 |  symptom_57==1  
tab cancer_case any_symptom

rename (symptom_1 symptom_2  symptom_3  symptom_5 symptom_6 symptom_7 symptom_8 symptom_9 symptom_10 symptom_13 symptom_15  symptom_18 symptom_19 symptom_20 symptom_21 symptom_22 symptom_23 symptom_29 symptom_30 symptom_31 symptom_32 symptom_34 symptom_36 symptom_37 symptom_38 symptom_40 symptom_48 symptom_51 symptom_52 symptom_53 symptom_56 symptom_57)(symptom1_1 symptom1_2 symptom1_3 symptom1_4  symptom1_5 symptom1_6  symptom1_7 symptom1_8 symptom1_9 symptom1_10 symptom1_11 symptom1_12 symptom1_13 symptom1_14 symptom1_15 symptom1_16 symptom1_17 symptom1_18 symptom1_19 symptom1_20 symptom1_21 symptom1_22 symptom1_23 symptom1_24 symptom1_25 symptom1_26 symptom1_27 symptom1_28 symptom1_29 symptom1_30 symptom1_31 symptom1_32)

rename (time_gap_1 time_gap_2  time_gap_3  time_gap_5 time_gap_6 time_gap_7 time_gap_8 time_gap_9 time_gap_10 time_gap_13 time_gap_15  time_gap_18 time_gap_19 time_gap_20 time_gap_21 time_gap_22 time_gap_23 time_gap_29 time_gap_30 time_gap_31 time_gap_32 time_gap_34 time_gap_36 time_gap_37 time_gap_38 time_gap_40 time_gap_48 time_gap_51 time_gap_52 time_gap_53 time_gap_56 time_gap_57)(time_gap1_1 time_gap1_2 time_gap1_3 time_gap1_4  time_gap1_5 time_gap1_6  time_gap1_7 time_gap1_8 time_gap1_9 time_gap1_10 time_gap1_11 time_gap1_12 time_gap1_13 time_gap1_14 time_gap1_15 time_gap1_16 time_gap1_17 time_gap1_18 time_gap1_19 time_gap1_20 time_gap1_21 time_gap1_22 time_gap1_23 time_gap1_24 time_gap1_25 time_gap1_26 time_gap1_27 time_gap1_28 time_gap1_29 time_gap1_30 time_gap1_31 time_gap1_32)

///rename (organomegaly lympho fever_v2 urti_v2 limb_v2 joint_v2 limp_v2 anpa tired_v2 abdop_v2 anorexia_v2 rash_v2 skin_v2 hnp_v2 hns_v2 cl_v2 resp chest_pain cough breathless headache_v2 bruise_v2 vomit_v2 hepatomegaly splenomegaly hepatosplenomegaly abdomass lump hn_lump other_lump wl pruritus  pap macro hemi_v2 hemipa tort squint eye acuity diplopia exopthalmos behaviour irritability delay voice cranial seizure puberty gait haematuria unwell constipation balance testicular_p testicular_s dizz syncope mood diarrhoea) (symptom_1 symptom_2  symptom_3 symptom_4 symptom_5 symptom_6 symptom_7 symptom_8 symptom_9 symptom_10 symptom_11 symptom_12 symptom_13 symptom_14 symptom_15 symptom_16 symptom_17 symptom_18 symptom_19 symptom_20 symptom_21 symptom_22 symptom_23 symptom_24 symptom_25 symptom_26 symptom_27 symptom_28 symptom_29 symptom_30 symptom_31 symptom_32 symptom_33 symptom_34 symptom_35 symptom_36 symptom_37 symptom_38 symptom_39 symptom_40 symptom_41 symptom_42 symptom_43 symptom_44 symptom_45 symptom_46 symptom_47 symptom_48 symptom_49 symptom_50 symptom_51 symptom_52 symptom_53 symptom_54 symptom_55 symptom_56 symptom_57 symptom_58 symptom_59 symptom_60)

global n=32
gen time_period=0


forval x=1/$n {
	
	replace time_period=1 if time_gap1_`x'<8
	replace time_period=2 if time_gap1_`x'>7 & time_gap1_`x'<16
	replace time_period=3 if time_gap1_`x'>15 & time_gap1_`x'<31
	replace time_period=4 if time_gap1_`x'>30 & time_gap1_`x'<46
	replace time_period=5 if time_gap1_`x'>45 & time_gap1_`x'<61
	replace time_period=6 if time_gap1_`x'>60 & time_gap1_`x'<91
	replace time_period=7 if time_gap1_`x'>90 & time_gap1_`x'<183

}

tab time_period any_symptom
sort time_period any_symptom
drop if time_period==0

sum time_period, detail

drop if cancer_case==0
tab cancer_case

gen time_gap_all=max(time_gap1_1, time_gap1_2, time_gap1_3, time_gap1_4,  time_gap1_5, time_gap1_6,  time_gap1_7, time_gap1_8, time_gap1_9, time_gap1_10, time_gap1_11, time_gap1_12, time_gap1_13, time_gap1_14, time_gap1_15, time_gap1_16, time_gap1_17, time_gap1_18, time_gap1_19, time_gap1_20, time_gap1_21, time_gap1_22, time_gap1_23, time_gap1_24, time_gap1_25, time_gap1_26, time_gap1_27, time_gap1_28, time_gap1_29, time_gap1_30, time_gap1_31, time_gap1_32)

summ time_gap_all, detail

graph hbox time_gap1_1 time_gap1_2 time_gap1_3 time_gap1_4  time_gap1_5 time_gap1_6  time_gap1_7 time_gap1_8 time_gap1_9 time_gap1_10 time_gap1_11 time_gap1_12 time_gap1_13 time_gap1_14 time_gap1_15 time_gap1_16 time_gap1_17 time_gap1_18 time_gap1_19 time_gap1_20 time_gap1_21 time_gap1_22 time_gap1_23 time_gap1_24 time_gap1_25 time_gap1_26 time_gap1_27 time_gap1_28 time_gap1_29 time_gap1_30 time_gap1_31 time_gap1_32, showyvars nooutsides scheme(s2color)

//median=32 days 
//early symptoms: limb pain, joint pain, tiredness, abdo pain, chest pain, cough, hn lump, other lump, weight loss, pruritus, seizures, haematuria 

preserve
keep if agediag_2==1 
summ time_gap_all, detail
graph hbox time_gap1_1 time_gap1_2 time_gap1_3 time_gap1_4  time_gap1_5 time_gap1_6  time_gap1_7 time_gap1_8 time_gap1_9 time_gap1_10 time_gap1_11 time_gap1_12 time_gap1_13 time_gap1_14 time_gap1_15 time_gap1_16 time_gap1_17 time_gap1_18 time_gap1_19 time_gap1_20 time_gap1_21 time_gap1_22 time_gap1_23 time_gap1_24 time_gap1_25 time_gap1_26 time_gap1_27 time_gap1_28 time_gap1_29 time_gap1_30 time_gap1_31 time_gap1_32, showyvars nooutsides scheme(s2color)
//median=27 days 
//early symptoms: limb pain, tiredness, abdo pain, chest pain, cough, hn lump, other lump, pruritus, seizures
restore

preserve
keep if agediag_2==2
summ time_gap_all, detail
graph hbox time_gap1_1 time_gap1_2 time_gap1_3 time_gap1_4  time_gap1_5 time_gap1_6  time_gap1_7 time_gap1_8 time_gap1_9 time_gap1_10 time_gap1_11 time_gap1_12 time_gap1_13 time_gap1_14 time_gap1_15 time_gap1_16 time_gap1_17 time_gap1_18 time_gap1_19 time_gap1_20 time_gap1_21 time_gap1_22 time_gap1_23 time_gap1_24 time_gap1_25 time_gap1_26 time_gap1_27 time_gap1_28 time_gap1_29 time_gap1_30 time_gap1_31 time_gap1_32, showyvars nooutsides scheme(s2color)
//median=38 days 
//early symptoms: limb pain, tiredness, abdo pain, chest pain, cough, bruising, hn lump, other lump, pruritus, seizures, haematuria, constipation, dizziness 
restore


/// early logistics 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all", clear 


tab cancer_type
sort setid
rename (effectivedatetime_organomegaly effectivedatetime_lympho effectivedatetime_fever_v2 effectivedatetime_urti_v2 effectivedatetime_limb_v2 effectivedatetime_joint_v2 effectivedatetime_limp_v2 effectivedatetime_anpa effectivedatetime_tired_v2 effectivedatetime_abdop_v2 effectivedatetime_anorexia_v2 effectivedatetime_rash_v2 effectivedatetime_skin_v2 effectivedatetime_hnp_v2 effectivedatetime_hns_v2 effectivedatetime_cl_v2 effectivedatetime_resp effectivedatetime_cp effectivedatetime_cough effectivedatetime_breathless effectivedatetime_headache_v2 effectivedatetime_bruise_v2 effectivedatetime_vomit_v2 effectivedatetime_hepatomegaly effectivedatetime_splenomegaly effectivedatetime_hsm effectivedatetime_abdomass effectivedatetime_lump effectivedatetime_hn_lump effectivedatetime_other_lump effectivedatetime_wl effectivedatetime_pruritus  effectivedatetime_pap effectivedatetime_macro effectivedatetime_hemi effectivedatetime_hemipa effectivedatetime_tort effectivedatetime_squint effectivedatetime_eyem effectivedatetime_acuity effectivedatetime_diplopia effectivedatetime_exopthalmos effectivedatetime_behaviour effectivedatetime_irritability effectivedatetime_delay effectivedatetime_voice effectivedatetime_cranial effectivedatetime_seizure effectivedatetime_puberty effectivedatetime_gait effectivedatetime_haematuria effectivedatetime_unwell effectivedatetime_constipation effectivedatetime_balance effectivedatetime_testicular_p effectivedatetime_testicular_s effectivedatetime_dizz effectivedatetime_syncope  effectivedatetime_mood effectivedatetime_diarrhoea) (effectivedatetime_1 effectivedatetime_2  effectivedatetime_3 effectivedatetime_4 effectivedatetime_5 effectivedatetime_6 effectivedatetime_7 effectivedatetime_8 effectivedatetime_9 effectivedatetime_10 effectivedatetime_11 effectivedatetime_12 effectivedatetime_13 effectivedatetime_14 effectivedatetime_15 effectivedatetime_16 effectivedatetime_17 effectivedatetime_18 effectivedatetime_19 effectivedatetime_20 effectivedatetime_21 effectivedatetime_22 effectivedatetime_23 effectivedatetime_24 effectivedatetime_25 effectivedatetime_26 effectivedatetime_27 effectivedatetime_28 effectivedatetime_29 effectivedatetime_30 effectivedatetime_31 effectivedatetime_32 effectivedatetime_33 effectivedatetime_34 effectivedatetime_35 effectivedatetime_36 effectivedatetime_37 effectivedatetime_38 effectivedatetime_39 effectivedatetime_40 effectivedatetime_41 effectivedatetime_42 effectivedatetime_43 effectivedatetime_44 effectivedatetime_45 effectivedatetime_46 effectivedatetime_47 effectivedatetime_48 effectivedatetime_49 effectivedatetime_50 effectivedatetime_51 effectivedatetime_52 effectivedatetime_53 effectivedatetime_54 effectivedatetime_55 effectivedatetime_56  effectivedatetime_57  effectivedatetime_58  effectivedatetime_59  effectivedatetime_60)

rename (organomegaly lympho fever_v2 urti_v2 limb_v2 joint_v2 limp_v2 anpa tired_v2 abdop_v2 anorexia_v2 rash_v2 skin_v2 hnp_v2 hns_v2 cl_v2 resp chest_pain cough breathless headache_v2 bruise_v2 vomit_v2 hepatomegaly splenomegaly hepatosplenomegaly abdomass lump hn_lump other_lump wl pruritus  pap macro hemi_v2 hemipa tort squint eye acuity diplopia exopthalmos behaviour irritability delay voice cranial seizure puberty gait haematuria unwell constipation balance testicular_p testicular_s dizz syncope mood diarrhoea) (symptom_1 symptom_2  symptom_3 symptom_4 symptom_5 symptom_6 symptom_7 symptom_8 symptom_9 symptom_10 symptom_11 symptom_12 symptom_13 symptom_14 symptom_15 symptom_16 symptom_17 symptom_18 symptom_19 symptom_20 symptom_21 symptom_22 symptom_23 symptom_24 symptom_25 symptom_26 symptom_27 symptom_28 symptom_29 symptom_30 symptom_31 symptom_32 symptom_33 symptom_34 symptom_35 symptom_36 symptom_37 symptom_38 symptom_39 symptom_40 symptom_41 symptom_42 symptom_43 symptom_44 symptom_45 symptom_46 symptom_47 symptom_48 symptom_49 symptom_50 symptom_51 symptom_52 symptom_53 symptom_54 symptom_55 symptom_56 symptom_57 symptom_58 symptom_59 symptom_60)



global n 60
forval x=1/$n {


qui gen time_gap_`x'=(index_date- effectivedatetime_`x')
qui replace symptom_`x'=. if (time_gap_`x'<33 | time_gap_`x'>182)
qui replace effectivedatetime_`x'=. if (time_gap_`x'<33 | time_gap_`x'>182)
qui replace time_gap_`x'=. if (time_gap_`x'<33 | time_gap_`x'>182)
qui replace any_cancer_source=0 if any_cancer_source==.
qui 

qui replace symptom_`x'=0 if symptom_`x'==.

}


//
tab cancer_type
sort patid
by patid: gen k1=sum(any_cancer_source)
by patid: replace k1=. if _n<_N
by patid: gen T=sum(any_cancer_source<.)
by patid: replace T=. if _n<_N
by patid: gen dup_1= cond(_N==1,0, _n)
sort patid k1
tab dup_1
tab k1,m
tab T
sort dup_1 k1

gen case_repeat=0 
replace case_repeat=1 if cancer_case==1 & dup_1>=2 
tab case_repeat 

drop if numset==1

drop agediag_2
gen agediag_2=1 if agediag<15
replace agediag_2=2 if agediag>14 & agediag<25



label define agelabels_2 1 "0-14 years" 2 "15-24 years", replace
label values agediag_2 agelabels_2
tab agediag_2, m
sort agediag_2
by agediag_2: tab cancer_type




bys agediag_2: tab cancer_type
bys cancer_case: tab cancer_type



clogit cancer_case symptom_2 symptom_5 symptom_6  symptom_10    symptom_18 symptom_19 symptom_21 symptom_22 symptom_23 symptom_29 symptom_30  symptom_32 symptom_48 symptom_51 symptom_53 symptom_56 symptom_57, group(setid) or


save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_early_all", replace

//subsection 1 - child - 28 days 


use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all", clear 


tab cancer_type
sort setid
rename (effectivedatetime_organomegaly effectivedatetime_lympho effectivedatetime_fever_v2 effectivedatetime_urti_v2 effectivedatetime_limb_v2 effectivedatetime_joint_v2 effectivedatetime_limp_v2 effectivedatetime_anpa effectivedatetime_tired_v2 effectivedatetime_abdop_v2 effectivedatetime_anorexia_v2 effectivedatetime_rash_v2 effectivedatetime_skin_v2 effectivedatetime_hnp_v2 effectivedatetime_hns_v2 effectivedatetime_cl_v2 effectivedatetime_resp effectivedatetime_cp effectivedatetime_cough effectivedatetime_breathless effectivedatetime_headache_v2 effectivedatetime_bruise_v2 effectivedatetime_vomit_v2 effectivedatetime_hepatomegaly effectivedatetime_splenomegaly effectivedatetime_hsm effectivedatetime_abdomass effectivedatetime_lump effectivedatetime_hn_lump effectivedatetime_other_lump effectivedatetime_wl effectivedatetime_pruritus  effectivedatetime_pap effectivedatetime_macro effectivedatetime_hemi effectivedatetime_hemipa effectivedatetime_tort effectivedatetime_squint effectivedatetime_eyem effectivedatetime_acuity effectivedatetime_diplopia effectivedatetime_exopthalmos effectivedatetime_behaviour effectivedatetime_irritability effectivedatetime_delay effectivedatetime_voice effectivedatetime_cranial effectivedatetime_seizure effectivedatetime_puberty effectivedatetime_gait effectivedatetime_haematuria effectivedatetime_unwell effectivedatetime_constipation effectivedatetime_balance effectivedatetime_testicular_p effectivedatetime_testicular_s effectivedatetime_dizz effectivedatetime_syncope  effectivedatetime_mood effectivedatetime_diarrhoea) (effectivedatetime_1 effectivedatetime_2  effectivedatetime_3 effectivedatetime_4 effectivedatetime_5 effectivedatetime_6 effectivedatetime_7 effectivedatetime_8 effectivedatetime_9 effectivedatetime_10 effectivedatetime_11 effectivedatetime_12 effectivedatetime_13 effectivedatetime_14 effectivedatetime_15 effectivedatetime_16 effectivedatetime_17 effectivedatetime_18 effectivedatetime_19 effectivedatetime_20 effectivedatetime_21 effectivedatetime_22 effectivedatetime_23 effectivedatetime_24 effectivedatetime_25 effectivedatetime_26 effectivedatetime_27 effectivedatetime_28 effectivedatetime_29 effectivedatetime_30 effectivedatetime_31 effectivedatetime_32 effectivedatetime_33 effectivedatetime_34 effectivedatetime_35 effectivedatetime_36 effectivedatetime_37 effectivedatetime_38 effectivedatetime_39 effectivedatetime_40 effectivedatetime_41 effectivedatetime_42 effectivedatetime_43 effectivedatetime_44 effectivedatetime_45 effectivedatetime_46 effectivedatetime_47 effectivedatetime_48 effectivedatetime_49 effectivedatetime_50 effectivedatetime_51 effectivedatetime_52 effectivedatetime_53 effectivedatetime_54 effectivedatetime_55 effectivedatetime_56  effectivedatetime_57  effectivedatetime_58  effectivedatetime_59  effectivedatetime_60)

rename (organomegaly lympho fever_v2 urti_v2 limb_v2 joint_v2 limp_v2 anpa tired_v2 abdop_v2 anorexia_v2 rash_v2 skin_v2 hnp_v2 hns_v2 cl_v2 resp chest_pain cough breathless headache_v2 bruise_v2 vomit_v2 hepatomegaly splenomegaly hepatosplenomegaly abdomass lump hn_lump other_lump wl pruritus  pap macro hemi_v2 hemipa tort squint eye acuity diplopia exopthalmos behaviour irritability delay voice cranial seizure puberty gait haematuria unwell constipation balance testicular_p testicular_s dizz syncope mood diarrhoea) (symptom_1 symptom_2  symptom_3 symptom_4 symptom_5 symptom_6 symptom_7 symptom_8 symptom_9 symptom_10 symptom_11 symptom_12 symptom_13 symptom_14 symptom_15 symptom_16 symptom_17 symptom_18 symptom_19 symptom_20 symptom_21 symptom_22 symptom_23 symptom_24 symptom_25 symptom_26 symptom_27 symptom_28 symptom_29 symptom_30 symptom_31 symptom_32 symptom_33 symptom_34 symptom_35 symptom_36 symptom_37 symptom_38 symptom_39 symptom_40 symptom_41 symptom_42 symptom_43 symptom_44 symptom_45 symptom_46 symptom_47 symptom_48 symptom_49 symptom_50 symptom_51 symptom_52 symptom_53 symptom_54 symptom_55 symptom_56 symptom_57 symptom_58 symptom_59 symptom_60)



global n 60
forval x=1/$n {


qui gen time_gap_`x'=(index_date- effectivedatetime_`x')
qui replace symptom_`x'=. if (time_gap_`x'<28 | time_gap_`x'>182)
qui replace effectivedatetime_`x'=. if (time_gap_`x'<28 | time_gap_`x'>182)
qui replace time_gap_`x'=. if (time_gap_`x'<28 | time_gap_`x'>182)
qui replace any_cancer_source=0 if any_cancer_source==.
qui 

qui replace symptom_`x'=0 if symptom_`x'==.

}


//
tab cancer_type
sort patid
by patid: gen k1=sum(any_cancer_source)
by patid: replace k1=. if _n<_N
by patid: gen T=sum(any_cancer_source<.)
by patid: replace T=. if _n<_N
by patid: gen dup_1= cond(_N==1,0, _n)
sort patid k1
tab dup_1
tab k1,m
tab T
sort dup_1 k1

gen case_repeat=0 
replace case_repeat=1 if cancer_case==1 & dup_1>=2 
tab case_repeat 

drop if numset==1

drop agediag_2
gen agediag_2=1 if agediag<15
replace agediag_2=2 if agediag>14 & agediag<25



label define agelabels_2 1 "0-14 years" 2 "15-24 years", replace
label values agediag_2 agelabels_2
tab agediag_2, m
sort agediag_2
by agediag_2: tab cancer_type




bys agediag_2: tab cancer_type
bys cancer_case: tab cancer_type



clogit cancer_case symptom_2  symptom_3  symptom_5 symptom_6 symptom_10 symptom_13  symptom_18 symptom_19 symptom_21 symptom_22 symptom_23 symptom_29 symptom_30  symptom_32 symptom_34 symptom_38 symptom_40 symptom_48 symptom_51 symptom_53 symptom_56 symptom_57, group(setid) or


save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_early_all_child", replace


//subsection 1 - TYA - 38 days 


use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_1_revised_all", clear 


tab cancer_type
sort setid
rename (effectivedatetime_organomegaly effectivedatetime_lympho effectivedatetime_fever_v2 effectivedatetime_urti_v2 effectivedatetime_limb_v2 effectivedatetime_joint_v2 effectivedatetime_limp_v2 effectivedatetime_anpa effectivedatetime_tired_v2 effectivedatetime_abdop_v2 effectivedatetime_anorexia_v2 effectivedatetime_rash_v2 effectivedatetime_skin_v2 effectivedatetime_hnp_v2 effectivedatetime_hns_v2 effectivedatetime_cl_v2 effectivedatetime_resp effectivedatetime_cp effectivedatetime_cough effectivedatetime_breathless effectivedatetime_headache_v2 effectivedatetime_bruise_v2 effectivedatetime_vomit_v2 effectivedatetime_hepatomegaly effectivedatetime_splenomegaly effectivedatetime_hsm effectivedatetime_abdomass effectivedatetime_lump effectivedatetime_hn_lump effectivedatetime_other_lump effectivedatetime_wl effectivedatetime_pruritus  effectivedatetime_pap effectivedatetime_macro effectivedatetime_hemi effectivedatetime_hemipa effectivedatetime_tort effectivedatetime_squint effectivedatetime_eyem effectivedatetime_acuity effectivedatetime_diplopia effectivedatetime_exopthalmos effectivedatetime_behaviour effectivedatetime_irritability effectivedatetime_delay effectivedatetime_voice effectivedatetime_cranial effectivedatetime_seizure effectivedatetime_puberty effectivedatetime_gait effectivedatetime_haematuria effectivedatetime_unwell effectivedatetime_constipation effectivedatetime_balance effectivedatetime_testicular_p effectivedatetime_testicular_s effectivedatetime_dizz effectivedatetime_syncope  effectivedatetime_mood effectivedatetime_diarrhoea) (effectivedatetime_1 effectivedatetime_2  effectivedatetime_3 effectivedatetime_4 effectivedatetime_5 effectivedatetime_6 effectivedatetime_7 effectivedatetime_8 effectivedatetime_9 effectivedatetime_10 effectivedatetime_11 effectivedatetime_12 effectivedatetime_13 effectivedatetime_14 effectivedatetime_15 effectivedatetime_16 effectivedatetime_17 effectivedatetime_18 effectivedatetime_19 effectivedatetime_20 effectivedatetime_21 effectivedatetime_22 effectivedatetime_23 effectivedatetime_24 effectivedatetime_25 effectivedatetime_26 effectivedatetime_27 effectivedatetime_28 effectivedatetime_29 effectivedatetime_30 effectivedatetime_31 effectivedatetime_32 effectivedatetime_33 effectivedatetime_34 effectivedatetime_35 effectivedatetime_36 effectivedatetime_37 effectivedatetime_38 effectivedatetime_39 effectivedatetime_40 effectivedatetime_41 effectivedatetime_42 effectivedatetime_43 effectivedatetime_44 effectivedatetime_45 effectivedatetime_46 effectivedatetime_47 effectivedatetime_48 effectivedatetime_49 effectivedatetime_50 effectivedatetime_51 effectivedatetime_52 effectivedatetime_53 effectivedatetime_54 effectivedatetime_55 effectivedatetime_56  effectivedatetime_57  effectivedatetime_58  effectivedatetime_59  effectivedatetime_60)

rename (organomegaly lympho fever_v2 urti_v2 limb_v2 joint_v2 limp_v2 anpa tired_v2 abdop_v2 anorexia_v2 rash_v2 skin_v2 hnp_v2 hns_v2 cl_v2 resp chest_pain cough breathless headache_v2 bruise_v2 vomit_v2 hepatomegaly splenomegaly hepatosplenomegaly abdomass lump hn_lump other_lump wl pruritus  pap macro hemi_v2 hemipa tort squint eye acuity diplopia exopthalmos behaviour irritability delay voice cranial seizure puberty gait haematuria unwell constipation balance testicular_p testicular_s dizz syncope mood diarrhoea) (symptom_1 symptom_2  symptom_3 symptom_4 symptom_5 symptom_6 symptom_7 symptom_8 symptom_9 symptom_10 symptom_11 symptom_12 symptom_13 symptom_14 symptom_15 symptom_16 symptom_17 symptom_18 symptom_19 symptom_20 symptom_21 symptom_22 symptom_23 symptom_24 symptom_25 symptom_26 symptom_27 symptom_28 symptom_29 symptom_30 symptom_31 symptom_32 symptom_33 symptom_34 symptom_35 symptom_36 symptom_37 symptom_38 symptom_39 symptom_40 symptom_41 symptom_42 symptom_43 symptom_44 symptom_45 symptom_46 symptom_47 symptom_48 symptom_49 symptom_50 symptom_51 symptom_52 symptom_53 symptom_54 symptom_55 symptom_56 symptom_57 symptom_58 symptom_59 symptom_60)



global n 60
forval x=1/$n {


qui gen time_gap_`x'=(index_date- effectivedatetime_`x')
qui replace symptom_`x'=. if (time_gap_`x'<38 | time_gap_`x'>182)
qui replace effectivedatetime_`x'=. if (time_gap_`x'<38 | time_gap_`x'>182)
qui replace time_gap_`x'=. if (time_gap_`x'<38 | time_gap_`x'>182)
qui replace any_cancer_source=0 if any_cancer_source==.
qui 

qui replace symptom_`x'=0 if symptom_`x'==.

}


//
tab cancer_type
sort patid
by patid: gen k1=sum(any_cancer_source)
by patid: replace k1=. if _n<_N
by patid: gen T=sum(any_cancer_source<.)
by patid: replace T=. if _n<_N
by patid: gen dup_1= cond(_N==1,0, _n)
sort patid k1
tab dup_1
tab k1,m
tab T
sort dup_1 k1

gen case_repeat=0 
replace case_repeat=1 if cancer_case==1 & dup_1>=2 
tab case_repeat 

drop if numset==1

drop agediag_2
gen agediag_2=1 if agediag<15
replace agediag_2=2 if agediag>14 & agediag<25



label define agelabels_2 1 "0-14 years" 2 "15-24 years", replace
label values agediag_2 agelabels_2
tab agediag_2, m
sort agediag_2
by agediag_2: tab cancer_type




bys agediag_2: tab cancer_type
bys cancer_case: tab cancer_type



clogit cancer_case symptom_2  symptom_3  symptom_5 symptom_6 symptom_10 symptom_13 symptom_18 symptom_19 symptom_21 symptom_22 symptom_23 symptom_29 symptom_30  symptom_32 symptom_34 symptom_48 symptom_51 symptom_53 symptom_56 symptom_57, group(setid) or


save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_early_all_tya", replace

/// symptom combos 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_v2", clear 


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

// imputation 
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_v2", clear

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


	mi impute chained (mlogit)ethnic_2cat (ologit)town_quintile =  i.symptom_1 i.symptom_2  i.symptom_3  i.symptom_5 i.symptom_6 i.symptom_7 i.symptom_8 i.symptom_9 i.symptom_10 i.symptom_13 i.symptom_15  i.symptom_18 i.symptom_19 i.symptom_20 i.symptom_21 i.symptom_22 i.symptom_23 i.symptom_29 i.symptom_30 i.symptom_31 i.symptom_32 i.symptom_34 i.symptom_36 i.symptom_37 i.symptom_38 i.symptom_40 i.symptom_48 i.symptom_51 i.symptom_52 i.symptom_53 i.symptom_56 i.symptom_57, rseed(2526) dots add(10) augment	




timer off 1 
timer list 

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_imputed_v2", replace

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_imputed_v2", clear

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
keep if patid==30155341
mi reshape long ppv_ se_ppv_, i(patid) j(event2)
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_long_all", replace
restore 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_long_all", clear 

mi estimate, or level(95): clogit cancer_case symptom_1 symptom_2  symptom_3  symptom_5 symptom_6 symptom_7 symptom_8 symptom_9 symptom_10 symptom_13 symptom_15  symptom_18 symptom_19 symptom_20 symptom_21 symptom_22 symptom_23 symptom_29 symptom_30 symptom_31 symptom_32 symptom_34 symptom_36 symptom_37 symptom_38 symptom_40 symptom_48 symptom_51 symptom_52 symptom_53 symptom_56 symptom_57 i.town_quint i.ethnic_2cat, group(setid) or



parmest, list(,) saving ("P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_multivariate_results_imputed", replace) eform label for(estimate min95 max95)
 use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_multivariate_results_imputed.dta", clear
 gen log_OR=log(estimate)
 gen log_min=log(min95)
 gen log_max=log(max95)
 format PPV %3.2f
 format estimate min95 max95 log_OR log_min log_max %12.1f
 label variable parm "Symptoms"
 label variable PPV "PPV(%)"
 label variable CI "95% CI"
metan log_OR log_min log_max, label(namevar=parm) nowt nooverall nobox eform effect(Odds Ratio) lcols(parm) rcols(PPV CI) textsize(100)



use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_imputed", clear 
keep if agediag_2==1


	mi estimate, or level(95): clogit cancer_case symptom_1 symptom_2  symptom_3  symptom_5 symptom_6 symptom_7 symptom_8 symptom_9 symptom_10 symptom_13 symptom_15  symptom_18 symptom_19 symptom_20 symptom_21 symptom_22 symptom_23 symptom_29 symptom_30 symptom_31 symptom_32 symptom_34 symptom_36 symptom_37 symptom_38 symptom_40 symptom_48 symptom_51 symptom_52 symptom_53 symptom_56 symptom_57 i.town_quint i.ethnic_2cat, group(setid) or

 
 parmest, list(,) saving ("P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_multivariate_results_imputed_child", replace) eform label for(estimate min95 max95)

 
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
keep if patid==32432305
mi reshape long ppv_ se_ppv_, i(patid) j(event2)
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_long_all_child", replace
restore 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_long_all", clear 

 
 
 use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_multivariate_results_imputed_child.dta", clear
 gen log_OR=log(estimate)
 gen log_min=log(min95)
 gen log_max=log(max95)
format PPV %3.2f
 format estimate min95 max95 log_OR log_min log_max %12.1f
 label variable parm "Symptoms"
 label variable PPV "PPV(%)"
 label variable CI "95% CI"
metan log_OR log_min log_max, label(namevar=parm) nowt nooverall nobox eform effect(Odds Ratio) lcols(parm) rcols(PPV CI) textsize(100)



use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_imputed", clear 

keep if agediag_2==2

mi estimate, or level(95): clogit cancer_case symptom_2  symptom_3  symptom_5  symptom_8 symptom_10 symptom_18 symptom_19 symptom_20 symptom_21 symptom_22 symptom_23 symptom_29 symptom_30 symptom_31 symptom_32 symptom_36 symptom_40 symptom_48 symptom_51 symptom_52 symptom_53 symptom_56  i.town_quint i.ethnic_2cat, group(setid) or
 parmest, list(,) saving ("P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_multivariate_results_imputed_TYA", replace) eform label for(estimate min95 max95)

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
keep if patid==32387250
mi reshape long ppv_ se_ppv_, i(patid) j(event2)
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_long_all_TYA", replace
restore 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_long_all_TYA", clear 

 
 use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_multivariate_results_imputed_TYA", clear

 gen log_OR=log(estimate)
 gen log_min=log(min95)
 gen log_max=log(max95)
format PPV %3.2f
 format estimate min95 max95 log_OR log_min log_max %12.1f
 label variable parm "Symptoms"
 label variable PPV "PPV(%)"
 label variable CI "95% CI"
metan log_OR log_min log_max, label(namevar=parm) nowt nooverall nobox eform effect(Odds Ratio) lcols(parm) rcols(PPV CI) textsize(100)




// imputation for part 2 - early multivariate analysis


use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_early_all", clear

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


mi impute chained (mlogit)ethnic_2cat (ologit)town_quintile =  i.symptom_2  i.symptom_3  i.symptom_5 i.symptom_6  i.symptom_10    i.symptom_18 i.symptom_19 i.symptom_21 i.symptom_22 i.symptom_23 i.symptom_29 i.symptom_30  i.symptom_32 i.symptom_48 i.symptom_51 i.symptom_53 i.symptom_56 i.symptom_57, rseed(2526) dots add(10) augment	




timer off 1 
timer list 

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_imputed_early", replace

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_imputed_early", clear

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
keep if patid==11893776
mi reshape long ppv_ se_ppv_, i(patid) j(event2)
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_long_all_early", replace
restore 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_long_all_early", clear 


mi estimate, or level(95): clogit cancer_case symptom_2 symptom_5 symptom_6  symptom_10    symptom_18 symptom_19 symptom_21 symptom_22 symptom_23 symptom_29 symptom_30  symptom_32 symptom_48 symptom_51 symptom_53 symptom_56 symptom_57 i.town_quint i.ethnic_2cat, group(setid) or
	
 parmest, list(,) saving ("P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_early_results_imputed_all", replace) eform label for(estimate min95 max95)
 
 use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_early_results_imputed_all", clear
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


use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_early_all_child", clear
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

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_imputed_early_child", replace

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_imputed_early_child", clear

mi estimate, or level(95): clogit cancer_case symptom_2  symptom_3  symptom_5 symptom_6 symptom_10 symptom_13  symptom_18 symptom_19 symptom_21 symptom_22 symptom_23 symptom_29 symptom_30  symptom_32 symptom_34 symptom_38 symptom_40 symptom_48 symptom_51 symptom_53 symptom_56 symptom_57 i.town_quint i.ethnic_2cat, group(setid) or

 parmest, list(,) saving ("P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_early_results_imputed_all_child", replace) eform label for(estimate min95 max95)
	

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
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_long_all_early_child", replace
restore 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_long_all_early_child", clear 




 
 use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_early_results_imputed_all_child", clear
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

 parmest, list(,) saving ("P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_early_results_imputed_all_tya", replace) eform label for(estimate min95 max95)
	

	
use	"P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_imputed_early_tya", clear
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
keep if patid==15782973
mi reshape long ppv_ se_ppv_, i(patid) j(event2)
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_long_all_early_tya", replace
restore 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_long_all_early_tya", clear 




 
 use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_early_results_imputed_all_tya", clear
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

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_combo", clear


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

save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_imputed_combo", replace

//step 1: all ages 
use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_imputed_combo", clear 


global n 33
forval x=1/$n {
	mi estimate, or level(95): clogit cancer_case symptom_combo_`x' i.town_quint i.ethnic_2cat, group(setid) or
}



parmest, list(,) saving ("P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_combo_results_tya_imputed", replace) eform label for(estimate min95 max95)
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
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_combo_long_tya", replace
restore 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_combo_long_tya", clear 


 use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_combo_results_all_imputed.dta", clear


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



use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_imputed_combo", clear 

keep if agediag_2==1 



global n 33
forval x=21/$n {
	mi estimate, or level(95): clogit cancer_case symptom_combo_`x' i.town_quint i.ethnic_2cat, group(setid) 
}



parmest, list(,) saving ("P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_combo_results_child_imputed", replace) eform label for(estimate min95 max95)
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
save "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_combo_long_all_child", replace
restore 

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_combo_long_all_child", clear 

 use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_combo_results_child_imputed", clear


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

use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_all_imputed_combo", clear 

keep if agediag_2==2

global n 33
forval x=23/$n {
	mi estimate, or level(95): clogit cancer_case symptom_combo_`x' i.town_quint i.ethnic_2cat, group(setid) or
}
	parmest, list(,) saving ("P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_combo_results_tya", replace) eform label for(estimate min95 max95)
 use "P:\OX94\OX94_backup_Dec_2023\ox94\Data\OX94_casecontrol_combo_results_tya.dta", clear


 gen log_OR=log(estimate)
 gen log_min=log(min95)
 gen log_max=log(max95)
 format PPV SE %12.4f
 format estimate min95 max95 log_OR log_min log_max %12.1f

metan log_OR log_min log_max, label(namevar=parm) nowt nooverall nobox eform effect(Odds Ratio) rcols(PPV SE) textsize(300)
