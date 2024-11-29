.PHONY: test

fmt:
	find . -name '*.hs' -type f -exec ormolu --mode inplace {} \;
	find . -name '*.nix' -exec nixfmt {} \;
	-statix check
	-deadnix -f

test:
	LANG=C.UTF-8 stack --nix test
build: fmt
	LANG=C.UTF-8 stack --nix build
release:
	LANG=C.UTF-8 stack --nix sdist .
