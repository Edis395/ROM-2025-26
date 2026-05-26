(* ============================================================ *)
(*  2. domaca naloga 2025/26  -  1. del  (Mathematica)          *)
(*  Vsako vrstico prilepi v locheno celico v Mathematici        *)
(* ============================================================ *)


(* ============================================================ *)
(*  1. NALOGA                                                    *)
(* ============================================================ *)

(* a) Neskoncna vsota  1 + 1/9 + 1/25 + 1/49 + 1/81 + ...        *)
(*    = vsota 1/(2k-1)^2  za  k = 1, 2, 3, ...                   *)

Sum[1/(2 k - 1)^2, {k, 1, Infinity}]
(*  ->  Pi^2/8                                                   *)
N[Sum[1/(2 k - 1)^2, {k, 1, Infinity}]]
(*  ->  1.2337                                                   *)


(* b) Limita funkcije  f(x) = (sin(x) - x)/x^3,  ko gre x -> 0   *)

Limit[(Sin[x] - x)/x^3, x -> 0]
(*  ->  -1/6                                                     *)


(* c) Ploscina lika, ki ga omejujejo graf  g(x) = sin(x) + x^2, *)
(*    abscisna os ter navpicnici  x = 0  in  x = 2 Pi.          *)

g[x_] := Sin[x] + x^2

(*    Na intervalu [0, 2 Pi] je g(x) >= 0, zato je ploscina      *)
(*    kar dolocen integral funkcije g od 0 do 2 Pi:             *)
ploscinaC = Integrate[g[x], {x, 0, 2 Pi}]
(*  ->  8 Pi^3 / 3                                               *)
N[ploscinaC]
(*  ->  82.6834                                                  *)

(*    Vizualizacija lika:                                        *)
Plot[g[x], {x, 0, 2 Pi},
  Filling -> Axis,
  PlotLabel -> "g(x) = sin(x) + x^2 na [0, 2 Pi]",
  AxesLabel -> {"x", "g(x)"}]


(* d) Ploscina lika med grafoma  g(x) = sin(x) + x^2  in         *)
(*    g1(x) = sin(x) + x^5/5.                                   *)

g1[x_] := Sin[x] + x^5/5

(*    Presecisci grafov (kjer je g(x) == g1(x)):                 *)
Solve[g[x] == g1[x], x, Reals]
(*  ->  x = 0  in  x = 5^(1/3) ~ 1.71                            *)

(*    Na [0, 5^(1/3)] je g(x) >= g1(x), ploscina je integral     *)
(*    razlike (g - g1):                                          *)
ploscinaD = Integrate[g[x] - g1[x], {x, 0, 5^(1/3)}]
(*  ->  5/6                                                      *)
N[ploscinaD]
(*  ->  0.833333                                                 *)

(*    Vizualizacija:                                             *)
Plot[{g[x], g1[x]}, {x, -0.5, 2},
  Filling -> {1 -> {2}},
  PlotLegends -> {"g(x) = sin(x)+x^2", "g1(x) = sin(x)+x^5/5"}]



(* ============================================================ *)
(*  2. NALOGA                                                    *)
(* ============================================================ *)

(* a) Funkcija A(m,n): vrne matriko dimenzije n x m, kjer je na  *)
(*    vsakem mestu vsota indeksa vrstice in indeksa stolpca.     *)
(*    (n = stevilo vrstic, m = stevilo stolpcev)                 *)

A[m_, n_] := Table[i + j, {i, 1, n}, {j, 1, m}]

(*    Preizkus:                                                  *)
A[3, 3] // MatrixForm


(* b) Determinanta, rang in lastne vrednosti matrike A(3,3).     *)

Det[A[3, 3]]
(*  ->  0                                                        *)
MatrixRank[A[3, 3]]
(*  ->  2                                                        *)
Eigenvalues[A[3, 3]]
(*  ->  {6 + Sqrt[42], 6 - Sqrt[42], 0}                          *)

(*  Opazimo: determinanta je 0 (matrika je singularna), rang je  *)
(*  2 (ne 3), ena lastna vrednost je 0  ->  stolpci matrike so   *)
(*  linearno odvisni (matrika ni polnega ranga).                 *)


