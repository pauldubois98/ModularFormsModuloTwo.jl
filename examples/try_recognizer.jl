include("../src/ModularFormsModuloTwo.jl")
using .ModularFormsModuloTwo
MFmod2 = ModularFormsModuloTwo

# parameters
LENGTH = 10^6
MAXI = 10^2

# precalculated
precalculated = MFmod2.loadFormListBinary(MAXI, LENGTH)


# test to_q
println("\n\tTest to_q:")

df = MFmod2.Delta_k(5)
println("df:")
MFmod2.disp(df)

f = MFmod2.to_q(df, precalculated)
println("f:")
MFmod2.disp(f)

# test to_delta
println("\n\tTest to_delta (and interaction with Hecke):")
f = MFmod2.delta(LENGTH) + MFmod2.delta_k(3, LENGTH)
println("f:")
MFmod2.disp(f)

T3f = MFmod2.Hecke(3, f)
println("T_3|f:")
MFmod2.disp(T3f)

df = MFmod2.to_delta(f, precalculated)
println("f:")
MFmod2.disp(df)

println("T_3|f:")
MFmod2.disp(MFmod2.to_delta(T3f, precalculated))



# test drop_error
println("\n\tTest drop_error (and interaction with Hecke):")
f = MFmod2.delta(LENGTH) + MFmod2.delta_k(3, LENGTH)
println("f:")
MFmod2.disp(f)

T11f = MFmod2.Hecke(11, f)
println("T_11|f:")
MFmod2.disp(T11f)

T11f_exact = MFmod2.drop_error(T11f, precalculated)
println("T_11|f:")
MFmod2.disp(T11f_exact)
println(">>> numercial error dropped !")

