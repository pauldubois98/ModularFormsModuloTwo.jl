include("../src/ModularFormsModuloTwo.jl")
using .ModularFormsModuloTwo
MFmod2 = ModularFormsModuloTwo

# parameters
LENGTH = 10^6
MAXI = 10^2

# precalculated
precalculated = MFmod2.loadFormListBinary(MAXI, LENGTH)

# test to_delta
println("\n\tTest to_delta (and interaction with Hecke):")
f = MFmod2.delta(LENGTH) + MFmod2.delta_k(3, LENGTH)
println("f:")
MFmod2.disp(f)

T3f = MFmod2.Hecke(11, f)
println("T_3|f:")
MFmod2.disp(T3f)

df = MFmod2.to_delta(f, precalculated)
println("f:")
MFmod2.disp(df)

println("T_3|f:")
MFmod2.disp(MFmod2.to_delta(T3f, precalculated))


# test to_q
println("\n\tTest to_q:")

df = MFmod2.Delta_k(5)
println("df:")
MFmod2.disp(df)

f = MFmod2.to_q(df, precalculated)
println("f:")
MFmod2.disp(f)


