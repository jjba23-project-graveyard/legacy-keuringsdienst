.PHONY: test

fmt:
	find . -name '*.hs' -type f -exec ormolu --mode inplace {} \;
	find . -name '*.nix' -exec nixfmt {} \;
	-nix develop -c -- statix check
	-nix develop -c -- deadnix -f

test:
	LANG=C.UTF-8 nix develop -c -- stack --nix test
build: fmt
	LANG=C.UTF-8 nix develop -c -- stack --nix build
release:
	LANG=C.UTF-8 nix develop -c -- stack --nix sdist .
