import numpy as np
from scipy import integrate
from numba import jit, float64
from numba.core.errors import NumbaWarning
import warnings

warnings.simplefilter('ignore', category=NumbaWarning)

@jit(nopython=True)
def G(r: float64, a: float64, alpha: float64, beta: float64):
  # Define your function G(r, a, alpha, beta) here
  # For example: return alpha * r + beta * a
  # Modify this according to your actual function.
  return alpha * r + beta * a

@jit
def double_integral(alpha_values, beta_values):
  min_integral = np.inf
  min_alpha = None
  min_beta = None
  for alpha in alpha_values:
    for beta in beta_values:
      # Define the integrand as a function of r and a
      # integrand = lambda r, a: G(r, a, alpha, beta)

      # Perform the double integral
      integral, _ = integrate.nquad(G, [[0, np.inf], [0, 2*np.pi]], args=(alpha, beta))

      # Update minimum if a smaller integral is found
      if integral < min_integral:
        min_integral = integral
        min_alpha = alpha
        min_beta = beta
  return min_alpha, min_beta, min_integral


# Define arrays of alpha and beta values
alpha_values = np.linspace(0.1, 2.0, 10)
beta_values = np.linspace(0.1, 2.0, 10)

# Compute the minimum integral and corresponding alpha and beta
min_alpha, min_beta, min_integral = double_integral(alpha_values, beta_values)

print("Minimum Integral:", min_integral)
print("Corresponding Alpha:", min_alpha)
print("Corresponding Beta:", min_beta)