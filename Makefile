coverage:
	ocamlbuild -use-ocamlfind \
	-pkgs oUnit,bisect \
	-tag syntax\(camlp4o\) \
	foo.byte
	BISECT_FILE=_build/coverage ./foo.byte

coveralls: coverage
	ocveralls --prefix _build _build/coverage*.out --output coveralls.json
	curl -F 'json_file=@coveralls.json' 'https://coveralls.io/api/v1/jobs'

clean:
	ocamlbuild -clean
