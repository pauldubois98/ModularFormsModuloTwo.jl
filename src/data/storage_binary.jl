using JLD2, FileIO



"""
    loadFormListBinary(MAXi, LENGTH)

Load the modular form list from file, using this module's standard naming system.
"""
function loadFormListBinary(MAXI::Int, LENGTH::Int)
    # standard naming
    file_name = "delta_q-"*"maxi"*string(MAXI)*"-"*"length"*string(LENGTH)*".jdl2"
    # load
    return load(joinpath(@__DIR__, file_name), "list")
end
