using JLD2, FileIO

"""
Load the modular forms lists from binary .jdl2 files, using this module's standard naming system.
"""



function loadFormListBinary(MAXI::Int, LENGTH::Int)
    # standard naming
    file_name = "delta_q-"*"maxi"*string(MAXI)*"-"*"length"*string(LENGTH)*".jdl2"
    # load
    return load(joinpath(@__DIR__, file_name), "list")
end

function loadHeckePrimesListBinary(MAX_PRIME::Int, MAX_DELTA::Int)
    # standard naming
    file_name = "Hecke_primes-"*"max_prime"*string(MAX_PRIME)*"-"*"max_delta"*string(MAX_DELTA)*".jdl2"
    # load
    return load(joinpath(@__DIR__, file_name), "list")
end

function loadHeckePowersListBinary(MAX_POWER::Int, MAX_DELTA::Int)
    # standard naming
    file_name = "Hecke_powers-"*"max_power"*string(MAX_POWER)*"-"*"max_delta"*string(MAX_DELTA)*".jdl2"
    # load
    return load(joinpath(@__DIR__, file_name), "list")
end
