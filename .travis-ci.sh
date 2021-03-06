set -eu

# OPAM packages you install
OPAM_DEPS="ocamlfind ounit camomile reactiveData js_of_ocaml tyxml deriving ppx_deriving"
#js_of_ocaml tyxml deriving ppx_deriving reactiveData ocp-indent camomile
export PREFIX="./usr"
export BINDIR="$PREFIX/bin"
export LIBDIR="$PREFIX/lib"
export PATH="$BINDIR:$PATH"

mkdir -p $PREFIX

# Download and install OPAM and OCaml
wget -q -O opam_installer.sh "https://raw.github.com/ocaml/opam/master/shell/opam_installer.sh"
if [ -n "${OPAM_VERSION:-}" ]; then
    sed -i "s/^VERSION=.*$/VERSION='$OPAM_VERSION'/" opam_installer.sh
fi
echo y | sh opam_installer.sh $BINDIR $OCAML_VERSION

export OPAMYES=1
export OPAMVERBOSE=1
opam init
eval `opam config env`

# Install OPAM packages
if [ -n "${OPAM_DEPS:-}" ]; then
    opam install $OPAM_DEPS
fi

# Build and test your programs
#ocamlopt example.ml -o example.out
#./example.out
cd ./src
./build.sh
