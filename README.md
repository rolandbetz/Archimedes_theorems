# Monte Carlo
Proving some of Archimedes' geometric theorems by a simple Monte Carlo simulation.
I just found theese theorems quite interesting, and it was fun to prove them by MC simulation...

The first function, named Archimedes1 demonstrates that if you take a cylinder,
and a sphere which matches inside the cylinder perfectly (means it touches both the
lateral surface and the bases of the cyclinder from inside), and finally a cone, which
also matches inside the cylinder, comparing the volumes of theese three objects will 
give a proportion of 3:2:1 respectively.

The second function, named Archimedes2 demonstrates that a sphere with a radius of 1
has a surface of 4pi, which is well known. On the other hand it also demonstrates,
that if you slice the sphere by paralell planes, which planes are in equal distances
from each other, theese sections of sphere have equal surfaces as well, and
this surface is also equal to the lateral surface area of the corresponding slice of the
circumscribing cylinder. This latter was Archimedes' favorite theorem, he was
so proud of it he even made theese two objects drawn onto his tombstone.

The third function solves Buffon's needle problem, which is probably one of the earliest problems
of geometric probability. The same time it is also a possible method for numerically determining
the value of pi. For more information check this page: https://en.wikipedia.org/wiki/Buffon%27s_needle_problem
