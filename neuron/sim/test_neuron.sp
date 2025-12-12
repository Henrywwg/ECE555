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
.INCLUDE "neuron.sp"
v1 vdd! 0 0.9v
v2 vss! 0 0v

**After testing the mux and 3 bit adder in first 3 ns, then we test our critical path.
v3 x0<1> 0 pwl 0ns 0.0v  3ns 0.0v  3.025ns 0.9v  4ns 0.9v  4.025ns 0.0v  5ns 0.0v  5.025ns 0.9v  6ns 0.9v 6.025ns 0.9v  7ns 0.9v  7.025ns 0.0v  8ns 0.0v  8.025ns 0.0v  9ns 0.0v  9.025ns 0.9v  10ns 0.9v 
v4 x0<0> 0 pwl 0ns 0.0v  3ns 0.0v  3.025ns 0.9v  4ns 0.9v  4.025ns 0.0v  5ns 0.0v  5.025ns 0.9v  6ns 0.9v 6.025ns 0.9v  7ns 0.9v  7.025ns 0.0v  8ns 0.0v  8.025ns 0.0v  9ns 0.0v  9.025ns 0.9v  10ns 0.9v
v5 w0<1> 0 pwl 0ns 0.0v  3ns 0.0v  3.025ns 0.9v  4ns 0.9v  4.025ns 0.9v  5ns 0.0v  5.025ns 0.0v  6ns 0.0v 6.025ns 0.9v  7ns 0.9v  7.025ns 0.0v  8ns 0.0v  8.025ns 0.0v  9ns 0.0v  9.025ns 0.0v  10ns 0v
v6 w0<0> 0 pwl 0ns 0.0v  3ns 0.0v  3.025ns 0.9v  4ns 0.9v  4.025ns 0.9v  5ns 0.0v  5.025ns 0.0v  6ns 0.0v 6.025ns 0.9v  7ns 0.9v  7.025ns 0.0v  8ns 0.0v  8.025ns 0.0v  9ns 0.0v  9.025ns 0.9v  10ns 0.9v
**          All inputs 0              all -1                    0 and -1           do a 180  -1 and 0        all -1              all 0            Hold val              0--> -1 & 0-->1


v7 x1<1> 0 pwl 0ns 0.0v  3ns 0.0v  3.025ns 0.9v  4ns 0.9v  4.025ns 0.0v  5ns 0.0v  5.025ns 0.9v  6ns 0.9v 6.025ns 0.9v  7ns 0.9v  7.025ns 0.0v  8ns 0.0v  8.025ns 0.9v   9ns 0.9v  9.025ns 0.0v 10ns 0v 
v8 x1<0> 0 pwl 0ns 0.0v  3ns 0.0v  3.025ns 0.9v  4ns 0.9v  4.025ns 0.0v  5ns 0.0v  5.025ns 0.9v  6ns 0.9v 6.025ns 0.9v  7ns 0.9v  7.025ns 0.0v  8ns 0.0v  8.025ns 0.9v   9ns 0.9v  9.025ns 0.0v 10ns 0v
v9 w1<1> 0 pwl 0ns 0.0v  3ns 0.0v  3.025ns 0.9v  4ns 0.9v  4.025ns 0.9v  5ns 0.0v  5.025ns 0.0v  6ns 0.0v 6.025ns 0.9v  7ns 0.9v  7.025ns 0.0v  8ns 0.0v  8.025ns 0.9v   9ns 0.9v  9.025ns 0.9v 10ns 0.9v
v10 w1<0> 0 pwl 0ns 0.0v  3ns 0.0v  3.025ns 0.9v  4ns 0.9v  4.025ns 0.9v  5ns 0.0v  5.025ns 0.0v  6ns 0.0v 6.025ns 0.9v  7ns 0.9v  7.025ns 0.0v  8ns 0.0v  8.025ns 0.9v  9ns 0.9v  9.025ns 0.9v 10ns 0.9v
**          All inputs 0              all -1                    0 and -1           do a 180  -1 and 0      all -1            all 0                    all -1                  -1->0 -1->-1
**                                                                                                                                              based on napkin math this should be the longest trans


**This is weight 2 so its really unlikely that any transition here will be on the critical path since these will be the early arriving signals
** in spite of this, we will want to have the internal carry into the third bit of the adder have to propagate to increase delay, so we'll want
** a combo such that we are forcing this propagation delay. For the heavy transitions (0 -> -1) -1 * -1 = 01 --> 01 + 01 --> 010 +
v11 w2<2> 0 pwl 0ns 0.0v  3ns 0.0v  3.025ns 0.9v  4ns 0.9v  4.025ns 0.0v  5ns 0.0v  5.025ns 0.9v  6ns 0.9v 6.025ns 0.9v  7ns 0.9v  7.025ns 0.0v  8ns 0.0v  8.025ns 0.9v  9ns 0.0v  9.025ns 0.0v  10ns 0v  
v12 w2<1> 0 pwl 0ns 0.0v  3ns 0.0v  3.025ns 0.9v  4ns 0.9v  4.025ns 0.0v  5ns 0.0v  5.025ns 0.9v  6ns 0.9v 6.025ns 0.9v  7ns 0.9v  7.025ns 0.0v  8ns 0.0v  8.025ns 0.9v  9ns 0.0v  9.025ns 0.0v  10ns 0v 
v13 w2<0> 0 pwl 0ns 0.0v  3ns 0.0v  3.025ns 0.9v  4ns 0.9v  4.025ns 0.0v  5ns 0.0v  5.025ns 0.9v  6ns 0.9v 6.025ns 0.9v  7ns 0.9v  7.025ns 0.0v  8ns 0.0v  8.025ns 0.0v  9ns 0.0v  9.025ns 0.9v  10ns 0.9v 
**          All inputs 0              all -1                    0 and -1           do a 180  -1 and 0      all -1            all 0



X_DUT x0<1> x0<0> w0<1> w0<0> x1<1> x1<0> w1<1> w1<0> w2<2> w2<1> w2<0> out_Z<2> out_Z<1> out_Z<0> vdd! vss! neuron

.OP
.TRAN STEP=10p STOP=9n
.end