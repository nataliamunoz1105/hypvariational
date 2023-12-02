using Cubature
using SymPy
using Printf
using DelimitedFiles

include("compute_symbolic_integrals_7.jl")
include("get_xy_numeric_function.jl")

alpha = 1.755656
c0 = 1
c1 = 0.337294
c2 = -0.037024
c3 = -0.145874
c4 = 0.023634
c5 = 0.112519

g1, g2 = compute_symbolic_integrals_7()
println(g1, g2)
@syms x y
function1 = get_xy_numeric_function(x * y * g1(x, y, alpha, c0, c1, c2, c3, c4, c5))
function2 = get_xy_numeric_function(x * y * g2(x, y, alpha, c0, c1, c2, c3, c4, c5))
integral1, error = hcubature(function1, [0.0, 0.0], [100, 100])
integral2, error = hcubature(function2, [0.0, 0.0], [100, 100])
quotient = simplify(integral1 / integral2)
println(quotient)