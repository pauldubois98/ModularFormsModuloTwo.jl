include("../src/ModularFormsModuloTwo.jl")
using .ModularFormsModuloTwo
MFmod2 = ModularFormsModuloTwo

# parameters
MAXI = 10^2
LENGTH = 10^6

#binary read
precalculated = MFmod2.loadFormListBinary(MAXI, LENGTH)

# parameters
MAX_DELTA = length(precalculated)
MAX_DELTA = 10
MAX_PRIME = 15
MAX_POWER = 2


# test Hecke primes
println("\n\tTest Hecke primes:")
Hecke_primes = MFmod2.loadHeckePrimesListBinary(MAX_PRIME, MAX_DELTA)

println("T11:")
println(Hecke_primes[11])
println("T11|Δ^3:")
MFmod2.disp(Hecke_primes[11][4])



# test Hecke powers
println("\n\tTest Hecke powers:")
Hecke_powers = MFmod2.loadHeckePowersListBinary(MAX_POWER, MAX_DELTA)

println("T3^0T5^1:")
println(Hecke_powers[1,2])
println("T3^0T5^1|Δ^5:")
MFmod2.disp(Hecke_powers[1,2][6])



