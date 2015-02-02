coverage:
	ocamlbuild -use-ocamlfind \
	-pkgs oUnit,bisect \
	-tag syntax\(camlp4o\) \
	foo.byte
	BISECT_FILE=_build/coverage ./foo.byte

coveralls:
	ocveralls --prefix _build _build/coverage*.out

clean:
	ocamlbuild -clean
