function correlated_pol_7(x, y, z, alpha, c0, c1, c2, c3, c4, c5)
  return exp(-alpha * (x + y)) * (c0 + c1 * z + c2 * z^2 + c3 * (x + y) + c4 * (x + y)^2 + c5 * (x - y)^2)
end