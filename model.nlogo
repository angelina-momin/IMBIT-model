 extensions [gis ] ;profiler]
__includes [ "utils/Spillover.nls" "utils/input.nls" "utils/Ageingplus.nls" "utils/SEIR.nls" "utils/Ageingmin.nls" "utils/JobCommuting.nls" "utils/Schoolcommuting.nls" "utils/Travelling.nls" "utils/HealthunitsMaternal.nls"
  "utils/HealthunitsLocation.nls" "utils/R0.nls" "utils/COVID19history.nls" "utils/Roadmapscenario.nls" "utils/Economicscenario.nls" "utils/Agescenario.nls"
  "utils/Municipality.nls" "utils/SpatialLayers.nls" "utils/Turtles.nls" "utils/ContactRates.nls"
  "utils/OriginalPertussisModel.nls" "utils/CreateOutputFile.nls"]


globals [basemap biblebelt centroids items serviceregion GGD setup-links-travelling exposed-period infected-period recovered-period oldtotalinfected oldtotalhospitalized totalinfectedNL
   newtotalinfected newtotalhospitalized differenceinfected differencehospitalized differencehospitalizedfixed reproductionnumber reproductionnumberold reproductionnumbernew
   positivetests positivetestscalc ij risk_level

   ; School commuting
   schoolcommuters totalschoolcommutersflow extraS14112school extraS14212school schoolcommuterstotal schoolcommuterstotalNL

   ; Job commuting
   jobcommuterstotal jobcommuterstotalNL
   extraS26311job extraS26312job extraS36322job extraS36311job extraS36312job extraS17311job extraS17312job extraS18311job extraS18312job
   extraS26111job extraS26112job extraS36122job extraS36111job extraS36112job extraS17111job extraS17112job extraS18111job extraS18112job

   ; VT & GAET
   VTtotal GAETtotal traveltotal
   travelextraS11112 travelextraS12112 travelextraS13112 travelextraS14212 travelextraS14112 travelextraS15111 travelextraS26311 travelextraS26312
   travelextraS26111 travelextraS26112 travelextraS36322 travelextraS36311 travelextraS36312 travelextraS36122 travelextraS36111 travelextraS36112
   travelextraS17311 travelextraS17312 travelextraS17111 travelextraS17112 travelextraS18311 travelextraS18312 travelextraS18111 travelextraS18112
   travelextraS19111

   ; Contact rates
   contactrates contactrate1 contactrate2 contactrate3
   contactrate0_000t contactrate0_020t contactrate0_029t contactrate0_040t contactrate0_050t contactrate0_067t contactrate0_100t contactrate0_200t
   contactrate0_300t contactrate0_400t contactrate0_600t contactrate0_800t contactrate1_000t contactrate1_400t contactrate2_000t

   ; Commuter contact
   commutercontact commutercontact1 commutercontact2 commutercontact3
   commutercontact0_000t commutercontact0_020t commutercontact0_029t commutercontact0_040t commutercontact0_050t  commutercontact0_067t commutercontact0_100t
   commutercontact0_200t commutercontact0_300t commutercontact0_400t commutercontact0_600t commutercontact0_800t commutercontact1_000t commutercontact1_400t commutercontact2_000t

   ; Travelling
   travelling0-5yrs travelling5-12yrs travelling12-17yrs travelling17-25yrs travelling25-35yrs travelling35-50yrs travelling50-65yrs travelling65plusyrs neighbouring
   travelling0-5yrs_neigh travelling5-12yrs_neigh travelling12-17yrs_neigh travelling17-25yrs_neigh travelling25-35yrs_neigh travelling35-50yrs_neigh travelling50-65yrs_neigh travelling65plusyrs_neigh decimalVT_neigh
   travelling0-5yrs_non_neigh travelling5-12yrs_non_neigh travelling12-17yrs_non_neigh travelling17-25yrs_non_neigh travelling25-35yrs_non_neigh travelling35-50yrs_non_neigh travelling50-65yrs_non_neigh travelling65plusyrs_non_neigh decimalVT_non_neigh

   ; Economic scores
   score economicscore contactjobschoolGAETVTscore
   contactscore1 contactscore2 contactscore3 contactscore4 contactscore5
   jobcomscore1 jobcomscore2 jobcomscore3 jobcomscore4 jobcomscore5
   schoolcomscore1 schoolcomscore2 schoolcomscore3 schoolcomscore4 schoolcomscore5
   GAETscore1 GAETscore2 GAETscore3 GAETscore4 GAETscore5
   VTscore1 VTscore2 VTscore3 VTscore4 VTscore5
   contactcontact jobcomcontact schoolcomcontact GAETcontact VTcontact
   contactrestrictions contactrestrictions1 contactrestrictions2 contactrestrictions3 contactrestrictions4 contactrestrictions5
   jobcomrestrictions jobcomrestrictions1 jobcomrestrictions2 jobcomrestrictions3 jobcomrestrictions4 jobcomrestrictions5
   schoolcomrestrictions schoolcomrestrictions1 schoolcomrestrictions2 schoolcomrestrictions3 schoolcomrestrictions4 schoolcomrestrictions5
   GAETrestrictions GAETrestrictions1 GAETrestrictions2 GAETrestrictions3 GAETrestrictions4 GAETrestrictions5
   VTrestrictions VTrestrictions1 VTrestrictions2 VTrestrictions3 VTrestrictions4 VTrestrictions5
   numberoflists

   ; Age scores
   agescore
   oldtotalinfected05 oldtotalhospitalized05 newtotalinfected05 newtotalhospitalized05 differencehospitalized05
   oldtotalinfected512 oldtotalhospitalized512 newtotalinfected512 newtotalhospitalized512 differencehospitalized512
   oldtotalinfected1217 oldtotalhospitalized1217 newtotalinfected1217 newtotalhospitalized1217 differencehospitalized1217
   oldtotalinfected1725 oldtotalhospitalized1725 newtotalinfected1725 newtotalhospitalized1725 differencehospitalized1725
   oldtotalinfected2535 oldtotalhospitalized2535 newtotalinfected2535 newtotalhospitalized2535 differencehospitalized2535
   oldtotalinfected3550 oldtotalhospitalized3550 newtotalinfected3550 newtotalhospitalized3550 differencehospitalized3550
   oldtotalinfected5065 oldtotalhospitalized5065 newtotalinfected5065 newtotalhospitalized5065 differencehospitalized5065
   oldtotalinfected6580 oldtotalhospitalized6580 newtotalinfected6580 newtotalhospitalized6580 differencehospitalized6580
   oldtotalinfected80plus oldtotalhospitalized80plus newtotalinfected80plus newtotalhospitalized80plus differencehospitalized80plus
   total05 total512 total1217 total1725 total2535 total3550 total5065 total6580 total80plus
   tests05per10000 tests512per10000 tests1217per10000 tests1725per10000 tests2535per10000 tests3550per10000 tests5065per10000 tests6580per10000 tests80plusper10000
   contactagescore1 jobcomagescore1 schoolcomagescore1 GAETagescore1 VTagescore1 contactagescore2 jobcomagescore2 schoolcomagescore2 GAETagescore2 VTagescore2
   contactagescore3 jobcomagescore3 schoolcomagescore3 GAETagescore3 VTagescore3 contactagescore4 jobcomagescore4 schoolcomagescore4 GAETagescore4 VTagescore4
   contactagescore5 jobcomagescore5 schoolcomagescore5 GAETagescore5 VTagescore5

   ; Measures
   contactlevel1 contactlevel2 contactlevel3 contactlevel4 contactlevel5 contactlevel6
   jobcomlevel1 jobcomlevel2 jobcomlevel3 jobcomlevel4 jobcomlevel5 jobcomlevel6
   schoolcomlevel1 schoolcomlevel2 schoolcomlevel3 schoolcomlevel4 schoolcomlevel5 schoolcomlevel6
   GAETlevel1 GAETlevel2 GAETlevel3 GAETlevel4 GAETlevel5 GAETlevel6
   VTlevel1 VTlevel2 VTlevel3 VTlevel4 VTlevel5 VTlevel6

   ; Holiday
   holiday-ticks helpstep helpstepb

   ; Decimals
   decimalschool decimalschoolcom decimaljob decimaljobcom decimalGAET decimalGAETcalc decimalVT decimalVTcalc travelflows

   ; Lists to calculate 7 day average
   jobcommuter-new-infected jobcommuter-new-infected-over-7-days schoolcommuter-new-infected schoolcommuter-new-infected-over-7-days VT-new-infected VT-new-infected-over-7-days
   GAET-new-infected GAET-new-infected-over-7-days R0-new R0-over-7-days economiclist]

