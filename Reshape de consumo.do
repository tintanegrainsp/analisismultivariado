clear all

use "C:\Users\jesus\OneDrive\INSP\Análisis multivariado\Factores\CN_ALIMENTOS_ADU.dta" 

tostring HOGAR, replace
tostring UPM, replace
tostring VIV_SEL, replace
tostring NUMREN, replace
gen id = UPM+VIV_SEL+HOGAR+NUMREN

destring id, replace

collapse (sum) P1_1, by (GRUPO id)

reshape wide P1_1 , i(id) j(GRUPO)


rename P1_11 Lacteos
rename P1_12 Frutas
rename P1_13 Verduras
rename P1_14 ComRap
rename P1_15 CarnesEmbHuev
rename P1_16 PescadoMarisco
rename P1_17 Leguminosas
rename P1_18 CerealesTuber
rename P1_19 Maíz
rename P1_110 Bebidas
rename P1_111 BotanasDulc
rename P1_112 SopaCremaPasta
rename P1_113 Misc

drop P1_116

drop id

export delimited using "C:\Users\jesus\Desktop\factore.csv", replace