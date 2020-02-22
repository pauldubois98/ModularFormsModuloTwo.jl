# Precalculated Data Storage

## Raw Data
Tables of data can be found here:
* Table of [primes Hecke](../tables/Hecke_primes_table.html) operators on modular forms modulo two.
* Table of [powers of Hecke](../tables/Hecke_powers_table.html) operators on modular forms modulo two.
If this is not enought, remeber that this module allows anyone to generate new data.

## Use of Precalculated Variables
Here is how to use the variables:
- ``\ T_p|\Delta^k `` is `Hecke_primes[p][k+1]`
- ``\ T_3^iT_5^j|\Delta^k `` is `Hecke_powers[i+1,j+1][k+1]`
These are stored as Δ-series.
The q-series of powers of Δ are stored as follows:
- ``\ \Delta^k `` is `precalculated[k+1]`

## Generating Precalculated Data
The various precalculated data generators may be found in the data subfolder.
Note that the user may create new data files, if the provided ones aren't enought.
Note as well that there are two implemented ways to store data, we advice the binary for speed purposes.

## Binary Data Reads
```@autodocs
Modules = [ModularFormsModuloTwo]
Pages   = ["data/storage_binary.jl"]
```


## Text Data Reads
```@autodocs
Modules = [ModularFormsModuloTwo]
Pages   = ["data/storage.jl"]
```

