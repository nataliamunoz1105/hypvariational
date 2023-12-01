function get_xy_numeric_function(symbolic_function)
  @syms x y
  lambda = lambdify(symbolic_function, [x, y])
  return function (x)
    result = lambda(x[1], x[2])
    if isnan(result)
      throw(DomainError(result, "Result is NaN at x = $(x[1]), y = $(x[2])"))
    end
    return result
  end
end