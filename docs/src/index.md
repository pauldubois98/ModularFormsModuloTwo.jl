# ModularFormsModuloTwo.jl Documentation
This module contains usual routines to do computation on modular forms modulo two.

## Introduction Modular Forms Modulo 2
Here is a very quick introduction to modular forms modulo two.

### Modular Forms
Modular forms are holomorphic complex functions on the upper half plane.

For a real introduction on modular forms, you can read "A Course in Arithmetic" by J-P. Serre (1973), or the [wikipedia page](https://en.wikipedia.org/wiki/Modular_form).

### ``\ q``-series of Modular Forms
Now, as they are holomorphic, they have a series expansion.
For a moular form ``\ f``, there is an expansion 

``\ f(z) = f(q) = \sum_{n \in \Z} a_n(f) q^n \qquad q = e^{2\pi i z}``

Now, Victor Saul Miller has proved in his thesis that there exists a basis for modular forms such that all ``\ a_n`` are integers.

### Reduction Modulo 2
Using this basis, we can reduce a mofular form ``\ f`` by taking it's ``\ q``-series and reducing all coefficients ``\ a_n`` modulo 2.
It may be proved that the resulting ``\ f`` is composed only of powers of ``\ \Delta`` with 

``\ \Delta = \sum_{m=0}^{\infty} q^{(2m+1)^2}.``

Therfore, the space of modular forms modulo 2 is:

``\ \mathcal{F} = \left\langle \Delta^k | k \text{ odd} \right\rangle = \left\langle \Delta, \Delta^3, \Delta^5, \Delta^7, \dots \right\rangle ``

### Duality ``\ q``-series and ``\ \Delta`` polynomial
What make the study of modular forms modulo 2 interesting is the fact that for a modular form ``\ f``, there are two representations:
* one as un infinite ``\ q``-series
* one as a finite polynomial in terms of ``\ \Delta``
The fact that we can switch from one representation is very useful.
With the ``\ q``-series, calculations (such as Hecke operators) are made easy, but we have to deal with an infinite series.
On the other hand, the ``\ \Delta``-polynomial is a finite representation, but calculations are harder.

### Specific use of this library
The way usual computer programs would deal with such object would be to represent ``\ 10^6`` ``\ q``-coefficients of modular forms, and suppose it is enough to take conclusions.
In this library, we try to take advantage of the fact that we have a duality ``\ q-\Delta`` and that all coefficients are over ``\ \mathbb{F}_2`` (so either ``\ 0`` or ``\ 1``).
There are functions ```to_q(df, precalculated)``` and ```to_Δ(f, precalculated)``` (in the [advanced operations](advanced/index.html) section) to switch from one representation to an other.
There is also a very special ```drop_error(f, precalculated, LENGTH)``` function wich drops the numerical error from calculating a Hecke operator (in the [advanced operations](advanced/index.html) as well).
(This is only possible by taking advantage of the fact that there is an equivanlent finite reprensentation in terms of ``\ \Delta``.)
