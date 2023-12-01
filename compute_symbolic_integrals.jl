using SymPy

include("./quantum_operators/energy_operators/hamiltonian.jl")
include("./quantum_systems/atomic_systems/helium_atom.jl")
include("./trial_functions/hylleraas_type/correlated_pol_int.jl");

function compute_symbolic_integrals()
  @syms x y z alpha c0 c1 c2 phi
  m1 = m1_he
  m2 = m2_he
  m3 = m3_he
  q1 = q1_he
  q2 = q2_he
  q3 = q3_he
  phi = correlated_pol_int(x, y, z, alpha, c0, c1, c2)
  h = hamiltonian(phi, x, y, z, m1, m2, m3, q1, q2, q3)
  integral_result1 = integrate(h * z, (z, sqrt((x - y)^2), x + y))
  integral_result2 = integrate(phi * z, (z, sqrt((x - y)^2), x + y))
  return integral_result1, integral_result2
end
