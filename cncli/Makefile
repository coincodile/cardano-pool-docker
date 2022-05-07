# You can set these variables from the command line, and also
# from the environment for the first two.
SHELL               =/bin/bash
DOCKER_BUILD       ?=docker build -f
SOURCEDIR           =.
BUILDDIR            =build
VERSIONS           ?=1.4.1

help:
	@$(DOCKER) --help

.PHONY: help Makefile clean

all: $(VERSIONS)
cncli:all
clean: 
force:

$(VERSIONS): force
	@$(DOCKER_BUILD) Dockerfile \
		--build-arg VERSION=$@\
		--tag coincodile/cardano-cncli:$@ \
		--tag coincodile/cardano-cncli:latest .


