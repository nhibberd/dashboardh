.PHONY: test build

default: test

test:
        cabal configure --enable-tests && cabal build && cabal test

build:
        cabal configure && cabal build

dev:
        cabal sandbox init && cabal install --only-dependencies

ghci:
        cabal configure && cabal build && cabal repl