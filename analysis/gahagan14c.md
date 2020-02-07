Temporal dynamics of Gahagan bifaces
================
Robert Z. Selden, Jr.
January 31, 2020

## Loading the oxcAAR package

This document includes supplemental materials for paper: “A quantitative
assessment of intraspecific morphological variation in Gahagan bifaces.”
Further information regarding the radiocarbon dates discussed below can
be found in the text of the article.

``` r
if(!require('devtools')) install.packages('devtools')
```

    ## Loading required package: devtools

    ## Loading required package: usethis

``` r
library(devtools)
install_github('ISAAKiel/oxcAAR')
```

    ## Skipping install of 'oxcAAR' from a github remote, the SHA1 (b7b3a5e0) has not changed since last install.
    ##   Use `force = TRUE` to force installation

``` r
# load oxcAAR and OxCal
library(oxcAAR)
quickSetupOxcal()
```

    ## Oxcal doesn't seem to be installed. Downloading it now:

    ## Oxcal download to C:\Users\seldenjrz\AppData\Local\Temp\RtmpmsNQce successful!

    ## Oxcal path set!

    ## NULL

## Calibration

### Calibration and plots for dates from Burial Pit 2 at the Gahagan Mound site

Three AMS dates (UGA12296, ISGS A0465, and ISGS A0466) were reported
from Burial Pit 2 at the Gahagan Mound site. More information about
these dates can be found in the text, and in those works cited in the
text of the article.

``` r
gahagan<-data.frame(bp=c(1000,950,910),
                    std=c(40,40,35),
                    names=c("UGA-12296","ISGS-A0466","ISGS-A0465")
)
gahagancal<-oxcalCalibrate(gahagan$bp,gahagan$std,gahagan$names)
gahagancal
```

    ## List of 3 calibrated dates:
    ## 
    ## =============================
    ##  R_Date: UGA-12296
    ## =============================
    ## 
    ## 
    ## BP = 1000, std = 40
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      
    ## 989 AD - 1046 AD (51.2%)       
    ## 1096 AD - 1120 AD (14.4%)      
    ## 1142 AD - 1147 AD (2.6%)       
    ## 
    ## two sigma                      
    ## 975 AD - 1155 AD (95.4%)       
    ## 
    ## three sigma                    
    ## 894 AD - 930 AD (1.5%)         
    ## 938 AD - 1168 AD (98.2%)       
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: ISGS-A0466
    ## =============================
    ## 
    ## 
    ## BP = 950, std = 40
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      
    ## 1028 AD - 1052 AD (17.1%)      
    ## 1082 AD - 1152 AD (51.1%)      
    ## 
    ## two sigma                      
    ## 1016 AD - 1184 AD (95.4%)      
    ## 
    ## three sigma                    
    ## 989 AD - 1215 AD (99.7%)       
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: ISGS-A0465
    ## =============================
    ## 
    ## 
    ## BP = 910, std = 35
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      
    ## 1044 AD - 1103 AD (39.5%)      
    ## 1119 AD - 1164 AD (28.7%)      
    ## 
    ## two sigma                      
    ## 1032 AD - 1206 AD (95.4%)      
    ## 
    ## three sigma                    
    ## 1020 AD - 1225 AD (99.7%)      
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013)

``` r
plot(gahagancal)
```

![](gahagan14c_files/figure-gfm/gahagancal-1.png)<!-- -->

``` r
calcurve_plot(gahagancal)
```

![](gahagan14c_files/figure-gfm/gahagancal-2.png)<!-- -->

### Calibration and plots for the dates from F119 and F134 at the George C. Davis site

Two dates (Tx-913 and Tx-1206) were reported from Features 119 and 134,
respectively. More information about these dates can be found in the
text, and in those works cited in the text of the article.

``` r
gcd<-data.frame(bp=c(1150,986),
                std=c(80,90),
                names=c("Tx-913","Tx-1206")
)
gcdcal<-oxcalCalibrate(gcd$bp,gcd$std,gcd$names)
gcdcal
```

    ## List of 2 calibrated dates:
    ## 
    ## =============================
    ##  R_Date: Tx-913
    ## =============================
    ## 
    ## 
    ## BP = 1150, std = 80
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      
    ## 777 AD - 794 AD (6%)           
    ## 801 AD - 970 AD (62.2%)        
    ## 
    ## two sigma                      
    ## 689 AD - 753 AD (9.8%)         
    ## 759 AD - 1020 AD (85.6%)       
    ## 
    ## three sigma                    
    ## 652 AD - 1052 AD (98.9%)       
    ## 1081 AD - 1152 AD (0.8%)       
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: Tx-1206
    ## =============================
    ## 
    ## 
    ## BP = 986, std = 90
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      
    ## 978 AD - 1162 AD (68.2%)       
    ## 
    ## two sigma                      
    ## 879 AD - 1254 AD (95.4%)       
    ## 
    ## three sigma                    
    ## 722 AD - 740 AD (0.1%)         
    ## 767 AD - 1278 AD (99.6%)       
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013)

``` r
plot(gcdcal)
```

![](gahagan14c_files/figure-gfm/GCDcal-1.png)<!-- -->

``` r
calcurve_plot(gcdcal)
```

![](gahagan14c_files/figure-gfm/GCDcal-2.png)<!-- -->

### Calibration and plots for dates from Burial Pit 5 at the Mounds Plantation site

Three dates (Tx-55, Tx-56, and M-1466) were reported from Burial Pit 5
at the Mounds Plantation site. More information about these dates can be
found in the text, and in those works cited in the text of the article.

``` r
moundspl<-data.frame(bp=c(860,900),
                     std=c(120,100),
                     names=c("Tx-55","M-1466")
)
moundsplcal<-oxcalCalibrate(moundspl$bp,moundspl$std,moundspl$names)
moundsplcal
```

    ## List of 2 calibrated dates:
    ## 
    ## =============================
    ##  R_Date: Tx-55
    ## =============================
    ## 
    ## 
    ## BP = 860, std = 120
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      
    ## 1044 AD - 1104 AD (19.3%)      
    ## 1118 AD - 1262 AD (48.9%)      
    ## 
    ## two sigma                      
    ## 901 AD - 922 AD (1%)           
    ## 950 AD - 1316 AD (92.3%)       
    ## 1356 AD - 1389 AD (2.1%)       
    ## 
    ## three sigma                    
    ## 776 AD - 1415 AD (99.7%)       
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: M-1466
    ## =============================
    ## 
    ## 
    ## BP = 900, std = 100
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      
    ## 1036 AD - 1214 AD (68.2%)      
    ## 
    ## two sigma                      
    ## 904 AD - 918 AD (0.7%)         
    ## 967 AD - 1284 AD (94.7%)       
    ## 
    ## three sigma                    
    ## 776 AD - 794 AD (0.1%)         
    ## 800 AD - 1316 AD (99.2%)       
    ## 1355 AD - 1390 AD (0.4%)       
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013)

``` r
plot(moundsplcal)
```

![](gahagan14c_files/figure-gfm/mplcal-1.png)<!-- -->

``` r
calcurve_plot(moundsplcal)
```

![](gahagan14c_files/figure-gfm/mplcal-2.png)<!-- -->

### Calibration and plots for dates from AU2 at the J. B. White site

Seventeen dates (Beta-176624, UGA-12500, UGA-12509, UGA-12497,
UGA-12498, UGA-12505, UGA-12495, Beta-176625, Beta-176623, UGA-12494,
UGA-12503, UGA-12499, Beta-176620, Beta-176627, Beta-176628, UGA-12493,
Beta-176630) were reported from AU2 at the J. B. White site. More
information about these dates can be found in the text, and in those
works cited in the text of the article.

``` r
jbw<-data.frame(bp=c(1190,1090,1090,1050,1030,990,980,980,970,970,950,920,910,890,880,860,710),
                     std=c(50,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40),
                     names=c("Beta-176624","UGA-12500","UGA-12509","UGA-12497","UGA-12498", "UGA-12505","UGA-12495","Beta-176625","Beta-176623","UGA-12494","UGA-12503","UGA-12499","Beta-176620","Beta-176627","Beta-176628","UGA-12493","Beta-176630")
)
jbwcal<-oxcalCalibrate(jbw$bp,jbw$std,jbw$names)
jbwcal
```

    ## List of 17 calibrated dates:
    ## 
    ## =============================
    ##  R_Date: Beta-176624
    ## =============================
    ## 
    ## 
    ## BP = 1190, std = 50
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      
    ## 770 AD - 894 AD (66.8%)        
    ## 933 AD - 937 AD (1.4%)         
    ## 
    ## two sigma                      
    ## 691 AD - 750 AD (11.9%)        
    ## 762 AD - 970 AD (83.5%)        
    ## 
    ## three sigma                    
    ## 668 AD - 993 AD (99.7%)        
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: UGA-12500
    ## =============================
    ## 
    ## 
    ## BP = 1090, std = 40
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      
    ## 896 AD - 928 AD (25.6%)        
    ## 940 AD - 994 AD (42.6%)        
    ## 
    ## two sigma                      
    ## 780 AD - 788 AD (0.6%)         
    ## 876 AD - 1024 AD (94.8%)       
    ## 
    ## three sigma                    
    ## 776 AD - 1030 AD (99.7%)       
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: UGA-12509
    ## =============================
    ## 
    ## 
    ## BP = 1090, std = 40
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      
    ## 896 AD - 928 AD (25.6%)        
    ## 940 AD - 994 AD (42.6%)        
    ## 
    ## two sigma                      
    ## 780 AD - 788 AD (0.6%)         
    ## 876 AD - 1024 AD (94.8%)       
    ## 
    ## three sigma                    
    ## 776 AD - 1030 AD (99.7%)       
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: UGA-12497
    ## =============================
    ## 
    ## 
    ## BP = 1050, std = 40
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      
    ## 906 AD - 916 AD (5.4%)         
    ## 968 AD - 1024 AD (62.8%)       
    ## 
    ## two sigma                      
    ## 892 AD - 1036 AD (95.4%)       
    ## 
    ## three sigma                    
    ## 778 AD - 790 AD (0.1%)         
    ## 866 AD - 1155 AD (99.6%)       
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: UGA-12498
    ## =============================
    ## 
    ## 
    ## BP = 1030, std = 40
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      
    ## 974 AD - 1032 AD (68.2%)       
    ## 
    ## two sigma                      
    ## 896 AD - 928 AD (7.7%)         
    ## 940 AD - 1049 AD (80.1%)       
    ## 1087 AD - 1124 AD (6.1%)       
    ## 1138 AD - 1150 AD (1.6%)       
    ## 
    ## three sigma                    
    ## 888 AD - 1156 AD (99.7%)       
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: UGA-12505
    ## =============================
    ## 
    ## 
    ## BP = 990, std = 40
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      
    ## 996 AD - 1047 AD (42.3%)       
    ## 1091 AD - 1122 AD (21%)        
    ## 1140 AD - 1148 AD (4.9%)       
    ## 
    ## two sigma                      
    ## 986 AD - 1156 AD (95.4%)       
    ## 
    ## three sigma                    
    ## 898 AD - 924 AD (0.6%)         
    ## 944 AD - 1188 AD (99.1%)       
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: UGA-12495
    ## =============================
    ## 
    ## 
    ## BP = 980, std = 40
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      
    ## 1016 AD - 1050 AD (29.4%)      
    ## 1084 AD - 1126 AD (29.5%)      
    ## 1136 AD - 1151 AD (9.4%)       
    ## 
    ## two sigma                      
    ## 992 AD - 1156 AD (95.4%)       
    ## 
    ## three sigma                    
    ## 902 AD - 920 AD (0.2%)         
    ## 964 AD - 1210 AD (99.5%)       
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: Beta-176625
    ## =============================
    ## 
    ## 
    ## BP = 980, std = 40
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      
    ## 1016 AD - 1050 AD (29.4%)      
    ## 1084 AD - 1126 AD (29.5%)      
    ## 1136 AD - 1151 AD (9.4%)       
    ## 
    ## two sigma                      
    ## 992 AD - 1156 AD (95.4%)       
    ## 
    ## three sigma                    
    ## 902 AD - 920 AD (0.2%)         
    ## 964 AD - 1210 AD (99.5%)       
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: Beta-176623
    ## =============================
    ## 
    ## 
    ## BP = 970, std = 40
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      
    ## 1020 AD - 1050 AD (25.4%)      
    ## 1084 AD - 1126 AD (32.3%)      
    ## 1136 AD - 1151 AD (10.5%)      
    ## 
    ## two sigma                      
    ## 996 AD - 1160 AD (95.4%)       
    ## 
    ## three sigma                    
    ## 972 AD - 1212 AD (99.7%)       
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: UGA-12494
    ## =============================
    ## 
    ## 
    ## BP = 970, std = 40
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      
    ## 1020 AD - 1050 AD (25.4%)      
    ## 1084 AD - 1126 AD (32.3%)      
    ## 1136 AD - 1151 AD (10.5%)      
    ## 
    ## two sigma                      
    ## 996 AD - 1160 AD (95.4%)       
    ## 
    ## three sigma                    
    ## 972 AD - 1212 AD (99.7%)       
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: UGA-12503
    ## =============================
    ## 
    ## 
    ## BP = 950, std = 40
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      
    ## 1028 AD - 1052 AD (17.1%)      
    ## 1082 AD - 1152 AD (51.1%)      
    ## 
    ## two sigma                      
    ## 1016 AD - 1184 AD (95.4%)      
    ## 
    ## three sigma                    
    ## 989 AD - 1215 AD (99.7%)       
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: UGA-12499
    ## =============================
    ## 
    ## 
    ## BP = 920, std = 40
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      
    ## 1043 AD - 1106 AD (41.6%)      
    ## 1118 AD - 1159 AD (26.6%)      
    ## 
    ## two sigma                      
    ## 1026 AD - 1206 AD (95.4%)      
    ## 
    ## three sigma                    
    ## 1014 AD - 1250 AD (99.7%)      
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: Beta-176620
    ## =============================
    ## 
    ## 
    ## BP = 910, std = 40
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      
    ## 1043 AD - 1106 AD (39.6%)      
    ## 1118 AD - 1165 AD (28.6%)      
    ## 
    ## two sigma                      
    ## 1030 AD - 1210 AD (95.4%)      
    ## 
    ## three sigma                    
    ## 1018 AD - 1250 AD (99.7%)      
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: Beta-176627
    ## =============================
    ## 
    ## 
    ## BP = 890, std = 40
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      
    ## 1049 AD - 1086 AD (23.4%)      
    ## 1124 AD - 1138 AD (7.2%)       
    ## 1150 AD - 1209 AD (37.5%)      
    ## 
    ## two sigma                      
    ## 1034 AD - 1220 AD (95.4%)      
    ## 
    ## three sigma                    
    ## 1024 AD - 1258 AD (99.7%)      
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: Beta-176628
    ## =============================
    ## 
    ## 
    ## BP = 880, std = 40
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      
    ## 1050 AD - 1083 AD (18.6%)      
    ## 1127 AD - 1136 AD (4%)         
    ## 1152 AD - 1216 AD (45.6%)      
    ## 
    ## two sigma                      
    ## 1036 AD - 1226 AD (93.3%)      
    ## 1232 AD - 1245 AD (2.1%)       
    ## 
    ## three sigma                    
    ## 1026 AD - 1262 AD (99.7%)      
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: UGA-12493
    ## =============================
    ## 
    ## 
    ## BP = 860, std = 40
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      
    ## 1058 AD - 1076 AD (7.9%)       
    ## 1154 AD - 1224 AD (59.2%)      
    ## 1238 AD - 1241 AD (1%)         
    ## 
    ## two sigma                      
    ## 1045 AD - 1098 AD (16.8%)      
    ## 1120 AD - 1260 AD (78.6%)      
    ## 
    ## three sigma                    
    ## 1030 AD - 1270 AD (99.7%)      
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: Beta-176630
    ## =============================
    ## 
    ## 
    ## BP = 710, std = 40
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      
    ## 1262 AD - 1300 AD (60.5%)      
    ## 1370 AD - 1380 AD (7.7%)       
    ## 
    ## two sigma                      
    ## 1224 AD - 1316 AD (77.7%)      
    ## 1356 AD - 1390 AD (17.7%)      
    ## 
    ## three sigma                    
    ## 1211 AD - 1400 AD (99.7%)      
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013)

