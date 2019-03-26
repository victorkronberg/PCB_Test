* Subcircuit AD8638
.subckt ad8638          1   2   99  50  45
* node assignments
*  1- noninverting input
*  2- inverting input
* 99- positive supply
* 50- negative supply
* 45- output
*
* input stage
*
m1  14  7  8  8 pix l=1e-6 w=2.092e-05
m2  16  2  8  8 pix l=1e-6 w=2.092e-05
rc5 14 50 1.200e+04
rc6 16 50 1.200e+04
c1  141 16 1.300e-12
rc56 14 141 2.0e-04
i1  99  8 5.000e-05
v1  99  9 2.001e+00
d1   8  9 dx
eos  7  1 poly(4) (22,98) (73,98) (83,98) (70,98) 3.00e-06 1 1 1.275 1
ios  1  2 5.00e-12
*
* cmrr=140db, pole at 12.5 hz
*
e1  21 98 poly(2) (1,98) (2,98) 0 2.066e-02 2.066e-02
r10 21 22 1.315e+04
r20 22 98 3.183e-02
c10 21 22 1.000e-06
*
* psrr=143db, pole at 0.1 hz
*
epsy 72 98 poly(1) (99,50) -26.1395e+00 1.67337e+00
rps3 72 73 1.224e+06
rps4 73 98 5.305e-02
cps3 72 73 1.00e-06
*
* voltage noise reference of 60nv/rt(hz)
*
vn1 80 98 0
rn1 80 98  80.0e-06
*
hn  81 98 vn1 220e+00
rnhh1 81 183 5.3
chh1 183 98 1uf
*
chh2 183 184 2.7e-07
rnhh2 184 98 10
*
rnhh3 184 83 129k
chh3 83 98 2.41e-10
*
* flicker noise corner = 0.0001 hz
*
d5  69 98 dnoise
vsn 69 98 dc 0.6551
h1  70 98 poly(1) vsn 1.00e-03 1.00e+00
rn  70 98 1
*
* internal voltage reference
*
eref 98  0 poly(2) (99,0) (50,0) 0 0.5 0.5
gsy  99 50 poly(1) (99,50) 0.7151e-03 8.763e-06
evp  97 98 poly(1) (99,50) 0 0.5e-09
evn  51 98 poly(1) (50,99) 0 0.5e-09
*
* gain stage
*
g1 98 130 poly(1) (14,16)  0 2.054e-01
rg1 130 30 1
r1 30 98 1.00e+06
cr1 30 98 1.00e-15
v3 32 30 -0.429e+00
v4 30 33 -1.560e+00
*
ez (145 0) poly(1) (45 0) 0 1
rez 145 0 10meg
*
cf 145 31 5.950e-08
rz 30 31 1.00e-01
d3 32 97 dx
d4 51 33 dx
*
* output stage
*
m5  45 46 99 99 pox l=1e-6 w=1.455e-04
m6  45 47 50 50 nox l=1e-6 w=1.875e-04
eg1 99 46 poly(1) (98,30) 5.626e-01 1
eg2 47 50 poly(1) (30,98) 4.966e-01 1
*
* models
*
.model pox pmos (level=2,kp=5.00e-05,vto=-0.4,lambda=0.05,rd=0.5)
.model nox nmos (level=2,kp=11.00e-05,vto=+0.4,lambda=0.04,rd=0.7)
.model pix pmos (level=2,kp=5.00e-05,vto=-6.00e-01,lambda=0.02)
.model dx d(is=1e-14,rs=5)
.model dnoise d(is=1e-14,rs=0,kf=2.50e-20)
*
*
.ends ad8638
