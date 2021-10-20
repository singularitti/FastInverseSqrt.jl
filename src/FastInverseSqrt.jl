module FastInverseSqrt

export rsqrt

# See https://en.wikipedia.org/wiki/Fast_inverse_square_root#Overview_of_the_code & https://www.youtube.com/watch?v=p8u_k2LIZyo
function rsqrt(number::Float32)
    x2 = number * 0.5f0
    y = number
    i = reinterpret(UInt32, y)
    i = 0x5f3759df - i >> 1
    y = reinterpret(Float32, i)
    y *= 1.5f0 - x2 * y^2
    return y
end
function rsqrt(number::Float64)
    x2 = number * 0.5
    y = number
    i = reinterpret(UInt64, y)
    i = 0x5fe6eb50c7b537a9 - i >> 1  # See https://stackoverflow.com/a/11644533/3260253
    y = reinterpret(Float64, i)
    y *= 1.5 - x2 * y^2
    return y
end

end
