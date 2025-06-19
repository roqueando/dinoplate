{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = [
    pkgs.git
    pkgs.gcc
    pkgs.stdenv.cc.cc.lib
    #pkgs.glibc
    pkgs.cmake
    pkgs.libtool
    pkgs.ninja
    pkgs.libcxx
    pkgs.libcxx.dev
    pkgs.clang
    pkgs.clang-tools
  ];
  inputsFrom = [ pkgs.buildFHSEnv ];
  shellHook = ''
      export CXX=clang++
      export CC=clang
      export CXXFLAGS="-stdlib=libc++ -I${pkgs.libcxx.dev}/include/c++/v1"
      export LDFLAGS="-L${pkgs.libcxx}/lib -lc++ -lc++abi"
      export TMPDIR="/tmp/default"
      mkdir -p $TMPDIR
  '';
  LD_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath [
    pkgs.libcxx
    pkgs.libcxx.dev
    pkgs.clang
    pkgs.gcc
    pkgs.cmake
    pkgs.libtool
    pkgs.ninja
  ]}";

}
