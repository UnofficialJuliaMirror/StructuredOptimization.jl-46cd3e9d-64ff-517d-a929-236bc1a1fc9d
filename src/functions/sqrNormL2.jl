is_smooth(f::SqrNormL2) = true
is_quadratic(f::SqrNormL2) = true
is_strconvex(f::SqrNormL2) = all(f.lambda .> 0)

function (f::SqrNormL2)(x::AbstractArray)
	return 0.5*f.lambda*deepvecnorm(x)^2
end

function gradient!(grad::AbstractArray, f::SqrNormL2, x::AbstractArray)
	grad .= (*).(f.lambda, x)
	return 0.5*f.lambda*deepvecnorm(x)^2
end

*(lambda::Real, f::SqrNormL2) = SqrNormL2(f.lambda.*lambda)
