function kinetic(phi, r, ma, mb)
    return -(1 / 2) * (1 / (ma) + 1 / (mb)) * (SymPy.diff(phi, r, 2) + (2 * SymPy.diff(phi, r)) / r) 
  end