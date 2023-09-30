using Cubature

# Define your function G(r, a, alpha, beta)
function G(x, alpha, beta)
    return alpha * x[1] + beta * x[2]
end

inf = 10000000000000000000000000000000000000000

# Define a function to compute the double integral
function double_integral(alpha_values, beta_values)
    min_integral = Inf
    min_alpha = nothing
    min_beta = nothing
    for alpha in alpha_values
        for beta in beta_values
            # Define the function to integrate
            f(x) = G(x, alpha, beta)
            # Perform the double integral
            integral, error = hcubature(f, [0.0, 0.0], [inf, 2π])
            # Update minimum if a smaller integral is found
            if integral < min_integral
                min_integral = integral
                min_alpha = alpha
                min_beta = beta
            end
        end
    end

    return min_alpha, min_beta, min_integral
end

# Define arrays of alpha and beta values
alpha_values = range(0.1, stop=2.0, length=10)
beta_values = range(0.1, stop=2.0, length=10)

# Compute the minimum integral and corresponding alpha and beta
min_alpha, min_beta, min_integral = double_integral(alpha_values, beta_values)

println("Minimum Integral:", min_integral)
println("Corresponding Alpha:", min_alpha)
println("Corresponding Beta:", min_beta)
