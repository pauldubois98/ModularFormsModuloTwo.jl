include("../src/ModularFormsModuloTwo.jl")
using .ModularFormsModuloTwo
using PrettyTables

MFmod2 = ModularFormsModuloTwo

# parameters
MAXI = 10^2
LENGTH = 10^6

#binary read
precalculated = MFmod2.loadFormListBinary(MAXI, LENGTH)

# parameters
MAX_DELTA = length(precalculated)
MAX_DELTA = 100
MAX_POWER = 20

# load Hecke powers
Hecke_powers = MFmod2.loadHeckePowersListBinary(MAX_POWER, MAX_DELTA)


########################################################################
# Δ or \\Delta


function Hecke_power_make_table(Hecke_pow, maxi_power::Int=10, delta_power::Int=3, 
    Delta_symbol::String="Δ", brackets_level::Int=1, math_mode::Bool=true)
    table = Array{Any, 2}(undef, maxi_power, maxi_power+1)
    header = Array{Any, 1}(undef, maxi_power)
    for i in 1:maxi_power
        if math_mode
            table[i, 1] = "\$T_3^"*MFmod2.brackets(i-1, brackets_level)*"\$"
        else
            table[i, 1] = "T_3^"*MFmod2.brackets(i-1, brackets_level)
        end
        for j in 1:maxi_power
            table[i, j+1] = MFmod2.delta_repr(Hecke_pow[i,j][delta_power+1], Delta_symbol, brackets_level, math_mode)
        end
    end
    if math_mode
        header = ["\$T_5^"*MFmod2.brackets(j-1, brackets_level)*"\$" for j in 1:maxi_power]
    else
        header = ["T_5^"*MFmod2.brackets(j-1, brackets_level) for j in 1:maxi_power]
    end
    header = vcat([MFmod2.delta_repr(MFmod2.Delta_k(delta_power), Delta_symbol, brackets_level, math_mode)], header)
    return table, header
end

#table, header = Hecke_power_make_table(Hecke_powers, 10, 61, "Δ", 0, false)


### Text file
# f = open("Hecke_powers_table.txt", "w")
### CSV file
# f = open("Hecke_powers_table.csv", "w")
### Tests
#f = Base.stdout

### PARAMETERS
for k in 1:2:98
    table, header = Hecke_power_make_table(Hecke_powers, 20, k, "Δ", 0, false)

    ### Std out
    pretty_table(table, header)

    ### Text file
    # pretty_table(f, table, header)
    ### CSV file
    # for h in header
    #     write(f, h)
    #     write(f, ",")
    # end
    # write(f, '\n')
    # for i in 1:20
    #     for j in 1:21
    #         write(f, table[i,j])
    #         write(f, ",")
    #     end
    #     write(f, '\n')
    # end
    # write(f, '\n')
    

    ### HTML
    ## (doesn't work very well)
    # open("index.html", "w") do f
    #     pretty_table(f, table, header, backend = :html, formatter=html_dark)
    # end
    ## => to do by hand

    ### LaTeX
    # # for full lines:
    # # vlines=[i for i in 0:maxi_k+1] ,hlines=[i for i in 1:length(primes)]
    # pretty_table(table, header, backend = :latex)

end

### file
# close(f)
