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

ParameterDefinitions = {
    {g1,             { Description -> "Hypercharge-Coupling"}},
    {g2,             { Description -> "Left-Coupling"}},
    {g3,             { Description -> "Strong-Coupling"}},
    {g1p,            { Description -> "Ncharge-Coupling",
                       Dependence -> None,
                       LaTeX -> "g_{1}^{\\prime}",
                       LesHouches -> {gauge, 4},
                       OutputName -> g1p}},
    {g11p,           { Description -> "Mixed Gauge Coupling 1",
                       Dependence -> None,
                       LaTeX -> "g_{1N}",
                       LesHouches -> {gauge, 10},
                       OutputName -> g11p}},
    {g1p1,           { Description -> "Mixed Gauge Coupling 2"
                       Dependence -> None,
                       LaTeX -> "g_{N1}",
                       LesHouches -> {gauge, 11},
                       OutputName -> g1p1}},
    {AlphaS,         { Description -> "Alpha Strong"}},
    {aEWinv,         { Description -> "inverse weak coupling constant at mZ"}},
    {Gf,             { Description -> "Fermi's constant"}},
    {e,              { Description -> "electric charge"}},
    {Yu,             { Description -> "Up-Yukawa-Coupling",
                       LaTeX -> "y^U"}},
    {Yd,             { Description -> "Down-Yukawa-Coupling",
                       LaTeX -> "y^D"}},
    {Ye,             { Description -> "Lepton-Yukawa-Coupling",
                       LaTeX -> "y^E"}},
    {vd,             { Description -> "Down-VEV",
                       LaTeX -> "v_1"}},
    {vu,             { Description -> "Up-VEV",
                       LaTeX -> "v_2"}},
    {v,              { Description -> "EW-VEV"}},
    {\[Beta],        { Description -> "Pseudo Scalar mixing angle",
                       DependenceSPheno -> -ArcSin[ZA[1,2]]}},
    {TanBeta,        { Description -> "Tan Beta",
                       LaTeX -> "\\tan\\beta"}},
    {T[Ye],          { Description -> "Trilinear-Lepton-Coupling",
                       LaTeX -> "T^E"}},
    {T[Yd],          { Description -> "Trilinear-Down-Coupling",
                       LaTeX -> "T^D"}},
    {T[Yu],          { Description -> "Trilinear-Up-Coupling",
                       LaTeX -> "T^U"}},
    {mq2,            { Description -> "Softbreaking left Squark Mass",
                       LaTeX -> "m_Q^2"}},
    {me2,            { Description -> "Softbreaking right Slepton Mass",
                       LaTeX -> "m_{e^c}^2"}},
    {ml2,            { Description -> "Softbreaking left Slepton Mass",
                       LaTeX -> "m_L^2"}},
    {mu2,            { Description -> "Softbreaking right Up-Squark Mass",
                       LaTeX -> "m_{u^c}^2"}},
    {md2,            { Description -> "Softbreaking right Down-Squark Mass",
                       LaTeX -> "m_{d^c}^2"}},
    {mHd2,           { Description -> "Softbreaking Down-Higgs Mass"}},
    {mHu2,           { Description -> "Softbreaking Up-Higgs Mass"}},
    {MassB,          { Description -> "Bino Mass parameter"}},
    {MassWB,         { Description -> "Wino Mass parameter"}},
    {MassG,          { Description -> "Gluino Mass parameter"}},

(* additional SE6SSM parameters *)

    {\[Lambda],      { Description -> "SM singlet-Higgs-Interaction",
                       LaTeX -> "\\lambda",
                       Real -> False,
                       Dependence -> None,
                       Value -> None,
                       OutputName -> lam,
                       LesHouches -> {ESIXRUN, 1}}},
    {\[Sigma],       { Description -> "Pure singlet-SM singlet-SM singlet bar term",
                       LaTeX -> "\\sigma",
                       Real -> False,
                       Dependence -> None,
                       Value -> None,
                       OutputName -> sigPr,
                       LesHouches -> {HMIX, 33}}},
    {\[Kappa]Pr,     { Description -> "Pure singlet cubic term",
                       LaTeX -> "\\kappa_{\\phi}",
                       Real -> False,
                       Dependence -> None,
                       Value -> None,
                       OutputName -> kapPr,
                       LesHouches -> {HMIX, 32}}},
    {\[Mu]Phi,       { Description -> "Pure singlet bilinear term",
                       LaTeX -> "\\mu_{\\phi}",
                       Real -> False,
                       Dependence -> None,
                       Value -> None,
                       OutputName -> muPhi,
                       LesHouches -> {HMIX, 31}}},
    {\[Xi]F,         { Description -> "Pure singlet tadpole term",
                       LaTeX -> "\\Lambda_F",
                       Real -> False,
                       Dependence -> None,
                       Value -> None,
                       OutputName -> XiF,
                       LesHouches -> {HMIX, 30}}},
    {\[Lambda]12,    { Description -> "Singlet-Inert Higgs-Interaction",
                       LaTeX -> "\\tilde{\\lambda}",
                       Real -> False,
                       Dependence -> None,
                       Value -> None,
                       OutputName -> lamI,
                       LesHouches -> ESIXLAMBDA}},
    {\[Kappa],       { Description -> "Singlet-Exotic-Interaction",
                       LaTeX -> "\\kappa",
                       Real -> False,
                       Dependence -> None,
                       Value -> None,
                       OutputName -> kap,
                       LesHouches -> ESIXKAPPA}},
    {fu,             { Description -> "SI.H1I.Hu term",
                       LaTeX -> "\\tilde{f}",
                       Real -> False,
                       Dependence -> None,
                       Value -> None,
                       OutputName -> fu,
                       LesHouches -> ESIXFUYUK}},
    {fd,             { Description -> "SI.Hd.H2I term",
                       LaTeX -> "f",
                       Real -> False,
                       Dependence -> None,
                       Value -> None,
                       OutputName-> fd,
                       LesHouches -> ESIXFDYUK}},
    {gD,             { Description -> "LHquark-L4-Dxbar term",
                       LaTeX -> "g^D",
                       Real -> False,
                       Dependence -> None,
                       Value -> None,
                       OutputName->gD,
                       LesHouches -> ESIXGDYUK}},
    {hE,             { Description -> "RHlepton-H1I-L4 term",
                       LaTeX -> "h^E",
                       Real -> False,
                       Dependence -> None,
                       Value -> None,
                       OutputName -> hE,
                       LesHouches -> ESIXHEYUK}},
    {\[Mu]L,         { Description -> "L4-L4bar bilinear term",
                       LaTeX -> "\\mu_L",
                       Real -> False,
                       Dependence -> None,
                       Value -> None,
                       OutputName -> muL,
                       LesHouches -> {ESIXRUN, 0}}},
    {\[Sigma]L,      { Description -> "Pure singlet-L4-L4bar term",
                       LaTeX -> "\\tilde{\\sigma}",
                       Real -> False,
                       Dependence -> None,
                       Value -> None,
                       OutputName -> sigL,
                       LesHouches -> {ESIXRUN, 42}}},
    {vs,             { Description -> "SM singlet-VEV",
                       LaTeX -> "s_1",
                       Real -> True,
                       Value -> None,
                       Dependence -> None,
                       OutputName -> vs,
                       LesHouches -> {ESIXRUN, 11}}},
    {vsb,            { Description -> "SM singletbar-VEV",
                       LaTeX -> "s_2",
                       Real -> True,
                       Value -> None,
                       Dependence -> None,
                       OutputName -> vsb,
                       LesHouches -> {ESIXRUN, 12}}},
    {vphi,           { Description -> "Pure singlet-VEV",
                       LaTeX -> "\\varphi",
                       Real -> True,
                       Value -> None,
                       Dependence -> None,
                       OutputName -> vphi,
                       LesHouches -> {ESIXRUN, 13}}},
    {T[\[Lambda]],   { Description -> "Softbreaking Singlet-Higgs-Interaction",
                       LaTeX -> "T_{\\lambda}",
                       Real -> False,
                       Dependence -> None,
                       Value -> None,
                       OutputName -> Tl,
                       LesHouches -> {ESIXRUN, 2}}},
    {T[\[Sigma]],    { Description -> "Softbreaking pure singlet-SM singlets trilinear",
                       LaTeX -> "T_{\\sigma}",
                       Real -> False,
                       Dependence -> None,
                       Value -> None,
                       OutputName -> Tsig,
                       LesHouches -> {ESIXRUN, 29}}},
    {T[\[Kappa]Pr],  { Description -> "Softbreaking pure singlet cubic interaction",
                       LaTeX -> "T_{\\kappa_\\phi}",
                       Real -> False,
                       Dependence -> None,
                       Value -> None,
                       OutputName -> TkapPr,
                       LesHouches -> {ESIXRUN, 28}}},
    {B[\[Mu]Phi],    { Description -> "Softbreaking pure singlet bilinear mass",
                       LaTeX -> "B_{\\mu_\\phi}",
                       Real -> False,
                       Dependence -> None,
                       Value -> None,
                       OutputName -> BmuPhi,
                       LesHouches -> {ESIXRUN, 30}}},
    {L[\[Xi]F],      { Description -> "Softbreaking pure singlet tadpole term",
                       LaTeX -> "\\Lambda_S",
                       Real -> False,
                       Dependence -> None,
                       Value -> None,
                       OutputName -> LXi,
                       LesHouches -> {HMIX, 34}}},
    {T[\[Lambda]12], { Description -> "Softbreaking Singlet-Inert-Higgs-Interaction",
                       LaTeX -> "T^{\\tilde{\\lambda}}",
                       Real -> False,
                       Dependence -> None,
                       Value -> None,
                       OutputName -> TlI,
                       LesHouches -> ESIXTLAMBDA}},
    {T[\[Kappa]],    { Description -> "Softbreaking Singlet-Exotic-Interaction",
                       LaTeX -> "T^{\\kappa}",
                       Real -> False,
                       Dependence -> None,
                       Value -> None,
                       OutputName -> Tkap,
                       LesHouches -> ESIXTKAPPA}},
    {T[fu],          { Description -> "Softbreaking SI.H1I.Hu term",
                       LaTeX -> "T^{\\tilde{f}}",
                       Real -> False,
                       Dependence -> None,
                       Value -> None,
                       OutputName -> Tfu,
                       LesHouches ->  ESIXTFUTRI}},
    {T[fd],          { Description -> "Softbreaking SI.Hd.H2I term",
                       LaTeX -> "T^{f}",
                       Real -> False,
                       Dependence -> None,
                       Value -> None,
                       OutputName -> Tfd,
                       LesHouches ->  ESIXTFDTRI}},
    {T[gD],          { Description -> "Softbreaking LHquark-L4-Dxbar term",
                       LaTeX -> "T^{g^D}",
                       Real -> False,
                       Dependence -> None,
                       Value -> None,
                       OutputName -> TgD,
                       LesHouches ->  ESIXTGDTRI}},
    {T[hE],          { Description -> "Softbreaking RHlepton-H1I-L4 term",
                       LaTeX -> "T^{h^E}",
                       Real -> False,
                       Dependence -> None,
                       Value -> None,
                       OutputName -> ThE,
                       LesHouches ->  ESIXTHETRI}},
    {B[\[Mu]L],      { Description -> "BMuPrime-parameter",
                       LaTeX -> "B_{\\mu_L}",
                       Real -> False,
                       Dependence -> None,
                       Value -> None,
                       OutputName -> BmuP,
                       LesHouches -> {ESIXRUN, 101}}},
    {T[\[Sigma]L],   { Description -> "Softbreaking pure singlet-L4-L4bar term",
                       LaTeX -> "T_{\\tilde{\\sigma}}",
                       Real -> False,
                       Dependence -> None,
                       Value -> None,
                       OutputName -> TsigL,
                       LesHouches -> {ESIXRUN, 43}}},
    {mDx2,           { Description -> "Softbreaking Exotics Mass",
                       LaTeX -> "m_{D}^2",
                       Real -> False,
                       Dependence -> None,
                       Value -> None,
                       OutputName -> mX2,
                       LesHouches -> mX2}},
    {mDxbar2,        { Description -> "Softbreaking BarExotics Mass",
                       LaTeX -> "m_{\\bar{D}}^2",
                       Real -> False,
                       Dependence -> None,
                       Value -> None,
                       OutputName -> mXB2,
                       LesHouches -> mXBar2}},
    {mH1I2,          { Description -> "Softbreaking Down-Inert-Higgs Mass",
                       LaTeX -> "m_{H_1}^2",
                       Real -> False,
                       Dependence -> None,
                       Value -> None,
                       OutputName -> mH1I2,
                       LesHouches -> mH1I2}},
    {mH2I2,          { Description -> "Softbreaking Up-Inert-Higgs Mass",
                       LaTeX -> "m_{H_2}^2",
                       Real -> False,
                       Dependence -> None,
                       Value -> None,
                       OutputName -> mH2I2,
                       LesHouches -> mH2I2}},
    {mSI2,           { Description -> "Softbreaking Inert-Singlet Mass",
                       LaTeX -> "m_{\\Sigma}^2",
                       Real -> False,
                       Dependence -> None,
                       Value -> None,
                       OutputName -> mSI2,
                       LesHouches -> mSI2}},
    {ms2,            { Description -> "Softbreaking SM Singlet Mass",
                       LaTeX -> "m_S^2",
                       Real -> True,
                       Dependence -> None,
                       Value -> None,
                       OutputName -> ms2,
                       LesHouches -> {MSOFT, 23}}},
    {msbar2,         { Description -> "Softbreaking SM Singletbar Mass",
                       LaTeX -> "m_{\\bar{S}}^2",
                       Real -> True,
                       Dependence -> None,
                       Value -> None,
                       OutputName -> msbar2,
                       LesHouches -> {MSOFT, 24}}},
    {mphi2,          { Description -> "Softbreaking pure Singlet Mass",
                       LaTeX -> "m_{\\phi}^2",
                       Real -> True,
                       Dependence -> None,
                       Value -> None,
                       OutputName -> mphi2,
                       LesHouches -> {MSOFT, 25}}},
    {mL42,           { Description -> "Softbreaking Survival Mass",
                       LaTeX -> "m_{L_4}^2",
                       Real -> True,
                       Dependence -> None,
                       Value -> None,
                       OutputName -> mL42,
                       LesHouches -> {MSOFT, 26}}},
    {mL4bar2,        { Description -> "Softbreaking Bar-Survival Mass",
                       LaTeX -> "m_{\\bar{L}_4}^2",
                       Real -> True,
                       Dependence -> None,
                       Value -> None,
                       OutputName -> mL4B2,
                       LesHouches -> {MSOFT, 27}}},
    {MassBp,         { Description -> "Bino' Mass",
                       LaTeX -> "M_1'",
                       OutputName -> M1P,
                       LesHouches -> {MSOFT, 4}}},
    {MassBBp,        { Description -> "Mixed Gaugino Mass 1",
                       LaTeX -> "{M}_{1N}",
                       OutputName -> M11P,
                       LesHouches -> {MSOFT, 5}}},
    {MassBpB,        { Description -> "Mixed Gaugino Mass 2",
                       LaTeX -> "{M}_{N1}",
                       OutputName -> M1P1,
                       LesHouches -> {MSOFT, 6}}},
(* mixing matrices *)

    {ZD,             { Description -> "Down-Squark-Mixing-Matrix" }},
    {ZU,             { Description -> "Up-Squark-Mixing-Matrix" }},
    {ZE,             { Description -> "Slepton-Mixing-Matrix" }},
    {ZV,             { Description -> "Sneutrino Mixing-Matrix" }},
    {ZEL,            { Description -> "Left-Lepton-Mixing-Matrix" }},
    {ZER,            { Description -> "Right-Lepton-Mixing-Matrix" }},
    {ZDL,            { Description -> "Left-Down-Mixing-Matrix" }},
    {ZDR,            { Description -> "Right-Down-Mixing-Matrix" }},
    {ZUL,            { Description -> "Left-Up-Mixing-Matrix" }},
    {ZUR,            { Description -> "Right-Up-Mixing-Matrix" }},
    {ZH,             { Description->"Scalar-Mixing-Matrix",
                       LaTeX -> "U_{H}",
                       Real -> True,
                       Dependence -> None,
                       DependenceOptional -> None,
                       Value -> None,
                       OutputName -> ZH,
                       LesHouches -> NMHMIX}},
    {ZA,             { Description -> "Pseudo-Scalar-Mixing-Matrix",
                       LaTeX -> "U_{A}",
                       Real ->True,
                       Dependence -> None,
                       DependenceOptional -> None,
                       Value -> None,
                       OutputName -> ZA,
                       LesHouches -> NMAMIX}},
    {ZP,             { Description -> "Charged-Mixing-Matrix",
                       LaTeX -> "U_{+}",
                       Real -> True,
                       Dependence -> None,
                       DependenceOptional -> {{Cos[\[Beta]],-Sin[\[Beta]]},
                                              {Sin[\[Beta]],Cos[\[Beta]]}},
                       Value -> None}},
    {ZN,             { Description -> "Neutralino Mixing-Matrix",
                       LesHouches -> NMNMIX}},
    {UP,             { Description -> "Chargino-plus Mixing-Matrix" }},
    {UM,             { Description -> "Chargino-minus Mixing-Matrix" }},
    {ZZ,             { Description ->   "Photon-Z-Z' Mixing Matrix" }},
    {ZW,             { Description -> "W Mixing Matrix" }},
    {ZfW,            { Description -> "Wino Mixing Matrix" }},
    {ZDX,            { Description -> "SExotics Mixing-Matrix",
                       LaTeX -> "Z^{Dx}",
                       Dependence -> None,
                       Value -> None,
                       OutputName -> ZDX,
                       LesHouches -> ESIXZDX}},
    {ZDXL,           { Description -> "Left-Exotic-Mixing-Matrix",
                       LaTeX -> "U^X_L",
                       Dependence -> None,
                       Value -> None,
                       OutputName -> ZXL,
                       LesHouches -> ESIXZXL}},
    {ZDXR,           { Description -> "Right-Exotic-Mixing-Matrix",
                       LaTeX -> "U^X_R",
                       Dependence -> None,
                       Value -> None,
                       OutputName -> ZXR,
                       LesHouches -> ESIXZXR}},
    {ZHp,            { Description -> "Prime neutral mixing matrix",
                       LaTeX -> "Z^{L_4^0}",
                       Real -> True,
                       Dependence -> None,
                       Value -> None,
                       OutputName -> ZHp,
                       LesHouches -> ZHNPMIX}},
    {ZPp,            { Description -> "Prime Charged Mixing Matrix",
                       LaTeX -> "Z^{L_4^+}",
                       Real -> True,
                       Dependence -> None,
                       Value -> None,
                       OutputName -> ZPp,
                       LesHouches -> ZPPMIX}},
    {ZHI,            { Description -> "Inert Scalar Mixing Matrix",
                       LaTeX -> "U_{H_I}",
                       Real -> True,
                       Dependence -> None,
                       Value -> None,
                       OutputName -> ZHI,
                       LesHouches -> ZHIMIX}},
    {ZAI,            { Description -> "Inert Pseudo-Scalar Mixing Matrix",
                       LaTeX -> "U_{A_I}",
                       Real -> True,
                       Dependence -> None,
                       Value -> None,
                       OutputName -> ZAI,
                       LesHouches -> ZAIMIX}},
    {ZPI,            { Description -> "Inert Charged Mixing Matrix",
                       LaTeX -> "U^{I+}",
                       Real -> True,
                       Dependence -> None,
                       Value -> None,
                       OutputName -> ZPI,
                       LesHouches -> ZPIMIX}},
    {ZNp,            { Description -> "Prime Neutralino Mixing Matrix",
                       LaTeX -> "N'",
                       Dependence -> None,
                       Value -> None,
                       OutputName -> ZNP,
                       LesHouches -> ZNPMIX}},
    {ZNI,            { Description -> "Inert Neutralino Mixing Matrix",
                       LaTeX -> "N^I",
                       Dependence -> None,
                       Value -> None,
                       OutputName -> ZNI,
                       LesHouches -> ZNIMIX}},
    {UMI,            { Description -> "Inert Chargino-minus Mixing-Matrix",
                       LaTeX -> "Z^{\\tilde{h}^{I-}}",
                       Dependence -> None,
                       Value -> None,
                       OutputName -> UMI,
                       LesHouches -> ESIXUMI}},
    {UPI,            { Description -> "Inert Chargino-plus Mixing-Matrix",
                       LaTeX -> "Z^{\\tilde{h}^{I+}}",
                       Dependence -> None,
                       Value -> None,
                       OutputName -> UPI,
                       LesHouches -> ESIXUPI}},

(* mixing angles *)

    {ThetaW,         { Description -> "Weinberg-Angle" }},
    {ThetaWp,        { Description -> "Theta'",
                       LaTeX -> "\\Theta_W'",
                       Real -> True,
                       DependenceNum -> 1/2 ArcTan[2 Sqrt[10] Sqrt[g1^2 + g2^2] g1p (-3 vd^2 + 2 vu^2) / (g1p^2 (9 vd^2 + 4 vu^2 + 25 vs^2 + 25 vsb^2) - 10 (g1^2 + g2^2) (vd^2 + vu^2))],
                       OutputName -> TWP,
                       LesHouches -> {ESIXRUN,20}}},

(* phases *)

    {PhaseGlu,       { Description -> "Gluino-Phase" }},
    {PhaseChaP,      { Description -> "Prime chargino phase",
                       LaTeX -> "\\phi_{\\tilde{\\chi}^{\\pm\\prime}}",
                       Value -> None,
                       OutputName -> pHp,
                       LesHouches -> {Phases, 2}}}

};
