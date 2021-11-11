namespace Qrng {
    open Microsoft.Quantum.Intrinsic;
    
    operation SampleQuantumRandomNumberGenerator() : Result {
        use q = Qubit(); // Allocate a qubit.
        H(q);            // Put the qubit to superposition. It now has a 50% chance of being 0 or 1.
        let r = M(q);    // Measure the qubit value.
        Reset(q);
        return r;
    }

    operation X_application() : Result {
        use q = Qubit(); // Allocate a |0> qubit.
        X(q);            // Apply X to the qubit, we get |1>
        let r = M(q);    // Measure the qubit value.
        Reset(q);
        return r;
    }

    operation Z_application() : Result {
        use q = Qubit(); // Allocate a |0> qubit.
        X(q);            // Apply X to the qubit, we get |1>
        Z(q);            // Apply Z to the qubit, we get -|1>
        Z(q);            // Apply Z to the qubit, we get |1>
        let r = M(q);    // Measure the qubit value.
        Reset(q);
        return r;
    }

    operation YasXZ_application() : Result {
        use q = Qubit(); // Allocate a |0> qubit.
        X(q);            // Apply X to the qubit, we get |1>
        Z(q);            // Apply Z to the qubit, we get -|1>
        let r = M(q);    // Measure the qubit value.
        Reset(q);
        return r;
    }

    operation Y_application() : Result {
        use q = Qubit(); // Allocate a |0> qubit.
        Y(q);            // Apply Z to the qubit, we get -|1>
        let r = M(q);    // Measure the qubit value, it returns 1
        Reset(q);
        return r;
    }

    operation CNOT_application() : Result {
        use control = Qubit(); // Allocate a |0> qubit.
        use target = Qubit(); // Allocate a |0> qubit.
        X(control);            // Apply X to the control qubit, we get |1>

        CNOT(control,target); //flip target qubit because the control qubit is |1>
        let r = M(target);    // Measure the qubit value, it returns 1
        Reset(control);
        Reset(target);
        return r;
    }

    operation Entangle_application() : Int {
        use control = Qubit(); // Allocate a |0> qubit.
        use target = Qubit(); // Allocate a |0> qubit.
        H(control);            // Apply H to the control qubit, we get a superposition in the middle

        CNOT(control,target);
        let m1 = M(target);    // Measure the qubit value, it now has a 50% chance of being 0 or 1.
        let m2 = M(control);   //if m1==0 -> m2==0, if m1==1 -> m2==1 
        Reset(control);
        Reset(target);
        mutable x = -1; 
        if(m1==m2){
            if(m1==One){
                set x=1;
            }
            else{
                set x=0;
            }    
        }
        return x;
    }
}