using JLD2, FileIO

function loadFormListBinary(MAXI::Int, LENGTH::Int)
    # # load data
    # @load "../data/Delta_q-series"*string(MAXI)*".jld2" Deltas
    # # and return
    # return Deltas
    file_name = "delta_q-"*"maxi"*string(MAXI)*"-"*"length"*string(LENGTH)*".jdl2"
    return load(joinpath(@__DIR__, file_name), "list")
end