breed [municipalities municipality]

municipalities-own [name GGDregion vaccinationrate population totalpopulation fractionsusceptible fractionexposed
  fractioninfected fractionrecovered totalsusceptible totalexposed totalinfected totalrecovered totalhospitalized achospitalized
  totalinfecteddaybefore totalnewinfected ; Used for calculating the number of totalnewinfected per day
  
  S112  E112  I112  R112 
  S212  E212  I212  R212 
  S312  E312  I312  R312 
  S422  E422  I422  R422
  S412  E412  I412  R412 
  S511  E511  I511  R511 
  S631  E631  I631  R631 
  S632  E632  I632  R632
  S611  E611  I611  R611 
  S612  E612  I612  R612 
  S731  E731  I731  R731 
  S732  E732  I732  R732 
  S711  E711  I711  R711 
  S712  E712  I712  R712
  S831  E831  I831  R831 
  S832  E832  I832  R832 
  S811  E811  I811  R811 
  S812  E812  I812  R812
  S911  E911  I911  R911 
  
  suminfected05 suminfected512 suminfected1217 suminfected1725 suminfected2535 suminfected3550
  suminfected5065 suminfected6580 suminfected80plus hospitalized05 hospitalized512 hospitalized1217 hospitalized1725 hospitalized2535 hospitalized3550
  hospitalized5065 hospitalized6580 hospitalized80plus
  
  ; To record number of animal infections and spillovers
  totalinfectedanimals totalspilloveranimalhumaninfections
  ]

directed-link-breed [commuterflows commuterflow]

commuterflows-own [nr-people frommuni tomuni]

directed-link-breed [schoolflows schoolflow]

schoolflows-own [nr-people frommuni tomuni]

directed-link-breed [visitflows visitflow]

visitflows-own [nr-people frommuni tomuni]

directed-link-breed [gatheringsandeventsflows gatheringsandeventsflow]

gatheringsandeventsflows-own [nr-people frommuni tomuni]

directed-link-breed [travelneighflows travelneighflow]

travelneighflows-own [nr-people frommuni tomuni]

directed-link-breed [travelnonneighflows travelnonneighflow]

travelnonneighflows-own [nr-people frommuni tomuni]

directed-link-breed [holidayflows holidayflow]

holidayflows-own [nr-people frommuni tomuni]

breed [healthunits healthunit]

healthunits-own [region]


to setup
  clear-all
  file-close

  load-spatial-layers
  create-model-turtles
  create-list-contactrates

  initiate-helpstep

  ;; setup selected links
  ifelse overall-job-commuting? [setup-links-job] []
  ifelse overall-school-commuting? [setup-links-school] []

  ;; setup links VT and GAET, that borh share same links
  set setup-links-travelling 0
  ifelse overall-gatherings-events-travelling? [set setup-links-travelling 1] []
  ifelse overall-visit-travelling? [set setup-links-travelling 1] []

  if setup-links-travelling = 1 [setup-links-travelling-neigh]
  if setup-links-travelling = 1 [setup-links-travelling-non-neigh]

  set decimalVT 1
  set decimalGAET 1
  set decimalschoolcom 1
  set decimaljobcom 1
  set decimalVTcalc 1
  set decimalGAETcalc 1

  ; create list to calculate 7 day average commuting and travelling
  set jobcommuter-new-infected []
  set schoolcommuter-new-infected []
  set VT-new-infected []
  set GAET-new-infected []
  set R0-new []
  set economiclist []

  ask links [ hide-link ]
  ;ask links [set color red]
  reset-ticks

  ;; set up the economic and age measure order
  if (Scenario ="Economic_Scenario") [setup-economic]
  if (Scenario ="Age_Scenario") [setup-age]
  if (Scenario ="Economic_Scenario") [order_economic]

  ;profiler:start         ;; start profiling
  ;repeat 50 [ go ]       ;; run something you want to measure
  ;profiler:stop          ;; stop profiling
  ;print profiler:report  ;; view the results
  ;profiler:reset         ;; clear the data

  create-and-setup-output-file

  ask municipalities[
;  healthunits-location-vaccination
  ]

  load-spillover-time-stamps
  print("Setup complete")
end

to go
  set oldtotalinfected sum [totalinfected] of municipalities
  set oldtotalhospitalized sum [totalhospitalized] of municipalities
  if (Scenario ="Age_Scenario") [old-age-tests-hospitalized-infected]

  if ticks = 0 or (ticks - Day-COVID-19-Outbreak) mod Frequency = 0 [run Scenario]

  ; For each day we reset the number of totalinfected animals for municipalities to 0
  ask municipalities [set totalinfectedanimals 0]
  load-animal-farm-infections

  ; Write to output file every day
  file-open (word "data/output/OutputBasemodel.csv")

  ask municipalities [
    ;population-model-plus
    ;population-model-min
    ;healthunits-maternal-vaccination

    SEIR-model

    if (Scenario ="COVID19_History_No_Lockdown") [decide_commuting_travelling_history]
    if (Scenario ="COVID19_History_Lockdown") [decide_commuting_travelling_history]
    if (Scenario ="Road_Map_Scenario") [decide_commuting_road_map]
    if (Scenario ="Economic_Scenario") [decide_commuting_economic]
    if (Scenario ="Age_Scenario") [decide_commuting_age]
    if (Scenario ="Original_Pertussis_Model") [decide_commuting_original]

    introduce-source-infection-single-municipality
    ; Introducing animal-human spillover infection in every gemeente
    ; if conditions are met
    if (ticks mod spillover-interval = 0)[
      create-spillover-infc-animal-human-gm
    ]

    recolor-single-municipality

    calculate-totals-single-municipality

    ;; write to output file
    ; The total susceptibl, exposed and infected are rounded
    file-print (word  " "ticks" ; "name" ; "xcor" ; "ycor" ; "totalinfectedanimals" ; "totalspilloveranimalhumaninfections" ; "round totalpopulation" ; "round totalsusceptible" ; "round totalexposed" ; "round totalinfected" ; "round totalrecovered" ; "totalnewinfected" ")
    ; "I112" ; "I212" ; "I312" ; "suminfected1217" ; "I511" ; "suminfected2535" ; "suminfected3550" ; "suminfected5065" ; "I911" ")
    ;] ;"sum05" ; "sum55"; "sum512"; "sum1217"; "sum1725"; "sum2535"; "sum3550"; "sum5065"; "sum65" ")] ; "S112" ; "E112" ;"I112" ;"R112" ;  "S212" ;  "E212" ; "I212" ; "R212" ; "S312" ; "E312" ; "I312" ; "R312" ; "S422" ; "E422" ; "I422" ; "R422" ; "S412" ; "E412" ; "I412" ; "R412" ; "S511" ; "E511" ; "I511" ; "R511" ; "S631" ; "E631" ; "I631" ; "R631" ; "S632" ; "E632" ; "I632" ; "R632" ; "S611" ; "E611" ; "I611" ; "R611" ; "S612" ; "E612" ; "I612" ; "R612" ; "S731" ; "E731" ; "I731" ; "R731" ; "S732" ; "E732" ; "I732" ; "R732" ; "S711" ; "E711" ; "I711" ; "R711" ; "S712" ; "E712" ; "I712" ; "R712" ; "S831" ; "E831" ; "I831" ; "R831" ; "S832" ; "E832" ; "I832" ; "R832" ; "S811" ; "E811" ; "I811" ; "R811" ; "S812" ; "E812" ; "I812" ; "R812" ; "S911" ; "E911" ; "I911" ; "R911" ")
  ]

  file-close

  ; The totalspilloveranimalhumaninfections need to set to 0
  ask municipalities [set totalspilloveranimalhumaninfections 0]
