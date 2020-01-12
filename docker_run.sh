#!/bin/sh
IMAGE=mathematicalmichael/latex
# choose a command (make, latexmk, pdflatex, bibtex, etc.)
# that will be run inside of the docker container
COMMAND=make
docker run --rm -v $(pwd):$(pwd) -w $(pwd) $IMAGE $COMMAND "$@"
