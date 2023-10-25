# Importar la biblioteca SymPy
using SymPy

# Definir los símbolos
@syms x y z α1 β1 γ1 u1 l1

# Definir la función Φ1(x, y, z)
function phi1(x, y, z, α1, β1)
    return exp(-α1*x - β1*y)*z^2 
end

# Definir los parámetros y el funcional H[Φ1]
m11 = m12 = 1
m13 = 7294 * m12
q11 = q12 = -1.0
q13 = 2.0

# Definir la función H[Φ1]
function Htest(x, y, z, α1, β1)
  Φ = Φ1(x, y, z, α1, β1)
  return Φ * (SymPy.diff(Φ, z, 2))
end

# Definir los límites de integración
lim_inf = abs(x - y)
lim_sup = x + y

# Realizar la integración simbólica
integral_result = integrate(H(x, y, z, α1, β1), (z, lim_inf, lim_sup))

# Mostrar el resultado
println(integral_result)