;  set newtotalinfected sum [totalinfected] of municipalities
;  set newtotalhospitalized sum [totalhospitalized] of municipalities

  tick

  ; calculate R0
  if (ticks > Day-COVID-19-Outbreak + 3) [R0]
  set reproductionnumbernew reproductionnumber

  ; calculate R0 7 day average
  if ticks > (Day-COVID-19-Outbreak + 3) [R0-7-days]

  ; calculate differences in infected and hospitalized each day
  set newtotalinfected sum [totalinfected] of municipalities
  set newtotalhospitalized sum [totalhospitalized] of municipalities
  set differenceinfected newtotalinfected - oldtotalinfected
  set differencehospitalized newtotalhospitalized - oldtotalhospitalized
  if (Scenario ="Age_Scenario") [age-tests-hospitalized-infected]

  ; calculate average commuters and travellers each 7 days
  if ticks > Day-COVID-19-Outbreak + 2 [commuters-travellers-average-7-days]

end

to commuters-travellers-average-7-days
  ; This model calculates the commuting and travelling once every 7 days, this creates the average of commuting and travelling in a week
  set schoolcommuter-new-infected lput schoolcommuterstotalNL schoolcommuter-new-infected
  if length schoolcommuter-new-infected > 7 [set schoolcommuter-new-infected but-first schoolcommuter-new-infected]
  if length schoolcommuter-new-infected = 7 [set schoolcommuter-new-infected-over-7-days (sum schoolcommuter-new-infected) / 7]
  set schoolcommuterstotalNL 0

  set jobcommuter-new-infected lput jobcommuterstotalNL jobcommuter-new-infected
  if length jobcommuter-new-infected > 7 [set jobcommuter-new-infected but-first jobcommuter-new-infected]
  if length schoolcommuter-new-infected = 7 [set jobcommuter-new-infected-over-7-days (sum jobcommuter-new-infected) / 7]
  set jobcommuterstotalNL 0

  set GAET-new-infected lput GAETtotal GAET-new-infected
  if length GAET-new-infected > 7 [set GAET-new-infected but-first GAET-new-infected]
  if length schoolcommuter-new-infected = 7 [set GAET-new-infected-over-7-days (sum GAET-new-infected) / 7]
  set GAETtotal 0

  set VT-new-infected lput VTtotal VT-new-infected
  if length VT-new-infected > 7 [set VT-new-infected but-first VT-new-infected]
  if length schoolcommuter-new-infected = 7 [set VT-new-infected-over-7-days (sum VT-new-infected) / 7]
  set VTtotal 0
end

to positivetestcalculation
   ; positive test per 100 000 inhabitants per week
   ; positive test per 100.000 inhabitants calculated by: (number of infected * (1 - ratio asymptomic people) / total population * week) * 100.000 * (1 - ratio asymptomic people)
  set positivetestscalc ((differenceinfected * 7 * 0.8) / sum [totalpopulation] of municipalities) * 100000
end
@#$#@#$#@
GRAPHICS-WINDOW
462
10
1071
702
-1
-1
20.72414
1
10
1
1
1
0
0
0
1
-14
14
-16
16
0
0
1
ticks
30.0

BUTTON
249
26
312
59
NIL
setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
380
26
443
59
go
go\nif ticks >= 550 [ stop ]
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

PLOT
1131
15
1517
165
Total infected in whole population
Time (days)
Infected
0.0
50.0
0.0
100.0
true
true
"" ""
PENS
"Nr. infected" 1.0 0 -2674135 true "" "plot newtotalinfected"

SWITCH
248
458
448
491
School-Commuting-Holiday?
School-Commuting-Holiday?
1
1
-1000

SLIDER
249
158
442
191
Commuter-Threshold
Commuter-Threshold
1
100
4.0
1
1
NIL
HORIZONTAL

SLIDER
250
71
443
104
Duration-of-Immunity
Duration-of-Immunity
0.1
4
0.1
0.1
1
Year
HORIZONTAL

SLIDER
250
111
443
144
Duration-of-Infectivity
Duration-of-Infectivity
5
30
6.0
1
1
Days
HORIZONTAL

SLIDER
248
196
442
229
Schoolcommuter-Threshold
Schoolcommuter-Threshold
1
100
6.0
1
1
NIL
HORIZONTAL

TEXTBOX
251
374
448
417
In summer holiday no school commuting and less job commuting? Switch holiday on: (Not used in thesis)
11
0.0
1

CHOOSER
9
251
101
296
Source_1
Source_1
"None" "Cuijk" "Tilburg" "Utrecht0gemeente" "Amsterdam" "Rotterdam" "s0Gravenhage0gemeente" "Groningen0gemeente"
2

SWITCH
9
420
227
453
Overall-Job-Commuting?
Overall-Job-Commuting?
1
1
-1000

SWITCH
9
457
227
490
Overall-School-Commuting?
Overall-School-Commuting?
1
1
-1000

TEXTBOX
11
386
161
414
Switch on to start commuting & travelling:
11
0.0
1

CHOOSER
9
185
231
230
Immunity-Startpopulation
Immunity-Startpopulation
"StartPopulationHighestR90TrMr.shp" "StartPopulationHighR70TrMr.shp" "StartPopulationFullySTrMr.shp" "StartPopulationChilderenR50.shp" "StartPopulationChildrenR90.shp"
0

CHOOSER
252
690
458
735
Infection-Rate-WithinMuni-Summer
Infection-Rate-WithinMuni-Summer
"Transmission0.020.txt" "Transmission0.029.txt" "Transmission0.040.txt" "Transmission0.050.txt" "Transmission0.067.txt" "Transmission0.100.txt" "Transmission0.200.txt" "Transmission0.400.txt" "Transmission0.600.txt" "Transmission0.800.txt" "Transmission1.000.txt" "Transmission1.400.txt" "Transmission2.000.txt"
0

CHOOSER
15
688
219
733
Infection-Rate-WithinMuni-SpringAutumn
Infection-Rate-WithinMuni-SpringAutumn
"Transmission0.020.txt" "Transmission0.029.txt" "Transmission0.040.txt" "Transmission0.050.txt" "Transmission0.067.txt" "Transmission0.100.txt" "Transmission0.200.txt" "Transmission0.400.txt" "Transmission0.600.txt" "Transmission0.800.txt" "Transmission1.000.txt" "Transmission1.400.txt" "Transmission2.000.txt"
12

CHOOSER
214
576
419
621
Infection-Rate-WithinMuni-Winter
Infection-Rate-WithinMuni-Winter
"Transmission0.020.txt" "Transmission0.029.txt" "Transmission0.040.txt" "Transmission0.050.txt" "Transmission0.067.txt" "Transmission0.100.txt" "Transmission0.200.txt" "Transmission0.400.txt" "Transmission0.600.txt" "Transmission0.800.txt" "Transmission1.000.txt" "Transmission1.400.txt" "Transmission2.000.txt"
12

CHOOSER
252
740
458
785
Infection-Rate-AmongMuni-Summer
Infection-Rate-AmongMuni-Summer
"CommuterTransmission0.020.txt" "CommuterTransmission0.029.txt" "CommuterTransmission0.040.txt" "CommuterTransmission0.050.txt" "CommuterTransmission0.067.txt" "CommuterTransmission0.100.txt" "CommuterTransmission0.200.txt" "CommuterTransmission0.400.txt" "CommuterTransmission0.600.txt" "CommuterTransmission0.800.txt" "CommuterTransmission1.000.txt" "CommuterTransmission1.400.txt" "CommuterTransmission2.000.txt"
3

CHOOSER
15
737
219
782
Infection-Rate-AmongMuni-SpringAutumn
Infection-Rate-AmongMuni-SpringAutumn
"CommuterTransmission0.020.txt" "CommuterTransmission0.029.txt" "CommuterTransmission0.040.txt" "CommuterTransmission0.050.txt" "CommuterTransmission0.067.txt" "CommuterTransmission0.100.txt" "CommuterTransmission0.200.txt" "CommuterTransmission0.400.txt" "CommuterTransmission0.600.txt" "CommuterTransmission0.800.txt" "CommuterTransmission1.000.txt" "CommuterTransmission1.400.txt" "CommuterTransmission2.000.txt"
12

CHOOSER
214
624
420
669
Infection-Rate-AmongMuni-Winter
Infection-Rate-AmongMuni-Winter
"CommuterTransmission0.020.txt" "CommuterTransmission0.029.txt" "CommuterTransmission0.040.txt" "CommuterTransmission0.050.txt" "CommuterTransmission0.067.txt" "CommuterTransmission0.100.txt" "CommuterTransmission0.200.txt" "CommuterTransmission0.400.txt" "CommuterTransmission0.600.txt" "CommuterTransmission0.800.txt" "CommuterTransmission1.000.txt" "CommuterTransmission1.400.txt" "CommuterTransmission2.000.txt"
12

