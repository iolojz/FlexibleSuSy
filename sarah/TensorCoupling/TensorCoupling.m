(* :Copyright:

   ====================================================================
   This file is part of FlexibleSUSY.

   FlexibleSUSY is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published
   by the Free Software Foundation, either version 3 of the License,
   or (at your option) any later version.

   FlexibleSUSY is distributed in the hope that it will be useful, but
   WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with FlexibleSUSY.  If not, see
   <http://www.gnu.org/licenses/>.
   ====================================================================

*)

Off[General::spell]

Model`Name = "E6SSM";
Model`NameLaTeX ="E6SSM";
Model`Authors = "G.Hellwig, P.Diessner, P.Athron, A.Voigt";
Model`Date = "2014-03-10";

(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Global symmetries *)

Global[[1]] = {Z[2],RParity};
RpM = {-1,-1,1};
RpP = {1,1,-1};

(* Vector Superfields *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False,RpM};
Gauge[[2]]={WB, SU[2], left,        g2,True, RpM};
Gauge[[3]]={G,  SU[3], color,       g3,False,RpM};

(* Chiral Superfields *)

SuperFields[[1]] = {q, 3, {uL,  dL},     1/6, 2, 3, RpM};  
SuperFields[[2]] = {l, 3, {vL,  eL},    -1/2, 2, 1, RpM};
SuperFields[[3]] = {Hd,1, {Hd0, Hdm},   -1/2, 2, 1, RpP};
SuperFields[[4]] = {Hu,1, {Hup, Hu0},    1/2, 2, 1, RpP};

SuperFields[[5]] = {d, 3, conj[dR],    1/3, 1, -3, RpM};
SuperFields[[6]] = {u, 3, conj[uR],   -2/3, 1, -3, RpM};
SuperFields[[7]] = {e, 3, conj[eR],      1, 1,  1, RpM};
SuperFields[[8]] = {s, 1, sR      ,      0, 1,  1, RpP};

SuperFields[[12]] = {Dx, 3, DxL   ,      0, 1,  3, RpP};

NoU1Mixing = True;
AddMixedSofts = False;

(*------------------------------------------------------*)
(*Z2H exact Superpotential *)
(*------------------------------------------------------*)

SuperPotential = Yu u.q.Hu - Yd d.q.Hd - Ye e.l.Hd + \[Lambda] s.Hu.Hd \
    + \[Kappa] Dx.Dx.Dx;

(*-------------------------------------------*)
(* Integrate Out or Delete Particles         *)
(*-------------------------------------------*)

IntegrateOut = {};
DeleteParticles = {};

(*----------------------------------------------*)
(*   ROTATIONS                                  *)
(*----------------------------------------------*)

NameOfStates = {GaugeES, EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][DiracSpinors] = {
    Bino -> {fB, conj[fB]},
    Wino -> {fWB, conj[fWB]},
    Glu  -> {fG, conj[fG]},
    H01  -> {FHd0, 0},
    H02  -> {0, conj[FHu0]},
    HC1  -> {FHdm, 0},
    HC2  -> {0, conj[FHup]},
    Fd1  -> {FdL, 0},
    Fd2  -> {0, FdR},
    Fu1  -> {FuL, 0},
    Fu2  -> {0, FuR},
    Fe1  -> {FeL, 0},
    Fe2  -> {0, FeR},
    Fv   -> {FvL,0},
    FS1  -> {FsR,0},
    FS2  -> {0,conj[FsR]},
    FDx1 -> {FDxL, 0},
    FDx2 -> {0, conj[FDxL]}
};


(* ----- After EWSB ----- *)


(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] = { 
    {{VB,VWB[3]},{VP,VZ},ZZ},
    {{VWB[1],VWB[2]},{VWm,conj[VWm]},ZW},
    {{fWB[1],fWB[2],fWB[3]},{fWm,fWp,fW0},ZfW}
};      
          	

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs] = {
    {SHd0, {vd, 1/Sqrt[2]}, {sigmad, \[ImaginaryI]/Sqrt[2]},{phid,1/Sqrt[2]}},
    {SHu0, {vu, 1/Sqrt[2]}, {sigmau, \[ImaginaryI]/Sqrt[2]},{phiu,1/Sqrt[2]}},
    {SsR,  {vs, 1/Sqrt[2]}, {sigmaS, \[ImaginaryI]/Sqrt[2]},{phiS,1/Sqrt[2]}}
};


 
(* ---- Mixings ---- *)

DEFINITION[EWSB][MatterSector] = {
    {{SdL, SdR}, {Sd, ZD}},
    {{SvL}, {Sv, ZV}},
    {{SuL, SuR}, {Su, ZU}},
    {{SeL, SeR}, {Se, ZE}},
    {{SDxL}, {SDX, ZDX}},
    {{phid, phiu, phiS}, {hh, ZH}},
    {{sigmad, sigmau, sigmaS}, {Ah, ZA}},
    {{SHdm,conj[SHup]},{Hpm,ZP}},
    {{fB, fW0, FHd0, FHu0, FsR}, {L0, ZN}}, 
    {{{fWm, FHdm}, {fWp, FHup}}, {{Lm,UM}, {Lp,UP}}}, 
    {{{FeL},{conj[FeR]}},{{FEL,ZEL},{FER,ZER}}},
    {{{FdL},{conj[FdR]}},{{FDL,ZDL},{FDR,ZDR}}},
    {{{FuL},{conj[FuR]}},{{FUL,ZUL},{FUR,ZUR}}}
}; 
       
DEFINITION[EWSB][Phases] = {
    {fG, PhaseGlu},
    {ChaP, PhaseFHpup}
}; 

DEFINITION[EWSB][DiracSpinors] = {
    Fd -> {FDL, conj[FDR]},
    Fe -> {FEL, conj[FER]},
    Fu -> {FUL, conj[FUR]},
    Fv -> {FvL, 0},
    Chi -> {L0, conj[L0]},
    Cha -> {Lm, conj[Lp]},
    Glu -> {fG, conj[fG]},
    FDX -> {FDxL, 0}
};	
