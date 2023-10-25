# # Importar la biblioteca SymPy
using SymPy

# # Definir los símbolos
@syms x y z alpha beta 

m11 = m12 = 1
m13 = 7294 
q1 = q2 = -1.0
q3 = 2.0

function phi1(x, y, z, alpha, beta)
  return exp(-alpha*x - beta*y)*z^2 
end

phi = phi1(x, y, z, alpha, beta)

function kinetic(phi, r, ma, mb)
  return -(1/2) * (1/(ma) + 1/(mb)) * (SymPy.diff(phi, r, 2) + (2 * SymPy.diff(phi, r)) / r)
end

function potential(r, qa, qb)
  return (qa*qb)/r
end

function polarization(Φ, ra, rb, rc, m)
  return -(1/(2m*ra*rb))*(ra^2+rb^2-rc^2)*SymPy.diff(SymPy.diff(phi, ra), rb)
end



function hamiltonian(phi, x, y, z)
  return phi * 
  (kinetic(phi, z, m11, m12) + kinetic(phi, x, m11, m13) + kinetic(phi, y, m12, m13)
  + potential(z, q1, q2) + potential(x, q1, q3) + potential(y, q2, q3) 
  + polarization(phi, z, x, y, m11) + polarization(phi, y, z, x, m12) + polarization(phi, x, y, z, m13))
end

print(hamiltonian(phi, x, y, z))

# function H(x, y, z, α1, β1, γ1, u1, l1)
#   Φ = Φ1(x, y, z, α1, β1, γ1, u1, l1)
#   return Φ * (-(1/2) * (1/(m11) + 1/(m12)) * (SymPy.diff(Φ, z, 2) + (2 * SymPy.diff(Φ, z)) / z) -
#               (1/2) * (1/(m11) + 1/(m13)) * (SymPy.diff(Φ, x, 2) + (2 * SymPy.diff(Φ, x)) / x) -
#               (1/2) * (1/(m12) + 1/(m13)) * (SymPy.diff(Φ, y, 2) + (2 * SymPy.diff(Φ, y)) / y) +
#               (q11 * q12 * Φ) / z + (q11 * q13 * Φ) / x + (q12 * q13 * Φ) / y -
#               (1/m11) * (z^2 + x^2 - y^2) / (2 * z * x) * SymPy.diff(SymPy.diff(Φ, z), x) -
#               (1/m12) * (y^2 + z^2 - x^2) / (2 * y * z) * SymPy.diff(SymPy.diff(Φ, z), y) -
#               (1/m13) * (x^2 + y^2 - z^2) / (2 * x * y) * SymPy.diff(SymPy.diff(Φ, x), y))
# end
  