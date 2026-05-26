function p1 = parabola(a, b, c)
% PARABOLA  Narise parabolo p(x) = a*x^2 + b*x + c na intervalu [-5, 5]
%           in vrne vrednost parabole v tocki x = 1.
%
%   p1 = parabola(a, b, c)
%
%   Vhod:  a, b, c - koeficienti parabole p(x) = a*x^2 + b*x + c
%   Izhod: p1      - vrednost parabole v tocki x = 1  (p1 = a + b + c)

    % funkcija parabole
    p = @(x) a*x.^2 + b*x + c;

    % risanje na intervalu [-5, 5]
    x = linspace(-5, 5, 400);
    figure;
    plot(x, p(x), 'b-', 'LineWidth', 1.5);
    grid on;
    xlabel('x'); ylabel('p(x)');
    title(sprintf('p(x) = %g x^2 + %g x + %g', a, b, c));

    % vrnjena vrednost: parabola v tocki x = 1
    p1 = p(1);
end
