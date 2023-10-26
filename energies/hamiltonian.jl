include("./potential.jl");
include("./kinetic.jl");
include("./polarization.jl");

function hamiltonian(phi, x, y, z)
  return phi *
         (kinetic(phi, z, m11, m12) + kinetic(phi, x, m11, m13) + kinetic(phi, y, m12, m13)
          + potential(z, q1, q2) + potential(x, q1, q3) + potential(y, q2, q3)
          + polarization(phi, z, x, y, m11) + polarization(phi, y, z, x, m12) + polarization(phi, x, y, z, m13))
end