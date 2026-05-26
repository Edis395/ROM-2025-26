%% ============================================================
%  2. domaca naloga 2025/26  -  2. del  (Matlab)
%  Glavna skripta. Zazeni jo z ukazom: DN2_2del
%  (datoteki  povprecje  in  parabola  morata biti v isti mapi)
% =============================================================
clc; clear; close all;

%% ============================================================
%  1. NALOGA
%  Vektor a: vsa liha stevila med -3 in 5  -> -3 -1 1 3 5
%  Vektor b: vsa soda stevila med 10 in 2 (padajoce) -> 10 8 6 4 2
%  Izracun skalarnega produkta.
% =============================================================
a = -3:2:5;          % liha stevila: -3 -1 1 3 5
b = 10:-2:2;         % soda stevila padajoce: 10 8 6 4 2

skalarni_produkt = dot(a, b);    % = a*b'

disp('--- 1. naloga ---');
disp('a ='); disp(a);
disp('b ='); disp(b);
fprintf('Skalarni produkt a . b = %d\n\n', skalarni_produkt);  % -10


%% ============================================================
%  2. NALOGA
% =============================================================
A = [ 1  2 -3  4;
     -1  0 -3  8;
      2 -2  2  1;
      0  2 -3  8];

disp('--- 2. naloga ---');
disp('Matrika A ='); disp(A);

% a) Drugi stolpec matrike A
disp('a) Drugi stolpec A(:,2) ='); disp(A(:,2));

% b) Vsota in povprecje vseh elementov matrike A
vsota     = sum(A(:));
povprecje = mean(A(:));
fprintf('b) Vsota elementov     = %g\n', vsota);       % 18
fprintf('   Povprecje elementov = %g\n', povprecje);   % 1.125

% c) Matrika A1, kjer velja  A1(i,j) = (A(i,j) + 2)^3
%    (racunanje po komponentah z operatorjema .+ in .^)
A1 = (A + 2).^3;
disp('c) A1 = (A+2).^3 ='); disp(A1);

% d) Matrika  B = A - (17/2) I
B = A - (17/2) * eye(4);
disp('d) B = A - (17/2)*I ='); disp(B);

detB = det(B);
fprintf('   det(B) = %g\n', detB);                      % -350.0625

% Najvecji element po absolutni vrednosti
[maxAbs, idx] = max(abs(B(:)));
fprintf('   Najvecji element po absolutni vrednosti = %g\n\n', maxAbs);  % 8.5


%% ============================================================
%  3. NALOGA  -  funkcije in risanje
% =============================================================
disp('--- 3. naloga ---');

% a) Graf funkcije f(x) = sin(3x) + x/9 na intervalu [-2, pi].
%    Izracun f(1) in oznacitev tocke na grafu.
f = @(x) sin(3*x) + x/9;

x = linspace(-2, pi, 400);
figure;
plot(x, f(x), 'b-', 'LineWidth', 1.5); hold on;

x0  = 1;
fx0 = f(x0);
plot(x0, fx0, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
text(x0, fx0, sprintf('  (1, %.3f)', fx0), 'VerticalAlignment','bottom');

grid on;
xlabel('x'); ylabel('f(x)');
title('f(x) = sin(3x) + x/9');
legend('f(x)', 'tocka pri x = 1', 'Location', 'best');
hold off;

fprintf('a) f(1) = %.4f\n', fx0);

% b) Anonimna funkcija "povprecje", ki sprejme stevili a in b
%    ter vrne njuno povprecje. Izracun povprecje(0.5, 6).
povprecje_anon = @(a, b) (a + b) / 2;
fprintf('b) povprecje(0.5, 6) = %.4f\n', povprecje_anon(0.5, 6));  % 3.25

% c) Funkcija parabola (definirana v locheni datoteki parabola.m),
%    ki narise parabolo p(x) = a x^2 + b x + c na [-5, 5] in vrne
%    vrednost parabole v tocki x = 1.
%    Primer klica (npr. a=1, b=-2, c=1  ->  p(1) = 0):
p1 = parabola(1, -2, 1);
fprintf('c) parabola(1, -2, 1): p(1) = %g\n', p1);
