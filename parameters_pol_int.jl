using Cubature
using SymPy

# include("main.jl")

function g1(x, y, alpha, c0, c1, c2)
  return alpha^2*c1*c2*(x + y)^7*exp(-2*alpha*x)*exp(-2*alpha*y)/(51058*x*y) - alpha^2*c1*c2*((x - y)^2)^(7/2)*exp(-2*alpha*x)*exp(-2*alpha*y)/(51058*x*y) - alpha^2*c2^2*(x - y)^8*exp(-2*alpha*x)*exp(-2*alpha*y)/(116704*x*y) + alpha^2*c2^2*(x + y)^8*exp(-2*alpha*x)*exp(-2*alpha*y)/(116704*x*y) - (x - y)^6*(2.28498309112513e-5*alpha^2*c0*c2*exp(-2*alpha*x)*exp(-2*alpha*y)/(x*y) + 1.14249154556256e-5*alpha^2*c1^2*exp(-2*alpha*x)*exp(-2*alpha*y)/(x*y) - 1.14249154556256e-5*alpha^2*c2^2*x*exp(-2*alpha*x)*exp(-2*alpha*y)/y - 0.166689516497578*alpha^2*c2^2*exp(-2*alpha*x)*exp(-2*alpha*y) - 1.14249154556256e-5*alpha^2*c2^2*y*exp(-2*alpha*x)*exp(-2*alpha*y)/x + 0.333356183164245*alpha*c2^2*exp(-2*alpha*x)*exp(-2*alpha*y)/y + 0.333356183164245*alpha*c2^2*exp(-2*alpha*x)*exp(-2*alpha*y)/x - 0.333333333333333*c2^2*exp(-2*alpha*x)*exp(-2*alpha*y)/y - 0.333333333333333*c2^2*exp(-2*alpha*x)*exp(-2*alpha*y)/x) - (x - y)^4*(1.71373731834384e-5*alpha^2*c0^2*exp(-2*alpha*x)*exp(-2*alpha*y)/(x*y) - 3.42747463668769e-5*alpha^2*c0*c2*x*exp(-2*alpha*x)*exp(-2*alpha*y)/y - 0.500068549492734*alpha^2*c0*c2*exp(-2*alpha*x)*exp(-2*alpha*y) - 3.42747463668769e-5*alpha^2*c0*c2*y*exp(-2*alpha*x)*exp(-2*alpha*y)/x - 1.71373731834384e-5*alpha^2*c1^2*x*exp(-2*alpha*x)*exp(-2*alpha*y)/y - 0.250034274746367*alpha^2*c1^2*exp(-2*alpha*x)*exp(-2*alpha*y) - 1.71373731834384e-5*alpha^2*c1^2*y*exp(-2*alpha*x)*exp(-2*alpha*y)/x + 0.750068549492734*alpha*c0*c2*exp(-2*alpha*x)*exp(-2*alpha*y)/y + 0.750068549492734*alpha*c0*c2*exp(-2*alpha*x)*exp(-2*alpha*y)/x + 0.375034274746367*alpha*c1^2*exp(-2*alpha*x)*exp(-2*alpha*y)/y + 0.375034274746367*alpha*c1^2*exp(-2*alpha*x)*exp(-2*alpha*y)/x - 0.25*alpha*c2^2*x^2*exp(-2*alpha*x)*exp(-2*alpha*y)/y + 0.25*alpha*c2^2*x*exp(-2*alpha*x)*exp(-2*alpha*y) + 0.25*alpha*c2^2*y*exp(-2*alpha*x)*exp(-2*alpha*y) - 0.25*alpha*c2^2*y^2*exp(-2*alpha*x)*exp(-2*alpha*y)/x - 1.0*c0*c2*exp(-2*alpha*x)*exp(-2*alpha*y)/y - 1.0*c0*c2*exp(-2*alpha*x)*exp(-2*alpha*y)/x - 0.5*c1^2*exp(-2*alpha*x)*exp(-2*alpha*y)/y - 0.5*c1^2*exp(-2*alpha*x)*exp(-2*alpha*y)/x + 0.5*c1*c2*exp(-2*alpha*x)*exp(-2*alpha*y) - 1.5*c2^2*exp(-2*alpha*x)*exp(-2*alpha*y)) - (x - y)^2*(-3.42747463668769e-5*alpha^2*c0^2*x*exp(-2*alpha*x)*exp(-2*alpha*y)/y - 0.500068549492734*alpha^2*c0^2*exp(-2*alpha*x)*exp(-2*alpha*y) - 3.42747463668769e-5*alpha^2*c0^2*y*exp(-2*alpha*x)*exp(-2*alpha*y)/x + 0.500068549492734*alpha*c0^2*exp(-2*alpha*x)*exp(-2*alpha*y)/y + 0.500068549492734*alpha*c0^2*exp(-2*alpha*x)*exp(-2*alpha*y)/x - 0.5*alpha*c0*c2*x^2*exp(-2*alpha*x)*exp(-2*alpha*y)/y + 0.5*alpha*c0*c2*x*exp(-2*alpha*x)*exp(-2*alpha*y) + 0.5*alpha*c0*c2*y*exp(-2*alpha*x)*exp(-2*alpha*y) - 0.5*alpha*c0*c2*y^2*exp(-2*alpha*x)*exp(-2*alpha*y)/x - 0.25*alpha*c1^2*x^2*exp(-2*alpha*x)*exp(-2*alpha*y)/y + 0.25*alpha*c1^2*x*exp(-2*alpha*x)*exp(-2*alpha*y) + 0.25*alpha*c1^2*y*exp(-2*alpha*x)*exp(-2*alpha*y) - 0.25*alpha*c1^2*y^2*exp(-2*alpha*x)*exp(-2*alpha*y)/x - 1.0*c0^2*exp(-2*alpha*x)*exp(-2*alpha*y)/y - 1.0*c0^2*exp(-2*alpha*x)*exp(-2*alpha*y)/x + 1.0*c0*c1*exp(-2*alpha*x)*exp(-2*alpha*y) - 3.0*c0*c2*exp(-2*alpha*x)*exp(-2*alpha*y) - 1.0*c1^2*exp(-2*alpha*x)*exp(-2*alpha*y)) + (x + y)^6*(2.28498309112513e-5*alpha^2*c0*c2*exp(-2*alpha*x)*exp(-2*alpha*y)/(x*y) + 1.14249154556256e-5*alpha^2*c1^2*exp(-2*alpha*x)*exp(-2*alpha*y)/(x*y) - 1.14249154556256e-5*alpha^2*c2^2*x*exp(-2*alpha*x)*exp(-2*alpha*y)/y - 0.166689516497578*alpha^2*c2^2*exp(-2*alpha*x)*exp(-2*alpha*y) - 1.14249154556256e-5*alpha^2*c2^2*y*exp(-2*alpha*x)*exp(-2*alpha*y)/x + 0.333356183164245*alpha*c2^2*exp(-2*alpha*x)*exp(-2*alpha*y)/y + 0.333356183164245*alpha*c2^2*exp(-2*alpha*x)*exp(-2*alpha*y)/x - 0.333333333333333*c2^2*exp(-2*alpha*x)*exp(-2*alpha*y)/y - 0.333333333333333*c2^2*exp(-2*alpha*x)*exp(-2*alpha*y)/x) + (x + y)^5*(2.74197970935015e-5*alpha^2*c0*c1*exp(-2*alpha*x)*exp(-2*alpha*y)/(x*y) - 2.74197970935015e-5*alpha^2*c1*c2*x*exp(-2*alpha*x)*exp(-2*alpha*y)/y - 0.400054839594187*alpha^2*c1*c2*exp(-2*alpha*x)*exp(-2*alpha*y) - 2.74197970935015e-5*alpha^2*c1*c2*y*exp(-2*alpha*x)*exp(-2*alpha*y)/x + 0.700054839594187*alpha*c1*c2*exp(-2*alpha*x)*exp(-2*alpha*y)/y + 0.700054839594187*alpha*c1*c2*exp(-2*alpha*x)*exp(-2*alpha*y)/x - 0.8*c1*c2*exp(-2*alpha*x)*exp(-2*alpha*y)/y - 0.8*c1*c2*exp(-2*alpha*x)*exp(-2*alpha*y)/x + 0.2*c2^2*exp(-2*alpha*x)*exp(-2*alpha*y)) + (x + y)^4*(1.71373731834384e-5*alpha^2*c0^2*exp(-2*alpha*x)*exp(-2*alpha*y)/(x*y) - 3.42747463668769e-5*alpha^2*c0*c2*x*exp(-2*alpha*x)*exp(-2*alpha*y)/y - 0.500068549492734*alpha^2*c0*c2*exp(-2*alpha*x)*exp(-2*alpha*y) - 3.42747463668769e-5*alpha^2*c0*c2*y*exp(-2*alpha*x)*exp(-2*alpha*y)/x - 1.71373731834384e-5*alpha^2*c1^2*x*exp(-2*alpha*x)*exp(-2*alpha*y)/y - 0.250034274746367*alpha^2*c1^2*exp(-2*alpha*x)*exp(-2*alpha*y) - 1.71373731834384e-5*alpha^2*c1^2*y*exp(-2*alpha*x)*exp(-2*alpha*y)/x + 0.750068549492734*alpha*c0*c2*exp(-2*alpha*x)*exp(-2*alpha*y)/y + 0.750068549492734*alpha*c0*c2*exp(-2*alpha*x)*exp(-2*alpha*y)/x + 0.375034274746367*alpha*c1^2*exp(-2*alpha*x)*exp(-2*alpha*y)/y + 0.375034274746367*alpha*c1^2*exp(-2*alpha*x)*exp(-2*alpha*y)/x - 0.25*alpha*c2^2*x^2*exp(-2*alpha*x)*exp(-2*alpha*y)/y + 0.25*alpha*c2^2*x*exp(-2*alpha*x)*exp(-2*alpha*y) + 0.25*alpha*c2^2*y*exp(-2*alpha*x)*exp(-2*alpha*y) - 0.25*alpha*c2^2*y^2*exp(-2*alpha*x)*exp(-2*alpha*y)/x - 1.0*c0*c2*exp(-2*alpha*x)*exp(-2*alpha*y)/y - 1.0*c0*c2*exp(-2*alpha*x)*exp(-2*alpha*y)/x - 0.5*c1^2*exp(-2*alpha*x)*exp(-2*alpha*y)/y - 0.5*c1^2*exp(-2*alpha*x)*exp(-2*alpha*y)/x + 0.5*c1*c2*exp(-2*alpha*x)*exp(-2*alpha*y) - 1.5*c2^2*exp(-2*alpha*x)*exp(-2*alpha*y)) + (x + y)^3*(-4.56996618225025e-5*alpha^2*c0*c1*x*exp(-2*alpha*x)*exp(-2*alpha*y)/y - 0.666758065990312*alpha^2*c0*c1*exp(-2*alpha*x)*exp(-2*alpha*y) - 4.56996618225025e-5*alpha^2*c0*c1*y*exp(-2*alpha*x)*exp(-2*alpha*y)/x + 0.833424732656978*alpha*c0*c1*exp(-2*alpha*x)*exp(-2*alpha*y)/y + 0.833424732656978*alpha*c0*c1*exp(-2*alpha*x)*exp(-2*alpha*y)/x - 0.5*alpha*c1*c2*x^2*exp(-2*alpha*x)*exp(-2*alpha*y)/y + 0.5*alpha*c1*c2*x*exp(-2*alpha*x)*exp(-2*alpha*y) + 0.5*alpha*c1*c2*y*exp(-2*alpha*x)*exp(-2*alpha*y) - 0.5*alpha*c1*c2*y^2*exp(-2*alpha*x)*exp(-2*alpha*y)/x - 1.33333333333333*c0*c1*exp(-2*alpha*x)*exp(-2*alpha*y)/y - 1.33333333333333*c0*c1*exp(-2*alpha*x)*exp(-2*alpha*y)/x + 0.666666666666667*c0*c2*exp(-2*alpha*x)*exp(-2*alpha*y) + 0.333333333333333*c1^2*exp(-2*alpha*x)*exp(-2*alpha*y) - 2.66666666666667*c1*c2*exp(-2*alpha*x)*exp(-2*alpha*y)) + (x + y)^2*(-3.42747463668769e-5*alpha^2*c0^2*x*exp(-2*alpha*x)*exp(-2*alpha*y)/y - 0.500068549492734*alpha^2*c0^2*exp(-2*alpha*x)*exp(-2*alpha*y) - 3.42747463668769e-5*alpha^2*c0^2*y*exp(-2*alpha*x)*exp(-2*alpha*y)/x + 0.500068549492734*alpha*c0^2*exp(-2*alpha*x)*exp(-2*alpha*y)/y + 0.500068549492734*alpha*c0^2*exp(-2*alpha*x)*exp(-2*alpha*y)/x - 0.5*alpha*c0*c2*x^2*exp(-2*alpha*x)*exp(-2*alpha*y)/y + 0.5*alpha*c0*c2*x*exp(-2*alpha*x)*exp(-2*alpha*y) + 0.5*alpha*c0*c2*y*exp(-2*alpha*x)*exp(-2*alpha*y) - 0.5*alpha*c0*c2*y^2*exp(-2*alpha*x)*exp(-2*alpha*y)/x - 0.25*alpha*c1^2*x^2*exp(-2*alpha*x)*exp(-2*alpha*y)/y + 0.25*alpha*c1^2*x*exp(-2*alpha*x)*exp(-2*alpha*y) + 0.25*alpha*c1^2*y*exp(-2*alpha*x)*exp(-2*alpha*y) - 0.25*alpha*c1^2*y^2*exp(-2*alpha*x)*exp(-2*alpha*y)/x - 1.0*c0^2*exp(-2*alpha*x)*exp(-2*alpha*y)/y - 1.0*c0^2*exp(-2*alpha*x)*exp(-2*alpha*y)/x + 1.0*c0*c1*exp(-2*alpha*x)*exp(-2*alpha*y) - 3.0*c0*c2*exp(-2*alpha*x)*exp(-2*alpha*y) - 1.0*c1^2*exp(-2*alpha*x)*exp(-2*alpha*y)) + (x + y)*(-0.5*alpha*c0*c1*x^2*exp(-2*alpha*x)*exp(-2*alpha*y)/y + 0.5*alpha*c0*c1*x*exp(-2*alpha*x)*exp(-2*alpha*y) + 0.5*alpha*c0*c1*y*exp(-2*alpha*x)*exp(-2*alpha*y) - 0.5*alpha*c0*c1*y^2*exp(-2*alpha*x)*exp(-2*alpha*y)/x + 1.0*c0^2*exp(-2*alpha*x)*exp(-2*alpha*y) - 2.0*c0*c1*exp(-2*alpha*x)*exp(-2*alpha*y)) - (-0.5*alpha*c0*c1*x^2*exp(-2*alpha*x)*exp(-2*alpha*y)/y + 0.5*alpha*c0*c1*x*exp(-2*alpha*x)*exp(-2*alpha*y) + 0.5*alpha*c0*c1*y*exp(-2*alpha*x)*exp(-2*alpha*y) - 0.5*alpha*c0*c1*y^2*exp(-2*alpha*x)*exp(-2*alpha*y)/x + 1.0*c0^2*exp(-2*alpha*x)*exp(-2*alpha*y) - 2.0*c0*c1*exp(-2*alpha*x)*exp(-2*alpha*y))*sqrt((x - y)^2) - (2.74197970935015e-5*alpha^2*c0*c1*exp(-2*alpha*x)*exp(-2*alpha*y)/(x*y) - 2.74197970935015e-5*alpha^2*c1*c2*x*exp(-2*alpha*x)*exp(-2*alpha*y)/y - 0.400054839594187*alpha^2*c1*c2*exp(-2*alpha*x)*exp(-2*alpha*y) - 2.74197970935015e-5*alpha^2*c1*c2*y*exp(-2*alpha*x)*exp(-2*alpha*y)/x + 0.700054839594187*alpha*c1*c2*exp(-2*alpha*x)*exp(-2*alpha*y)/y + 0.700054839594187*alpha*c1*c2*exp(-2*alpha*x)*exp(-2*alpha*y)/x - 0.8*c1*c2*exp(-2*alpha*x)*exp(-2*alpha*y)/y - 0.8*c1*c2*exp(-2*alpha*x)*exp(-2*alpha*y)/x + 0.2*c2^2*exp(-2*alpha*x)*exp(-2*alpha*y))*((x - y)^2)^(5/2) - (-4.56996618225025e-5*alpha^2*c0*c1*x*exp(-2*alpha*x)*exp(-2*alpha*y)/y - 0.666758065990312*alpha^2*c0*c1*exp(-2*alpha*x)*exp(-2*alpha*y) - 4.56996618225025e-5*alpha^2*c0*c1*y*exp(-2*alpha*x)*exp(-2*alpha*y)/x + 0.833424732656978*alpha*c0*c1*exp(-2*alpha*x)*exp(-2*alpha*y)/y + 0.833424732656978*alpha*c0*c1*exp(-2*alpha*x)*exp(-2*alpha*y)/x - 0.5*alpha*c1*c2*x^2*exp(-2*alpha*x)*exp(-2*alpha*y)/y + 0.5*alpha*c1*c2*x*exp(-2*alpha*x)*exp(-2*alpha*y) + 0.5*alpha*c1*c2*y*exp(-2*alpha*x)*exp(-2*alpha*y) - 0.5*alpha*c1*c2*y^2*exp(-2*alpha*x)*exp(-2*alpha*y)/x - 1.33333333333333*c0*c1*exp(-2*alpha*x)*exp(-2*alpha*y)/y - 1.33333333333333*c0*c1*exp(-2*alpha*x)*exp(-2*alpha*y)/x + 0.666666666666667*c0*c2*exp(-2*alpha*x)*exp(-2*alpha*y) + 0.333333333333333*c1^2*exp(-2*alpha*x)*exp(-2*alpha*y) - 2.66666666666667*c1*c2*exp(-2*alpha*x)*exp(-2*alpha*y))*((x - y)^2)^(3/2)
