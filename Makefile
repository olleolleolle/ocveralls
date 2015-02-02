coverage:
	ocamlbuild -use-ocamlfind \
	-pkgs oUnit,bisect \
	-tag syntax\(camlp4o\) \
	foo.byte
	BISECT_FILE=_build/coverage ./foo.byte

coveralls: coverage
	ocveralls --prefix _build _build/coverage*.out > coverage.json
	curl -F json_file=coverage.json https://coveralls.io/api/v1/jobs

clean:
	ocamlbuild -clean