``` r
plot(jbwcal)
```

![](gahagan14c_files/figure-gfm/jbwcal-1.png)<!-- -->

``` r
calcurve_plot(jbwcal)
```

![](gahagan14c_files/figure-gfm/jbwcal-2.png)<!-- -->

### Calibration and plots for the dates from the Baker site

Three dates (D-AMS 035170, D-AMS 035169, D-AMS 035290) were reported
from Features 119 and 134, respectively. More information about these
dates can be found in the text, and in those works cited in the text of
the article.

``` r
bkr<-data.frame(bp=c(667,648,624),
                std=c(24,22,28),
                names=c("D-AMS 035170","D-AMS 035169","D-AMS 035290")
)
bkrcal<-oxcalCalibrate(bkr$bp,bkr$std,bkr$names)
bkrcal
```

    ## List of 3 calibrated dates:
    ## 
    ## =============================
    ##  R_Date: D-AMS 035170
    ## =============================
    ## 
    ## 
    ## BP = 667, std = 24
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      
    ## 1284 AD - 1302 AD (38.2%)      
    ## 1367 AD - 1383 AD (30%)        
    ## 
    ## two sigma                      
    ## 1278 AD - 1316 AD (52.2%)      
    ## 1356 AD - 1390 AD (43.2%)      
    ## 
    ## three sigma                    
    ## 1270 AD - 1328 AD (54.3%)      
    ## 1342 AD - 1396 AD (45.4%)      
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: D-AMS 035169
    ## =============================
    ## 
    ## 
    ## BP = 648, std = 22
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      
    ## 1291 AD - 1309 AD (27.3%)      
    ## 1362 AD - 1386 AD (40.9%)      
    ## 
    ## two sigma                      
    ## 1284 AD - 1320 AD (41.6%)      
    ## 1350 AD - 1392 AD (53.8%)      
    ## 
    ## three sigma                    
    ## 1278 AD - 1332 AD (43.6%)      
    ## 1337 AD - 1399 AD (56.1%)      
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: D-AMS 035290
    ## =============================
    ## 
    ## 
    ## BP = 624, std = 28
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      
    ## 1299 AD - 1320 AD (26.6%)      
    ## 1350 AD - 1372 AD (26.4%)      
    ## 1378 AD - 1392 AD (15.2%)      
    ## 
    ## two sigma                      
    ## 1290 AD - 1400 AD (95.4%)      
    ## 
    ## three sigma                    
    ## 1282 AD - 1410 AD (99.7%)      
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013)

``` r
plot(bkrcal)
```

![](gahagan14c_files/figure-gfm/bkrcal-1.png)<!-- -->

``` r
calcurve_plot(bkrcal)
```

![](gahagan14c_files/figure-gfm/bkrcal-2.png)<!-- -->

### Summed probability distributions for contexts yielding Gahagan bifaces

A summed probability distribution is presented for all dates, then each
site. Those dates from the same wood specimen at the Mounds Plantation
site (M-1466 and Tx-55) were not combined for these distributions.
Outliers mentioned in the text of the article are omitted from the
summed probability distributions for contexts yielding Gahagan bifaces
listed below.

``` r
# plot spd for all contexts yielding Gahagan bifaces
spdall<-R_Date(c("Beta-176624","Tx-913","UGA-12500","UGA-12509","UGA-12497","UGA-12498","UGA-12296","UGA-12505","UGA-12495","Beta-176625","Beta-176623","UGA-12494","UGA-12503","ISGS-A0466","UGA-12499","Beta-176620","ISGS-A0465","M-1466","Tx-55","Beta-176627","Beta-176628","UGA-12493","Beta-176630","D-AMS 035170","D-AMS 035169","D-AMS 035290"), c(1190,1150,1090,1090,1050,1030,1000,990,980,980,970,970,950,950,920,910,910,900,860,890,880,860,710,667,648,624), c(50,80,40,40,40,40,40,40,40,40,40,40,40,40,40,40,35,100,120,40,40,40,40,24,22,28))
cat(spdall)
```

    ## R_Date("Beta-176624", 1190, 50);
    ## R_Date("Tx-913", 1150, 80);
    ## R_Date("UGA-12500", 1090, 40);
    ## R_Date("UGA-12509", 1090, 40);
    ## R_Date("UGA-12497", 1050, 40);
    ## R_Date("UGA-12498", 1030, 40);
    ## R_Date("UGA-12296", 1000, 40);
    ## R_Date("UGA-12505", 990, 40);
    ## R_Date("UGA-12495", 980, 40);
    ## R_Date("Beta-176625", 980, 40);
    ## R_Date("Beta-176623", 970, 40);
    ## R_Date("UGA-12494", 970, 40);
    ## R_Date("UGA-12503", 950, 40);
    ## R_Date("ISGS-A0466", 950, 40);
    ## R_Date("UGA-12499", 920, 40);
    ## R_Date("Beta-176620", 910, 40);
    ## R_Date("ISGS-A0465", 910, 35);
    ## R_Date("M-1466", 900, 100);
    ## R_Date("Tx-55", 860, 120);
    ## R_Date("Beta-176627", 890, 40);
    ## R_Date("Beta-176628", 880, 40);
    ## R_Date("UGA-12493", 860, 40);
    ## R_Date("Beta-176630", 710, 40);
    ## R_Date("D-AMS 035170", 667, 24);
    ## R_Date("D-AMS 035169", 648, 22);
    ## R_Date("D-AMS 035290", 624, 28);

``` r
sumall<-oxcal_Sum(spdall)

cat(sumall)
```

    ## Sum(" Sum "){
    ##  R_Date("Beta-176624", 1190, 50);
    ## R_Date("Tx-913", 1150, 80);
    ## R_Date("UGA-12500", 1090, 40);
    ## R_Date("UGA-12509", 1090, 40);
    ## R_Date("UGA-12497", 1050, 40);
    ## R_Date("UGA-12498", 1030, 40);
    ## R_Date("UGA-12296", 1000, 40);
    ## R_Date("UGA-12505", 990, 40);
    ## R_Date("UGA-12495", 980, 40);
    ## R_Date("Beta-176625", 980, 40);
    ## R_Date("Beta-176623", 970, 40);
    ## R_Date("UGA-12494", 970, 40);
    ## R_Date("UGA-12503", 950, 40);
    ## R_Date("ISGS-A0466", 950, 40);
    ## R_Date("UGA-12499", 920, 40);
    ## R_Date("Beta-176620", 910, 40);
    ## R_Date("ISGS-A0465", 910, 35);
    ## R_Date("M-1466", 900, 100);
    ## R_Date("Tx-55", 860, 120);
    ## R_Date("Beta-176627", 890, 40);
    ## R_Date("Beta-176628", 880, 40);
    ## R_Date("UGA-12493", 860, 40);
    ## R_Date("Beta-176630", 710, 40);
    ## R_Date("D-AMS 035170", 667, 24);
    ## R_Date("D-AMS 035169", 648, 22);
    ## R_Date("D-AMS 035290", 624, 28); 
    ## };

``` r
library(magrittr)

sumall.cal <- sumall %>% executeOxcalScript() %>% readOxcalOutput() %>% parseOxcalOutput(first = T, only.R_Date = F)

str(sumall.cal)
```

    ## List of 1
    ##  $  Sum :List of 9
    ##   ..$ name                   : chr " Sum "
    ##   ..$ type                   : chr "Sum"
    ##   ..$ bp                     : logi NA
    ##   ..$ std                    : logi NA
    ##   ..$ cal_curve              :List of 5
    ##   .. ..$ name      : chr " IntCal13 atmospheric curve (Reimer et al 2013)"
    ##   .. ..$ resolution: num 5
    ##   .. ..$ bp        : num [1:10001] 46401 46396 46391 46386 46381 ...
    ##   .. ..$ bc        : num [1:10001] -48050 -48045 -48040 -48035 -48030 ...
    ##   .. ..$ sigma     : num [1:10001] 274 274 274 273 273 ...
    ##   ..$ sigma_ranges           :List of 3
    ##   .. ..$ one_sigma  : logi NA
    ##   .. ..$ two_sigma  : logi NA
    ##   .. ..$ three_sigma: logi NA
    ##   ..$ raw_probabilities      :'data.frame':  224 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:224] 530 536 540 546 550 ...
    ##   .. ..$ probabilities: num [1:224] 0.00 0.00 3.97e-09 3.97e-09 7.94e-09 ...
    ##   ..$ posterior_sigma_ranges :List of 3
    ##   .. ..$ one_sigma  : logi NA
    ##   .. ..$ two_sigma  : logi NA
    ##   .. ..$ three_sigma: logi NA
    ##   ..$ posterior_probabilities: logi NA
    ##   ..- attr(*, "class")= chr "oxcAARCalibratedDate"
    ##  - attr(*, "class")= chr [1:2] "list" "oxcAARCalibratedDatesList"

``` r
plot(sumall.cal)
```

![](gahagan14c_files/figure-gfm/sumcal-1.png)<!-- -->

``` r
#simulate spd using the same date range, number of dates, and mean error
sum_sim<-oxcalSumSim(
  timeframe_begin = 600,
  timeframe_end = 1600,
  n = 26,
  stds = 45,
  date_distribution = "uniform"
)
str(sum_sim)
```

    ## List of 9
    ##  $ name                   : chr " Sum "
    ##  $ type                   : chr "Sum"
    ##  $ bp                     : logi NA
    ##  $ std                    : logi NA
    ##  $ cal_curve              :List of 5
    ##   ..$ name      : chr " IntCal13 atmospheric curve (Reimer et al 2013)"
    ##   ..$ resolution: num 5
    ##   ..$ bp        : num [1:10001] 46401 46396 46391 46386 46381 ...
    ##   ..$ bc        : num [1:10001] -48050 -48045 -48040 -48035 -48030 ...
    ##   ..$ sigma     : num [1:10001] 274 274 274 273 273 ...
    ##  $ sigma_ranges           :List of 3
    ##   ..$ one_sigma  : logi NA
    ##   ..$ two_sigma  : logi NA
    ##   ..$ three_sigma: logi NA
    ##  $ raw_probabilities      :'data.frame': 326 obs. of  2 variables:
    ##   ..$ dates        : num [1:326] 326 330 336 340 346 ...
    ##   ..$ probabilities: num [1:326] 0.00 0.00 0.00 1.67e-09 1.67e-09 ...
    ##  $ posterior_sigma_ranges :List of 3
    ##   ..$ one_sigma  : logi NA
    ##   ..$ two_sigma  : logi NA
    ##   ..$ three_sigma: logi NA
    ##  $ posterior_probabilities: logi NA
    ##  - attr(*, "class")= chr "oxcAARCalibratedDate"

``` r
plot(sum_sim)
```

![](gahagan14c_files/figure-gfm/sumcal-2.png)<!-- -->

### Chronological model for Caddo contexts yielding Gahagan bifaces

For reasons explained in the text, Tx-1206 and Tx-56 are included in the
model as outliers. The script that appears below achieves the same
results in R and in OxCal. While Figure 3 in the article was produced
using this script in OxCal 4.3.2 for aesthetic purposes, the
chronological model was created using the oxcAAR package.

