# 2. domača naloga 2025/26 — rešitve

Naloga ima dva dela. Spodaj so datoteke in vsi rezultati.

## Datoteke
- `DN2_1del_Mathematica.m` — 1. del (Mathematica), vse 3 naloge. Ukaze prilepi v Mathematico (vsako celico posebej). Za 3. nalogo potrebuješ `vreme.xlsx` v isti mapi.
- `DN2_2del.m` — 2. del (Matlab), glavna skripta. Zaženi `DN2_2del`.
- `parabola.m` — ločena funkcija za nalogo 3c (Matlab). Mora biti v isti mapi.

---

## 1. del — Mathematica

### 1. naloga
- **a)** Vsota 1 + 1/9 + 1/25 + … = **π²/8 ≈ 1.2337**
- **b)** Limita (sin x − x)/x³ pri x→0 = **−1/6**
- **c)** Ploščina med g(x)=sin x + x² in osjo na [0, 2π] = **8π³/3 ≈ 82.683**
- **d)** Ploščina med g(x)=sin x + x² in g₁(x)=sin x + x⁵/5 (presečišči x=0 in x=∛5) = **5/6 ≈ 0.8333**

### 2. naloga
A(m,n) vrne matriko n×m, kjer je element = vrstica + stolpec. Za A(3,3) = [[2,3,4],[3,4,5],[4,5,6]]:
- **b)** det = **0**, rang = **2**, lastne vrednosti = **6+√42, 6−√42, 0**. Ena lastna vrednost je 0 in determinanta 0 → matrika je singularna, stolpci so linearno odvisni.
- **c)** Trije stolpčni vektorji ležijo v isti ravnini skozi izhodišče (narisano z `InfinitePlane`), kar potrjuje rang 2.
- **d)** 1. stolpec = **2·(2. stolpec) − 1·(3. stolpec)**, torej s=2, t=−1.
- **e)** Enolična celoštevilska rešitev: **α=−2, x₁=−1, x₂=−1, x₃=0**.

### 3. naloga (vreme.xlsx)
- **a)** Stolpčni graf najvišjih mesečnih temperatur z barvno lestvico (Rainbow), oznake = številke mesecev. Vrednosti se preberejo iz uvožene tabele.
- **b)** Topli meseci (povprečna T > 15 °C): **Maj, Junij, Julij, Avgust, September**.

---

## 2. del — Matlab

### 1. naloga
a = [−3 −1 1 3 5], b = [10 8 6 4 2], skalarni produkt **a·b = −10**.

### 2. naloga
- **a)** 2. stolpec A: [2; 0; −2; 2]
- **b)** vsota = **18**, povprečje = **1.125**
- **c)** A1 = (A+2).^3 (računano po komponentah)
- **d)** B = A − (17/2)·I, det(B) = **−350.0625**, največji element po absolutni vrednosti = **8.5**

### 3. naloga
- **a)** Graf f(x)=sin(3x)+x/9 na [−2, π]; f(1) ≈ **0.2522**, točka označena na grafu.
- **b)** Anonimna funkcija `povprecje = @(a,b)(a+b)/2`; povprecje(0.5, 6) = **3.25**.
- **c)** Funkcija `parabola(a,b,c)` (ločena datoteka) nariše p(x)=ax²+bx+c na [−5,5] in vrne p(1)=a+b+c.

---

### Opombe
- V 2. nalogi (1. del) je `IdentityMatrix[{4,3}]` pravokotna "identiteta" 4×3 (1 na glavni diagonali), ker je M = A(4,3)+αI pravokotna 4×3 matrika; pri morebitnih težavah z uvozom preveri obliko `vreme.xlsx` z `Import["vreme.xlsx"]`.
- Vse številske vrednosti so bile preverjene neodvisno.
