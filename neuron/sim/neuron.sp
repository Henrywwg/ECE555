.subckt neuron x0<1> x0<0> w0<1> w0<0> x1<1> x1<0> w1<1> w1<0> w2<2> w2<1> w2<0> z<2> z<1> z<0> vdd vss

** Library name: ECE555
** Cell name: INV
** View name: schematic
.subckt INV in out vdd vss
mn0 out in vss vss nmos_rvt w=81e-9 l=20e-9 nfin=3
mp1 out in vdd vdd pmos_rvt w=81e-9 l=20e-9 nfin=3
.ends INV
** End of subcircuit definition.

** Library name: ECE555
** Cell name: AND_2
** View name: schematic
.subckt AND_2 a b y vdd vss
mn2 y net2 vss vss nmos_rvt w=54e-9 l=20e-9 nfin=2
mn1 net2 b net1 vss nmos_rvt w=108e-9 l=20e-9 nfin=4
mn0 net1 a vss vss nmos_rvt w=108e-9 l=20e-9 nfin=4
mp5 y net2 vdd vdd pmos_rvt w=81e-9 l=20e-9 nfin=3
mp4 net2 b vdd vdd pmos_rvt w=81e-9 l=20e-9 nfin=3
mp3 net2 a vdd vdd pmos_rvt w=81e-9 l=20e-9 nfin=3
.ends AND_2
** End of subcircuit definition.

** Library name: ECE555
** Cell name: NAND
** View name: schematic
.subckt NAND in1 in2 out vdd vss
mn3 vss in1 net7 vss nmos_rvt w=54e-9 l=20e-9 nfin=2
mn1 net1 in2 vss vss nmos_rvt w=54e-9 l=20e-9 nfin=2
mn2 net7 in2 out vss nmos_rvt w=54e-9 l=20e-9 nfin=2
mn0 out in1 net1 vss nmos_rvt w=54e-9 l=20e-9 nfin=2
mp5 vdd in2 out vdd pmos_rvt w=81e-9 l=20e-9 nfin=3
mp4 out in1 vdd vdd pmos_rvt w=81e-9 l=20e-9 nfin=3
.ends NAND
** End of subcircuit definition.

** Library name: ECE555
** Cell name: MULT2
** View name: schematic
.subckt MULT2 a<1> a<0> b<1> b<0> y<1> y<0> vdd vss
xi1 a<1> net10 vdd vss INV
xi0 b<1> net7 vdd vss INV
xi3 y<0> net17 y<1> vdd vss AND_2
xi2 b<0> a<0> y<0> vdd vss AND_2
xi6 net24 net29 net17 vdd vss NAND
xi5 net10 b<1> net29 vdd vss NAND
xi4 net7 a<1> net24 vdd vss NAND
.ends MULT2
** End of subcircuit definition.

** Library name: ECE555
** Cell name: XOR
** View name: schematic
.subckt XOR a b out vdd vss
mp3 out b net1 vdd pmos_rvt w=81e-9 l=20e-9 nfin=3
mp2 net7 b__ out vdd pmos_rvt w=81e-9 l=20e-9 nfin=3
mp1 vdd a net7 vdd pmos_rvt w=81e-9 l=20e-9 nfin=3
mp0 net1 a__ vdd vdd pmos_rvt w=81e-9 l=20e-9 nfin=3
mn7 vss b net25 vss nmos_rvt w=81e-9 l=20e-9 nfin=3
mn6 net25 a out vss nmos_rvt w=81e-9 l=20e-9 nfin=3
mn5 net19 b__ vss vss nmos_rvt w=81e-9 l=20e-9 nfin=3
mn4 out a__ net19 vss nmos_rvt w=81e-9 l=20e-9 nfin=3
xi4 b b__ vdd vss INV
xi0 a a__ vdd vss INV
.ends XOR
** End of subcircuit definition.

** Library name: ECE555
** Cell name: CONVFA
** View name: schematic
.subckt CONVFA a b cin cout out vdd vss
xi1 net3 cin out vdd vss XOR
xi0 a b net3 vdd vss XOR
xi4 net3 cin net2 vdd vss NAND
xi3 net13 net2 cout vdd vss NAND
xi2 a b net13 vdd vss NAND
.ends CONVFA
** End of subcircuit definition.

** Library name: ECE555
** Cell name: ADDER2
** View name: schematic
.subckt ADDER2 a<1> a<0> b<1> b<0> cin sum<2> sum<1> sum<0> vdd vss
xi3 a<0> b<0> cin net8 sum<0> vdd vss CONVFA
xi4 a<1> b<1> net8 sum<2> sum<1> vdd vss CONVFA
.ends ADDER2
** End of subcircuit definition.

** Library name: ECE555
** Cell name: ADDER3
** View name: schematic
.subckt ADDER3 a<2> a<1> a<0> b<2> b<1> b<0> cin cout sum<2> sum<1> sum<0> vdd vss
xi6 a<2> b<2> net9 cout sum<2> vdd vss CONVFA
xi3 a<0> b<0> cin net8 sum<0> vdd vss CONVFA
xi4 a<1> b<1> net8 net9 sum<1> vdd vss CONVFA
.ends ADDER3
** End of subcircuit definition.

** Library name: ECE555
** Cell name: 3b_2_1_MUX
** View name: schematic
.subckt ECE555_3b_2_1_MUX_schematic a<2> a<1> a<0> vdd vss y<2> y<1> y<0>
xi4 vdd y<2> vdd vss INV
xi0 a<2> net4 vdd vss INV
xi2 net4 a<0> y<0> vdd vss AND_2
xi1 net4 a<1> y<1> vdd vss AND_2
.ends ECE555_3b_2_1_MUX_schematic
** End of subcircuit definition.

** Library name: ECE555
** Cell name: neuron
** View name: schematic
xi3 x1<1> x1<0> w1<1> w1<0> net2<0> net2<1> vdd vss MULT2
xi2 x0<1> x0<0> w0<1> w0<0> net3<0> net3<1> vdd vss MULT2
xi4 net3<0> net3<1> net2<0> net2<1> vss net4<0> net4<1> net4<2> vdd vss ADDER2
xi5 net4<0> net4<1> net4<2> w2<2> w2<1> w2<0> vss cout net7<0> net7<1> net7<2> vdd vss ADDER3
xi1 net7<0> net7<1> net7<2> vdd vss z<2> z<1> z<0> ECE555_3b_2_1_MUX_schematic
.END

.ends neuron