end

function g2(x, y, alpha, c0, c1, c2)
  return -c0^2*(x - y)^2*exp(-2*alpha*x)*exp(-2*alpha*y)/2 + c0^2*(x + y)^2*exp(-2*alpha*x)*exp(-2*alpha*y)/2 + 2*c0*c1*(x + y)^3*exp(-2*alpha*x)*exp(-2*alpha*y)/3 - 2*c0*c1*((x - y)^2)^(3/2)*exp(-2*alpha*x)*exp(-2*alpha*y)/3 + 2*c1*c2*(x + y)^5*exp(-2*alpha*x)*exp(-2*alpha*y)/5 - 2*c1*c2*((x - y)^2)^(5/2)*exp(-2*alpha*x)*exp(-2*alpha*y)/5 - c2^2*(x - y)^6*exp(-2*alpha*x)*exp(-2*alpha*y)/6 + c2^2*(x + y)^6*exp(-2*alpha*x)*exp(-2*alpha*y)/6 - (x - y)^4*(c0*c2*exp(-2*alpha*x)*exp(-2*alpha*y)/2 + c1^2*exp(-2*alpha*x)*exp(-2*alpha*y)/4) + (x + y)^4*(c0*c2*exp(-2*alpha*x)*exp(-2*alpha*y)/2 + c1^2*exp(-2*alpha*x)*exp(-2*alpha*y)/4)
