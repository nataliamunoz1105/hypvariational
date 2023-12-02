using Cubature
using SymPy
using Printf
using DelimitedFiles

include("compute_symbolic_integrals_4.jl")
include("get_xy_numeric_function.jl")

function quotient(alpha_values, c0_values, c1_values, c2_values)
  min_quotient = Inf
  min_alpha = nothing
  min_c0 = nothing
  min_c1 = nothing
  min_c2 = nothing
  g1, g2 = compute_symbolic_integrals_4()
  @syms x y
  results::Vector{Vector{Float64}} = Vector{Vector{Float64}}()
  counter::Float64 = 0
  for alpha in alpha_values
    for c0 in c0_values
      for c1 in c1_values
        for c2 in c2_values
          function1 = get_xy_numeric_function(x * y * g1(x, y, c0, c1, c2))
          function2 = get_xy_numeric_function(x * y * g2(x, y, c0, c1, c2))
          integral1, error = hcubature(function1, [0.0, 0.0], [100, 100])
          integral2, error = hcubature(function2, [0.0, 0.0], [100, 100])
          quotient = simplify(integral1 / integral2)
          @printf("--::>> int1=%.2e int2=%.2e quot=%.2e at c0=%.2e, c1=%.2e, c2=%.2e\n", integral1, integral2, quotient, c0, c1, c2)
          if quotient < min_quotient
            min_quotient = quotient
            min_alpha = alpha
            min_c0 = c0
            min_c1 = c1
            min_c2 = c2
          end
          counter += 1
          push!(results, [counter, alpha, c0, c1, c2, quotient])
        end
      end
    end
  end
  writedlm("history.tsv", results, '\t', header=false)
  writedlm("result.tsv", [min_alpha, min_c0, min_c1, min_c2, min_quotient], '\t', header=false)
  return min_alpha, min_c0, min_c1, min_c2, min_quotient
end


alpha_values = range(0, stop=1, length=4)
c0_values = range(-1.0, stop=1.0, length=4)
c1_values = range(-1.0, stop=1.0, length=4)
c2_values = range(-1.0, stop=1.0, length=4)

min_alpha, min_c0, min_c1, min_c2, min_quotient = quotient(alpha_values, c0_values, c1_values, c2_values)

println("Minimum quotient:", min_quotient)
println("Corresponding Alpha:", min_alpha)
println("Corresponding c1:", min_c0)
println("Corresponding c1:", min_c1)
println("Corresponding c1:", min_c2)