TEXTBOX
18
578
198
662
Infection rates should be set to the same number for within municipalities and among municipalities in the same seasons. Only used for Original pertussis model and COVID-19 history model without lockdown
11
0.0
1

PLOT
1529
15
1964
165
Fractions SIR whole population
Time (days)
Fraction
0.0
10.0
0.0
1.0
true
true
"" ""
PENS
"Fraction Susceptible" 1.0 0 -14070903 true "" "plot (sum [fractionsusceptible] of municipalities) / 396"
"Fraction Infected" 1.0 0 -2674135 true "" "plot (sum [fractioninfected] of municipalities) / 396"
"Fraction Recovered" 1.0 0 -13840069 true "" "plot (sum [fractionrecovered] of municipalities) / 396"
"Fraction Exposed" 1.0 0 -1184463 true "" "plot (sum [fractionexposed] of municipalities) / 396"

SWITCH
248
420
447
453
Job-Commuting-Holiday?
Job-Commuting-Holiday?
1
1
-1000

TEXTBOX
12
82
241
180
Sets the percentage immunity before the start (go procedure) of the model. Simulates a one time vaccination intervention. Municipal vaccinationrates are taken into account.\n\nFor the COVID-19 thesis select: \"StartPopulationFullySTrMr.shp\"
11
0.0
1

PLOT
1129
360
1518
549
Hospitalization
Time (days)
patients
0.0
50.0
0.0
1.0
true
true
"" ""
PENS
"Nr. hospitalized" 1.0 0 -16777216 true "" "plot sum [totalhospitalized] of municipalities"
"0-4 years" 1.0 0 -5825686 true "" "plot sum [hospitalized05] of municipalities"
"5-11 years" 1.0 0 -2064490 true "" "plot sum [hospitalized512] of municipalities"
"12-16 years" 1.0 0 -2674135 true "" "plot sum [hospitalized1217] of municipalities"
"17-24 years" 1.0 0 -955883 true "" "plot sum [hospitalized1725] of municipalities"
"25-34 years" 1.0 0 -6459832 true "" "plot sum [hospitalized2535] of municipalities"
"35-49 years" 1.0 0 -1184463 true "" "plot sum [hospitalized3550] of municipalities"
"50-64 years" 1.0 0 -13345367 true "" "plot sum [hospitalized5065] of municipalities"
"65-79 years" 1.0 0 -11221820 true "" "plot sum [hospitalized6580] of municipalities"
"80+ years" 1.0 0 -14835848 true "" "plot sum [hospitalized80plus] of municipalities"

CHOOSER
9
30
238
75
Scenario
Scenario
"Original_Pertussis_Model" "COVID19_History_No_Lockdown" "COVID19_History_Lockdown" "Road_Map_Scenario" "Economic_Scenario" "Age_Scenario"
3

MONITOR
625
722
733
767
Total Infected
newtotalinfected
0
1
11

MONITOR
740
722
850
767
Total Hospital
newtotalhospitalized\n;sum [totalhospitalized] of municipalities
0
1
11

SWITCH
9
532
227
565
Overall-Visit-Travelling?
Overall-Visit-Travelling?
1
1
-1000

SWITCH
247
533
449
566
Extra-Visit-Travelling-Holiday?
Extra-Visit-Travelling-Holiday?
1
1
-1000

SLIDER
248
235
443
268
Travelling-Threshold
Travelling-Threshold
1
100
8.0
1
1
NIL
HORIZONTAL

TEXTBOX
13
10
163
28
Select here the scenario
11
0.0
1

MONITOR
568
720
618
765
Week
(ticks / 7)
0
1
11

TEXTBOX
118
497
268
515
NIL
11
0.0
1

MONITOR
856
771
952
816
Positive tests (day)
newtotalinfected * 0.80 / Duration-of-Infectivity\n; 20% is asymptomic and does not take a test. \n; Around 10.5% of tests taken are positive \n; based on 2020
0
1
11

PLOT
1130
173
1517
351
Age infected whole population
Time (days)
Infected
0.0
50.0
0.0
100.0
true
true
"" ""
PENS
"0-4 years" 1.0 0 -5825686 true "" "plot sum [suminfected05] of municipalities"
"5-11 years" 1.0 0 -2064490 true "" "plot sum [suminfected512] of municipalities"
"12-16 years" 1.0 0 -2674135 true "" "plot sum [suminfected1217] of municipalities"
"17-24 years" 1.0 0 -955883 true "" "plot sum [suminfected1725] of municipalities"
"25-34 years" 1.0 0 -6459832 true "" "plot sum [suminfected2535] of municipalities"
"35-49 years" 1.0 0 -16514302 true "" "plot sum [suminfected3550] of municipalities"
"50-64 years" 1.0 0 -13345367 true "" "plot sum [suminfected5065] of municipalities"
"65-80 years" 1.0 0 -11221820 true "" "plot sum [suminfected6580] of municipalities"
"80+ years" 1.0 0 -14835848 true "" "plot sum [suminfected80plus] of municipalities"

MONITOR
856
723
952
768
Nr. of tests (day)
newtotalinfected * 0.80 / Duration-of-Infectivity / 10.5 * 100\n; 20% is asymptomic and does not take a test. \n; Around 10.5% of tests taken are positive \n; based on week 48 to 52 in 2020
0
1
11

MONITOR
626
771
733
816
Difference Infected
differenceinfected
0
1
11

SWITCH
9
495
227
528
Overall-Gatherings-Events-Travelling?
Overall-Gatherings-Events-Travelling?
1
1
-1000

SWITCH
247
495
449
528
Extra-Gathering-Events-Travelling-Holiday
Extra-Gathering-Events-Travelling-Holiday
1
1
-1000

PLOT
1528
172
1964
352
Fractions SIR only Utrecht
Time (days)
Fraction
0.0
50.0
0.0
1.0
true
true
"" ""
PENS
"Fraction Susceptible" 1.0 0 -13345367 true "" "plot [fractionsusceptible] of municipality 357"
"Fraction Infected" 1.0 0 -2674135 true "" "plot [fractioninfected] of municipality 357"
"Fraction Recovered" 1.0 0 -10899396 true "" "plot [fractionrecovered] of municipality 357"
"Fraction Exposed" 1.0 0 -1184463 true "" "plot [fractionexposed] of municipality 357"

PLOT
1529
357
1961
550
Reproduction number
NIL
NIL
4.0
0.0
4.0
3.0
true
true
"" ""
PENS
"R0" 1.0 0 -16777216 true "" "plot reproductionnumber"

PLOT
1528
557
1961
734
Commuting and Travelling (in %)
NIL
NIL
0.0
100.0
0.0
100.0
true
true
"" ""
PENS
"Job commuting" 1.0 0 -10899396 true "" "plot decimaljobcom * 100"
"School commuting" 1.0 0 -6759204 true "" "plot decimalschoolcom * 100"
"VT" 1.0 0 -5825686 true "" "plot decimalVTcalc * 100"
"GAET" 1.0 0 -13345367 true "" "plot decimalGAETcalc * 100"

PLOT
1132
556
1521
734
(Not Working) Number of infected commuting and travelling
NIL
NIL
0.0
10.0
0.0
10.0
true
true
"" ""
PENS
"Job commuting" 1.0 0 -10899396 true "" "plot jobcommuter-new-infected-over-7-days"
"School commuting" 1.0 0 -6759204 true "" "plot schoolcommuter-new-infected-over-7-days"
"VT" 1.0 0 -5825686 true "" "plot VT-new-infected-over-7-days"
"GAET" 1.0 0 -13345367 true "" "plot GAET-new-infected-over-7-days"

TEXTBOX
253
272
454
314
Number of infected in thesis: 25. Day outbreak: 21 (with 55 not effect wanted)
11
0.0
1

TEXTBOX
11
235
216
253
Introducing infected in:
11
0.0
1

SLIDER
248
338
446
371
Day-COVID-19-Outbreak
Day-COVID-19-Outbreak
1
100
41.0
1
1
NIL
HORIZONTAL

MONITOR
740
771
850
816
Difference Hospitalized
differencehospitalizedfixed
0
1
11

PLOT
1967
356
2350
551
Reproduction number 7 day average
NIL
NIL
0.0
3.0
0.0
3.0
true
true
"" ""
PENS
"R0" 1.0 0 -16777216 true "" "plot R0-over-7-days"