``` r
knitr::opts_chunk$set(cache=TRUE)
bgahagan <- 'Plot()
 {
  Phase("Contexts yielding Gahagan Bifaces")
  {
   Sequence("Gahagan Bifaces")
   {
    Boundary("start Gahagan Bifaces SCA");
    Phase("southern Caddo area")
    {
     R_Date("Tx-913", 1150, 80);
     R_Date("UGA-12296", 1000, 40);
     R_Date("Tx-1206", 986, 90)
     {
      Outlier();
     };
     R_Date("ISGS-A0466", 950, 40);
     R_Date("ISGS-A0465", 910, 35);
     R_Combine("Log 1")
     {
      R_Date("M-1466", 900, 100);
      R_Date("Tx-55", 860, 120);
     };
     R_Date("Tx-56", 475, 100)
     {
      Outlier();
     };
    };
    Boundary("end Gahagan bifaces SCA");
    Boundary("start Gahagan bifaces CTX");
    Phase("central Texas")
    {
     R_Date("Beta-176624", 1190, 50);
     R_Date("UGA-12500", 1090, 40);
     R_Date("UGA-12509", 1090, 40);
     R_Date("UGA-12497", 1050, 40);
     R_Date("UGA-12498", 1030, 40);
     R_Date("UGA-12505", 990, 40);
     R_Date("UGA-12495", 980, 40);
     R_Date("Beta-176625", 980, 40);
     R_Date("Beta-176623", 970, 40);
     R_Date("UGA-12494", 970, 40);
     R_Date("UGA-12503", 950, 40);
     R_Date("UGA-12499", 920, 40);
     R_Date("Beta-176620", 910, 40);
     R_Date("Beta-176627", 890, 40);
     R_Date("Beta-176628", 880, 40);
     R_Date("UGA-12493", 860, 40);
     R_Date("Beta-176630", 710, 40);
     R_Date("D-AMS 035170", 667, 24);
     R_Date("D-AMS 035169", 648, 22);
     R_Date("D-AMS 035290", 624, 28);
    };
    Boundary("end Ghagan Bifaces CTX");
   };
  };
 };
'
  
  bgahagan_results <- executeOxcalScript(bgahagan) 
  bgahagan_text <- readOxcalOutput(bgahagan_results)
  bgahagan_result_data <- parseOxcalOutput(bgahagan_text, only.R_Date = F)
  str(bgahagan_result_data)
```

    ## List of 35
    ##  $ start Gahagan Bifaces SCA        :List of 9
    ##   ..$ name                   : chr "start Gahagan Bifaces SCA"
    ##   ..$ type                   : chr "Boundary"
    ##   ..$ bp                     : logi NA
    ##   ..$ std                    : logi NA
    ##   ..$ cal_curve              :List of 5
    ##   .. ..$ name      : chr " IntCal13 atmospheric curve (Reimer et al 2013)"
    ##   .. ..$ resolution: num 5
    ##   .. ..$ bp        : num [1:10001] 46401 46396 46391 46386 46381 ...
    ##   .. ..$ bc        : num [1:10001] -48050 -48045 -48040 -48035 -48030 ...
    ##   .. ..$ sigma     : num [1:10001] 274 274 274 273 273 ...
    ##   ..$ sigma_ranges           :List of 3
    ##   .. ..$ one_sigma  : logi NA
    ##   .. ..$ two_sigma  : logi NA
    ##   .. ..$ three_sigma: logi NA
    ##   ..$ raw_probabilities      : logi NA
    ##   ..$ posterior_sigma_ranges :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 988
    ##   .. .. ..$ end        : num 1002
    ##   .. .. ..$ probability: num 68.2
    ##   .. ..$ two_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 973
    ##   .. .. ..$ end        : num 1008
    ##   .. .. ..$ probability: num 95.4
    ##   .. ..$ three_sigma:'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 893 932
    ##   .. .. ..$ end        : num [1:2] 924 1024
    ##   .. .. ..$ probability: num [1:2] 0.5 99.2
    ##   ..$ posterior_probabilities:'data.frame':  59 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:59] 770 776 780 786 790 ...
    ##   .. ..$ probabilities: num [1:59] 0.00 8.64e-07 4.32e-07 3.74e-06 1.22e-06 ...
    ##   ..- attr(*, "class")= chr "oxcAARCalibratedDate"
    ##  $ Tx-913                           :List of 9
    ##   ..$ name                   : chr "Tx-913"
    ##   ..$ type                   : chr "R_Date"
    ##   ..$ bp                     : int 1150
    ##   ..$ std                    : int 80
    ##   ..$ cal_curve              :List of 5
    ##   .. ..$ name      : chr " IntCal13 atmospheric curve (Reimer et al 2013)"
    ##   .. ..$ resolution: num 5
    ##   .. ..$ bp        : num [1:10001] 46401 46396 46391 46386 46381 ...
    ##   .. ..$ bc        : num [1:10001] -48050 -48045 -48040 -48035 -48030 ...
    ##   .. ..$ sigma     : num [1:10001] 274 274 274 273 273 ...
    ##   ..$ sigma_ranges           :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 777 801
    ##   .. .. ..$ end        : num [1:2] 794 970
    ##   .. .. ..$ probability: num [1:2] 6 62.2
    ##   .. ..$ two_sigma  :'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 689 759
    ##   .. .. ..$ end        : num [1:2] 753 1020
    ##   .. .. ..$ probability: num [1:2] 9.8 85.6
    ##   .. ..$ three_sigma:'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 652 1081
    ##   .. .. ..$ end        : num [1:2] 1052 1152
    ##   .. .. ..$ probability: num [1:2] 98.9 0.8
    ##   ..$ raw_probabilities      :'data.frame':  175 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:175] 416 420 426 430 436 ...
    ##   .. ..$ probabilities: num [1:175] 0.00 0.00 0.00 8.26e-09 1.65e-08 ...
    ##   ..$ posterior_sigma_ranges :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 991
    ##   .. .. ..$ end        : num 1004
    ##   .. .. ..$ probability: num 68.2
    ##   .. ..$ two_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 980
    ##   .. .. ..$ end        : num 1010
    ##   .. .. ..$ probability: num 95.4
    ##   .. ..$ three_sigma:'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 901 946
    ##   .. .. ..$ end        : num [1:2] 923 1033
    ##   .. .. ..$ probability: num [1:2] 0.4 99.3
    ##   ..$ posterior_probabilities:'data.frame':  65 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:65] 790 796 800 806 810 ...
    ##   .. ..$ probabilities: num [1:65] 0.00 4.51e-07 0.00 4.51e-07 0.00 ...
    ##   ..- attr(*, "class")= chr "oxcAARCalibratedDate"
    ##  $ UGA-12296                        :List of 9
    ##   ..$ name                   : chr "UGA-12296"
    ##   ..$ type                   : chr "R_Date"
    ##   ..$ bp                     : int 1000
    ##   ..$ std                    : int 40
    ##   ..$ cal_curve              :List of 5
    ##   .. ..$ name      : chr " IntCal13 atmospheric curve (Reimer et al 2013)"
    ##   .. ..$ resolution: num 5
    ##   .. ..$ bp        : num [1:10001] 46401 46396 46391 46386 46381 ...
    ##   .. ..$ bc        : num [1:10001] -48050 -48045 -48040 -48035 -48030 ...
    ##   .. ..$ sigma     : num [1:10001] 274 274 274 273 273 ...
    ##   ..$ sigma_ranges           :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   3 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:3] 989 1096 1142
    ##   .. .. ..$ end        : num [1:3] 1046 1120 1147
    ##   .. .. ..$ probability: num [1:3] 51.2 14.4 2.6
    ##   .. ..$ two_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 975
    ##   .. .. ..$ end        : num 1155
    ##   .. .. ..$ probability: num 95.4
    ##   .. ..$ three_sigma:'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 894 938
    ##   .. .. ..$ end        : num [1:2] 930 1168
    ##   .. .. ..$ probability: num [1:2] 1.5 98.2
    ##   ..$ raw_probabilities      :'data.frame':  103 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:103] 760 766 770 776 780 ...
    ##   .. ..$ probabilities: num [1:103] 0.00 0.00 0.00 6.97e-08 9.62e-07 ...
    ##   ..$ posterior_sigma_ranges :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 992
    ##   .. .. ..$ end        : num 1003
    ##   .. .. ..$ probability: num 68.2
    ##   .. ..$ two_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 984
    ##   .. .. ..$ end        : num 1010
    ##   .. .. ..$ probability: num 95.4
    ##   .. ..$ three_sigma:'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 903 968
    ##   .. .. ..$ end        : num [1:2] 918 1034
    ##   .. .. ..$ probability: num [1:2] 0.4 99.3
    ##   ..$ posterior_probabilities:'data.frame':  47 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:47] 876 880 886 890 896 ...
    ##   .. ..$ probabilities: num [1:47] 0.00 0.00 0.00 1.67e-06 3.74e-06 ...
    ##   ..- attr(*, "class")= chr "oxcAARCalibratedDate"
    ##  $ Tx-1206                          :List of 9
    ##   ..$ name                   : chr "Tx-1206"
    ##   ..$ type                   : chr "R_Date"
    ##   ..$ bp                     : int 986
    ##   ..$ std                    : int 90
    ##   ..$ cal_curve              :List of 5
    ##   .. ..$ name      : chr " IntCal13 atmospheric curve (Reimer et al 2013)"
    ##   .. ..$ resolution: num 5
    ##   .. ..$ bp        : num [1:10001] 46401 46396 46391 46386 46381 ...
    ##   .. ..$ bc        : num [1:10001] -48050 -48045 -48040 -48035 -48030 ...
    ##   .. ..$ sigma     : num [1:10001] 274 274 274 273 273 ...
    ##   ..$ sigma_ranges           :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 978
    ##   .. .. ..$ end        : num 1162
    ##   .. .. ..$ probability: num 68.2
    ##   .. ..$ two_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 879
    ##   .. .. ..$ end        : num 1254
    ##   .. .. ..$ probability: num 95.4
    ##   .. ..$ three_sigma:'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 722 767
    ##   .. .. ..$ end        : num [1:2] 740 1278
    ##   .. .. ..$ probability: num [1:2] 0.1 99.6
    ##   ..$ raw_probabilities      :'data.frame':  170 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:170] 586 590 596 600 606 ...
    ##   .. ..$ probabilities: num [1:170] 0.00 4.55e-09 4.55e-09 9.09e-09 1.36e-08 ...
    ##   ..$ posterior_sigma_ranges :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 978
    ##   .. .. ..$ end        : num 1162
    ##   .. .. ..$ probability: num 68.2
    ##   .. ..$ two_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 877
    ##   .. .. ..$ end        : num 1254
    ##   .. .. ..$ probability: num 95.4
    ##   .. ..$ three_sigma:'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 721 766
    ##   .. .. ..$ end        : num [1:2] 741 1280
    ##   .. .. ..$ probability: num [1:2] 0.1 99.6
    ##   ..$ posterior_probabilities:'data.frame':  149 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:149] 656 660 666 670 676 ...
    ##   .. ..$ probabilities: num [1:149] 0.00 1.25e-06 2.92e-06 4.58e-06 7.08e-06 ...
    ##   ..- attr(*, "class")= chr "oxcAARCalibratedDate"
    ##  $ ISGS-A0466                       :List of 9
    ##   ..$ name                   : chr "ISGS-A0466"
    ##   ..$ type                   : chr "R_Date"
    ##   ..$ bp                     : int 950
    ##   ..$ std                    : int 40
    ##   ..$ cal_curve              :List of 5
    ##   .. ..$ name      : chr " IntCal13 atmospheric curve (Reimer et al 2013)"
    ##   .. ..$ resolution: num 5
    ##   .. ..$ bp        : num [1:10001] 46401 46396 46391 46386 46381 ...
    ##   .. ..$ bc        : num [1:10001] -48050 -48045 -48040 -48035 -48030 ...
    ##   .. ..$ sigma     : num [1:10001] 274 274 274 273 273 ...
    ##   ..$ sigma_ranges           :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 1028 1082
    ##   .. .. ..$ end        : num [1:2] 1052 1152
    ##   .. .. ..$ probability: num [1:2] 17.1 51.1
    ##   .. ..$ two_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1016
    ##   .. .. ..$ end        : num 1184
    ##   .. .. ..$ probability: num 95.4
    ##   .. ..$ three_sigma:'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 989
    ##   .. .. ..$ end        : num 1215
    ##   .. .. ..$ probability: num 99.7
    ##   ..$ raw_probabilities      :'data.frame':  85 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:85] 870 876 880 886 890 ...
    ##   .. ..$ probabilities: num [1:85] 0.00 0.00 7.97e-09 1.59e-08 1.19e-07 ...
    ##   ..$ posterior_sigma_ranges :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 992
    ##   .. .. ..$ end        : num 1003
    ##   .. .. ..$ probability: num 68.2
    ##   .. ..$ two_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 986
    ##   .. .. ..$ end        : num 1009
    ##   .. .. ..$ probability: num 95.4
    ##   .. ..$ three_sigma:'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 903 972
    ##   .. .. ..$ end        : num [1:2] 918 1045
    ##   .. .. ..$ probability: num [1:2] 0.4 99.3
    ##   ..$ posterior_probabilities:'data.frame':  46 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:46] 876 880 886 890 896 ...
    ##   .. ..$ probabilities: num [1:46] 0.00 0.00 0.00 8.16e-07 2.12e-06 ...
    ##   ..- attr(*, "class")= chr "oxcAARCalibratedDate"
    ##  $ ISGS-A0465                       :List of 9
    ##   ..$ name                   : chr "ISGS-A0465"
    ##   ..$ type                   : chr "R_Date"
    ##   ..$ bp                     : int 910
    ##   ..$ std                    : int 35
    ##   ..$ cal_curve              :List of 5
    ##   .. ..$ name      : chr " IntCal13 atmospheric curve (Reimer et al 2013)"
    ##   .. ..$ resolution: num 5
    ##   .. ..$ bp        : num [1:10001] 46401 46396 46391 46386 46381 ...
    ##   .. ..$ bc        : num [1:10001] -48050 -48045 -48040 -48035 -48030 ...
    ##   .. ..$ sigma     : num [1:10001] 274 274 274 273 273 ...
    ##   ..$ sigma_ranges           :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 1044 1119
    ##   .. .. ..$ end        : num [1:2] 1103 1164
    ##   .. .. ..$ probability: num [1:2] 39.5 28.7
    ##   .. ..$ two_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1032
    ##   .. .. ..$ end        : num 1206
    ##   .. .. ..$ probability: num 95.4
    ##   .. ..$ three_sigma:'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1020
    ##   .. .. ..$ end        : num 1225
    ##   .. .. ..$ probability: num 99.7
    ##   ..$ raw_probabilities      :'data.frame':  81 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:81] 890 896 900 906 910 ...
    ##   .. ..$ probabilities: num [1:81] 0.00 0.00 0.00 7.71e-09 1.54e-08 ...
    ##   ..$ posterior_sigma_ranges :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 992
    ##   .. .. ..$ end        : num 1002
    ##   .. .. ..$ probability: num 68.2
    ##   .. ..$ two_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 986
    ##   .. .. ..$ end        : num 1008
    ##   .. .. ..$ probability: num 95.4
    ##   .. ..$ three_sigma:'data.frame':   3 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:3] 903 974 1030
    ##   .. .. ..$ end        : num [1:3] 918 1020 1051
    ##   .. .. ..$ probability: num [1:3] 0.5 99 0.2
    ##   ..$ posterior_probabilities:'data.frame':  46 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:46] 890 896 900 906 910 ...
    ##   .. ..$ probabilities: num [1:46] 0 0 0 0.000187 0.000535 ...
    ##   ..- attr(*, "class")= chr "oxcAARCalibratedDate"
    ##  $ Log 1                            :List of 9
    ##   ..$ name                   : chr "Log 1"
    ##   ..$ type                   : chr "R_Combine"
    ##   ..$ bp                     : int 884
    ##   ..$ std                    : int 77
    ##   ..$ cal_curve              :List of 5
    ##   .. ..$ name      : chr " IntCal13 atmospheric curve (Reimer et al 2013)"
    ##   .. ..$ resolution: num 5
    ##   .. ..$ bp        : num [1:10001] 46401 46396 46391 46386 46381 ...
    ##   .. ..$ bc        : num [1:10001] -48050 -48045 -48040 -48035 -48030 ...
    ##   .. ..$ sigma     : num [1:10001] 274 274 274 273 273 ...
    ##   ..$ sigma_ranges           :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 1044 1119
    ##   .. .. ..$ end        : num [1:2] 1102 1219
    ##   .. .. ..$ probability: num [1:2] 24.6 43.6
    ##   .. ..$ two_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1020
    ##   .. .. ..$ end        : num 1268
    ##   .. .. ..$ probability: num 95.4
    ##   .. ..$ three_sigma:'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 899 946
    ##   .. .. ..$ end        : num [1:2] 924 1297
    ##   .. .. ..$ probability: num [1:2] 0.2 99.5
    ##   ..$ raw_probabilities      :'data.frame':  157 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:157] 666 670 676 680 686 ...
    ##   .. ..$ probabilities: num [1:157] 0.00 0.00 4.92e-09 4.92e-09 9.83e-09 ...
    ##   ..$ posterior_sigma_ranges :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 992
    ##   .. .. ..$ end        : num 1003
    ##   .. .. ..$ probability: num 68.2
    ##   .. ..$ two_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 984
    ##   .. .. ..$ end        : num 1010
    ##   .. .. ..$ probability: num 95.4
    ##   .. ..$ three_sigma:'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 902 964
    ##   .. .. ..$ end        : num [1:2] 920 1051
    ##   .. .. ..$ probability: num [1:2] 0.4 99.3
    ##   ..$ posterior_probabilities:'data.frame':  63 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:63] 806 810 816 820 826 ...
    ##   .. ..$ probabilities: num [1:63] 0.00 0.00 0.00 3.97e-07 1.27e-06 ...
    ##   ..- attr(*, "class")= chr "oxcAARCalibratedDate"
    ##  $ Tx-56                            :List of 9
    ##   ..$ name                   : chr "Tx-56"
    ##   ..$ type                   : chr "R_Date"
    ##   ..$ bp                     : int 475
    ##   ..$ std                    : int 100
    ##   ..$ cal_curve              :List of 5
    ##   .. ..$ name      : chr " IntCal13 atmospheric curve (Reimer et al 2013)"
    ##   .. ..$ resolution: num 5
    ##   .. ..$ bp        : num [1:10001] 46401 46396 46391 46386 46381 ...
    ##   .. ..$ bc        : num [1:10001] -48050 -48045 -48040 -48035 -48030 ...
    ##   .. ..$ sigma     : num [1:10001] 274 274 274 273 273 ...
    ##   ..$ sigma_ranges           :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   3 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:3] 1316 1390 1596
    ##   .. .. ..$ end        : num [1:3] 1355 1517 1618
    ##   .. .. ..$ probability: num [1:3] 11.5 50.4 6.3
    ##   .. ..$ two_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1297
    ##   .. .. ..$ end        : num 1638
    ##   .. .. ..$ probability: num 95.4
    ##   .. ..$ three_sigma:'data.frame':   3 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:3] 1246 1762 1937
    ##   .. .. ..$ end        : num [1:3] 1682 1804 NA
    ##   .. .. ..$ probability: num [1:3] 99.2 0.4 0.1
    ##   ..$ raw_probabilities      :'data.frame':  190 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:190] 1006 1010 1016 1020 1026 ...
    ##   .. ..$ probabilities: num [1:190] 0.00 0.00 0.00 1.14e-08 2.86e-08 ...
    ##   ..$ posterior_sigma_ranges :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   3 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:3] 1316 1390 1596
    ##   .. .. ..$ end        : num [1:3] 1356 1516 1618
    ##   .. .. ..$ probability: num [1:3] 11.9 49.9 6.4
    ##   .. ..$ two_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1296
    ##   .. .. ..$ end        : num 1638
    ##   .. .. ..$ probability: num 95.4
    ##   .. ..$ three_sigma:'data.frame':   3 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:3] 1252 1762 1934
    ##   .. .. ..$ end        : num [1:3] 1682 1804 1953
    ##   .. .. ..$ probability: num [1:3] 99.1 0.4 0.1
    ##   ..$ posterior_probabilities:'data.frame':  165 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:165] 1146 1150 1156 1160 1166 ...
    ##   .. ..$ probabilities: num [1:165] 0.00 4.19e-07 8.32e-07 1.66e-06 1.66e-06 ...
    ##   ..- attr(*, "class")= chr "oxcAARCalibratedDate"
    ##  $ southern Caddo area              :List of 9
    ##   ..$ name                   : chr "southern Caddo area"
    ##   ..$ type                   : chr "Phase"
    ##   ..$ bp                     : logi NA
    ##   ..$ std                    : logi NA
    ##   ..$ cal_curve              :List of 5
    ##   .. ..$ name      : chr " IntCal13 atmospheric curve (Reimer et al 2013)"
    ##   .. ..$ resolution: num 5
    ##   .. ..$ bp        : num [1:10001] 46401 46396 46391 46386 46381 ...
    ##   .. ..$ bc        : num [1:10001] -48050 -48045 -48040 -48035 -48030 ...
    ##   .. ..$ sigma     : num [1:10001] 274 274 274 273 273 ...
    ##   ..$ sigma_ranges           :List of 3
    ##   .. ..$ one_sigma  : logi NA
    ##   .. ..$ two_sigma  : logi NA
    ##   .. ..$ three_sigma: logi NA
    ##   ..$ raw_probabilities      : logi NA
    ##   ..$ posterior_sigma_ranges :List of 3
    ##   .. ..$ one_sigma  : logi NA
    ##   .. ..$ two_sigma  : logi NA
    ##   .. ..$ three_sigma: logi NA
    ##   ..$ posterior_probabilities: logi NA
    ##   ..- attr(*, "class")= chr "oxcAARCalibratedDate"
    ##  $ end Gahagan bifaces SCA          :List of 9
    ##   ..$ name                   : chr "end Gahagan bifaces SCA"
    ##   ..$ type                   : chr "Boundary"
    ##   ..$ bp                     : logi NA
    ##   ..$ std                    : logi NA
    ##   ..$ cal_curve              :List of 5
    ##   .. ..$ name      : chr " IntCal13 atmospheric curve (Reimer et al 2013)"
    ##   .. ..$ resolution: num 5
    ##   .. ..$ bp        : num [1:10001] 46401 46396 46391 46386 46381 ...
    ##   .. ..$ bc        : num [1:10001] -48050 -48045 -48040 -48035 -48030 ...
    ##   .. ..$ sigma     : num [1:10001] 274 274 274 273 273 ...
    ##   ..$ sigma_ranges           :List of 3
    ##   .. ..$ one_sigma  : logi NA
    ##   .. ..$ two_sigma  : logi NA
    ##   .. ..$ three_sigma: logi NA
    ##   ..$ raw_probabilities      : logi NA
    ##   ..$ posterior_sigma_ranges :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 994
    ##   .. .. ..$ end        : num 1005
    ##   .. .. ..$ probability: num 68.2
    ##   .. ..$ two_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 989
    ##   .. .. ..$ end        : num 1010
    ##   .. .. ..$ probability: num 95.4
    ##   .. ..$ three_sigma:'data.frame':   3 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:3] 906 977 1040
    ##   .. .. ..$ end        : num [1:3] 926 1024 1069
    ##   .. .. ..$ probability: num [1:3] 0.4 99 0.3
    ##   ..$ posterior_probabilities:'data.frame':  47 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:47] 890 896 900 906 910 ...
    ##   .. ..$ probabilities: num [1:47] 0.00 0.00 0.00 3.91e-05 2.57e-04 ...
    ##   ..- attr(*, "class")= chr "oxcAARCalibratedDate"
    ##  $ start Gahagan bifaces CTX        :List of 9
    ##   ..$ name                   : chr "start Gahagan bifaces CTX"
    ##   ..$ type                   : chr "Boundary"
    ##   ..$ bp                     : logi NA
    ##   ..$ std                    : logi NA
    ##   ..$ cal_curve              :List of 5
    ##   .. ..$ name      : chr " IntCal13 atmospheric curve (Reimer et al 2013)"
    ##   .. ..$ resolution: num 5
    ##   .. ..$ bp        : num [1:10001] 46401 46396 46391 46386 46381 ...
    ##   .. ..$ bc        : num [1:10001] -48050 -48045 -48040 -48035 -48030 ...
    ##   .. ..$ sigma     : num [1:10001] 274 274 274 273 273 ...
    ##   ..$ sigma_ranges           :List of 3
    ##   .. ..$ one_sigma  : logi NA
    ##   .. ..$ two_sigma  : logi NA
    ##   .. ..$ three_sigma: logi NA
    ##   ..$ raw_probabilities      : logi NA
    ##   ..$ posterior_sigma_ranges :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 998
    ##   .. .. ..$ end        : num 1009
    ##   .. .. ..$ probability: num 68.2
    ##   .. ..$ two_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 992
    ##   .. .. ..$ end        : num 1015
    ##   .. .. ..$ probability: num 95.4
    ##   .. ..$ three_sigma:'data.frame':   3 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:3] 920 981 1060
    ##   .. .. ..$ end        : num [1:3] 960 1025 1094
    ##   .. .. ..$ probability: num [1:3] 0.4 99.1 0.3
    ##   ..$ posterior_probabilities:'data.frame':  47 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:47] 896 900 906 910 916 ...
    ##   .. ..$ probabilities: num [1:47] 0.00 0.00 0.00 1.71e-05 4.46e-05 ...
    ##   ..- attr(*, "class")= chr "oxcAARCalibratedDate"
    ##  $ Beta-176624                      :List of 9
    ##   ..$ name                   : chr "Beta-176624"
    ##   ..$ type                   : chr "R_Date"
    ##   ..$ bp                     : int 1190
    ##   ..$ std                    : int 50
    ##   ..$ cal_curve              :List of 5
    ##   .. ..$ name      : chr " IntCal13 atmospheric curve (Reimer et al 2013)"
    ##   .. ..$ resolution: num 5
    ##   .. ..$ bp        : num [1:10001] 46401 46396 46391 46386 46381 ...
    ##   .. ..$ bc        : num [1:10001] -48050 -48045 -48040 -48035 -48030 ...
    ##   .. ..$ sigma     : num [1:10001] 274 274 274 273 273 ...
    ##   ..$ sigma_ranges           :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 770 933
    ##   .. .. ..$ end        : num [1:2] 894 937
    ##   .. .. ..$ probability: num [1:2] 66.8 1.4
    ##   .. ..$ two_sigma  :'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 691 762
    ##   .. .. ..$ end        : num [1:2] 750 970
    ##   .. .. ..$ probability: num [1:2] 11.9 83.5
    ##   .. ..$ three_sigma:'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 668
    ##   .. .. ..$ end        : num 993
    ##   .. .. ..$ probability: num 99.7
    ##   ..$ raw_probabilities      :'data.frame':  116 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:116] 590 596 600 606 610 ...
    ##   .. ..$ probabilities: num [1:116] 0.00 0.00 5.56e-09 1.11e-08 2.78e-08 ...
    ##   ..$ posterior_sigma_ranges :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1005
    ##   .. .. ..$ end        : num 1018
    ##   .. .. ..$ probability: num 68.2
    ##   .. ..$ two_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 996
    ##   .. .. ..$ end        : num 1024
    ##   .. .. ..$ probability: num 95.4
    ##   .. ..$ three_sigma:'data.frame':   3 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:3] 944 982 1093
    ##   .. .. ..$ end        : num [1:3] 974 1040 1123
    ##   .. .. ..$ probability: num [1:3] 0.2 99 0.4
    ##   ..$ posterior_probabilities:'data.frame':  55 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:55] 896 900 906 910 916 ...
    ##   .. ..$ probabilities: num [1:55] 0.00 0.00 0.00 2.07e-06 4.15e-06 ...
    ##   ..- attr(*, "class")= chr "oxcAARCalibratedDate"
    ##  $ UGA-12500                        :List of 9
    ##   ..$ name                   : chr "UGA-12500"
    ##   ..$ type                   : chr "R_Date"
    ##   ..$ bp                     : int 1090
    ##   ..$ std                    : int 40
    ##   ..$ cal_curve              :List of 5
    ##   .. ..$ name      : chr " IntCal13 atmospheric curve (Reimer et al 2013)"
    ##   .. ..$ resolution: num 5
    ##   .. ..$ bp        : num [1:10001] 46401 46396 46391 46386 46381 ...
    ##   .. ..$ bc        : num [1:10001] -48050 -48045 -48040 -48035 -48030 ...
    ##   .. ..$ sigma     : num [1:10001] 274 274 274 273 273 ...
    ##   ..$ sigma_ranges           :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 896 940
    ##   .. .. ..$ end        : num [1:2] 928 994
    ##   .. .. ..$ probability: num [1:2] 25.6 42.6
    ##   .. ..$ two_sigma  :'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 780 876
    ##   .. .. ..$ end        : num [1:2] 788 1024
    ##   .. .. ..$ probability: num [1:2] 0.6 94.8
    ##   .. ..$ three_sigma:'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 776
    ##   .. .. ..$ end        : num 1030
    ##   .. .. ..$ probability: num 99.7
    ##   ..$ raw_probabilities      :'data.frame':  104 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:104] 660 666 670 676 680 ...
    ##   .. ..$ probabilities: num [1:104] 0.00 0.00 0.00 9.69e-09 3.87e-08 ...
    ##   ..$ posterior_sigma_ranges :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1004
    ##   .. .. ..$ end        : num 1019
    ##   .. .. ..$ probability: num 68.2
    ##   .. ..$ two_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 996
    ##   .. .. ..$ end        : num 1030
    ##   .. .. ..$ probability: num 95.4
    ##   .. ..$ three_sigma:'data.frame':   3 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:3] 962 1084 1136
    ##   .. .. ..$ end        : num [1:3] 1049 1126 1150
    ##   .. .. ..$ probability: num [1:3] 98.4 1.1 0.2
    ##   ..$ posterior_probabilities:'data.frame':  56 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:56] 900 906 910 916 920 ...
    ##   .. ..$ probabilities: num [1:56] 0.00 0.00 0.00 2.06e-06 3.35e-06 ...
    ##   ..- attr(*, "class")= chr "oxcAARCalibratedDate"
    ##  $ UGA-12509                        :List of 9
    ##   ..$ name                   : chr "UGA-12509"
    ##   ..$ type                   : chr "R_Date"
    ##   ..$ bp                     : int 1090
    ##   ..$ std                    : int 40
    ##   ..$ cal_curve              :List of 5
    ##   .. ..$ name      : chr " IntCal13 atmospheric curve (Reimer et al 2013)"
    ##   .. ..$ resolution: num 5
    ##   .. ..$ bp        : num [1:10001] 46401 46396 46391 46386 46381 ...
    ##   .. ..$ bc        : num [1:10001] -48050 -48045 -48040 -48035 -48030 ...
    ##   .. ..$ sigma     : num [1:10001] 274 274 274 273 273 ...
    ##   ..$ sigma_ranges           :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 896 940
    ##   .. .. ..$ end        : num [1:2] 928 994
    ##   .. .. ..$ probability: num [1:2] 25.6 42.6
    ##   .. ..$ two_sigma  :'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 780 876
    ##   .. .. ..$ end        : num [1:2] 788 1024
    ##   .. .. ..$ probability: num [1:2] 0.6 94.8
    ##   .. ..$ three_sigma:'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 776
    ##   .. .. ..$ end        : num 1030
    ##   .. .. ..$ probability: num 99.7
    ##   ..$ raw_probabilities      :'data.frame':  104 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:104] 660 666 670 676 680 ...
    ##   .. ..$ probabilities: num [1:104] 0.00 0.00 0.00 9.69e-09 3.87e-08 ...
    ##   ..$ posterior_sigma_ranges :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1004
    ##   .. .. ..$ end        : num 1020
    ##   .. .. ..$ probability: num 68.2
    ##   .. ..$ two_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 996
    ##   .. .. ..$ end        : num 1030
    ##   .. .. ..$ probability: num 95.4
    ##   .. ..$ three_sigma:'data.frame':   3 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:3] 966 1084 1134
    ##   .. .. ..$ end        : num [1:3] 1050 1129 1152
    ##   .. .. ..$ probability: num [1:3] 98.3 1.2 0.3
    ##   ..$ posterior_probabilities:'data.frame':  56 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:56] 900 906 910 916 920 ...
    ##   .. ..$ probabilities: num [1:56] 0.00 0.00 0.00 1.64e-06 2.52e-06 ...
    ##   ..- attr(*, "class")= chr "oxcAARCalibratedDate"
    ##  $ UGA-12497                        :List of 9
    ##   ..$ name                   : chr "UGA-12497"
    ##   ..$ type                   : chr "R_Date"
    ##   ..$ bp                     : int 1050
    ##   ..$ std                    : int 40
    ##   ..$ cal_curve              :List of 5
    ##   .. ..$ name      : chr " IntCal13 atmospheric curve (Reimer et al 2013)"
    ##   .. ..$ resolution: num 5
    ##   .. ..$ bp        : num [1:10001] 46401 46396 46391 46386 46381 ...
    ##   .. ..$ bc        : num [1:10001] -48050 -48045 -48040 -48035 -48030 ...
    ##   .. ..$ sigma     : num [1:10001] 274 274 274 273 273 ...
    ##   ..$ sigma_ranges           :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 906 968
    ##   .. .. ..$ end        : num [1:2] 916 1024
    ##   .. .. ..$ probability: num [1:2] 5.4 62.8
    ##   .. ..$ two_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 892
    ##   .. .. ..$ end        : num 1036
    ##   .. .. ..$ probability: num 95.4
    ##   .. ..$ three_sigma:'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 778 866
    ##   .. .. ..$ end        : num [1:2] 790 1155
    ##   .. .. ..$ probability: num [1:2] 0.1 99.6
    ##   ..$ raw_probabilities      :'data.frame':  111 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:111] 680 686 690 696 700 ...
    ##   .. ..$ probabilities: num [1:111] 0.00 0.00 0.00 1.37e-08 1.37e-08 ...
    ##   ..$ posterior_sigma_ranges :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1003
    ##   .. .. ..$ end        : num 1024
    ##   .. .. ..$ probability: num 68.2
    ##   .. ..$ two_sigma  :'data.frame':   3 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:3] 994 1095 1144
    ##   .. .. ..$ end        : num [1:3] 1045 1121 1146
    ##   .. .. ..$ probability: num [1:3] 90.3 4.7 0.4
    ##   .. ..$ three_sigma:'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 989
    ##   .. .. ..$ end        : num 1156
    ##   .. .. ..$ probability: num 99.7
    ##   ..$ posterior_probabilities:'data.frame':  65 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:65] 896 900 906 910 916 ...
    ##   .. ..$ probabilities: num [1:65] 0.00 0.00 0.00 4.26e-07 1.66e-06 ...
    ##   ..- attr(*, "class")= chr "oxcAARCalibratedDate"
    ##  $ UGA-12498                        :List of 9
    ##   ..$ name                   : chr "UGA-12498"
    ##   ..$ type                   : chr "R_Date"
    ##   ..$ bp                     : int 1030
    ##   ..$ std                    : int 40
    ##   ..$ cal_curve              :List of 5
    ##   .. ..$ name      : chr " IntCal13 atmospheric curve (Reimer et al 2013)"
    ##   .. ..$ resolution: num 5
    ##   .. ..$ bp        : num [1:10001] 46401 46396 46391 46386 46381 ...
    ##   .. ..$ bc        : num [1:10001] -48050 -48045 -48040 -48035 -48030 ...
    ##   .. ..$ sigma     : num [1:10001] 274 274 274 273 273 ...
    ##   ..$ sigma_ranges           :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 974
    ##   .. .. ..$ end        : num 1032
    ##   .. .. ..$ probability: num 68.2
    ##   .. ..$ two_sigma  :'data.frame':   4 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:4] 896 940 1087 1138
    ##   .. .. ..$ end        : num [1:4] 928 1049 1124 1150
    ##   .. .. ..$ probability: num [1:4] 7.7 80.1 6.1 1.6
    ##   .. ..$ three_sigma:'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 888
    ##   .. .. ..$ end        : num 1156
    ##   .. .. ..$ probability: num 99.7
    ##   ..$ raw_probabilities      :'data.frame':  106 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:106] 710 716 720 726 730 ...
    ##   .. ..$ probabilities: num [1:106] 0.00 0.00 0.00 1.56e-08 4.67e-08 ...
    ##   ..$ posterior_sigma_ranges :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1000
    ##   .. .. ..$ end        : num 1036
    ##   .. .. ..$ probability: num 68.2
    ##   .. ..$ two_sigma  :'data.frame':   3 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:3] 996 1084 1136
    ##   .. .. ..$ end        : num [1:3] 1050 1127 1152
    ##   .. .. ..$ probability: num [1:3] 78.8 13 3.6
    ##   .. ..$ three_sigma:'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 991
    ##   .. .. ..$ end        : num 1158
    ##   .. .. ..$ probability: num 99.7
    ##   ..$ posterior_probabilities:'data.frame':  65 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:65] 900 906 910 916 920 ...
    ##   .. ..$ probabilities: num [1:65] 0.00 0.00 0.00 3.75e-06 8.31e-07 ...
    ##   ..- attr(*, "class")= chr "oxcAARCalibratedDate"
    ##  $ UGA-12505                        :List of 9
    ##   ..$ name                   : chr "UGA-12505"
    ##   ..$ type                   : chr "R_Date"
    ##   ..$ bp                     : int 990
    ##   ..$ std                    : int 40
    ##   ..$ cal_curve              :List of 5
    ##   .. ..$ name      : chr " IntCal13 atmospheric curve (Reimer et al 2013)"
    ##   .. ..$ resolution: num 5
    ##   .. ..$ bp        : num [1:10001] 46401 46396 46391 46386 46381 ...
    ##   .. ..$ bc        : num [1:10001] -48050 -48045 -48040 -48035 -48030 ...
    ##   .. ..$ sigma     : num [1:10001] 274 274 274 273 273 ...
    ##   ..$ sigma_ranges           :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   3 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:3] 996 1091 1140
    ##   .. .. ..$ end        : num [1:3] 1047 1122 1148
    ##   .. .. ..$ probability: num [1:3] 42.3 21 4.9
    ##   .. ..$ two_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 986
    ##   .. .. ..$ end        : num 1156
    ##   .. .. ..$ probability: num 95.4
    ##   .. ..$ three_sigma:'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 898 944
    ##   .. .. ..$ end        : num [1:2] 924 1188
    ##   .. .. ..$ probability: num [1:2] 0.6 99.1
    ##   ..$ raw_probabilities      :'data.frame':  104 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:104] 760 766 770 776 780 ...
    ##   .. ..$ probabilities: num [1:104] 0.0 0.0 0.0 2.6e-08 3.0e-07 ...
    ##   ..$ posterior_sigma_ranges :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   3 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:3] 1010 1090 1140
    ##   .. .. ..$ end        : num [1:3] 1047 1122 1148
    ##   .. .. ..$ probability: num [1:3] 38.5 24.3 5.4
    ##   .. ..$ two_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1002
    ##   .. .. ..$ end        : num 1155
    ##   .. .. ..$ probability: num 95.4
    ##   .. ..$ three_sigma:'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 992
    ##   .. .. ..$ end        : num 1182
    ##   .. .. ..$ probability: num 99.7
    ##   ..$ posterior_probabilities:'data.frame':  61 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:61] 950 956 960 966 970 ...
    ##   .. ..$ probabilities: num [1:61] 0.00 0.00 0.00 1.25e-06 8.33e-07 ...
    ##   ..- attr(*, "class")= chr "oxcAARCalibratedDate"
    ##  $ UGA-12495                        :List of 9
    ##   ..$ name                   : chr "UGA-12495"
    ##   ..$ type                   : chr "R_Date"
    ##   ..$ bp                     : int 980
    ##   ..$ std                    : int 40
    ##   ..$ cal_curve              :List of 5
    ##   .. ..$ name      : chr " IntCal13 atmospheric curve (Reimer et al 2013)"
    ##   .. ..$ resolution: num 5
    ##   .. ..$ bp        : num [1:10001] 46401 46396 46391 46386 46381 ...
    ##   .. ..$ bc        : num [1:10001] -48050 -48045 -48040 -48035 -48030 ...
    ##   .. ..$ sigma     : num [1:10001] 274 274 274 273 273 ...
    ##   ..$ sigma_ranges           :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   3 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:3] 1016 1084 1136
    ##   .. .. ..$ end        : num [1:3] 1050 1126 1151
    ##   .. .. ..$ probability: num [1:3] 29.4 29.5 9.4
    ##   .. ..$ two_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 992
    ##   .. .. ..$ end        : num 1156
    ##   .. .. ..$ probability: num 95.4
    ##   .. ..$ three_sigma:'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 902 964
    ##   .. .. ..$ end        : num [1:2] 920 1210
    ##   .. .. ..$ probability: num [1:2] 0.2 99.5
    ##   ..$ raw_probabilities      :'data.frame':  103 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:103] 766 770 776 780 786 ...
    ##   .. ..$ probabilities: num [1:103] 0.00 0.00 0.00 8.99e-08 1.46e-07 ...
    ##   ..$ posterior_sigma_ranges :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   3 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:3] 1016 1085 1136
    ##   .. .. ..$ end        : num [1:3] 1050 1125 1150
    ##   .. .. ..$ probability: num [1:3] 30 29.2 9
    ##   .. ..$ two_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1006
    ##   .. .. ..$ end        : num 1156
    ##   .. .. ..$ probability: num 95.4
    ##   .. ..$ three_sigma:'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 994
    ##   .. .. ..$ end        : num 1190
    ##   .. .. ..$ probability: num 99.7
    ##   ..$ posterior_probabilities:'data.frame':  63 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:63] 950 956 960 966 970 ...
    ##   .. ..$ probabilities: num [1:63] 0.00 0.00 0.00 8.32e-07 1.25e-06 ...
    ##   ..- attr(*, "class")= chr "oxcAARCalibratedDate"
    ##  $ Beta-176625                      :List of 9
    ##   ..$ name                   : chr "Beta-176625"
    ##   ..$ type                   : chr "R_Date"
    ##   ..$ bp                     : int 980
    ##   ..$ std                    : int 40
    ##   ..$ cal_curve              :List of 5
    ##   .. ..$ name      : chr " IntCal13 atmospheric curve (Reimer et al 2013)"
    ##   .. ..$ resolution: num 5
    ##   .. ..$ bp        : num [1:10001] 46401 46396 46391 46386 46381 ...
    ##   .. ..$ bc        : num [1:10001] -48050 -48045 -48040 -48035 -48030 ...
    ##   .. ..$ sigma     : num [1:10001] 274 274 274 273 273 ...
    ##   ..$ sigma_ranges           :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   3 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:3] 1016 1084 1136
    ##   .. .. ..$ end        : num [1:3] 1050 1126 1151
    ##   .. .. ..$ probability: num [1:3] 29.4 29.5 9.4
    ##   .. ..$ two_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 992
    ##   .. .. ..$ end        : num 1156
    ##   .. .. ..$ probability: num 95.4
    ##   .. ..$ three_sigma:'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 902 964
    ##   .. .. ..$ end        : num [1:2] 920 1210
    ##   .. .. ..$ probability: num [1:2] 0.2 99.5
    ##   ..$ raw_probabilities      :'data.frame':  103 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:103] 766 770 776 780 786 ...
    ##   .. ..$ probabilities: num [1:103] 0.00 0.00 0.00 8.99e-08 1.46e-07 ...
    ##   ..$ posterior_sigma_ranges :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   3 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:3] 1016 1085 1137
    ##   .. .. ..$ end        : num [1:3] 1050 1126 1150
    ##   .. .. ..$ probability: num [1:3] 29.8 29.6 8.8
    ##   .. ..$ two_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1006
    ##   .. .. ..$ end        : num 1156
    ##   .. .. ..$ probability: num 95.4
    ##   .. ..$ three_sigma:'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 994
    ##   .. .. ..$ end        : num 1192
    ##   .. .. ..$ probability: num 99.7
    ##   ..$ posterior_probabilities:'data.frame':  61 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:61] 956 960 966 970 976 ...
    ##   .. ..$ probabilities: num [1:61] 0.00 0.00 0.00 1.25e-06 8.34e-07 ...
    ##   ..- attr(*, "class")= chr "oxcAARCalibratedDate"
    ##  $ Beta-176623                      :List of 9
    ##   ..$ name                   : chr "Beta-176623"
    ##   ..$ type                   : chr "R_Date"
    ##   ..$ bp                     : int 970
    ##   ..$ std                    : int 40
    ##   ..$ cal_curve              :List of 5
    ##   .. ..$ name      : chr " IntCal13 atmospheric curve (Reimer et al 2013)"
    ##   .. ..$ resolution: num 5
    ##   .. ..$ bp        : num [1:10001] 46401 46396 46391 46386 46381 ...
    ##   .. ..$ bc        : num [1:10001] -48050 -48045 -48040 -48035 -48030 ...
    ##   .. ..$ sigma     : num [1:10001] 274 274 274 273 273 ...
    ##   ..$ sigma_ranges           :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   3 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:3] 1020 1084 1136
    ##   .. .. ..$ end        : num [1:3] 1050 1126 1151
    ##   .. .. ..$ probability: num [1:3] 25.4 32.3 10.5
    ##   .. ..$ two_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 996
    ##   .. .. ..$ end        : num 1160
    ##   .. .. ..$ probability: num 95.4
    ##   .. ..$ three_sigma:'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 972
    ##   .. .. ..$ end        : num 1212
    ##   .. .. ..$ probability: num 99.7
    ##   ..$ raw_probabilities      :'data.frame':  104 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:104] 766 770 776 780 786 ...
    ##   .. ..$ probabilities: num [1:104] 0.00 0.00 0.00 1.97e-08 3.94e-08 ...
    ##   ..$ posterior_sigma_ranges :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   3 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:3] 1020 1084 1136
    ##   .. .. ..$ end        : num [1:3] 1050 1126 1150
    ##   .. .. ..$ probability: num [1:3] 25.2 32.9 10
    ##   .. ..$ two_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1012
    ##   .. .. ..$ end        : num 1159
    ##   .. .. ..$ probability: num 95.4
    ##   .. ..$ three_sigma:'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 996
    ##   .. .. ..$ end        : num 1206
    ##   .. .. ..$ probability: num 99.7
    ##   ..$ posterior_probabilities:'data.frame':  66 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:66] 936 940 946 950 956 ...
    ##   .. ..$ probabilities: num [1:66] 0.00 0.00 0.00 1.25e-06 4.20e-07 ...
    ##   ..- attr(*, "class")= chr "oxcAARCalibratedDate"
    ##  $ UGA-12494                        :List of 9
    ##   ..$ name                   : chr "UGA-12494"
    ##   ..$ type                   : chr "R_Date"
    ##   ..$ bp                     : int 970
    ##   ..$ std                    : int 40
    ##   ..$ cal_curve              :List of 5
    ##   .. ..$ name      : chr " IntCal13 atmospheric curve (Reimer et al 2013)"
    ##   .. ..$ resolution: num 5
    ##   .. ..$ bp        : num [1:10001] 46401 46396 46391 46386 46381 ...
    ##   .. ..$ bc        : num [1:10001] -48050 -48045 -48040 -48035 -48030 ...
    ##   .. ..$ sigma     : num [1:10001] 274 274 274 273 273 ...
    ##   ..$ sigma_ranges           :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   3 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:3] 1020 1084 1136
    ##   .. .. ..$ end        : num [1:3] 1050 1126 1151
    ##   .. .. ..$ probability: num [1:3] 25.4 32.3 10.5
    ##   .. ..$ two_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 996
    ##   .. .. ..$ end        : num 1160
    ##   .. .. ..$ probability: num 95.4
    ##   .. ..$ three_sigma:'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 972
    ##   .. .. ..$ end        : num 1212
    ##   .. .. ..$ probability: num 99.7
    ##   ..$ raw_probabilities      :'data.frame':  104 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:104] 766 770 776 780 786 ...
    ##   .. ..$ probabilities: num [1:104] 0.00 0.00 0.00 1.97e-08 3.94e-08 ...
    ##   ..$ posterior_sigma_ranges :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   3 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:3] 1020 1085 1136
    ##   .. .. ..$ end        : num [1:3] 1050 1126 1150
    ##   .. .. ..$ probability: num [1:3] 25.6 32.4 10.2
    ##   .. ..$ two_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1012
    ##   .. .. ..$ end        : num 1159
    ##   .. .. ..$ probability: num 95.4
    ##   .. ..$ three_sigma:'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 996
    ##   .. .. ..$ end        : num 1206
    ##   .. .. ..$ probability: num 99.7
    ##   ..$ posterior_probabilities:'data.frame':  67 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:67] 936 940 946 950 956 ...
    ##   .. ..$ probabilities: num [1:67] 0.00 0.00 0.00 4.15e-07 0.00 ...
    ##   ..- attr(*, "class")= chr "oxcAARCalibratedDate"
    ##  $ UGA-12503                        :List of 9
    ##   ..$ name                   : chr "UGA-12503"
    ##   ..$ type                   : chr "R_Date"
    ##   ..$ bp                     : int 950
    ##   ..$ std                    : int 40
    ##   ..$ cal_curve              :List of 5
    ##   .. ..$ name      : chr " IntCal13 atmospheric curve (Reimer et al 2013)"
    ##   .. ..$ resolution: num 5
    ##   .. ..$ bp        : num [1:10001] 46401 46396 46391 46386 46381 ...
    ##   .. ..$ bc        : num [1:10001] -48050 -48045 -48040 -48035 -48030 ...
    ##   .. ..$ sigma     : num [1:10001] 274 274 274 273 273 ...
    ##   ..$ sigma_ranges           :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 1028 1082
    ##   .. .. ..$ end        : num [1:2] 1052 1152
    ##   .. .. ..$ probability: num [1:2] 17.1 51.1
    ##   .. ..$ two_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1016
    ##   .. .. ..$ end        : num 1184
    ##   .. .. ..$ probability: num 95.4
    ##   .. ..$ three_sigma:'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 989
    ##   .. .. ..$ end        : num 1215
    ##   .. .. ..$ probability: num 99.7
    ##   ..$ raw_probabilities      :'data.frame':  85 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:85] 870 876 880 886 890 ...
    ##   .. ..$ probabilities: num [1:85] 0.00 0.00 7.97e-09 1.59e-08 1.19e-07 ...
    ##   ..$ posterior_sigma_ranges :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 1029 1082
    ##   .. .. ..$ end        : num [1:2] 1052 1152
    ##   .. .. ..$ probability: num [1:2] 16.7 51.5
    ##   .. ..$ two_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1016
    ##   .. .. ..$ end        : num 1170
    ##   .. .. ..$ probability: num 95.4
    ##   .. ..$ three_sigma:'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1002
    ##   .. .. ..$ end        : num 1214
    ##   .. .. ..$ probability: num 99.7
    ##   ..$ posterior_probabilities:'data.frame':  66 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:66] 956 960 966 970 976 ...
    ##   .. ..$ probabilities: num [1:66] 0.00 0.00 0.00 4.13e-07 0.00 ...
    ##   ..- attr(*, "class")= chr "oxcAARCalibratedDate"
    ##  $ UGA-12499                        :List of 9
    ##   ..$ name                   : chr "UGA-12499"
    ##   ..$ type                   : chr "R_Date"
    ##   ..$ bp                     : int 920
    ##   ..$ std                    : int 40
    ##   ..$ cal_curve              :List of 5
    ##   .. ..$ name      : chr " IntCal13 atmospheric curve (Reimer et al 2013)"
    ##   .. ..$ resolution: num 5
    ##   .. ..$ bp        : num [1:10001] 46401 46396 46391 46386 46381 ...
    ##   .. ..$ bc        : num [1:10001] -48050 -48045 -48040 -48035 -48030 ...
    ##   .. ..$ sigma     : num [1:10001] 274 274 274 273 273 ...
    ##   ..$ sigma_ranges           :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 1043 1118
    ##   .. .. ..$ end        : num [1:2] 1106 1159
    ##   .. .. ..$ probability: num [1:2] 41.6 26.6
    ##   .. ..$ two_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1026
    ##   .. .. ..$ end        : num 1206
    ##   .. .. ..$ probability: num 95.4
    ##   .. ..$ three_sigma:'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1014
    ##   .. .. ..$ end        : num 1250
    ##   .. .. ..$ probability: num 99.7
    ##   ..$ raw_probabilities      :'data.frame':  84 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:84] 880 886 890 896 900 ...
    ##   .. ..$ probabilities: num [1:84] 0.00 0.00 0.00 2.09e-08 1.26e-07 ...
    ##   ..$ posterior_sigma_ranges :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 1043 1118
    ##   .. .. ..$ end        : num [1:2] 1106 1159
    ##   .. .. ..$ probability: num [1:2] 41.3 26.9
    ##   .. ..$ two_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1026
    ##   .. .. ..$ end        : num 1206
    ##   .. .. ..$ probability: num 95.4
    ##   .. ..$ three_sigma:'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 1014 1232
    ##   .. .. ..$ end        : num [1:2] 1226 1246
    ##   .. .. ..$ probability: num [1:2] 99.5 0.2
    ##   ..$ posterior_probabilities:'data.frame':  62 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:62] 976 980 986 990 996 ...
    ##   .. ..$ probabilities: num [1:62] 0.00 0.00 0.00 4.15e-07 3.75e-06 ...
    ##   ..- attr(*, "class")= chr "oxcAARCalibratedDate"
    ##  $ Beta-176620                      :List of 9
    ##   ..$ name                   : chr "Beta-176620"
    ##   ..$ type                   : chr "R_Date"
    ##   ..$ bp                     : int 910
    ##   ..$ std                    : int 40
    ##   ..$ cal_curve              :List of 5
    ##   .. ..$ name      : chr " IntCal13 atmospheric curve (Reimer et al 2013)"
    ##   .. ..$ resolution: num 5
    ##   .. ..$ bp        : num [1:10001] 46401 46396 46391 46386 46381 ...
    ##   .. ..$ bc        : num [1:10001] -48050 -48045 -48040 -48035 -48030 ...
    ##   .. ..$ sigma     : num [1:10001] 274 274 274 273 273 ...
    ##   ..$ sigma_ranges           :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 1043 1118
    ##   .. .. ..$ end        : num [1:2] 1106 1165
    ##   .. .. ..$ probability: num [1:2] 39.6 28.6
    ##   .. ..$ two_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1030
    ##   .. .. ..$ end        : num 1210
    ##   .. .. ..$ probability: num 95.4
    ##   .. ..$ three_sigma:'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1018
    ##   .. .. ..$ end        : num 1250
    ##   .. .. ..$ probability: num 99.7
    ##   ..$ raw_probabilities      :'data.frame':  83 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:83] 886 890 896 900 906 ...
    ##   .. ..$ probabilities: num [1:83] 0.00 0.00 7.09e-09 4.26e-08 1.42e-07 ...
    ##   ..$ posterior_sigma_ranges :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 1042 1116
    ##   .. .. ..$ end        : num [1:2] 1106 1166
    ##   .. .. ..$ probability: num [1:2] 39 29.2
    ##   .. ..$ two_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1030
    ##   .. .. ..$ end        : num 1210
    ##   .. .. ..$ probability: num 95.4
    ##   .. ..$ three_sigma:'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1018
    ##   .. .. ..$ end        : num 1250
    ##   .. .. ..$ probability: num 99.7
    ##   ..$ posterior_probabilities:'data.frame':  62 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:62] 980 986 990 996 1000 ...
    ##   .. ..$ probabilities: num [1:62] 0.00 0.00 0.00 3.34e-06 1.50e-05 ...
    ##   ..- attr(*, "class")= chr "oxcAARCalibratedDate"
    ##  $ Beta-176627                      :List of 9
    ##   ..$ name                   : chr "Beta-176627"
    ##   ..$ type                   : chr "R_Date"
    ##   ..$ bp                     : int 890
    ##   ..$ std                    : int 40
    ##   ..$ cal_curve              :List of 5
    ##   .. ..$ name      : chr " IntCal13 atmospheric curve (Reimer et al 2013)"
    ##   .. ..$ resolution: num 5
    ##   .. ..$ bp        : num [1:10001] 46401 46396 46391 46386 46381 ...
    ##   .. ..$ bc        : num [1:10001] -48050 -48045 -48040 -48035 -48030 ...
    ##   .. ..$ sigma     : num [1:10001] 274 274 274 273 273 ...
    ##   ..$ sigma_ranges           :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   3 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:3] 1049 1124 1150
    ##   .. .. ..$ end        : num [1:3] 1086 1138 1209
    ##   .. .. ..$ probability: num [1:3] 23.4 7.2 37.5
    ##   .. ..$ two_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1034
    ##   .. .. ..$ end        : num 1220
    ##   .. .. ..$ probability: num 95.4
    ##   .. ..$ three_sigma:'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1024
    ##   .. .. ..$ end        : num 1258
    ##   .. .. ..$ probability: num 99.7
    ##   ..$ raw_probabilities      :'data.frame':  84 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:84] 890 896 900 906 910 ...
    ##   .. ..$ probabilities: num [1:84] 0.00 0.00 7.67e-09 1.53e-08 2.30e-08 ...
    ##   ..$ posterior_sigma_ranges :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   3 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:3] 1050 1125 1150
    ##   .. .. ..$ end        : num [1:3] 1086 1137 1208
    ##   .. .. ..$ probability: num [1:3] 23.2 6.8 38.2
    ##   .. ..$ two_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1035
    ##   .. .. ..$ end        : num 1220
    ##   .. .. ..$ probability: num 95.4
    ##   .. ..$ three_sigma:'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1024
    ##   .. .. ..$ end        : num 1258
    ##   .. .. ..$ probability: num 99.7
    ##   ..$ posterior_probabilities:'data.frame':  61 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:61] 986 990 996 1000 1006 ...
    ##   .. ..$ probabilities: num [1:61] 0.00 0.00 0.00 5.83e-06 1.04e-05 ...
    ##   ..- attr(*, "class")= chr "oxcAARCalibratedDate"
    ##  $ Beta-176628                      :List of 9
    ##   ..$ name                   : chr "Beta-176628"
    ##   ..$ type                   : chr "R_Date"
    ##   ..$ bp                     : int 880
    ##   ..$ std                    : int 40
    ##   ..$ cal_curve              :List of 5
    ##   .. ..$ name      : chr " IntCal13 atmospheric curve (Reimer et al 2013)"
    ##   .. ..$ resolution: num 5
    ##   .. ..$ bp        : num [1:10001] 46401 46396 46391 46386 46381 ...
    ##   .. ..$ bc        : num [1:10001] -48050 -48045 -48040 -48035 -48030 ...
    ##   .. ..$ sigma     : num [1:10001] 274 274 274 273 273 ...
    ##   ..$ sigma_ranges           :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   3 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:3] 1050 1127 1152
    ##   .. .. ..$ end        : num [1:3] 1083 1136 1216
    ##   .. .. ..$ probability: num [1:3] 18.6 4 45.6
    ##   .. ..$ two_sigma  :'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 1036 1232
    ##   .. .. ..$ end        : num [1:2] 1226 1245
    ##   .. .. ..$ probability: num [1:2] 93.3 2.1
    ##   .. ..$ three_sigma:'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1026
    ##   .. .. ..$ end        : num 1262
    ##   .. .. ..$ probability: num 99.7
    ##   ..$ raw_probabilities      :'data.frame':  83 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:83] 896 900 906 910 916 ...
    ##   .. ..$ probabilities: num [1:83] 0.00 0.00 8.14e-09 8.14e-09 8.14e-09 ...
    ##   ..$ posterior_sigma_ranges :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   3 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:3] 1050 1126 1150
    ##   .. .. ..$ end        : num [1:3] 1085 1136 1217
    ##   .. .. ..$ probability: num [1:3] 19.1 4.2 44.9
    ##   .. ..$ two_sigma  :'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 1037 1234
    ##   .. .. ..$ end        : num [1:2] 1226 1242
    ##   .. .. ..$ probability: num [1:2] 94 1.4
    ##   .. ..$ three_sigma:'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1026
    ##   .. .. ..$ end        : num 1262
    ##   .. .. ..$ probability: num 99.7
    ##   ..$ posterior_probabilities:'data.frame':  60 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:60] 1000 1006 1010 1016 1020 ...
    ##   .. ..$ probabilities: num [1:60] 0.00 4.20e-07 2.50e-06 5.41e-06 5.79e-05 ...
    ##   ..- attr(*, "class")= chr "oxcAARCalibratedDate"
    ##  $ UGA-12493                        :List of 9
    ##   ..$ name                   : chr "UGA-12493"
    ##   ..$ type                   : chr "R_Date"
    ##   ..$ bp                     : int 860
    ##   ..$ std                    : int 40
    ##   ..$ cal_curve              :List of 5
    ##   .. ..$ name      : chr " IntCal13 atmospheric curve (Reimer et al 2013)"
    ##   .. ..$ resolution: num 5
    ##   .. ..$ bp        : num [1:10001] 46401 46396 46391 46386 46381 ...
    ##   .. ..$ bc        : num [1:10001] -48050 -48045 -48040 -48035 -48030 ...
    ##   .. ..$ sigma     : num [1:10001] 274 274 274 273 273 ...
    ##   ..$ sigma_ranges           :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   3 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:3] 1058 1154 1238
    ##   .. .. ..$ end        : num [1:3] 1076 1224 1241
    ##   .. .. ..$ probability: num [1:3] 7.9 59.2 1
    ##   .. ..$ two_sigma  :'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 1045 1120
    ##   .. .. ..$ end        : num [1:2] 1098 1260
    ##   .. .. ..$ probability: num [1:2] 16.8 78.6
    ##   .. ..$ three_sigma:'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1030
    ##   .. .. ..$ end        : num 1270
    ##   .. .. ..$ probability: num 99.7
    ##   ..$ raw_probabilities      :'data.frame':  86 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:86] 970 976 980 986 990 ...
    ##   .. ..$ probabilities: num [1:86] 0.00 0.00 9.25e-09 1.85e-08 1.48e-07 ...
    ##   ..$ posterior_sigma_ranges :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   3 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:3] 1058 1154 1238
    ##   .. .. ..$ end        : num [1:3] 1076 1225 1242
    ##   .. .. ..$ probability: num [1:3] 7.8 59 1.4
    ##   .. ..$ two_sigma  :'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 1045 1119
    ##   .. .. ..$ end        : num [1:2] 1096 1261
    ##   .. .. ..$ probability: num [1:2] 16.2 79.2
    ##   .. ..$ three_sigma:'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1030
    ##   .. .. ..$ end        : num 1270
    ##   .. .. ..$ probability: num 99.7
    ##   ..$ posterior_probabilities:'data.frame':  58 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:58] 1006 1010 1016 1020 1026 ...
    ##   .. ..$ probabilities: num [1:58] 0.00 8.29e-07 2.08e-06 1.33e-05 9.08e-05 ...
    ##   ..- attr(*, "class")= chr "oxcAARCalibratedDate"
    ##  $ Beta-176630                      :List of 9
    ##   ..$ name                   : chr "Beta-176630"
    ##   ..$ type                   : chr "R_Date"
    ##   ..$ bp                     : int 710
    ##   ..$ std                    : int 40
    ##   ..$ cal_curve              :List of 5
    ##   .. ..$ name      : chr " IntCal13 atmospheric curve (Reimer et al 2013)"
    ##   .. ..$ resolution: num 5
    ##   .. ..$ bp        : num [1:10001] 46401 46396 46391 46386 46381 ...
    ##   .. ..$ bc        : num [1:10001] -48050 -48045 -48040 -48035 -48030 ...
    ##   .. ..$ sigma     : num [1:10001] 274 274 274 273 273 ...
    ##   ..$ sigma_ranges           :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 1262 1370
    ##   .. .. ..$ end        : num [1:2] 1300 1380
    ##   .. .. ..$ probability: num [1:2] 60.5 7.7
    ##   .. ..$ two_sigma  :'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 1224 1356
    ##   .. .. ..$ end        : num [1:2] 1316 1390
    ##   .. .. ..$ probability: num [1:2] 77.7 17.7
    ##   .. ..$ three_sigma:'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1211
    ##   .. .. ..$ end        : num 1400
    ##   .. .. ..$ probability: num 99.7
    ##   ..$ raw_probabilities      :'data.frame':  82 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:82] 1036 1040 1046 1050 1056 ...
    ##   .. ..$ probabilities: num [1:82] 0.00 0.00 0.00 4.98e-08 1.49e-07 ...
    ##   ..$ posterior_sigma_ranges :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1266
    ##   .. .. ..$ end        : num 1296
    ##   .. .. ..$ probability: num 68.2
    ##   .. ..$ two_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1224
    ##   .. .. ..$ end        : num 1312
    ##   .. .. ..$ probability: num 95.4
    ##   .. ..$ three_sigma:'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 1206 1342
    ##   .. .. ..$ end        : num [1:2] 1330 1390
    ##   .. .. ..$ probability: num [1:2] 97.6 2.1
    ##   ..$ posterior_probabilities:'data.frame':  53 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:53] 1150 1156 1160 1166 1170 ...
    ##   .. ..$ probabilities: num [1:53] 0.00 0.00 2.49e-06 1.38e-05 2.62e-05 ...
    ##   ..- attr(*, "class")= chr "oxcAARCalibratedDate"
    ##  $ D-AMS 035170                     :List of 9
    ##   ..$ name                   : chr "D-AMS 035170"
    ##   ..$ type                   : chr "R_Date"
    ##   ..$ bp                     : int 667
    ##   ..$ std                    : int 24
    ##   ..$ cal_curve              :List of 5
    ##   .. ..$ name      : chr " IntCal13 atmospheric curve (Reimer et al 2013)"
    ##   .. ..$ resolution: num 5
    ##   .. ..$ bp        : num [1:10001] 46401 46396 46391 46386 46381 ...
    ##   .. ..$ bc        : num [1:10001] -48050 -48045 -48040 -48035 -48030 ...
    ##   .. ..$ sigma     : num [1:10001] 274 274 274 273 273 ...
    ##   ..$ sigma_ranges           :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 1284 1367
    ##   .. .. ..$ end        : num [1:2] 1302 1383
    ##   .. .. ..$ probability: num [1:2] 38.2 30
    ##   .. ..$ two_sigma  :'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 1278 1356
    ##   .. .. ..$ end        : num [1:2] 1316 1390
    ##   .. .. ..$ probability: num [1:2] 52.2 43.2
    ##   .. ..$ three_sigma:'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 1270 1342
    ##   .. .. ..$ end        : num [1:2] 1328 1396
    ##   .. .. ..$ probability: num [1:2] 54.3 45.4
    ##   ..$ raw_probabilities      :'data.frame':  44 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:44] 1210 1216 1220 1226 1230 ...
    ##   .. ..$ probabilities: num [1:44] 0.00 0.00 0.00 2.46e-08 7.38e-08 ...
    ##   ..$ posterior_sigma_ranges :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1284
    ##   .. .. ..$ end        : num 1302
    ##   .. .. ..$ probability: num 68.2
    ##   .. ..$ two_sigma  :'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 1275 1369
    ##   .. .. ..$ end        : num [1:2] 1318 1377
    ##   .. .. ..$ probability: num [1:2] 93.6 1.8
    ##   .. ..$ three_sigma:'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 1268 1348
    ##   .. .. ..$ end        : num [1:2] 1326 1390
    ##   .. .. ..$ probability: num [1:2] 94.5 5.2
    ##   ..$ posterior_probabilities:'data.frame':  34 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:34] 1246 1250 1256 1260 1266 ...
    ##   .. ..$ probabilities: num [1:34] 0.00 0.00 4.03e-07 7.92e-06 6.71e-05 ...
    ##   ..- attr(*, "class")= chr "oxcAARCalibratedDate"
    ##  $ D-AMS 035169                     :List of 9
    ##   ..$ name                   : chr "D-AMS 035169"
    ##   ..$ type                   : chr "R_Date"
    ##   ..$ bp                     : int 648
    ##   ..$ std                    : int 22
    ##   ..$ cal_curve              :List of 5
    ##   .. ..$ name      : chr " IntCal13 atmospheric curve (Reimer et al 2013)"
    ##   .. ..$ resolution: num 5
    ##   .. ..$ bp        : num [1:10001] 46401 46396 46391 46386 46381 ...
    ##   .. ..$ bc        : num [1:10001] -48050 -48045 -48040 -48035 -48030 ...
    ##   .. ..$ sigma     : num [1:10001] 274 274 274 273 273 ...
    ##   ..$ sigma_ranges           :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 1291 1362
    ##   .. .. ..$ end        : num [1:2] 1309 1386
    ##   .. .. ..$ probability: num [1:2] 27.3 40.9
    ##   .. ..$ two_sigma  :'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 1284 1350
    ##   .. .. ..$ end        : num [1:2] 1320 1392
    ##   .. .. ..$ probability: num [1:2] 41.6 53.8
    ##   .. ..$ three_sigma:'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 1278 1337
    ##   .. .. ..$ end        : num [1:2] 1332 1399
    ##   .. .. ..$ probability: num [1:2] 43.6 56.1
    ##   ..$ raw_probabilities      :'data.frame':  37 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:37] 1250 1256 1260 1266 1270 ...
    ##   .. ..$ probabilities: num [1:37] 0.00 0.00 1.88e-08 3.20e-07 4.27e-06 ...
    ##   ..$ posterior_sigma_ranges :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1288
    ##   .. .. ..$ end        : num 1309
    ##   .. .. ..$ probability: num 68.2
    ##   .. ..$ two_sigma  :'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 1280 1360
    ##   .. .. ..$ end        : num [1:2] 1323 1376
    ##   .. .. ..$ probability: num [1:2] 91.7 3.7
    ##   .. ..$ three_sigma:'data.frame':   2 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:2] 1276 1341
    ##   .. .. ..$ end        : num [1:2] 1332 1391
    ##   .. .. ..$ probability: num [1:2] 92.5 7.2
    ##   ..$ posterior_probabilities:'data.frame':  32 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:32] 1256 1260 1266 1270 1276 ...
    ##   .. ..$ probabilities: num [1:32] 0.00 0.00 8.48e-07 1.96e-05 1.79e-04 ...
    ##   ..- attr(*, "class")= chr "oxcAARCalibratedDate"
    ##  $ D-AMS 035290                     :List of 9
    ##   ..$ name                   : chr "D-AMS 035290"
    ##   ..$ type                   : chr "R_Date"
    ##   ..$ bp                     : int 624
    ##   ..$ std                    : int 28
    ##   ..$ cal_curve              :List of 5
    ##   .. ..$ name      : chr " IntCal13 atmospheric curve (Reimer et al 2013)"
    ##   .. ..$ resolution: num 5
    ##   .. ..$ bp        : num [1:10001] 46401 46396 46391 46386 46381 ...
    ##   .. ..$ bc        : num [1:10001] -48050 -48045 -48040 -48035 -48030 ...
    ##   .. ..$ sigma     : num [1:10001] 274 274 274 273 273 ...
    ##   ..$ sigma_ranges           :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   3 obs. of  3 variables:
    ##   .. .. ..$ start      : num [1:3] 1299 1350 1378
    ##   .. .. ..$ end        : num [1:3] 1320 1372 1392
    ##   .. .. ..$ probability: num [1:3] 26.6 26.4 15.2
    ##   .. ..$ two_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1290
    ##   .. .. ..$ end        : num 1400
    ##   .. .. ..$ probability: num 95.4
    ##   .. ..$ three_sigma:'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1282
    ##   .. .. ..$ end        : num 1410
    ##   .. .. ..$ probability: num 99.7
    ##   ..$ raw_probabilities      :'data.frame':  42 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:42] 1246 1250 1256 1260 1266 ...
    ##   .. ..$ probabilities: num [1:42] 0.00 0.00 0.00 1.27e-08 2.91e-07 ...
    ##   ..$ posterior_sigma_ranges :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1292
    ##   .. .. ..$ end        : num 1317
    ##   .. .. ..$ probability: num 68.2
    ##   .. ..$ two_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1282
    ##   .. .. ..$ end        : num 1366
    ##   .. .. ..$ probability: num 95.4
    ##   .. ..$ three_sigma:'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1278
    ##   .. .. ..$ end        : num 1392
    ##   .. .. ..$ probability: num 99.7
    ##   ..$ posterior_probabilities:'data.frame':  34 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:34] 1256 1260 1266 1270 1276 ...
    ##   .. ..$ probabilities: num [1:34] 0.00 0.00 4.16e-06 1.21e-05 1.03e-04 ...
    ##   ..- attr(*, "class")= chr "oxcAARCalibratedDate"
    ##  $ central Texas                    :List of 9
    ##   ..$ name                   : chr "central Texas"
    ##   ..$ type                   : chr "Phase"
    ##   ..$ bp                     : logi NA
    ##   ..$ std                    : logi NA
    ##   ..$ cal_curve              :List of 5
    ##   .. ..$ name      : chr " IntCal13 atmospheric curve (Reimer et al 2013)"
    ##   .. ..$ resolution: num 5
    ##   .. ..$ bp        : num [1:10001] 46401 46396 46391 46386 46381 ...
    ##   .. ..$ bc        : num [1:10001] -48050 -48045 -48040 -48035 -48030 ...
    ##   .. ..$ sigma     : num [1:10001] 274 274 274 273 273 ...
    ##   ..$ sigma_ranges           :List of 3
    ##   .. ..$ one_sigma  : logi NA
    ##   .. ..$ two_sigma  : logi NA
    ##   .. ..$ three_sigma: logi NA
    ##   ..$ raw_probabilities      : logi NA
    ##   ..$ posterior_sigma_ranges :List of 3
    ##   .. ..$ one_sigma  : logi NA
    ##   .. ..$ two_sigma  : logi NA
    ##   .. ..$ three_sigma: logi NA
    ##   ..$ posterior_probabilities: logi NA
    ##   ..- attr(*, "class")= chr "oxcAARCalibratedDate"
    ##  $ end Ghagan Bifaces CTX           :List of 9
    ##   ..$ name                   : chr "end Ghagan Bifaces CTX"
    ##   ..$ type                   : chr "Boundary"
    ##   ..$ bp                     : logi NA
    ##   ..$ std                    : logi NA
    ##   ..$ cal_curve              :List of 5
    ##   .. ..$ name      : chr " IntCal13 atmospheric curve (Reimer et al 2013)"
    ##   .. ..$ resolution: num 5
    ##   .. ..$ bp        : num [1:10001] 46401 46396 46391 46386 46381 ...
    ##   .. ..$ bc        : num [1:10001] -48050 -48045 -48040 -48035 -48030 ...
    ##   .. ..$ sigma     : num [1:10001] 274 274 274 273 273 ...
    ##   ..$ sigma_ranges           :List of 3
    ##   .. ..$ one_sigma  : logi NA
    ##   .. ..$ two_sigma  : logi NA
    ##   .. ..$ three_sigma: logi NA
    ##   ..$ raw_probabilities      : logi NA
    ##   ..$ posterior_sigma_ranges :List of 3
    ##   .. ..$ one_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1300
    ##   .. .. ..$ end        : num 1336
    ##   .. .. ..$ probability: num 68.2
    ##   .. ..$ two_sigma  :'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1294
    ##   .. .. ..$ end        : num 1395
    ##   .. .. ..$ probability: num 95.4
    ##   .. ..$ three_sigma:'data.frame':   1 obs. of  3 variables:
    ##   .. .. ..$ start      : num 1286
    ##   .. .. ..$ end        : num 1444
    ##   .. .. ..$ probability: num 99.7
    ##   ..$ posterior_probabilities:'data.frame':  54 obs. of  2 variables:
    ##   .. ..$ dates        : num [1:54] 1280 1286 1290 1296 1300 ...
    ##   .. ..$ probabilities: num [1:54] 0 0.00003 0.000439 0.002888 0.010534 ...
    ##   ..- attr(*, "class")= chr "oxcAARCalibratedDate"
    ##  $ Gahagan Bifaces                  :List of 9
    ##   ..$ name                   : chr "Gahagan Bifaces"
    ##   ..$ type                   : chr "Sequence"
    ##   ..$ bp                     : logi NA
    ##   ..$ std                    : logi NA
    ##   ..$ cal_curve              :List of 5
    ##   .. ..$ name      : chr " IntCal13 atmospheric curve (Reimer et al 2013)"
    ##   .. ..$ resolution: num 5
    ##   .. ..$ bp        : num [1:10001] 46401 46396 46391 46386 46381 ...
    ##   .. ..$ bc        : num [1:10001] -48050 -48045 -48040 -48035 -48030 ...
    ##   .. ..$ sigma     : num [1:10001] 274 274 274 273 273 ...
    ##   ..$ sigma_ranges           :List of 3
    ##   .. ..$ one_sigma  : logi NA
    ##   .. ..$ two_sigma  : logi NA
    ##   .. ..$ three_sigma: logi NA
    ##   ..$ raw_probabilities      : logi NA
    ##   ..$ posterior_sigma_ranges :List of 3
    ##   .. ..$ one_sigma  : logi NA
    ##   .. ..$ two_sigma  : logi NA
    ##   .. ..$ three_sigma: logi NA
    ##   ..$ posterior_probabilities: logi NA
    ##   ..- attr(*, "class")= chr "oxcAARCalibratedDate"
    ##  $ Contexts yielding Gahagan Bifaces:List of 9
    ##   ..$ name                   : chr "Contexts yielding Gahagan Bifaces"
    ##   ..$ type                   : chr "Phase"
    ##   ..$ bp                     : logi NA
    ##   ..$ std                    : logi NA
    ##   ..$ cal_curve              :List of 5
    ##   .. ..$ name      : chr " IntCal13 atmospheric curve (Reimer et al 2013)"
    ##   .. ..$ resolution: num 5
    ##   .. ..$ bp        : num [1:10001] 46401 46396 46391 46386 46381 ...
    ##   .. ..$ bc        : num [1:10001] -48050 -48045 -48040 -48035 -48030 ...
    ##   .. ..$ sigma     : num [1:10001] 274 274 274 273 273 ...
    ##   ..$ sigma_ranges           :List of 3
    ##   .. ..$ one_sigma  : logi NA
    ##   .. ..$ two_sigma  : logi NA
    ##   .. ..$ three_sigma: logi NA
    ##   ..$ raw_probabilities      : logi NA
    ##   ..$ posterior_sigma_ranges :List of 3
    ##   .. ..$ one_sigma  : logi NA
    ##   .. ..$ two_sigma  : logi NA
    ##   .. ..$ three_sigma: logi NA
    ##   ..$ posterior_probabilities: logi NA
    ##   ..- attr(*, "class")= chr "oxcAARCalibratedDate"
    ##  - attr(*, "class")= chr [1:2] "list" "oxcAARCalibratedDatesList"

