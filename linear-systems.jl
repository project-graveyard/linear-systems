#= 
This program calculates a system of linear equations for two variables
and three variables
=#

#= 
For any linear system:
  Sample: 
      a1x + b1y = c1
      a2x + b2y = c2

Let A = [             b = [
   a1   b1     AND        c1
   a2   b2                c2
]                     ]

then x, y = A\b
=#

# Get number of system of equations from user
print("How many system of equations (number of variables): ")
num = parse(Int64, readline())


# Initialise A and B to zeros
A = zeros(num, num)
B = zeros(num)


# function to round Vector to n decimal places
function roundVector(A::Vector{Float64}, n::Int64)
    for x in 1:length(A)
        A[x] = round(A[x], digits=n)
    end
    return A
end


# loop to receive values based on number of system of equations
for x in 1:num
    println("Enter equation $x")

    if num == 2
        println("Enter a linear system in the form: ax + by = c")
        print("a: ")
        a = parse(Float64, readline())
        print("b: ")
        b = parse(Float64, readline())
        print("c: ")
        c = parse(Float64, readline())
        A[x], A[num+x] = a, b
        B[x] = c
    elseif num == 3
        println("Enter a linear system in the form: ax + by + cz = d")
        print("a: ")
        a = parse(Float64, readline())
        print("b: ")
        b = parse(Float64, readline())
        print("c: ")
        c = parse(Float64, readline())
        print("d: ")
        d = parse(Float64, readline())
        A[x], A[num+x], A[2num+x] = a, b, c
        B[x] = d
    end
end

println("-"^30)


# Display the value of x, y (and z)
if num == 2
    x, y = roundVector(A\B, 4)
    println("x: $x")
    println("y: $y")
elseif num == 3
    x, y, z = roundVector(A\B, 4)
    println("x: $x")
    println("y: $y")
    println("z: $z")
end
