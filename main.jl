using SymPy

include("./energies/hamiltonian.jl");
include("./wave_functions/test_function.jl")

@syms x y z alpha beta;

m11 = m12 = 1;
m13 = 7294;
q1 = q2 = -1.0;
q3 = 2.0;
c1 = 0.390807;

phi = phi1(x, y, z, alpha, beta);


lim_inf = abs(x - y);
lim_sup = x + y;

integral_result = integrate(hamiltonian(phi, x, y, z) * z, (z, lim_inf, lim_sup));

println(integral_result);


