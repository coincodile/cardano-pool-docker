# You can set these variables from the command line, and also
# from the environment for the first two.
SHELL               =/bin/bash
DOCKER_BUILD       ?= docker build -f
SOURCEDIR           = .
BUILDDIR            = build

VERSIONS           ?=1.34.1-2

# Put it first so that "make" without argument is like "make help".
help:
	@$(DOCKER) --help

.PHONY: help Makefile clean


all: $(VERSIONS)
clean: 
force:

$(VERSIONS): force
	@$(DOCKER_BUILD) Dockerfile \
		--tag coincodile/cardano-pool:$@ \
		--tag coincodile/cardano-pool:latest .