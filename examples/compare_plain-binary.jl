include("../src/ModularFormsModuloTwo.jl")
using .ModularFormsModuloTwo
MFmod2 = ModularFormsModuloTwo

#params
MAXI = 10^2
LENGTH = 10^6

# compare time of:
# list = MFmod2.loadFormListBinary(MAXI, LENGTH)

#text read
file_name = "delta_q-"*"maxi"*string(MAXI)*"-"*"length"*string(LENGTH)*".txt"
dir_name = joinpath(@__DIR__, "../src/data")
@time list = MFmod2.loadFormList(joinpath(dir_name, file_name))
#binary read
@time list = MFmod2.loadFormListBinary(MAXI, LENGTH)
