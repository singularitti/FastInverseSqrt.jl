module FastInverseSqrt

export rsqrt

# See https://en.wikipedia.org/wiki/Fast_inverse_square_root#Overview_of_the_code & https://www.youtube.com/watch?v=p8u_k2LIZyo
function rsqrt(x::Float32)
    xₛ = x
    int32 = reinterpret(UInt32, xₛ)
    int32 = 0x5f3759df - int32 >> 1
    xₛ = reinterpret(Float32, int32)
    xₛ *= 1.5f0 - x * 0.5f0 * xₛ^2
    return xₛ
end
function rsqrt(x::Float64)
    xₛ = x
    int64 = reinterpret(UInt64, xₛ)
    int64 = 0x5fe6eb50c7b537a9 - int64 >> 1  # See https://stackoverflow.com/a/11644533/3260253
    xₛ = reinterpret(Float64, int64)
    xₛ *= 1.5 - x * 0.5 * xₛ^2
    return xₛ
end
rsqrt(x::Real) = rsqrt(float(x))

end
