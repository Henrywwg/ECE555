* SPICE NETLIST
***************************************

.SUBCKT 3b_2_1_MUX vss vdd A<2> A<1> A<0> Y<1> Y<0> Y<2>
** N=32 EP=8 IP=0 FDC=20
M0 4 A<2> vss vss nmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=284 $Y=108 $D=1
M1 12 4 vss vss nmos_rvt L=2e-08 W=5.4e-08 nfin=2 $X=932 $Y=216 $D=1
M2 6 A<1> 12 vss nmos_rvt L=2e-08 W=5.4e-08 nfin=2 $X=1148 $Y=216 $D=1
M3 13 A<1> 6 vss nmos_rvt L=2e-08 W=5.4e-08 nfin=2 $X=1364 $Y=216 $D=1
M4 vss 4 13 vss nmos_rvt L=2e-08 W=5.4e-08 nfin=2 $X=1580 $Y=216 $D=1
M5 Y<1> 6 vss vss nmos_rvt L=2e-08 W=5.4e-08 nfin=2 $X=1796 $Y=216 $D=1
M6 14 4 vss vss nmos_rvt L=2e-08 W=5.4e-08 nfin=2 $X=2444 $Y=216 $D=1
M7 8 A<0> 14 vss nmos_rvt L=2e-08 W=5.4e-08 nfin=2 $X=2660 $Y=216 $D=1
M8 15 A<0> 8 vss nmos_rvt L=2e-08 W=5.4e-08 nfin=2 $X=2876 $Y=216 $D=1
M9 vss 4 15 vss nmos_rvt L=2e-08 W=5.4e-08 nfin=2 $X=3092 $Y=216 $D=1
M10 Y<0> 8 vss vss nmos_rvt L=2e-08 W=5.4e-08 nfin=2 $X=3308 $Y=216 $D=1
M11 Y<2> vdd vss vss nmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=3956 $Y=108 $D=1
M12 4 A<2> vdd vdd pmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=284 $Y=648 $D=0
M13 6 4 vdd vdd pmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=932 $Y=648 $D=0
M14 vdd A<1> 6 vdd pmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=1148 $Y=648 $D=0
M15 Y<1> 6 vdd vdd pmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=1796 $Y=648 $D=0
M16 8 4 vdd vdd pmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=2444 $Y=648 $D=0
M17 vdd A<0> 8 vdd pmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=2660 $Y=648 $D=0
M18 Y<0> 8 vdd vdd pmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=3308 $Y=648 $D=0
M19 Y<2> vdd vdd vdd pmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=3956 $Y=648 $D=0
.ENDS
***************************************
