function polarization(phi, ra, rb, rc, m)
    return -(1 / (2m * ra * rb)) * (ra^2 + rb^2 - rc^2) * SymPy.diff(SymPy.diff(phi, ra), rb) 
  end