CHOOSER
9
297
101
342
Source_2
Source_2
"None" "Cuijk" "Tilburg" "Utrecht0gemeente" "Amsterdam" "Rotterdam" "s0Gravenhage0gemeente" "Groningen0gemeente"
4

CHOOSER
9
343
101
388
Source_3
Source_3
"None" "Cuijk" "Tilburg" "Utrecht0gemeente" "Amsterdam" "Rotterdam" "s0Gravenhage0gemeente" "Groningen0gemeente" "Diemen"
8

SLIDER
101
257
231
290
Source_1_infections
Source_1_infections
0
50
0.0
1
1
NIL
HORIZONTAL

SLIDER
101
303
231
336
Source_2_infections
Source_2_infections
0
20
0.0
1
1
NIL
HORIZONTAL

SLIDER
101
350
231
383
Source_3_infections
Source_3_infections
0
20
0.0
1
1
NIL
HORIZONTAL

BUTTON
314
26
377
59
Output
if ticks >= 511 [\n\nset ij (word substring date-and-time 0 2 substring date-and-time 3 5)\nif substring ij 0 2 = \"10\" [stop]\nexport-plot \"Total infected in whole population\" ( word \"Total infected in whole population _ \" ij \".csv\" )\nexport-plot \"Age infected whole population\" ( word \"Age infected whole population _ \" ij \".csv\" )\nexport-plot \"Hospitalization\" ( word \"Hospitalization _ \" ij \".csv\" )\nexport-plot \"Reproduction number 7 day average\" ( word \"Reproduction number 7 day average _ \" ij \".csv\" )\nexport-plot \"Commuting and Travelling (in %)\" ( word \"Commuting and Travelling (in %) _ \" ij \".csv\" )\nexport-plot \"(Not Working) Number of infected commuting and travelling\" ( word \"(Not Working) Number of infected commuting and travelling _ \" ij \".csv\" )\n\nreset-ticks\nclear-all-plots\nsetup\n\n;export-plot \"Age infected whole population\" ( word \"Age infected whole population _ 5.csv\" )\n;export-plot \"Hospitalization\" ( word \"Hospitalization _ 5.csv\" )\n;export-plot \"Reproduction number 7 day average\" ( word \"Reproduction number 7 day average _ 5.csv\" )\n;export-plot \"Commuting and Travelling (in %)\" ( word \"Commuting and Travelling (in %) _ 5.csv\" )\n;export-plot \"(Not Working) Number of infected commuting and travelling\" ( word \"(Not Working) Number of infected commuting and travelling _ 5.csv\" )\n;stop\n\n]\n\ngo\n\n;if ij >= 50 [ stop ]\nif ticks >= 510 [ stop ]
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SLIDER
248
304
446
337
Frequency
Frequency
0
30
0.0
1
1
NIL
HORIZONTAL

PLOT
1133
748
1532
903
plot 1
NIL
NIL
0.0
10.0
0.0
5.0
true
false
"" ""
PENS
"default" 1.0 0 -16777216 true "" "\nif positivetestscalc < 50 or differencehospitalizedfixed < 40 [ set risk_level 1 ] \n  ;Concern level\nif positivetestscalc >= 50 and positivetests < 150 and differencehospitalizedfixed < 40 [ set risk_level 2]\n  ;Serious level\nif positivetestscalc >= 150 and positivetests < 250 or differencehospitalizedfixed >= 40 and differencehospitalizedfixed < 80 [ set risk_level 3 ] \n  ;Severe level\nif positivetestscalc >= 250 or differencehospitalizedfixed >= 80 and differencehospitalizedfixed < 100 [ set risk_level 4 ]\n  ;Lockdown level\nif positivetestscalc >= 350 or differencehospitalizedfixed >= 100 [ set risk_level 5 ]\n  \nplot risk_level"

CHOOSER
16
796
154
841
spillover-group
spillover-group
"all" "farmers"
0

@#$#@#$#@
## CONTACT?

If you have any questions about the corona model Spring 2021 version, please contact me on my personal email: *mail.astridherwig@gmail.com*

## WHAT IS IT?

The main goal of this model is to evaluate the impact of the governmental risk perception and coping appraisal on the predicted number of disease cases for COVID-19 in the Netherlands with a COVID-19 Netlogo model. An agent-based COVID-19 model will be used to test newly available data. This thesis aims to give insight into COVID-19 through the year 2020 by looking at the effect of government decisions in different scenarios on the number of infected individuals, the reproduction number, the hospitalizations and the virus diffusion. 

## HOW IT WORKS
There are five scenario options (of which three are actual scenarios:
- Original pertussis model by Tjalma (2016): this is the original model meant to 
calculate the pertussis cases
- COVID-19 History: This is the part of the model used to simulate the COVID-19 outbreak 
in 2020 and base the callibration of the scenarios on.
- Road map scenario: This scenario follows the Road map (routekaart) of december 2020 published by the RIVM (Rijksinstituut voor Volksgezondheid en Milieu)
- Economic scenario: This scenario is based on the authors knowledge of the  effect of the COVID-19 measures on the economy and the number of infected. The measures are chosen based on the lowest impact they have on the economy. A textfile in the folder (EconomicScore.txt) imports the scores of each scenario. 
- Age scenario: For the age scenario the impact of the measures on the different age groups in this model was observed. When an age group has a high number of cases the measures are chosen which affect the age group the most. This is hardcoded.

## SETTINGS INTERFACE
Other settings
["Introduce-Infection-In" "Tilburg"]
["Immunity-Startpopulation" "StartPopulationFullySTrMr.shp"] (whole population is used)
["Day-COVID-19-Outbreak" 32]
["Infection_Ratio" 1]
["Number-Infectives-Introduced" 25]

Lockdown
["Covid-19-History-Lockdown?" true]

Thresholds
["Travelling-Threshold" 1]
["Commuter-Threshold" 1]
["Schoolcommuter-Threshold" 1]

Duration
["Duration-of-Immunity" 1] (1 year)
["Duration-of-Infectivity" 6] (6 days)

Commuting & Travelling
["Overall-School-Commuting?" true]
["Overall-Job-Commuting?" true]
["Overall-Visit-Travelling?" true]
["Overall-Gatherings-Events-Travelling?" true]

Holiday (turned of for thesis)
["School-Commuting-Holiday?" false]
["Job-Commuting-Holiday?" false]
["Extra-Gathering-Events-Travelling-Holiday" false]
["Extra-Visit-Travelling-Holiday?" false]

Transmission
["Infection-Rate-WithinMuni-SpringAutumn" "Transmission1.400.txt"]
["Infection-Rate-WithinMuni-Winter" "Transmission2.000.txt"]
["Infection-Rate-WithinMuni-Summer" "Transmission1.000.txt"]

Commuter transmission
["Infection-Rate-AmongMuni-SpringAutumn" "CommuterTransmission1.400.txt"]
["Infection-Rate-AmongMuni-Summer" "CommuterTransmission1.000.txt"]
["Infection-Rate-AmongMuni-Winter" "CommuterTransmission2.000.txt"]


## THINGS TO NOTICE

- Spread of the virus
- The number of infected (Is too high)

## THINGS TO TRY

- If new knowledge about COVID-19 (e.g. duration of immunity or infectivity) is available, try to implement it in the model

## EXTENDING THE MODEL

- The Age scenario is hardcoded and by implementing a textfile (like the economic scenario) it would be easier to make changes. 
- Vaccination can be added, this was already in the pertussis model so there is a part already coded
- Callibration with new/updated COVID-19 data


## CREDITS AND REFERENCES
Original Pertussis model: 
Tjalma, S. (2016). An agent-based model to compare vaccination strategies for pertussis in the Netherlands (p. 97) [Thesis GIMA]. Twente University. https://dspace.library.uu.nl/handle/1874/340415
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cross
false
0
Rectangle -7500403 true true 120 60 180 240
Rectangle -7500403 true true 60 120 240 180

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.4.0
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
<experiments>
  <experiment name="experiment" repetitions="3" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <exitCondition>if ticks 370</exitCondition>
    <metric>ticks</metric>
    <enumeratedValueSet variable="Infection-Rate-WithinMuni-Summer">
      <value value="&quot;Transmission0.600.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Extra-Gathering-Events-Travelling-Holiday">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Schoolcommuter-Threshold">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-School-Commuting?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Travelling-Threshold">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Scenario">
      <value value="&quot;COVID19_History&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Commuter-Threshold">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-AmongMuni-SpringAutumn">
      <value value="&quot;CommuterTransmission1.000.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-Job-Commuting?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-Visit-Travelling?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-AmongMuni-Winter">
      <value value="&quot;CommuterTransmission2.000.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Duration-of-Immunity">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="School-Commuting-Holiday?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Introduce-Infection-In">
      <value value="&quot;Tilburg&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Immunity-Startpopulation">
      <value value="&quot;StartPopulationFullySTrMr.shp&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Job-Commuting-Holiday?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Duration-of-Infectivity">
      <value value="9"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-AmongMuni-Summer">
      <value value="&quot;CommuterTransmission0.600.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-WithinMuni-SpringAutumn">
      <value value="&quot;Transmission1.000.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-Gatherings-Events-Travelling?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-WithinMuni-Winter">
      <value value="&quot;Transmission2.000.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Number-Infectives-Introduced">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Extra-Visit-Travelling-Holiday?">
      <value value="false"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="experiment 2" repetitions="50" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>go</go>
    <exitCondition>ticks = 370</exitCondition>
    <metric>ticks</metric>
    <metric>newtotalinfected</metric>
    <metric>reproductionnumber</metric>
    <metric>newtotalhospitalized</metric>
    <enumeratedValueSet variable="Infection-Rate-WithinMuni-Summer">
      <value value="&quot;Transmission0.600.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Extra-Gathering-Events-Travelling-Holiday">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Schoolcommuter-Threshold">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-School-Commuting?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Scenario">
      <value value="&quot;COVID19_History&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Travelling-Threshold">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Commuter-Threshold">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-AmongMuni-SpringAutumn">
      <value value="&quot;CommuterTransmission1.000.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-Job-Commuting?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-Visit-Travelling?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-AmongMuni-Winter">
      <value value="&quot;CommuterTransmission2.000.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Duration-of-Immunity">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="School-Commuting-Holiday?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Introduce-Infection-In">
      <value value="&quot;Tilburg&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Immunity-Startpopulation">
      <value value="&quot;StartPopulationFullySTrMr.shp&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Job-Commuting-Holiday?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Duration-of-Infectivity">
      <value value="9"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-AmongMuni-Summer">
      <value value="&quot;CommuterTransmission0.600.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-WithinMuni-SpringAutumn">
      <value value="&quot;Transmission1.000.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-Gatherings-Events-Travelling?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-WithinMuni-Winter">
      <value value="&quot;Transmission2.000.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Number-Infectives-Introduced">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Extra-Visit-Travelling-Holiday?">
      <value value="false"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="experiment sensitivity 0.020" repetitions="25" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>go</go>
    <exitCondition>ticks = 370</exitCondition>
    <metric>ticks</metric>
    <metric>newtotalinfected</metric>
    <metric>reproductionnumber</metric>
    <metric>newtotalhospitalized</metric>
    <metric>(sum [fractionsusceptible] of municipalities) / 396</metric>
    <metric>(sum [fractionexposed] of municipalities) / 396</metric>
    <metric>(sum [fractioninfected] of municipalities) / 396</metric>
    <metric>(sum [fractionrecovered] of municipalities) / 396</metric>
    <enumeratedValueSet variable="Scenario">
      <value value="&quot;COVID19_History&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Immunity-Startpopulation">
      <value value="&quot;StartPopulationFullySTrMr.shp&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Introduce-Infection-In">
      <value value="&quot;Tilburg&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Duration-of-Infectivity">
      <value value="9"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Number-Infectives-Introduced">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-WithinMuni-Winter">
      <value value="&quot;Transmission0.020.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-AmongMuni-Winter">
      <value value="&quot;CommuterTransmission0.020.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-WithinMuni-SpringAutumn">
      <value value="&quot;Transmission0.020.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-AmongMuni-SpringAutumn">
      <value value="&quot;CommuterTransmission0.020.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-WithinMuni-Summer">
      <value value="&quot;Transmission0.020.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-AmongMuni-Summer">
      <value value="&quot;CommuterTransmission0.020.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-Job-Commuting?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-School-Commuting?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-Gatherings-Events-Travelling?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-Visit-Travelling?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Commuter-Threshold">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Schoolcommuter-Threshold">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Travelling-Threshold">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Duration-of-Immunity">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-History-Lockdown?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-Age-groups-restrictions-0-25?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-Age-groups-restrictions-25-65?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-Age-groups-restrictions-65plus?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Job-Commuting-Holiday?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="School-Commuting-Holiday?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Extra-Gathering-Events-Travelling-Holiday">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Extra-Visit-Travelling-Holiday?">
      <value value="false"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="experiment sensitivity 0.200" repetitions="25" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>go</go>
    <exitCondition>ticks = 370</exitCondition>
    <metric>ticks</metric>
    <metric>newtotalinfected</metric>
    <metric>reproductionnumber</metric>
    <metric>newtotalhospitalized</metric>
    <metric>(sum [fractionsusceptible] of municipalities) / 396</metric>
    <metric>(sum [fractionexposed] of municipalities) / 396</metric>
    <metric>(sum [fractioninfected] of municipalities) / 396</metric>
    <metric>(sum [fractionrecovered] of municipalities) / 396</metric>
    <enumeratedValueSet variable="Scenario">
      <value value="&quot;COVID19_History&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Immunity-Startpopulation">
      <value value="&quot;StartPopulationFullySTrMr.shp&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Introduce-Infection-In">
      <value value="&quot;Tilburg&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Duration-of-Infectivity">
      <value value="9"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Number-Infectives-Introduced">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-WithinMuni-Winter">
      <value value="&quot;Transmission0.200.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-AmongMuni-Winter">
      <value value="&quot;CommuterTransmission0.200.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-WithinMuni-SpringAutumn">
      <value value="&quot;Transmission0.200.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-AmongMuni-SpringAutumn">
      <value value="&quot;CommuterTransmission0.200.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-WithinMuni-Summer">
      <value value="&quot;Transmission0.200.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-AmongMuni-Summer">
      <value value="&quot;CommuterTransmission0.200.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-Job-Commuting?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-School-Commuting?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-Gatherings-Events-Travelling?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-Visit-Travelling?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Commuter-Threshold">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Schoolcommuter-Threshold">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Travelling-Threshold">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Duration-of-Immunity">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-History-Lockdown?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-Age-groups-restrictions-0-25?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-Age-groups-restrictions-25-65?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-Age-groups-restrictions-65plus?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Job-Commuting-Holiday?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="School-Commuting-Holiday?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Extra-Gathering-Events-Travelling-Holiday">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Extra-Visit-Travelling-Holiday?">
      <value value="false"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="experiment sensitivity 2.000" repetitions="25" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>go</go>
    <exitCondition>ticks = 370</exitCondition>
    <metric>ticks</metric>
    <metric>newtotalinfected</metric>
    <metric>reproductionnumber</metric>
    <metric>newtotalhospitalized</metric>
    <metric>(sum [fractionsusceptible] of municipalities) / 396</metric>
    <metric>(sum [fractionexposed] of municipalities) / 396</metric>
    <metric>(sum [fractioninfected] of municipalities) / 396</metric>
    <metric>(sum [fractionrecovered] of municipalities) / 396</metric>
    <enumeratedValueSet variable="Scenario">
      <value value="&quot;COVID19_History&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Immunity-Startpopulation">
      <value value="&quot;StartPopulationFullySTrMr.shp&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Introduce-Infection-In">
      <value value="&quot;Tilburg&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Duration-of-Infectivity">
      <value value="9"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Number-Infectives-Introduced">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-WithinMuni-Winter">
      <value value="&quot;Transmission2.000.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-AmongMuni-Winter">
      <value value="&quot;CommuterTransmission2.000.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-WithinMuni-SpringAutumn">
      <value value="&quot;Transmission2.000.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-AmongMuni-SpringAutumn">
      <value value="&quot;CommuterTransmission2.000.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-WithinMuni-Summer">
      <value value="&quot;Transmission2.000.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-AmongMuni-Summer">
      <value value="&quot;CommuterTransmission2.000.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-Job-Commuting?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-School-Commuting?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-Gatherings-Events-Travelling?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-Visit-Travelling?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Commuter-Threshold">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Schoolcommuter-Threshold">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Travelling-Threshold">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Duration-of-Immunity">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-History-Lockdown?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-Age-groups-restrictions-0-25?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-Age-groups-restrictions-25-65?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-Age-groups-restrictions-65plus?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Job-Commuting-Holiday?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="School-Commuting-Holiday?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Extra-Gathering-Events-Travelling-Holiday">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Extra-Visit-Travelling-Holiday?">
      <value value="false"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="experiment sensitivity 1.000" repetitions="25" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>go</go>
    <exitCondition>ticks = 370</exitCondition>
    <metric>ticks</metric>
    <metric>newtotalinfected</metric>
    <metric>reproductionnumber</metric>
    <metric>newtotalhospitalized</metric>
    <metric>(sum [fractionsusceptible] of municipalities) / 396</metric>
    <metric>(sum [fractionexposed] of municipalities) / 396</metric>
    <metric>(sum [fractioninfected] of municipalities) / 396</metric>
    <metric>(sum [fractionrecovered] of municipalities) / 396</metric>
    <enumeratedValueSet variable="Scenario">
      <value value="&quot;COVID19_History&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Immunity-Startpopulation">
      <value value="&quot;StartPopulationFullySTrMr.shp&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Introduce-Infection-In">
      <value value="&quot;Tilburg&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Duration-of-Infectivity">
      <value value="9"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Number-Infectives-Introduced">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-WithinMuni-Winter">
      <value value="&quot;Transmission1.000.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-AmongMuni-Winter">
      <value value="&quot;CommuterTransmission1.000.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-WithinMuni-SpringAutumn">
      <value value="&quot;Transmission1.000.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-AmongMuni-SpringAutumn">
      <value value="&quot;CommuterTransmission1.000.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-WithinMuni-Summer">
      <value value="&quot;Transmission1.000.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-AmongMuni-Summer">
      <value value="&quot;CommuterTransmission1.000.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-Job-Commuting?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-School-Commuting?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-Gatherings-Events-Travelling?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-Visit-Travelling?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Commuter-Threshold">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Schoolcommuter-Threshold">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Travelling-Threshold">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Duration-of-Immunity">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-History-Lockdown?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-Age-groups-restrictions-0-25?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-Age-groups-restrictions-25-65?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-Age-groups-restrictions-65plus?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Job-Commuting-Holiday?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="School-Commuting-Holiday?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Extra-Gathering-Events-Travelling-Holiday">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Extra-Visit-Travelling-Holiday?">
      <value value="false"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="experiment sensitivity 1.400" repetitions="25" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>go</go>
    <exitCondition>ticks = 370</exitCondition>
    <metric>ticks</metric>
    <metric>newtotalinfected</metric>
    <metric>reproductionnumber</metric>
    <metric>newtotalhospitalized</metric>
    <metric>(sum [fractionsusceptible] of municipalities) / 396</metric>
    <metric>(sum [fractionexposed] of municipalities) / 396</metric>
    <metric>(sum [fractioninfected] of municipalities) / 396</metric>
    <metric>(sum [fractionrecovered] of municipalities) / 396</metric>
    <enumeratedValueSet variable="Scenario">
      <value value="&quot;COVID19_History&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Immunity-Startpopulation">
      <value value="&quot;StartPopulationFullySTrMr.shp&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Introduce-Infection-In">
      <value value="&quot;Tilburg&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Duration-of-Infectivity">
      <value value="9"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Number-Infectives-Introduced">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-WithinMuni-Winter">
      <value value="&quot;Transmission1.400.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-AmongMuni-Winter">
      <value value="&quot;CommuterTransmission1.400.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-WithinMuni-SpringAutumn">
      <value value="&quot;Transmission1.400.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-AmongMuni-SpringAutumn">
      <value value="&quot;CommuterTransmission1.400.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-WithinMuni-Summer">
      <value value="&quot;Transmission1.400.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-AmongMuni-Summer">
      <value value="&quot;CommuterTransmission1.400.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-Job-Commuting?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-School-Commuting?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-Gatherings-Events-Travelling?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-Visit-Travelling?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Commuter-Threshold">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Schoolcommuter-Threshold">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Travelling-Threshold">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Duration-of-Immunity">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-History-Lockdown?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-Age-groups-restrictions-0-25?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-Age-groups-restrictions-25-65?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-Age-groups-restrictions-65plus?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Job-Commuting-Holiday?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="School-Commuting-Holiday?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Extra-Gathering-Events-Travelling-Holiday">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Extra-Visit-Travelling-Holiday?">
      <value value="false"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="experiment sensitivity 0.600" repetitions="8" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>go</go>
    <exitCondition>ticks = 370</exitCondition>
    <metric>ticks</metric>
    <metric>newtotalinfected</metric>
    <metric>reproductionnumber</metric>
    <metric>newtotalhospitalized</metric>
    <metric>(sum [fractionsusceptible] of municipalities) / 396</metric>
    <metric>(sum [fractionexposed] of municipalities) / 396</metric>
    <metric>(sum [fractioninfected] of municipalities) / 396</metric>
    <metric>(sum [fractionrecovered] of municipalities) / 396</metric>
    <enumeratedValueSet variable="Scenario">
      <value value="&quot;COVID19_History&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Immunity-Startpopulation">
      <value value="&quot;StartPopulationFullySTrMr.shp&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Introduce-Infection-In">
      <value value="&quot;Tilburg&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Duration-of-Infectivity">
      <value value="9"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Number-Infectives-Introduced">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-WithinMuni-Winter">
      <value value="&quot;Transmission0.600.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-AmongMuni-Winter">
      <value value="&quot;CommuterTransmission0.600.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-WithinMuni-SpringAutumn">
      <value value="&quot;Transmission0.600.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-AmongMuni-SpringAutumn">
      <value value="&quot;CommuterTransmission0.600.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-WithinMuni-Summer">
      <value value="&quot;Transmission0.600.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-AmongMuni-Summer">
      <value value="&quot;CommuterTransmission0.600.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-Job-Commuting?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-School-Commuting?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-Gatherings-Events-Travelling?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-Visit-Travelling?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Commuter-Threshold">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Schoolcommuter-Threshold">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Travelling-Threshold">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Duration-of-Immunity">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-History-Lockdown?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-Age-groups-restrictions-0-25?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-Age-groups-restrictions-25-65?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-Age-groups-restrictions-65plus?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Job-Commuting-Holiday?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="School-Commuting-Holiday?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Extra-Gathering-Events-Travelling-Holiday">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Extra-Visit-Travelling-Holiday?">
      <value value="false"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="experiment calibration 2.0 0.8 0.4" repetitions="25" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>go</go>
    <exitCondition>ticks = 370</exitCondition>
    <metric>ticks</metric>
    <metric>newtotalinfected</metric>
    <metric>reproductionnumber</metric>
    <metric>newtotalhospitalized</metric>
    <metric>(sum [fractionsusceptible] of municipalities) / 396</metric>
    <metric>(sum [fractionexposed] of municipalities) / 396</metric>
    <metric>(sum [fractioninfected] of municipalities) / 396</metric>
    <metric>(sum [fractionrecovered] of municipalities) / 396</metric>
    <enumeratedValueSet variable="Scenario">
      <value value="&quot;COVID19_History&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Immunity-Startpopulation">
      <value value="&quot;StartPopulationFullySTrMr.shp&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Introduce-Infection-In">
      <value value="&quot;Tilburg&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Duration-of-Infectivity">
      <value value="9"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Number-Infectives-Introduced">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-WithinMuni-Winter">
      <value value="&quot;Transmission2.000.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-AmongMuni-Winter">
      <value value="&quot;CommuterTransmission2.000.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-WithinMuni-SpringAutumn">
      <value value="&quot;Transmission0.800.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-AmongMuni-SpringAutumn">
      <value value="&quot;CommuterTransmission0.800.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-WithinMuni-Summer">
      <value value="&quot;Transmission0.400.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-AmongMuni-Summer">
      <value value="&quot;CommuterTransmission0.400.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-Job-Commuting?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-School-Commuting?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-Gatherings-Events-Travelling?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-Visit-Travelling?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Commuter-Threshold">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Schoolcommuter-Threshold">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Travelling-Threshold">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Duration-of-Immunity">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-History-Lockdown?">
      <value value="false"/>
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-Age-groups-restrictions-0-25?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-Age-groups-restrictions-25-65?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-Age-groups-restrictions-65plus?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Job-Commuting-Holiday?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="School-Commuting-Holiday?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Extra-Gathering-Events-Travelling-Holiday">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Extra-Visit-Travelling-Holiday?">
      <value value="false"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="experiment sensitivity 2.000 test platform" repetitions="8" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>go</go>
    <exitCondition>ticks = 370</exitCondition>
    <metric>ticks</metric>
    <metric>newtotalinfected</metric>
    <metric>reproductionnumber</metric>
    <metric>newtotalhospitalized</metric>
    <metric>(sum [fractionsusceptible] of municipalities) / 396</metric>
    <metric>(sum [fractionexposed] of municipalities) / 396</metric>
    <metric>(sum [fractioninfected] of municipalities) / 396</metric>
    <metric>(sum [fractionrecovered] of municipalities) / 396</metric>
    <enumeratedValueSet variable="Scenario">
      <value value="&quot;COVID19_History&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Immunity-Startpopulation">
      <value value="&quot;StartPopulationFullySTrMr.shp&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Introduce-Infection-In">
      <value value="&quot;Tilburg&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Duration-of-Infectivity">
      <value value="9"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Number-Infectives-Introduced">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-WithinMuni-Winter">
      <value value="&quot;Transmission2.000.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-AmongMuni-Winter">
      <value value="&quot;CommuterTransmission2.000.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-WithinMuni-SpringAutumn">
      <value value="&quot;Transmission2.000.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-AmongMuni-SpringAutumn">
      <value value="&quot;CommuterTransmission2.000.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-WithinMuni-Summer">
      <value value="&quot;Transmission2.000.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-AmongMuni-Summer">
      <value value="&quot;CommuterTransmission2.000.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-Job-Commuting?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-School-Commuting?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-Gatherings-Events-Travelling?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-Visit-Travelling?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Commuter-Threshold">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Schoolcommuter-Threshold">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Travelling-Threshold">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Duration-of-Immunity">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-History-Lockdown?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-Age-groups-restrictions-0-25?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-Age-groups-restrictions-25-65?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-Age-groups-restrictions-65plus?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Job-Commuting-Holiday?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="School-Commuting-Holiday?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Extra-Gathering-Events-Travelling-Holiday">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Extra-Visit-Travelling-Holiday?">
      <value value="false"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="experiment (1)" repetitions="1" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>go</go>
    <metric>count turtles</metric>
    <enumeratedValueSet variable="Schoolcommuter-Threshold">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-Age-Groups-Restrictions-5-12?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-Age-Groups-Restrictions-12-17?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-School-Commuting?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-History-Lockdown?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Travelling-Threshold">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Commuter-Threshold">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-AmongMuni-SpringAutumn">
      <value value="&quot;CommuterTransmission1.000.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-AmongMuni-Winter">
      <value value="&quot;CommuterTransmission1.400.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Duration-of-Immunity">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-Age-Groups-Restrictions-65plus?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="thresholdjobcom">
      <value value="0.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Immunity-Startpopulation">
      <value value="&quot;StartPopulationFullySTrMr.shp&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-Age-groups-restrictions-25-35?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Job-Commuting-Holiday?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Duration-of-Infectivity">
      <value value="7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-AmongMuni-Summer">
      <value value="&quot;CommuterTransmission0.600.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-Age-Groups-Restrictions-0-5?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-Gatherings-Events-Travelling?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Day-COVID-19-Outbreak">
      <value value="21"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Number-Infectives-Introduced">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-WithinMuni-Winter">
      <value value="&quot;Transmission1.400.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Extra-Visit-Travelling-Holiday?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-WithinMuni-Summer">
      <value value="&quot;Transmission0.800.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Extra-Gathering-Events-Travelling-Holiday">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-Age-Groups-Restrictions-17-25?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Scenario">
      <value value="&quot;COVID19_History&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-Age-Groups-Restrictions-35-50?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-Job-Commuting?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-Visit-Travelling?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="School-Commuting-Holiday?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Introduce-Infection-In">
      <value value="&quot;Tilburg&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-Age-Groups-Restrictions-50-65?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-WithinMuni-SpringAutumn">
      <value value="&quot;Transmission2.000.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Lockdown_Ratio">
      <value value="0.5"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Last run" repetitions="25" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>go</go>
    <exitCondition>ticks = 370</exitCondition>
    <metric>ticks</metric>
    <metric>newtotalinfected</metric>
    <metric>reproductionnumber</metric>
    <metric>R0-over-7-days</metric>
    <metric>newtotalhospitalized</metric>
    <metric>(sum [fractionsusceptible] of municipalities) / 396</metric>
    <metric>(sum [fractionexposed] of municipalities) / 396</metric>
    <metric>(sum [fractioninfected] of municipalities) / 396</metric>
    <metric>(sum [fractionrecovered] of municipalities) / 396</metric>
    <metric>sum [suminfected05] of municipalities</metric>
    <metric>sum [suminfected512] of municipalities</metric>
    <metric>sum [suminfected1217] of municipalities</metric>
    <metric>sum [suminfected1725] of municipalities</metric>
    <metric>sum [suminfected2535] of municipalities</metric>
    <metric>sum [suminfected3550] of municipalities</metric>
    <metric>sum [suminfected5065] of municipalities</metric>
    <metric>sum [suminfected6580] of municipalities</metric>
    <metric>sum [suminfected80plus] of municipalities</metric>
    <metric>sum [hospitalized05] of municipalities</metric>
    <metric>sum [hospitalized512] of municipalities</metric>
    <metric>sum [hospitalized1217] of municipalities</metric>
    <metric>sum [hospitalized1725] of municipalities</metric>
    <metric>sum [hospitalized2535] of municipalities</metric>
    <metric>sum [hospitalized3550] of municipalities</metric>
    <metric>sum [hospitalized5065] of municipalities</metric>
    <metric>sum [hospitalized6580] of municipalities</metric>
    <metric>sum [hospitalized80plus] of municipalities</metric>
    <metric>jobcommuter-new-infected-over-7-days</metric>
    <metric>schoolcommuter-new-infected-over-7-days</metric>
    <metric>VT-new-infected-over-7-days</metric>
    <metric>GAET-new-infected-over-7-days</metric>
    <metric>decimaljobcom * 100</metric>
    <metric>decimalschoolcom * 100</metric>
    <metric>decimalVTcalc * 100</metric>
    <metric>decimalGAETcalc * 100</metric>
    <enumeratedValueSet variable="Covid-19-Age-Groups-Restrictions-5-12?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Schoolcommuter-Threshold">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-Age-Groups-Restrictions-12-17?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-School-Commuting?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-History-Lockdown?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Travelling-Threshold">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Commuter-Threshold">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-AmongMuni-SpringAutumn">
      <value value="&quot;CommuterTransmission1.000.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-AmongMuni-Winter">
      <value value="&quot;CommuterTransmission1.400.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Duration-of-Immunity">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-Age-Groups-Restrictions-65plus?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="thresholdjobcom">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Immunity-Startpopulation">
      <value value="&quot;StartPopulationFullySTrMr.shp&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-Age-groups-restrictions-25-35?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Duration-of-Infectivity">
      <value value="6"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Job-Commuting-Holiday?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-AmongMuni-Summer">
      <value value="&quot;CommuterTransmission0.600.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection_Ratio">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-Age-Groups-Restrictions-0-5?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-Gatherings-Events-Travelling?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Day-COVID-19-Outbreak">
      <value value="32"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Number-Infectives-Introduced">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-WithinMuni-Winter">
      <value value="&quot;Transmission1.400.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Extra-Visit-Travelling-Holiday?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Extra-Gathering-Events-Travelling-Holiday">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-WithinMuni-Summer">
      <value value="&quot;Transmission0.800.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-Age-Groups-Restrictions-17-25?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Scenario">
      <value value="&quot;COVID19_History&quot;"/>
      <value value="&quot;Route_Map_Scenario&quot;"/>
      <value value="&quot;Economic_Scenario&quot;"/>
      <value value="&quot;Age_Scenario&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-Age-Groups-Restrictions-35-50?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-Job-Commuting?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Overall-Visit-Travelling?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="School-Commuting-Holiday?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Introduce-Infection-In">
      <value value="&quot;Tilburg&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Covid-19-Age-Groups-Restrictions-50-65?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Infection-Rate-WithinMuni-SpringAutumn">
      <value value="&quot;Transmission2.000.txt&quot;"/>
    </enumeratedValueSet>
  </experiment>
</experiments>
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@
