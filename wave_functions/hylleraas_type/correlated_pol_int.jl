function correlated_pol_int(x, y, z, alpha, c0, c1, c2)
    return exp(-alpha * (x + y)) * (c0 + c1 * z + c2 * z^2)
  end