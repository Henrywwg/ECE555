**Test
.GLOBAL vss! vdd!
.TEMP 25.0
.OPTION
+    ARTIST=2
+    INGOLD=2
+    PARHIER=LOCAL
+    PSF=2
+    HIER_DELIM=0
.options accurate=1 NUMDGT=8 measdgt=5 GMINDC=1e-18 DELMAX=1n method=gear INGOLD=2 POST=1
.INCLUDE "/cae/apps/data/asap7PDK-2022/asap7PDK_r1p7/models/hspice/7nm_TT_160803.pm"
.INCLUDE "MULT2.pex.netlist"
v1 vdd! 0 0.9v
v2 vss! 0 0v
v3 A<1> 0 pwl 0ns 0.9v  3ns 0.9v  3.025ns 0v  9ns 0v 
v4 A<0> 0 pwl 0ns 0.9v  3ns 0.9v  3.025ns 0v  6ns 0v  6.025ns 0.9v  9ns 0.9v 
v5 B<1> 0 pwl 0ns 0.9v  1ns 0.9v  1.025ns 0v  3ns 0v  3.025ns 0.9v  4ns 0.9v  4.025ns 0v  6ns 0v  6.026ns 0.9v  7ns 0.9v  7.025ns 0v  9ns 0v
v6 B<0> 0 pwl 0ns 0.9v  1ns 0.9v  1.025ns 0v  2ns 0v  2.025ns 0.9v  4ns 0.9v  4.025ns 0v  5ns 0v  5.025ns 0.9v  7ns 0.9v  7.025ns 0v  8ns 0v  8.025ns 0.9v  9ns 0.9v

X_DUT vss! vdd! B<1> A<1> B<0> A<0> out_Y<0> out_Y<1> MULT2

.OP
.TRAN STEP=10p STOP=9n
.end