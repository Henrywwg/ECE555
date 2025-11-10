** Library name: ECE555
** Cell name: AND_2
** View name: schematic
.subckt AND_2 a b y
mn2 y net2 vss! vss! nmos_sram w=54e-9 l=20e-9 nfin=2
mn1 net2 b net1 net1 nmos_sram w=108e-9 l=20e-9 nfin=4
mn0 net1 a vss! vss! nmos_sram w=108e-9 l=20e-9 nfin=4
mp5 y net2 vdd! vdd! pmos_sram w=81e-9 l=20e-9 nfin=3
mp4 net2 b vdd! vdd! pmos_sram w=81e-9 l=20e-9 nfin=3
mp3 net2 a vdd! vdd! pmos_sram w=81e-9 l=20e-9 nfin=3
.ends AND_2
** End of subcircuit definition.

** Library name: ECE555
** Cell name: INV
** View name: schematic
.subckt INV in out
mn0 out in vss! vss! nmos_rvt w=54e-9 l=20e-9 nfin=2
mp1 out in vdd! vdd! pmos_rvt w=81e-9 l=20e-9 nfin=3
.ends INV
** End of subcircuit definition.

** Library name: ECE555
** Cell name: AND_2_tb
** View name: schematic
xi0 in<0> in<1> out AND_2
xi4 out dout<3> INV
xi3 out dout<2> INV
xi2 out dout<1> INV
xi1 out dout<0> INV
