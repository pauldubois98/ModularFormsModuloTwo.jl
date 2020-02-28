include("../src/ModularFormsModuloTwo.jl")
using .ModularFormsModuloTwo
using PrettyTables

MF2 = ModularFormsModuloTwo

# parameters
MAXI = 10^3
LENGTH = 10^6

#binary read
precalculated = MF2.loadFormListBinary(MAXI, LENGTH)

# parameters
MAX_DELTA = length(precalculated)
MAX_DELTA = 1000
MAX_POWER = 50

# load Hecke powers
Hecke_powers = MF2.loadHeckePowersListBinary(MAX_POWER, MAX_DELTA)


########################################################################
# Δ or \\Delta

function Hecke_power_make_table_smart(Hecke_pow, maxi_power::Int=10, delta_power::Int=3, 
    Delta_symbol::String="Δ", brackets_level::Int=1, math_mode::Bool=true)
    new_maxi_power=0
    f0 = MF2.zero( length(Hecke_pow[1,1][2]) )
    j=1
    for i in 1:maxi_power
        if Hecke_pow[i,j][delta_power+1]==f0
            #pass
        else
            new_maxi_power = max(i, new_maxi_power)
        end
    end
    i=1
    for j in 1:maxi_power
        if Hecke_pow[i,j][delta_power+1]==f0
            #pass
        else
            new_maxi_power = max(j, new_maxi_power)
        end
    end
    new_maxi_power = min(maxi_power, new_maxi_power+1)
    return Hecke_power_make_table(Hecke_pow, new_maxi_power, delta_power, Delta_symbol, brackets_level, math_mode)
end


function Hecke_power_make_table(Hecke_pow, maxi_power::Int=10, delta_power::Int=3, 
    Delta_symbol::String="Δ", brackets_level::Int=1, math_mode::Bool=true)
    table = Array{Any, 2}(undef, maxi_power, maxi_power+1)
    header = Array{Any, 1}(undef, maxi_power)
    for i in 1:maxi_power
        if math_mode
            table[i, 1] = "\$T_3^"*MF2.brackets(i-1, brackets_level)*"\$"
        else
            table[i, 1] = "T_3^"*MF2.brackets(i-1, brackets_level)
        end
        for j in 1:maxi_power
            table[i, j+1] = MF2.delta_repr(Hecke_pow[i,j][delta_power+1], Delta_symbol, brackets_level, math_mode)
        end
    end
    if math_mode
        header = ["\$T_5^"*MF2.brackets(j-1, brackets_level)*"\$" for j in 1:maxi_power]
    else
        header = ["T_5^"*MF2.brackets(j-1, brackets_level) for j in 1:maxi_power]
    end
    header = vcat([MF2.delta_repr(MF2.Delta_k(delta_power), Delta_symbol, brackets_level, math_mode)], header)
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
for k in 1:2:10
    
    table, header = Hecke_power_make_table_smart(Hecke_powers, 50, k, "Δ", 0, false)
    #table, header = Hecke_power_make_table(Hecke_powers, 33, k, "Δ", 0, false)
    
    #print(table)
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
    # for i in 1:size(table, 1)
    #     for j in 1:size(table, 2)
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
