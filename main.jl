using SymPy

include("./quantum_operators/energy_operators/hamiltonian.jl");
include("./trial_functions/hylleraas_type/correlated_pol1.jl");
include("./trial_functions/hylleraas_type/kellner_function.jl");
include("./trial_functions/hylleraas_type/correlated_pol2.jl");
include("./trial_functions/hylleraas_type/correlated_pol_int.jl");
include("./quantum_operators/identity_operator/joint_density.jl");
include("./quantum_systems/atomic_systems/helium_atom.jl");


m1 = m1_he;
m2 = m2_he;
m3 = m3_he;
q1 = q1_he;
q2 = q2_he;
q3 = q3_he;

function integrals(x, y, alpha, c0, c1, c2)
  @syms x y z alpha c0 c1 c2;
  phi = correlated_pol_int(x, y, z, alpha, c0, c1, c2);
  
  lim_inf = sqrt((x - y)^2);
  lim_sup = x + y;
  
  integral_result1 = integrate(hamiltonian(phi, x, y, z) * z, (z, lim_inf, lim_sup));
  integral_result2 = integrate(density(phi) * z, (z, lim_inf, lim_sup));
  return integral_result1, integral_result2
end