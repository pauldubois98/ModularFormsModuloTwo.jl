# Stored Modular Forms Modulo Two DATA

Since it take quite a ong time to generet the modular forms, it is a good idea to generete them once, store all the data in files, and then recall it once needed.

There are two implemented ways to store data: 
Eeither in a text (.txt) file, or in a binary (.jdl2) file.

* Binary is much faster, but can only be read by a program
* Text file is slower, but the file may be opened by the user

Example: Δ^k up to k=100, coefficients q^n up to n=10^6

File storage type | @time lorading result
------------------|----------------------------
Text              | 1.707102 seconds (16.02 M allocations: 458.670 MiB, 8.63% gc time)
Binary            | 0.037556 seconds (5.01 k allocations: 23.113 MiB, 3.23% gc time)


Note that the data files should be computed by the user.
The data files are not saved a s part of the module so that the package size isn't too big.
It takes a few minutes to generete them, using the provided *_file_maker.jl and *_file_maker_binary.jl.

