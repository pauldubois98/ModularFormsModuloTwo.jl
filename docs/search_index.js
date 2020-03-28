var documenterSearchIndex = {"docs":
[{"location":"advanced/#Advanced-Operations-1","page":"Advanced Operations","title":"Advanced Operations","text":"","category":"section"},{"location":"advanced/#Hecke-Operators-1","page":"Advanced Operations","title":"Hecke Operators","text":"","category":"section"},{"location":"advanced/#","page":"Advanced Operations","title":"Advanced Operations","text":"Hecke operators represent the hear of the study of modular forms modulo two.","category":"page"},{"location":"advanced/#","page":"Advanced Operations","title":"Advanced Operations","text":"Modules = [ModularFormsModuloTwo]\r\nPages   = [\"HeckeOperator.jl\"]","category":"page"},{"location":"advanced/#Main.ModularFormsModuloTwo.Hecke-Tuple{Int64,SparseArrays.SparseVector{Int8,Int64}}","page":"Advanced Operations","title":"Main.ModularFormsModuloTwo.Hecke","text":"Hecke(p, f)\n\nCompute Tp|f (with mathematical accuracy).\n\nExample\n\njulia> d=delta()\njulia> disp(d)\nMF mod 2 (coef to 1000) - 01000000010000000000000001000000000000000000000001...\n\njulia> disp(Hecke(2, d))\nMF mod 2 (coef to 500) - 00100000000000000010000000000000000000000000000000...\n\njulia> disp(Hecke(3, d))\nMF mod 2 (coef to 333) - 00000000000000000000000000000000000000000000000000...\n\n\n\n\n\n","category":"method"},{"location":"advanced/#Recognizer-1","page":"Advanced Operations","title":"Recognizer","text":"","category":"section"},{"location":"advanced/#","page":"Advanced Operations","title":"Advanced Operations","text":"The functions defined in this section allow the user to switch between the two representations of modular forms modulo two: (capped) infinite q-series and finite Δ-series.","category":"page"},{"location":"advanced/#","page":"Advanced Operations","title":"Advanced Operations","text":"Modules = [ModularFormsModuloTwo]\r\nPages   = [\"recognizer.jl\"]","category":"page"},{"location":"advanced/#Main.ModularFormsModuloTwo.drop_error","page":"Advanced Operations","title":"Main.ModularFormsModuloTwo.drop_error","text":"drop_error(f, precalculated, LENGTH)\n\nDrops the numerical error that f might have (as long as this error isn't too large).\n\nExample\n\njulia> precalculated = loadFormListBinary(10^2, 10^6)\njulia> f = delta(10^6) + delta_k(3, 10^6)\njulia> disp(f)\nMF mod 2 (coef to 1000000) - 01010000010100000001000001000000000000000001000001...\n\njulia> T11f = MFmod2.Hecke(11, f)\njulia> disp(T11f)\nMF mod 2 (coef to 90909) - 01000000010000000000000001000000000000000000000001...\n\njulia> T11f_exact = drop_error(T11f, precalculated)\njulia> disp(T11f_exact)\nMF mod 2 (coef to 1000000) - 01000000010000000000000001000000000000000000000001...\n\n\n\n\n\n\n","category":"function"},{"location":"advanced/#Main.ModularFormsModuloTwo.to_q","page":"Advanced Operations","title":"Main.ModularFormsModuloTwo.to_q","text":"to_q(df, precalculated)\n\nCompute the q-series representation of f (using precalculated).\n\nExample\n\njulia> precalculated = loadFormListBinary(10^2, 10^6)\njulia> df = Delta_k(5)\njulia> disp(df)\nMF mod 2 (coef to 100) - 00000100000000000000000000000000000000000000000000...\n\njulia> f = to_q(df, precalculated)\njulia> disp(f)\nMF mod 2 (coef to 1000000) - 00000100000001000000000000000100000001000000010000...\n\n\n\n\n\n\n","category":"function"},{"location":"advanced/#Main.ModularFormsModuloTwo.to_Δ","page":"Advanced Operations","title":"Main.ModularFormsModuloTwo.to_Δ","text":"to_Δ(f, precalculated)\n-- or --\nto_delta(f, precalculated)\n\nCompute the Δ-series representation of f (using precalculated).\n\nExample\n\njulia> precalculated = loadFormListBinary(10^2, 10^6)\njulia> f = delta(10^6) + delta_k(3, 10^6)\njulia> disp(f)\nMF mod 2 (coef to 1000000) - 01010000010100000001000001000000000000000001000001...\n\njulia> df = to_delta(f, precalculated)\n100-element SparseArrays.SparseVector{Int8,Int64} with 2 stored entries:\n  [2  ]  =  1\n  [4  ]  =  1\n\njulia> disp(df)\nMF mod 2 (coef to 100) - 01010000000000000000000000000000000000000000000000...\n\n\n\n\n\n","category":"function"},{"location":"data/#Precalculated-Data-Storage-1","page":"Computation Storage","title":"Precalculated Data Storage","text":"","category":"section"},{"location":"data/#Raw-Data-1","page":"Computation Storage","title":"Raw Data","text":"","category":"section"},{"location":"data/#","page":"Computation Storage","title":"Computation Storage","text":"Tables of data can be found here:","category":"page"},{"location":"data/#","page":"Computation Storage","title":"Computation Storage","text":"Table of primes Hecke operators on modular forms modulo two.\nTable of powers of Hecke operators on modular forms modulo two.","category":"page"},{"location":"data/#","page":"Computation Storage","title":"Computation Storage","text":"If this is not enough, remember that this module allows anyone to generate new data.","category":"page"},{"location":"data/#Use-of-Precalculated-Variables-1","page":"Computation Storage","title":"Use of Precalculated Variables","text":"","category":"section"},{"location":"data/#","page":"Computation Storage","title":"Computation Storage","text":"Here is how to use the variables:","category":"page"},{"location":"data/#","page":"Computation Storage","title":"Computation Storage","text":" T_pDelta^k is Hecke_primes[p][k+1]\n T_3^iT_5^jDelta^k is Hecke_powers[i+1,j+1][k+1]","category":"page"},{"location":"data/#","page":"Computation Storage","title":"Computation Storage","text":"These are stored as Δ-series. The q-series of powers of Δ are stored as follows:","category":"page"},{"location":"data/#","page":"Computation Storage","title":"Computation Storage","text":" Delta^k is precalculated[k+1]","category":"page"},{"location":"data/#Generating-Precalculated-Data-1","page":"Computation Storage","title":"Generating Precalculated Data","text":"","category":"section"},{"location":"data/#","page":"Computation Storage","title":"Computation Storage","text":"The various precalculated data generators may be found in the data subfolder. Note that the user may create new data files, if the provided ones aren't enough. Note as well that there are two implemented ways to store data, we advice the binary for speed purposes.","category":"page"},{"location":"data/#Binary-Data-Reads-1","page":"Computation Storage","title":"Binary Data Reads","text":"","category":"section"},{"location":"data/#","page":"Computation Storage","title":"Computation Storage","text":"Modules = [ModularFormsModuloTwo]\r\nPages   = [\"data/storage.jl\"]","category":"page"},{"location":"data/#Main.ModularFormsModuloTwo.loadFormListBinary-Tuple{Int64,Int64}","page":"Computation Storage","title":"Main.ModularFormsModuloTwo.loadFormListBinary","text":"loadFormListBinary(MAXI, LENGTH)\n\nLoads the list of q-coefficients of Δ powers form file.\n\n\n\n\n\n","category":"method"},{"location":"data/#Main.ModularFormsModuloTwo.loadHeckePowersListBinary-Tuple{Int64,Int64}","page":"Computation Storage","title":"Main.ModularFormsModuloTwo.loadHeckePowersListBinary","text":"loadHeckePowersListBinary(MAX_POWER, MAX_DELTA)\n\nLoads the list of Δ-coefficients of powers of Hecke operators applied to powers of Δ.\n\n\n\n\n\n","category":"method"},{"location":"data/#Main.ModularFormsModuloTwo.loadHeckePrimesListBinary-Tuple{Int64,Int64}","page":"Computation Storage","title":"Main.ModularFormsModuloTwo.loadHeckePrimesListBinary","text":"loadHeckePrimesListBinary(MAX_PRIME, MAX_DELTA)\n\nLoads the list of Δ-coefficients of prime Hecke operators applied to powers of Δ.\n\n\n\n\n\n","category":"method"},{"location":"data/#Text-Data-Reads-1","page":"Computation Storage","title":"Text Data Reads","text":"","category":"section"},{"location":"data/#","page":"Computation Storage","title":"Computation Storage","text":"Modules = [ModularFormsModuloTwo]\r\nPages   = [\"data/storage_text.jl\"]","category":"page"},{"location":"data/#Main.ModularFormsModuloTwo.loadForm","page":"Computation Storage","title":"Main.ModularFormsModuloTwo.loadForm","text":"loadForm(name, file_name)\n\nLoad the modular form modulo 2 name from file_name.\n\n\n\n\n\n","category":"function"},{"location":"data/#Main.ModularFormsModuloTwo.loadFormList","page":"Computation Storage","title":"Main.ModularFormsModuloTwo.loadFormList","text":"loadFormList(file_name)\n\nLoad the modular form list from file_name.\n\n\n\n\n\n","category":"function"},{"location":"data/#Main.ModularFormsModuloTwo.saveForm","page":"Computation Storage","title":"Main.ModularFormsModuloTwo.saveForm","text":"saveForm(f, name, file_name)\n\nSave the modular form modulo 2 f as name in file_name.\n\n\n\n\n\n","category":"function"},{"location":"data/#Main.ModularFormsModuloTwo.saveFormList","page":"Computation Storage","title":"Main.ModularFormsModuloTwo.saveFormList","text":"saveFormList(forms_list, file_name)\n\nSave the modular forms modulo 2 f as name in file_name.\n\n\n\n\n\n","category":"function"},{"location":"#ModularFormsModuloTwo.jl-Documentation-1","page":"Home","title":"ModularFormsModuloTwo.jl Documentation","text":"","category":"section"},{"location":"#","page":"Home","title":"Home","text":"This module contains usual routines to do computation on modular forms modulo two.","category":"page"},{"location":"#Introduction-Modular-Forms-Modulo-2-1","page":"Home","title":"Introduction Modular Forms Modulo 2","text":"","category":"section"},{"location":"#","page":"Home","title":"Home","text":"Here is a very quick introduction to modular forms modulo two.","category":"page"},{"location":"#Modular-Forms-1","page":"Home","title":"Modular Forms","text":"","category":"section"},{"location":"#","page":"Home","title":"Home","text":"Modular forms are holomorphic complex functions on the upper half plane.","category":"page"},{"location":"#","page":"Home","title":"Home","text":"For a real introduction on modular forms, you can read \"A Course in Arithmetic\" by J-P. Serre (1973), or the wikipedia page.","category":"page"},{"location":"#\\-q-series-of-Modular-Forms-1","page":"Home","title":" q-series of Modular Forms","text":"","category":"section"},{"location":"#","page":"Home","title":"Home","text":"Now, as they are holomorphic, they have a series expansion. For a modular form  f, there is an expansion ","category":"page"},{"location":"#","page":"Home","title":"Home","text":" f(z) = f(q) = sum_n in Z a_n(f) q^n qquad q = e^2pi i z","category":"page"},{"location":"#","page":"Home","title":"Home","text":"Now, Victor Saul Miller has proved in his thesis that there exists a basis for modular forms such that all  a_n are integers.","category":"page"},{"location":"#Reduction-Modulo-2-1","page":"Home","title":"Reduction Modulo 2","text":"","category":"section"},{"location":"#","page":"Home","title":"Home","text":"Using this basis, we can reduce a modular form  f by taking it's  q-series and reducing all coefficients  a_n modulo 2. It may be proved that the resulting  f is composed only of powers of  Delta with ","category":"page"},{"location":"#","page":"Home","title":"Home","text":" Delta = sum_m=0^infty q^(2m+1)^2","category":"page"},{"location":"#","page":"Home","title":"Home","text":"Therefore, the space of modular forms modulo 2 is:","category":"page"},{"location":"#","page":"Home","title":"Home","text":" mathcalF = leftlangle Delta^k  k text odd rightrangle = leftlangle Delta Delta^3 Delta^5 Delta^7 dots rightrangle","category":"page"},{"location":"#Duality-\\-q-series-and-\\-\\Delta-polynomial-1","page":"Home","title":"Duality  q-series and  Delta polynomial","text":"","category":"section"},{"location":"#","page":"Home","title":"Home","text":"What make the study of modular forms modulo 2 interesting is the fact that for a modular form  f, there are two representations:","category":"page"},{"location":"#","page":"Home","title":"Home","text":"one as un infinite  q-series\none as a finite polynomial in terms of  Delta","category":"page"},{"location":"#","page":"Home","title":"Home","text":"The fact that we can switch from one representation is very useful. With the  q-series, calculations (such as Hecke operators) are made easy, but we have to deal with an infinite series. On the other hand, the  Delta-polynomial is a finite representation, but calculations are harder.","category":"page"},{"location":"#Specific-use-of-this-library-1","page":"Home","title":"Specific use of this library","text":"","category":"section"},{"location":"#","page":"Home","title":"Home","text":"The way usual computer programs would deal with such object would be to represent  10^6  q-coefficients of modular forms, and suppose it is enough to take conclusions. In this library, we try to take advantage of the fact that we have a duality  q-Delta and that all coefficients are over  mathbbF_2 (so either  0 or  1). There are functions to_q(df, precalculated) and to_Δ(f, precalculated) (in the advanced operations section) to switch from one representation to an other. There is also a very special drop_error(f, precalculated, LENGTH) function which drops the numerical error from calculating a Hecke operator (in the advanced operations as well). (This is only possible by taking advantage of the fact that there is an equivalent finite representation in terms of  Delta.)","category":"page"},{"location":"standard/#Standard-operations-1","page":"Standard operations","title":"Standard operations","text":"","category":"section"},{"location":"standard/#General-1","page":"Standard operations","title":"General","text":"","category":"section"},{"location":"standard/#","page":"Standard operations","title":"Standard operations","text":"First, we define types and a useful display function.","category":"page"},{"location":"standard/#","page":"Standard operations","title":"Standard operations","text":"Modules = [ModularFormsModuloTwo]\r\nPages   = [\"ModularFormsModuloTwo.jl\"]","category":"page"},{"location":"standard/#Main.ModularFormsModuloTwo.ModularForm","page":"Standard operations","title":"Main.ModularFormsModuloTwo.ModularForm","text":"We can represent a modular forms mod 2 by it's coefficients as a polynomial in q or Δ. The routines in this file are made for q-series. Modular forms modulo 2 have coefficients in q-series being 0 most of the times, and 1 otherwise. Thus, we will represent them as sparse 1-dimensional arrays (sparse vectors) of type SparseVector{Int8,Int}.\n\n\n\n\n\n","category":"type"},{"location":"standard/#Main.ModularFormsModuloTwo.ModularFormOrNothingList","page":"Standard operations","title":"Main.ModularFormsModuloTwo.ModularFormOrNothingList","text":"Lists of Modular Forms will be useful for storage.\n\n\n\n\n\n","category":"type"},{"location":"standard/#Main.ModularFormsModuloTwo.disp","page":"Standard operations","title":"Main.ModularFormsModuloTwo.disp","text":"disp(f[, maxi])\n\nDisplay details of f, a modular forms mod 2.\n\nDisplays what type of data the object id,  up to which coefficient is the form known. Then displays the first few coefficients. Coefficients are displayed until maxi (50 by default).\n\nExample\n\n[f is a modular form mod 2]\njulia> disp(f)\nMF mod 2 (coef to 100) - 01000000010000000000000001000000000000000000000001...\n\n\n\n\n\n","category":"function"},{"location":"standard/#Arithmetic-1","page":"Standard operations","title":"Arithmetic","text":"","category":"section"},{"location":"standard/#","page":"Standard operations","title":"Standard operations","text":"Then, we define the standard arithmetic (arithmetic of modular forms modulo two is more than a trivial implementation).","category":"page"},{"location":"standard/#","page":"Standard operations","title":"Standard operations","text":"Modules = [ModularFormsModuloTwo]\r\nPages   = [\"arithmetic.jl\"]","category":"page"},{"location":"standard/#Base.:*-Tuple{SparseArrays.SparseVector{Int8,Int64},SparseArrays.SparseVector{Int8,Int64}}","page":"Standard operations","title":"Base.:*","text":"*(f1, f2)\n\nCompute the multiplication of two modular forms (with mathematical accuracy).\n\nExample\n\n[f1 & f2 are modular forms mod 2]\njulia> f1*f2\n1000-element SparseVector{Int8,Int64} with 86 stored entries:\n  [...]\n\n\n\n\n\n","category":"method"},{"location":"standard/#Base.:+-Tuple{SparseArrays.SparseVector{Int8,Int64},SparseArrays.SparseVector{Int8,Int64}}","page":"Standard operations","title":"Base.:+","text":"+(f1, f2)\n\nCompute the addition of two modular forms (with mathematical accuracy).\n\nExample\n\n[f1 & f2 are modular forms mod 2]\njulia> f1+f2\n1000-element SparseVector{Int8,Int64} with 27 stored entries:\n  [...]\n\n\n\n\n\n","category":"method"},{"location":"standard/#Base.:^-Tuple{SparseArrays.SparseVector{Int8,Int64},Int64}","page":"Standard operations","title":"Base.:^","text":"^(f, k)\n\nCompute f^k (with mathematical accuracy).\n\nExample\n\n[f is a modular form mod 2]\njulia> f^5\n1000-element SparseVector{Int8,Int64} with 75 stored entries:\n  [...]\n\n\n\n\n\n","category":"method"},{"location":"standard/#Main.ModularFormsModuloTwo.sq-Tuple{SparseArrays.SparseVector{Int8,Int64}}","page":"Standard operations","title":"Main.ModularFormsModuloTwo.sq","text":"sq(f)\n\nCompute the square of a modular form (with mathematical accuracy).\n\nThis is a much more efficient method then computing the square with multiplication. sq(f) is (much) more efficient then f*f, time wise and memory wise.\n\nExample\n\n[f is a modular form mod 2]\njulia> @time f*f\n  0.169466 seconds (37 allocations: 1.127 MiB)\n\njulia> @time sq(f)\n  0.000020 seconds (23 allocations: 9.875 KiB)\n\n\n\n\n\n","category":"method"},{"location":"standard/#Equality-1","page":"Standard operations","title":"Equality","text":"","category":"section"},{"location":"standard/#","page":"Standard operations","title":"Standard operations","text":"It will be usefull to define an equality reation that is lighter than the very strict regular one.","category":"page"},{"location":"standard/#","page":"Standard operations","title":"Standard operations","text":"Modules = [ModularFormsModuloTwo]\r\nPages   = [\"equality.jl\"]","category":"page"},{"location":"standard/#Main.ModularFormsModuloTwo.eq-Tuple{SparseArrays.SparseVector{Int8,Int64},SparseArrays.SparseVector{Int8,Int64}}","page":"Standard operations","title":"Main.ModularFormsModuloTwo.eq","text":"eq(f1, f2)\n\nUp to maximum coefficient known for both f1 and f2, tell equality.\n\n\n\n\n\n","category":"method"},{"location":"standard/#Main.ModularFormsModuloTwo.iszero-Tuple{SparseArrays.SparseVector{Int8,Int64}}","page":"Standard operations","title":"Main.ModularFormsModuloTwo.iszero","text":"iszero(f1, f2)\n\nTell if a modular form is exactly zero (what ever it's size is).\n\n\n\n\n\n","category":"method"},{"location":"standard/#Main.ModularFormsModuloTwo.truncate","page":"Standard operations","title":"Main.ModularFormsModuloTwo.truncate","text":"truncate(f, LENGTH)\n\nTruncate f to the LENGTH first coefficients with no error.\n\nExample\n\n[f is a modular form mod 2]\njulia> f\n1000-element SparseVector{Int8,Int64} with 16 stored entries:\n  [...]\n\njulia> truncate(f, 100)\n100-element SparseVector{Int8,Int64} with 5 stored entries:\n  [...]\n\n\n\n\n\n","category":"function"},{"location":"standard/#Main.ModularFormsModuloTwo.truncate","page":"Standard operations","title":"Main.ModularFormsModuloTwo.truncate","text":"truncate(f1, f2[, LENGTH])\n\nTruncate f1 and f2 to LENGTH first coefficients with no error. Truncate to min length of f1 & f2 if LENGTH = -1.\n\nExample\n\n[f1 & f2 are modular forms mod 2]\njulia> disp(f1)\nMF mod 2 (coef to 1000) - 01000000010000000000000001000000000000000000000001...\njulia> disp(f2)\nMF mod 2 (coef to 100) - 01000000010000000000000001000000000000000000000001...\n\njulia> f1, f2 = truncate(f1,f2)\n\njulia> disp(f1)\nMF mod 2 (coef to 100) - 01000000010000000000000001000000000000000000000001...\njulia> disp(f2)\nMF mod 2 (coef to 100) - 01000000010000000000000001000000000000000000000001...\n\n\n\n\n\n","category":"function"},{"location":"standard/#Generators-1","page":"Standard operations","title":"Generators","text":"","category":"section"},{"location":"standard/#","page":"Standard operations","title":"Standard operations","text":"Most of the time, the modular forms modulo two are standards, and we will use generators to create them.","category":"page"},{"location":"standard/#","page":"Standard operations","title":"Standard operations","text":"Modules = [ModularFormsModuloTwo]\r\nPages   = [\"generators.jl\"]","category":"page"},{"location":"standard/#Main.ModularFormsModuloTwo.Delta_k","page":"Standard operations","title":"Main.ModularFormsModuloTwo.Delta_k","text":"Delta(k[, LENGTH])\n\nCreate the standard Δ form, with coefficients up to LENGTH => as a Δ-series!\n\nExample\n\njulia> disp(Delta(1))\nMF mod 2 (coef to 100) - 01000000000000000000000000000000000000000000000000...\n\n\n\n\n\n","category":"function"},{"location":"standard/#Main.ModularFormsModuloTwo.delta","page":"Standard operations","title":"Main.ModularFormsModuloTwo.delta","text":"delta([LENGTH])\n\nCreate the standard Δ form, with coefficients up to LENGTH => as a Δ-series!\n\nExample\n\njulia> disp(delta())\nMF mod 2 (coef to 1000) - 01000000010000000000000001000000000000000000000001...\n\njulia> disp(delta(10^6))\nMF mod 2 (coef to 1000000) - 01000000010000000000000001000000000000000000000001...\n\n\n\n\n\n","category":"function"},{"location":"standard/#Main.ModularFormsModuloTwo.delta_k","page":"Standard operations","title":"Main.ModularFormsModuloTwo.delta_k","text":"delta_k(k[, LENGTH])\n\nCreate the standard Δ^k form, with coefficients up to LENGTH => as a q-series!\n\nExample\n\njulia> disp(delta_k(0))\nMF mod 2 (coef to 1000) - 10000000000000000000000000000000000000000000000000...\n\njulia> disp(delta_k(1))\nMF mod 2 (coef to 1000) - 01000000010000000000000001000000000000000000000001...\n\njulia> disp(delta_k(2))\nMF mod 2 (coef to 1000) - 00100000000000000010000000000000000000000000000000...\n\njulia> disp(delta_k(3))\nMF mod 2 (coef to 1000) - 00010000000100000001000000000000000000000001000000...\n\njulia> disp(delta_k(5))\nMF mod 2 (coef to 1000) - 00000100000001000000000000000100000001000000010000...\n\n\n\n\n\n","category":"function"},{"location":"standard/#Main.ModularFormsModuloTwo.one","page":"Standard operations","title":"Main.ModularFormsModuloTwo.one","text":"one([LENGTH])\n\nCreate a one form of length LENGTH\n\nExample\n\njulia> one()\n1000-element SparseVector{Int8,Int64} with 1 stored entry:\n  [1   ]  =  1\n\njulia> one(1)\n1-element SparseVector{Int8,Int64} with 1 stored entry:\n  [1]  =  1\n\n\n\n\n\n","category":"function"},{"location":"standard/#Main.ModularFormsModuloTwo.zero","page":"Standard operations","title":"Main.ModularFormsModuloTwo.zero","text":"zero([LENGTH])\n\nCreate a zero form of length LENGTH\n\nExample\n\njulia> zero()\n1000-element SparseVector{Int8,Int64} with 0 stored entries\n\njulia> zero(1)\n1-element SparseVector{Int8,Int64} with 0 stored entries\n\n\n\n\n\n","category":"function"}]
}