end

inf = 10000000000000000000000000000000000000000

function quotient(alpha_values, c0_values, c1_values, c2_values)
    min_quotient = Inf
    min_alpha = nothing
    min_c0 = nothing
    min_c1 = nothing
    min_c2 = nothing
    for alpha in alpha_values
      for c0 in c1_values
        for c1 in c1_values
          for c2 in c1_values
            # g1, g2 = integrals(x, y, alpha, c0, c1, c2)
            f1(x, y) = x * y * g1(x, y, alpha, c0, c1, c2)
            f1(v) = f1(v...) 
            integral1, error = hcubature(f1, [0.0, 0.0], [100, 100])

            f2(x, y) = x * y * g2(x, y, alpha, c0, c1, c2)
            f2(v) = f2(v...) 
            integral2, error = hcubature(f2, [0.0, 0.0], [10, 10])

            quotient = simplify(integral1/integral2)

            if quotient < min_quotient
                min_quotient = quotient
                min_alpha = alpha
                min_c0 = c0
                min_c1 = c1
                min_c2 = c2
            end
          end 
        end
      end
    end

    return min_alpha, min_c0, min_c1, min_c2, min_quotient
end

alpha_values = range(0, stop=5, length=2)
c0_values = range(-1.0, stop=1.0, length=2)
c1_values = range(-1.0, stop=1.0, length=2)
c2_values = range(-1.0, stop=1.0, length=2)

min_alpha, min_c0, min_c1, min_c2, min_quotient = quotient(alpha_values, c0_values, c1_values, c2_values)

println("Minimum quotient:", min_quotient)
println("Corresponding Alpha:", min_alpha)
println("Corresponding c1:", min_c0)
println("Corresponding c1:", min_c1)
println("Corresponding c1:", min_c2)