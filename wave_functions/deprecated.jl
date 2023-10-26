function H(x, y, z, α1, β1, γ1, u1, l1)
  Φ = Φ1(x, y, z, α1, β1, γ1, u1, l1)
  return Φ * (-(1 / 2) * (1 / (m11) + 1 / (m12)) * (SymPy.diff(Φ, z, 2) + (2 * SymPy.diff(Φ, z)) / z) -
              (1 / 2) * (1 / (m11) + 1 / (m13)) * (SymPy.diff(Φ, x, 2) + (2 * SymPy.diff(Φ, x)) / x) -
              (1 / 2) * (1 / (m12) + 1 / (m13)) * (SymPy.diff(Φ, y, 2) + (2 * SymPy.diff(Φ, y)) / y) +
              (q11 * q12 * Φ) / z + (q11 * q13 * Φ) / x + (q12 * q13 * Φ) / y -
              (1 / m11) * (z^2 + x^2 - y^2) / (2 * z * x) * SymPy.diff(SymPy.diff(Φ, z), x) -
              (1 / m12) * (y^2 + z^2 - x^2) / (2 * y * z) * SymPy.diff(SymPy.diff(Φ, z), y) -
              (1 / m13) * (x^2 + y^2 - z^2) / (2 * x * y) * SymPy.diff(SymPy.diff(Φ, x), y))
end