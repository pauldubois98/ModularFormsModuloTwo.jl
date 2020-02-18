# ModularFormsModuloTwo.jl Documentation

This module contains usual routines to do computation on modular forms modulo two.

## General
First, we define types and a useful display function.
```@autodocs
Modules = [ModularFormsModuloTwo]
Pages   = ["ModularFormsModuloTwo.jl"]
```

## Arithmetic
Then, we define the standard arithmetic (arithmetic of modular forms modulo two is more than a trivial implementation).
```@autodocs
Modules = [ModularFormsModuloTwo]
Pages   = ["arithmetic.jl"]
```

## Equality
It will be usefull to define an equality reation that is lighter than the very strict regular one.
```@autodocs
Modules = [ModularFormsModuloTwo]
Pages   = ["equality.jl"]
```

## Generators
Most of the time, the modular forms modulo two are standards, and we will use generators to create them.
```@autodocs
Modules = [ModularFormsModuloTwo]
Pages   = ["generators.jl"]
```

## Hecke Operators
Hecke operators represent the hear of the study of modular forms modulo two.
```@autodocs
Modules = [ModularFormsModuloTwo]
Pages   = ["HeckeOperator.jl"]
```

## Recognizer
The functions defined in this section allow he user to switch between the two representations of modular forms modulo two: (capped) infinite q-series and finite Δ-series.
```@autodocs
Modules = [ModularFormsModuloTwo]
Pages   = ["recognizer.jl"]
```