(* c) Narisi vektorje, ki ustrezajo stolpcem A(3,3), in ravnino, *)
(*    v kateri ti trije vektorji lezijo (ukaz InfinitePlane).    *)

stolpci = Transpose[A[3, 3]]
(*  stolpci = {{2,3,4}, {3,4,5}, {4,5,6}}                        *)

Graphics3D[{
   {Red,    Arrow[{{0, 0, 0}, stolpci[[1]]}]},
   {Green,  Arrow[{{0, 0, 0}, stolpci[[2]]}]},
   {Blue,   Arrow[{{0, 0, 0}, stolpci[[3]]}]},
   {Opacity[0.3], Yellow, InfinitePlane[{0, 0, 0}, {stolpci[[1]], stolpci[[2]]}]}
   },
  Axes -> True, AxesLabel -> {"x", "y", "z"},
  ImageSize -> 400]
(*  Vsi trije vektorji lezijo v isti ravnini skozi izhodisce     *)
(*  (kar potrjuje, da je rang 2).                                *)


(* d) Parametra, s katerima prvi stolpec izrazimo z drugima      *)
(*    dvema:   stolpec1 = s * stolpec2 + t * stolpec3.           *)

Solve[stolpci[[1]] == s stolpci[[2]] + t stolpci[[3]], {s, t}]
(*  ->  {s -> 2, t -> -1}                                        *)
(*  torej:  (1. stolpec) = 2*(2. stolpec) - 1*(3. stolpec)       *)


(* e) Cela stevila alpha, x1, x2, x3, ki zadoscajo enakosti      *)
(*       M . (x1, x2, x3)^T = (-3, -5, -9, -11)^T,               *)
(*    kjer je  M = A(4,3) + alpha * I  (I identicna matrika      *)
(*    ustrezne velikosti).  Resitev v eni vrstici:               *)

Solve[(A[4, 3] + alpha IdentityMatrix[{4, 3}]) . {x1, x2, x3} == {-3, -5, -9, -11}, {alpha, x1, x2, x3}, Integers]
(*  ->  {alpha -> -2, x1 -> -1, x2 -> -1, x3 -> 0}               *)



(* ============================================================ *)
(*  3. NALOGA  -  podatki o vremenu (vreme.xlsx)                 *)
(* ============================================================ *)

(*  Uvoz podatkov. Pot do datoteke po potrebi prilagodi.         *)
(*  Predpostavimo glavo:                                         *)
(*    Stevilka | Mesec | Najvisja | Povprecna                    *)

podatki = Import["vreme.xlsx"][[1]];
podatki // TableForm

(*  Locimo glavo od vrednosti:                                   *)
glava   = podatki[[1]];
tabela  = podatki[[2 ;;]];      (* 12 vrstic z vrednostmi *)


(* a) Graficni prikaz najvisjih mesecnih temperatur z barvnim    *)
(*    stolpicnim grafom (podobno prilozenemu).                   *)
(*    Stevilke mesecev = 1. stolpec, najvisje temperature = 3.   *)

steviceMesecev = tabela[[All, 1]];     (* {1,2,...,12} *)
najvisje       = tabela[[All, 3]];     (* najvisje temperature *)

BarChart[najvisje,
  ChartLabels -> steviceMesecev,
  ColorFunction -> "Rainbow",
  ChartStyle -> "Rainbow",
  PlotLabel -> "Najvisje mesecne temperature v Ljubljani 2025",
  AxesLabel -> {"mesec", "T [°C]"},
  ChartElementFunction -> "GradientScaleRectangle"]


(* b) Poizvedba, ki vrne imena "toplih mesecev" - mesecev,       *)
(*    katerih povprecna temperatura je visja od 15 stopinj.      *)
(*    (imena = 2. stolpec, povprecna = 4. stolpec)               *)
(*    Poskus v eni vrstici:                                      *)

Select[tabela, #[[4]] > 15 &][[All, 2]]
(*  ->  {Maj, Junij, Julij, Avgust, September}                   *)
