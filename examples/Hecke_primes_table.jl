include("../src/ModularFormsModuloTwo.jl")
using .ModularFormsModuloTwo
using PrettyTables
using Primes
MF2 = ModularFormsModuloTwo



# parameters
MAX_DELTA = 1000
MAX_PRIME = 1000
MAX_POWER = 2

# load Hecke primes
Hecke_primes = MF2.loadHeckePrimesListBinary(MAX_PRIME, MAX_DELTA)



########################################################################
# Δ or \\Delta


function Hecke_primes_make_table(Hecke_primes, maxi_prime::Int=50, maxi_delta_power::Int=20, 
    Delta_symbol::String="Δ", brackets_level::Int=1, math_mode::Bool=true)
    
    primes = Primes.primes(3, maxi_prime)
    maxi_k = trunc(Int, (maxi_delta_power-1)/2)
    table = Array{Any, 2}(undef, length(primes), maxi_k+1)
    header = Array{Any, 1}(undef, maxi_k)
    for i in 1:length(primes)
        if math_mode
            table[i, 1] = "\$T_"*MF2.brackets(primes[i], brackets_level)*"\$"
        else
            table[i, 1] = "T_"*MF2.brackets(primes[i], brackets_level)
        end
        for j in 1:maxi_k
            table[i, j+1] = MF2.delta_repr( Hecke_primes[primes[i]][2*j] , Delta_symbol, brackets_level, math_mode)
        end
    end
    header = vcat([""], [MF2.delta_repr(MF2.Delta_k(2j-1), Delta_symbol, brackets_level, math_mode) for j in 1:maxi_k])

    return table, header
end

println("loaded")
println()
### PARAMETERS
table, header = Hecke_primes_make_table(Hecke_primes, 1000, 250, "Δ", 0, false)

### Std out
pretty_table(table, header)


### Text file
# f = open("Hecke_primes_table.txt", "w")
# pretty_table(f, table, header)
# close(f)

### Tests
# f = Base.stdout
### CSV file
# f = open("Hecke_primes_table.csv", "w")
# for h in header
#     write(f, h)
#     write(f, ",")
# end
# write(f, '\n')
# for i in 1:length(Primes.primes(3, 1000))
#     for j in 1:length(header)
#         write(f, table[i,j])
#         write(f, ",")
#     end
#     write(f, '\n')
# end
# write(f, '\n')
# close(f)


### HTML
## (doesn't work very well)
# open("index.html", "w") do f
#     pretty_table(f, table, header, backend = :html, formatter=html_dark)
# end
## => use text & <pre></pre>


### LaTeX
# # for full lines:
# # vlines=[i for i in 0:maxi_k+1] ,hlines=[i for i in 1:length(primes)]
# pretty_table(table, header, backend = :latex)