``` r
  print(bgahagan_result_data)
```

    ## List of 35 calibrated dates:
    ## 
    ## =============================
    ##  Boundary: start Gahagan Bifaces SCA
    ## =============================
    ## 
    ## 
    ##                                posterior:
    ## 
    ##                                one sigma
    ##                                988 AD - 1002 AD (68.2%)
    ## 
    ##                                two sigma
    ##                                973 AD - 1008 AD (95.4%)
    ## 
    ##                                three sigma
    ##                                893 AD - 924 AD (0.5%)
    ##                                932 AD - 1024 AD (99.2%)
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: Tx-913
    ## =============================
    ## 
    ## 
    ## BP = 1150, std = 80
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      one sigma
    ## 777 AD - 794 AD (6%)           991 AD - 1004 AD (68.2%)
    ## 801 AD - 970 AD (62.2%)        
    ## 
    ## two sigma                      two sigma
    ## 689 AD - 753 AD (9.8%)         980 AD - 1010 AD (95.4%)
    ## 759 AD - 1020 AD (85.6%)       
    ## 
    ## three sigma                    three sigma
    ## 652 AD - 1052 AD (98.9%)       901 AD - 923 AD (0.4%)
    ## 1081 AD - 1152 AD (0.8%)       946 AD - 1033 AD (99.3%)
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: UGA-12296
    ## =============================
    ## 
    ## 
    ## BP = 1000, std = 40
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      one sigma
    ## 989 AD - 1046 AD (51.2%)       992 AD - 1003 AD (68.2%)
    ## 1096 AD - 1120 AD (14.4%)      
    ## 1142 AD - 1147 AD (2.6%)       
    ## 
    ## two sigma                      two sigma
    ## 975 AD - 1155 AD (95.4%)       984 AD - 1010 AD (95.4%)
    ## 
    ## three sigma                    three sigma
    ## 894 AD - 930 AD (1.5%)         903 AD - 918 AD (0.4%)
    ## 938 AD - 1168 AD (98.2%)       968 AD - 1034 AD (99.3%)
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: Tx-1206
    ## =============================
    ## 
    ## 
    ## BP = 986, std = 90
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      one sigma
    ## 978 AD - 1162 AD (68.2%)       978 AD - 1162 AD (68.2%)
    ## 
    ## two sigma                      two sigma
    ## 879 AD - 1254 AD (95.4%)       877 AD - 1254 AD (95.4%)
    ## 
    ## three sigma                    three sigma
    ## 722 AD - 740 AD (0.1%)         721 AD - 741 AD (0.1%)
    ## 767 AD - 1278 AD (99.6%)       766 AD - 1280 AD (99.6%)
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: ISGS-A0466
    ## =============================
    ## 
    ## 
    ## BP = 950, std = 40
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      one sigma
    ## 1028 AD - 1052 AD (17.1%)      992 AD - 1003 AD (68.2%)
    ## 1082 AD - 1152 AD (51.1%)      
    ## 
    ## two sigma                      two sigma
    ## 1016 AD - 1184 AD (95.4%)      986 AD - 1009 AD (95.4%)
    ## 
    ## three sigma                    three sigma
    ## 989 AD - 1215 AD (99.7%)       903 AD - 918 AD (0.4%)
    ##                                972 AD - 1045 AD (99.3%)
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: ISGS-A0465
    ## =============================
    ## 
    ## 
    ## BP = 910, std = 35
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      one sigma
    ## 1044 AD - 1103 AD (39.5%)      992 AD - 1002 AD (68.2%)
    ## 1119 AD - 1164 AD (28.7%)      
    ## 
    ## two sigma                      two sigma
    ## 1032 AD - 1206 AD (95.4%)      986 AD - 1008 AD (95.4%)
    ## 
    ## three sigma                    three sigma
    ## 1020 AD - 1225 AD (99.7%)      903 AD - 918 AD (0.5%)
    ##                                974 AD - 1020 AD (99%)
    ##                                1030 AD - 1051 AD (0.2%)
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Combine: Log 1
    ## =============================
    ## 
    ## 
    ## BP = 884, std = 77
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      one sigma
    ## 1044 AD - 1102 AD (24.6%)      992 AD - 1003 AD (68.2%)
    ## 1119 AD - 1219 AD (43.6%)      
    ## 
    ## two sigma                      two sigma
    ## 1020 AD - 1268 AD (95.4%)      984 AD - 1010 AD (95.4%)
    ## 
    ## three sigma                    three sigma
    ## 899 AD - 924 AD (0.2%)         902 AD - 920 AD (0.4%)
    ## 946 AD - 1297 AD (99.5%)       964 AD - 1051 AD (99.3%)
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: Tx-56
    ## =============================
    ## 
    ## 
    ## BP = 475, std = 100
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      one sigma
    ## 1316 AD - 1355 AD (11.5%)      1316 AD - 1356 AD (11.9%)
    ## 1390 AD - 1517 AD (50.4%)      1390 AD - 1516 AD (49.9%)
    ## 1596 AD - 1618 AD (6.3%)       1596 AD - 1618 AD (6.4%)
    ## 
    ## two sigma                      two sigma
    ## 1297 AD - 1638 AD (95.4%)      1296 AD - 1638 AD (95.4%)
    ## 
    ## three sigma                    three sigma
    ## 1246 AD - 1682 AD (99.2%)      1252 AD - 1682 AD (99.1%)
    ## 1762 AD - 1804 AD (0.4%)       1762 AD - 1804 AD (0.4%)
    ## 1937 AD - NA (0.1%)            1934 AD - 1953 AD (0.1%)
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  Phase: southern Caddo area
    ## =============================
    ## 
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  Boundary: end Gahagan bifaces SCA
    ## =============================
    ## 
    ## 
    ##                                posterior:
    ## 
    ##                                one sigma
    ##                                994 AD - 1005 AD (68.2%)
    ## 
    ##                                two sigma
    ##                                989 AD - 1010 AD (95.4%)
    ## 
    ##                                three sigma
    ##                                906 AD - 926 AD (0.4%)
    ##                                977 AD - 1024 AD (99%)
    ##                                1040 AD - 1069 AD (0.3%)
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  Boundary: start Gahagan bifaces CTX
    ## =============================
    ## 
    ## 
    ##                                posterior:
    ## 
    ##                                one sigma
    ##                                998 AD - 1009 AD (68.2%)
    ## 
    ##                                two sigma
    ##                                992 AD - 1015 AD (95.4%)
    ## 
    ##                                three sigma
    ##                                920 AD - 960 AD (0.4%)
    ##                                981 AD - 1025 AD (99.1%)
    ##                                1060 AD - 1094 AD (0.3%)
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: Beta-176624
    ## =============================
    ## 
    ## 
    ## BP = 1190, std = 50
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      one sigma
    ## 770 AD - 894 AD (66.8%)        1005 AD - 1018 AD (68.2%)
    ## 933 AD - 937 AD (1.4%)         
    ## 
    ## two sigma                      two sigma
    ## 691 AD - 750 AD (11.9%)        996 AD - 1024 AD (95.4%)
    ## 762 AD - 970 AD (83.5%)        
    ## 
    ## three sigma                    three sigma
    ## 668 AD - 993 AD (99.7%)        944 AD - 974 AD (0.2%)
    ##                                982 AD - 1040 AD (99%)
    ##                                1093 AD - 1123 AD (0.4%)
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: UGA-12500
    ## =============================
    ## 
    ## 
    ## BP = 1090, std = 40
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      one sigma
    ## 896 AD - 928 AD (25.6%)        1004 AD - 1019 AD (68.2%)
    ## 940 AD - 994 AD (42.6%)        
    ## 
    ## two sigma                      two sigma
    ## 780 AD - 788 AD (0.6%)         996 AD - 1030 AD (95.4%)
    ## 876 AD - 1024 AD (94.8%)       
    ## 
    ## three sigma                    three sigma
    ## 776 AD - 1030 AD (99.7%)       962 AD - 1049 AD (98.4%)
    ##                                1084 AD - 1126 AD (1.1%)
    ##                                1136 AD - 1150 AD (0.2%)
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: UGA-12509
    ## =============================
    ## 
    ## 
    ## BP = 1090, std = 40
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      one sigma
    ## 896 AD - 928 AD (25.6%)        1004 AD - 1020 AD (68.2%)
    ## 940 AD - 994 AD (42.6%)        
    ## 
    ## two sigma                      two sigma
    ## 780 AD - 788 AD (0.6%)         996 AD - 1030 AD (95.4%)
    ## 876 AD - 1024 AD (94.8%)       
    ## 
    ## three sigma                    three sigma
    ## 776 AD - 1030 AD (99.7%)       966 AD - 1050 AD (98.3%)
    ##                                1084 AD - 1129 AD (1.2%)
    ##                                1134 AD - 1152 AD (0.3%)
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: UGA-12497
    ## =============================
    ## 
    ## 
    ## BP = 1050, std = 40
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      one sigma
    ## 906 AD - 916 AD (5.4%)         1003 AD - 1024 AD (68.2%)
    ## 968 AD - 1024 AD (62.8%)       
    ## 
    ## two sigma                      two sigma
    ## 892 AD - 1036 AD (95.4%)       994 AD - 1045 AD (90.3%)
    ##                                1095 AD - 1121 AD (4.7%)
    ##                                1144 AD - 1146 AD (0.4%)
    ## 
    ## three sigma                    three sigma
    ## 778 AD - 790 AD (0.1%)         989 AD - 1156 AD (99.7%)
    ## 866 AD - 1155 AD (99.6%)       
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: UGA-12498
    ## =============================
    ## 
    ## 
    ## BP = 1030, std = 40
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      one sigma
    ## 974 AD - 1032 AD (68.2%)       1000 AD - 1036 AD (68.2%)
    ## 
    ## two sigma                      two sigma
    ## 896 AD - 928 AD (7.7%)         996 AD - 1050 AD (78.8%)
    ## 940 AD - 1049 AD (80.1%)       1084 AD - 1127 AD (13%)
    ## 1087 AD - 1124 AD (6.1%)       1136 AD - 1152 AD (3.6%)
    ## 1138 AD - 1150 AD (1.6%)       
    ## 
    ## three sigma                    three sigma
    ## 888 AD - 1156 AD (99.7%)       991 AD - 1158 AD (99.7%)
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: UGA-12505
    ## =============================
    ## 
    ## 
    ## BP = 990, std = 40
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      one sigma
    ## 996 AD - 1047 AD (42.3%)       1010 AD - 1047 AD (38.5%)
    ## 1091 AD - 1122 AD (21%)        1090 AD - 1122 AD (24.3%)
    ## 1140 AD - 1148 AD (4.9%)       1140 AD - 1148 AD (5.4%)
    ## 
    ## two sigma                      two sigma
    ## 986 AD - 1156 AD (95.4%)       1002 AD - 1155 AD (95.4%)
    ## 
    ## three sigma                    three sigma
    ## 898 AD - 924 AD (0.6%)         992 AD - 1182 AD (99.7%)
    ## 944 AD - 1188 AD (99.1%)       
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: UGA-12495
    ## =============================
    ## 
    ## 
    ## BP = 980, std = 40
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      one sigma
    ## 1016 AD - 1050 AD (29.4%)      1016 AD - 1050 AD (30%)
    ## 1084 AD - 1126 AD (29.5%)      1085 AD - 1125 AD (29.2%)
    ## 1136 AD - 1151 AD (9.4%)       1136 AD - 1150 AD (9%)
    ## 
    ## two sigma                      two sigma
    ## 992 AD - 1156 AD (95.4%)       1006 AD - 1156 AD (95.4%)
    ## 
    ## three sigma                    three sigma
    ## 902 AD - 920 AD (0.2%)         994 AD - 1190 AD (99.7%)
    ## 964 AD - 1210 AD (99.5%)       
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: Beta-176625
    ## =============================
    ## 
    ## 
    ## BP = 980, std = 40
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      one sigma
    ## 1016 AD - 1050 AD (29.4%)      1016 AD - 1050 AD (29.8%)
    ## 1084 AD - 1126 AD (29.5%)      1085 AD - 1126 AD (29.6%)
    ## 1136 AD - 1151 AD (9.4%)       1137 AD - 1150 AD (8.8%)
    ## 
    ## two sigma                      two sigma
    ## 992 AD - 1156 AD (95.4%)       1006 AD - 1156 AD (95.4%)
    ## 
    ## three sigma                    three sigma
    ## 902 AD - 920 AD (0.2%)         994 AD - 1192 AD (99.7%)
    ## 964 AD - 1210 AD (99.5%)       
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: Beta-176623
    ## =============================
    ## 
    ## 
    ## BP = 970, std = 40
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      one sigma
    ## 1020 AD - 1050 AD (25.4%)      1020 AD - 1050 AD (25.2%)
    ## 1084 AD - 1126 AD (32.3%)      1084 AD - 1126 AD (32.9%)
    ## 1136 AD - 1151 AD (10.5%)      1136 AD - 1150 AD (10%)
    ## 
    ## two sigma                      two sigma
    ## 996 AD - 1160 AD (95.4%)       1012 AD - 1159 AD (95.4%)
    ## 
    ## three sigma                    three sigma
    ## 972 AD - 1212 AD (99.7%)       996 AD - 1206 AD (99.7%)
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: UGA-12494
    ## =============================
    ## 
    ## 
    ## BP = 970, std = 40
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      one sigma
    ## 1020 AD - 1050 AD (25.4%)      1020 AD - 1050 AD (25.6%)
    ## 1084 AD - 1126 AD (32.3%)      1085 AD - 1126 AD (32.4%)
    ## 1136 AD - 1151 AD (10.5%)      1136 AD - 1150 AD (10.2%)
    ## 
    ## two sigma                      two sigma
    ## 996 AD - 1160 AD (95.4%)       1012 AD - 1159 AD (95.4%)
    ## 
    ## three sigma                    three sigma
    ## 972 AD - 1212 AD (99.7%)       996 AD - 1206 AD (99.7%)
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: UGA-12503
    ## =============================
    ## 
    ## 
    ## BP = 950, std = 40
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      one sigma
    ## 1028 AD - 1052 AD (17.1%)      1029 AD - 1052 AD (16.7%)
    ## 1082 AD - 1152 AD (51.1%)      1082 AD - 1152 AD (51.5%)
    ## 
    ## two sigma                      two sigma
    ## 1016 AD - 1184 AD (95.4%)      1016 AD - 1170 AD (95.4%)
    ## 
    ## three sigma                    three sigma
    ## 989 AD - 1215 AD (99.7%)       1002 AD - 1214 AD (99.7%)
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: UGA-12499
    ## =============================
    ## 
    ## 
    ## BP = 920, std = 40
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      one sigma
    ## 1043 AD - 1106 AD (41.6%)      1043 AD - 1106 AD (41.3%)
    ## 1118 AD - 1159 AD (26.6%)      1118 AD - 1159 AD (26.9%)
    ## 
    ## two sigma                      two sigma
    ## 1026 AD - 1206 AD (95.4%)      1026 AD - 1206 AD (95.4%)
    ## 
    ## three sigma                    three sigma
    ## 1014 AD - 1250 AD (99.7%)      1014 AD - 1226 AD (99.5%)
    ##                                1232 AD - 1246 AD (0.2%)
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: Beta-176620
    ## =============================
    ## 
    ## 
    ## BP = 910, std = 40
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      one sigma
    ## 1043 AD - 1106 AD (39.6%)      1042 AD - 1106 AD (39%)
    ## 1118 AD - 1165 AD (28.6%)      1116 AD - 1166 AD (29.2%)
    ## 
    ## two sigma                      two sigma
    ## 1030 AD - 1210 AD (95.4%)      1030 AD - 1210 AD (95.4%)
    ## 
    ## three sigma                    three sigma
    ## 1018 AD - 1250 AD (99.7%)      1018 AD - 1250 AD (99.7%)
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: Beta-176627
    ## =============================
    ## 
    ## 
    ## BP = 890, std = 40
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      one sigma
    ## 1049 AD - 1086 AD (23.4%)      1050 AD - 1086 AD (23.2%)
    ## 1124 AD - 1138 AD (7.2%)       1125 AD - 1137 AD (6.8%)
    ## 1150 AD - 1209 AD (37.5%)      1150 AD - 1208 AD (38.2%)
    ## 
    ## two sigma                      two sigma
    ## 1034 AD - 1220 AD (95.4%)      1035 AD - 1220 AD (95.4%)
    ## 
    ## three sigma                    three sigma
    ## 1024 AD - 1258 AD (99.7%)      1024 AD - 1258 AD (99.7%)
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: Beta-176628
    ## =============================
    ## 
    ## 
    ## BP = 880, std = 40
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      one sigma
    ## 1050 AD - 1083 AD (18.6%)      1050 AD - 1085 AD (19.1%)
    ## 1127 AD - 1136 AD (4%)         1126 AD - 1136 AD (4.2%)
    ## 1152 AD - 1216 AD (45.6%)      1150 AD - 1217 AD (44.9%)
    ## 
    ## two sigma                      two sigma
    ## 1036 AD - 1226 AD (93.3%)      1037 AD - 1226 AD (94%)
    ## 1232 AD - 1245 AD (2.1%)       1234 AD - 1242 AD (1.4%)
    ## 
    ## three sigma                    three sigma
    ## 1026 AD - 1262 AD (99.7%)      1026 AD - 1262 AD (99.7%)
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: UGA-12493
    ## =============================
    ## 
    ## 
    ## BP = 860, std = 40
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      one sigma
    ## 1058 AD - 1076 AD (7.9%)       1058 AD - 1076 AD (7.8%)
    ## 1154 AD - 1224 AD (59.2%)      1154 AD - 1225 AD (59%)
    ## 1238 AD - 1241 AD (1%)         1238 AD - 1242 AD (1.4%)
    ## 
    ## two sigma                      two sigma
    ## 1045 AD - 1098 AD (16.8%)      1045 AD - 1096 AD (16.2%)
    ## 1120 AD - 1260 AD (78.6%)      1119 AD - 1261 AD (79.2%)
    ## 
    ## three sigma                    three sigma
    ## 1030 AD - 1270 AD (99.7%)      1030 AD - 1270 AD (99.7%)
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: Beta-176630
    ## =============================
    ## 
    ## 
    ## BP = 710, std = 40
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      one sigma
    ## 1262 AD - 1300 AD (60.5%)      1266 AD - 1296 AD (68.2%)
    ## 1370 AD - 1380 AD (7.7%)       
    ## 
    ## two sigma                      two sigma
    ## 1224 AD - 1316 AD (77.7%)      1224 AD - 1312 AD (95.4%)
    ## 1356 AD - 1390 AD (17.7%)      
    ## 
    ## three sigma                    three sigma
    ## 1211 AD - 1400 AD (99.7%)      1206 AD - 1330 AD (97.6%)
    ##                                1342 AD - 1390 AD (2.1%)
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: D-AMS 035170
    ## =============================
    ## 
    ## 
    ## BP = 667, std = 24
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      one sigma
    ## 1284 AD - 1302 AD (38.2%)      1284 AD - 1302 AD (68.2%)
    ## 1367 AD - 1383 AD (30%)        
    ## 
    ## two sigma                      two sigma
    ## 1278 AD - 1316 AD (52.2%)      1275 AD - 1318 AD (93.6%)
    ## 1356 AD - 1390 AD (43.2%)      1369 AD - 1377 AD (1.8%)
    ## 
    ## three sigma                    three sigma
    ## 1270 AD - 1328 AD (54.3%)      1268 AD - 1326 AD (94.5%)
    ## 1342 AD - 1396 AD (45.4%)      1348 AD - 1390 AD (5.2%)
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: D-AMS 035169
    ## =============================
    ## 
    ## 
    ## BP = 648, std = 22
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      one sigma
    ## 1291 AD - 1309 AD (27.3%)      1288 AD - 1309 AD (68.2%)
    ## 1362 AD - 1386 AD (40.9%)      
    ## 
    ## two sigma                      two sigma
    ## 1284 AD - 1320 AD (41.6%)      1280 AD - 1323 AD (91.7%)
    ## 1350 AD - 1392 AD (53.8%)      1360 AD - 1376 AD (3.7%)
    ## 
    ## three sigma                    three sigma
    ## 1278 AD - 1332 AD (43.6%)      1276 AD - 1332 AD (92.5%)
    ## 1337 AD - 1399 AD (56.1%)      1341 AD - 1391 AD (7.2%)
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  R_Date: D-AMS 035290
    ## =============================
    ## 
    ## 
    ## BP = 624, std = 28
    ## 
    ## 
    ## unmodelled:                    posterior:
    ## 
    ## one sigma                      one sigma
    ## 1299 AD - 1320 AD (26.6%)      1292 AD - 1317 AD (68.2%)
    ## 1350 AD - 1372 AD (26.4%)      
    ## 1378 AD - 1392 AD (15.2%)      
    ## 
    ## two sigma                      two sigma
    ## 1290 AD - 1400 AD (95.4%)      1282 AD - 1366 AD (95.4%)
    ## 
    ## three sigma                    three sigma
    ## 1282 AD - 1410 AD (99.7%)      1278 AD - 1392 AD (99.7%)
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  Phase: central Texas
    ## =============================
    ## 
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  Boundary: end Ghagan Bifaces CTX
    ## =============================
    ## 
    ## 
    ##                                posterior:
    ## 
    ##                                one sigma
    ##                                1300 AD - 1336 AD (68.2%)
    ## 
    ##                                two sigma
    ##                                1294 AD - 1395 AD (95.4%)
    ## 
    ##                                three sigma
    ##                                1286 AD - 1444 AD (99.7%)
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  Sequence: Gahagan Bifaces
    ## =============================
    ## 
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013) 
    ## 
    ## =============================
    ##  Phase: Contexts yielding Gahagan Bifaces
    ## =============================
    ## 
    ## 
    ## Calibrated with:
    ##    IntCal13 atmospheric curve (Reimer et al 2013)

``` r
  plot(bgahagan_result_data)
```

![](gahagan14c_files/figure-gfm/chronmod-1.png)<!-- -->

``` r
  bgahagan_result_data %>%
    sapply(function(x) x$type %in% c("Boundary")) %>%
    bgahagan_result_data[.] %>%
    oxcAAR:::plot.oxcAARCalibratedDatesList()
```

![](gahagan14c_files/figure-gfm/chronmod-2.png)<!-- -->

``` r
# end of script
```

### Acknowledgments

Thanks to Martin Hinz for fielding questions related to the oxcAAR
package, and to Derek Hamilton for his guidance with the chronological
model.
