using Cubature
using SymPy
using Printf
using DelimitedFiles

include("compute_symbolic_integrals_7.jl")
include("get_xy_numeric_function.jl")

function quotient(alpha_values, c0_values, c1_values, c2_values, c3_values, c4_values, c5_values)
  min_quotient = Inf
  min_alpha = nothing
  min_c0 = nothing
  min_c1 = nothing
  min_c2 = nothing
  min_c3 = nothing
  min_c4 = nothing
  min_c5 = nothing
  g1, g2 = compute_symbolic_integrals_7()
  println(g1, g2)
  @syms x y
  results::Vector{Vector{Float64}} = Vector{Vector{Float64}}()
  counter::Float64 = 0
  for alpha in alpha_values
    for c0 in c0_values
      for c1 in c1_values
        for c2 in c2_values
          for c3 in c3_values
            for c4 in c4_values
              for c5 in c5_values
                function1 = get_xy_numeric_function(x * y * g1(x, y, alpha, c0, c1, c2, c3, c4, c5))
                function2 = get_xy_numeric_function(x * y * g2(x, y, alpha, c0, c1, c2, c3, c4, c5))
                integral1, error = hcubature(function1, [0.0, 0.0], [100, 100])
                integral2, error = hcubature(function2, [0.0, 0.0], [100, 100])
                quotient = simplify(integral1 / integral2)
                @printf(
                  "--::>> int1=%.2e int2=%.2e quot=%.2e at c0=%.2e, c1=%.2e, c2=%.2e, c3=%.2e, c4=%.2e, c5=%.2e\n",
                  integral1, integral2, quotient, c0, c1, c2, c3, c4, c5
                )
                if quotient < min_quotient
                  println(quotient, min_quotient, quotient < min_quotient)
                  min_quotient = quotient
                  min_alpha = alpha
                  min_c0 = c0
                  min_c1 = c1
                  min_c2 = c2
                  min_c3 = c3
                  min_c4 = c4
                  min_c5 = c5
                end
                counter += 1
                push!(results, [counter, alpha, c0, c1, c2, c3, c4, c5, quotient])
              end
            end
          end
        end
      end
    end
  end
  writedlm("history.tsv", results, '\t', header=false)
  writedlm("result.tsv", [min_alpha, min_c0, min_c1, min_c2, min_c3, min_c4, min_c5, min_quotient], '\t', header=false)
  return min_alpha, min_c0, min_c1, min_c2, min_c3, min_c4, min_c5, min_quotient
end


alpha_values = range(1.6, stop=1.8, length=3)
c0_values = [1] #range(1, stop=1.1, length=1)
c1_values = range(0.3, stop=0.38, length=3)
c2_values = range(-0.038, stop=-0.036, length=3)
c3_values = range(-0.15, stop=-0.14, length=3)
c4_values = range(0.02, stop=0.025, length=3)
c5_values = range(0.10, stop=0.12, length=3)

min_alpha, min_c0, min_c1, min_c2, min_c3, min_c4, min_c5, min_quotient = quotient(alpha_values, c0_values, c1_values, c2_values, c3_values, c4_values, c5_values)

println("Minimum quotient:", min_quotient)
println("Corresponding Alpha:", min_alpha)
println("Corresponding c0:", min_c0)
println("Corresponding c1:", min_c1)
println("Corresponding c2:", min_c2)
println("Corresponding c3:", min_c3)
println("Corresponding c4:", min_c4)
println("Corresponding c5:", min_c5)