# You can set these variables from the command line, and also
# from the environment for the first two.
SHELL               =/bin/bash
DOCKER_BUILD       ?= docker build -f
SOURCEDIR           = .
TARGET              = cardano-address

VERSIONS           ?=3.8.0 3.9.0 
LATEST              =3.9.0 
help:
	@$(DOCKER) --help

.PHONY: help Makefile clean


all: $(VERSIONS)
latest: $(LATEST)
clean: 
force:

$(VERSIONS): force
	@$(DOCKER_BUILD) Dockerfile \
		--build-arg VERSION=$@\
		--tag coincodile/cardano-address:$@ \
		--tag coincodile/cardano-address:latest .

