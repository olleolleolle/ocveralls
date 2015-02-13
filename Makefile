coverage:
	ocamlbuild -use-ocamlfind \
	-pkgs oUnit,bisect \
	-tag syntax\(camlp4o\) \
	foo.byte
	BISECT_FILE=_build/coverage ./foo.byte

coveralls: coverage
	ocveralls --prefix _build _build/coverage*.out --send

clean:
	ocamlbuild -clean
