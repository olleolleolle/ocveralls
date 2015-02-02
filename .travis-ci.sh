OPAM_DEPENDS="ocamlfind ounit menhir bisect ocveralls"

case "$OCAML_VERSION,$OPAM_VERSION" in
    3.12.1,1.0.0) ppa=avsm/ocaml312+opam10 ;;
    3.12.1,1.1.0) ppa=avsm/ocaml312+opam11 ;;
    4.00.1,1.0.0) ppa=avsm/ocaml40+opam10 ;;
    4.00.1,1.1.0) ppa=avsm/ocaml40+opam11 ;;
    4.01.0,1.0.0) ppa=avsm/ocaml41+opam10 ;;
    4.01.0,1.1.0) ppa=avsm/ocaml41+opam11 ;;
    4.01.0,1.2.0) ppa=avsm/ocaml41+opam12 ;;
    4.02.0,1.2.0) ppa=avsm/ocaml42+opam12 ;;
    *) error "Unknown ocaml or opam version: $OCAML_VERSION,$OPAM_VERSION";;
esac

echo "yes" | sudo add-apt-repository ppa:$ppa
sudo apt-get update -qq
sudo apt-get install -qq ocaml ocaml-native-compilers camlp4-extra opam

export OPAMYES=1
export OPAMVERBOSE=1
opam init

git clone https://github.com/sagotch/ezjsonm.git
opam pin add -k git -n ezjsonm ezjsonm

git clone https://github.com/sagotch/ocveralls.ml.git
opam pin add -k git -n ocveralls ocveralls.ml

opam install ${OPAM_DEPENDS}

eval `opam config env`

make coverage coveralls
