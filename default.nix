with import <nixpkgs> {}; {
    HyperNerdEnv = stdenv.mkDerivation {
        name = "TestNix";
        buildInputs = [ 
            gcc
            raylib
	    ];
        LD_LIBRARY_PATH="${raylib}/lib";
    };
}
