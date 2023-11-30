include("./potential.jl");
include("./kinetic.jl");
include("./polarization.jl");

function hamiltonian(phi, x, y, z)
  return  phi * (kinetic(phi, z, m1, m2) + kinetic(phi, x, m1, m3) + kinetic(phi, y, m2, m3)
          + potential(z, q1, q2) + potential(x, q1, q3) + potential(y, q2, q3)
          + polarization(phi, z, x, y, m1) + polarization(phi, y, z, x, m2) + polarization(phi, x, y, z, m3))
end