include("./identity.jl")

function density(phi)
  return phi * identity(phi)
end