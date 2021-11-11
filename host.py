import qsharp
from Qrng import SampleQuantumRandomNumberGenerator
from Qrng import X_application
from Qrng import Z_application
from Qrng import YasXZ_application
from Qrng import Y_application
from Qrng import CNOT_application
from Qrng import Entangle_application

i=0
while i<10:
    print("By measuring a qubit in super-position we obtain "+ str(SampleQuantumRandomNumberGenerator.simulate()))
    i=i+1

print("\n")

print("By measuring X|0> we obtain " + str(X_application.simulate()))
print("By measuring ZZX|0> = ZZ|1> = Z(-|1>) we obtain " + str(Z_application.simulate()))
print("By measuring Y|0> we obtain " + str(Y_application.simulate())+ " that is the same of XZ|0>: "+str(YasXZ_application.simulate()))

print("\n")

print("If target is |0> and control is |1>, by measurinng target after CNOT(control,target) we obtain " + str(CNOT_application.simulate()))

print("\n")

i=0
print("If target is |0> and control is |+>, CNOT(control,target) is an entangled state has a 50percent chance of being 00 or 11")
while i<10:
    print("Both qubits have value "+str(Entangle_application.simulate()))
    i=i+1