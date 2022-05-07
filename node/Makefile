# You can set these variables from the command line, and also
# from the environment for the first two.
SHELL               =/bin/bash
DOCKER_BUILD       ?= docker build -f
SOURCEDIR           = .
BUILDDIR            = build

NODE_VERSION        ?=1.34.1
LIBSODIUM_VERSION   ?=66f017f1
ADDRESS_VERSION     ?=3.9.0
BECH_VERSION        ?=1.1.2
CNCLI_VERSION       ?=4.0.4
POOL_VERSION        ?=1.34.1-2

SUBDIRS           = docs
IMAGES            = address bech32 cncli pool node
# Put it first so that "make" without argument is like "make help".
help:
	@$(DOCKER) --help

.PHONY: help Makefile clean


all: $(SUBDIRS) $(IMAGES)
clean: $(SUBDIRS)
force:

$(SUBDIRS):force
	$(MAKE) -C $@ $(MAKECMDGOALS)

address: force
	@$(DOCKER_BUILD) Dockerfile.$@ \
		--build-arg VERSION=$(ADDRESS_VERSION) \
		--tag coincodile/cardano-$@:$(ADDRESS_VERSION) \
		--tag coincodile/cardano-$@:latest .

bech32: force
	@$(DOCKER_BUILD) Dockerfile.$@ \
		--build-arg VERSION=${BECH_VERSION} \
		--tag coincodile/cardano-$@:${BECH_VERSION} \
		--tag coincodile/cardano-$@:latest .

cncli: node
	@$(DOCKER_BUILD) Dockerfile.$@ \
		--build-arg VERSION=${CNCLI_VERSION} \
		--tag coincodile/cardano-$@:${CNCLI_VERSION} \
		--tag coincodile/cardano-$@:latest .

pool: force
	@$(DOCKER_BUILD) Dockerfile.$@ \
		--tag coincodile/cardano-$@:${POOL_VERSION} \
		--tag coincodile/cardano-$@:latest .

node: force
	@$(DOCKER_BUILD) Dockerfile.$@ \
		--build-arg VERSION=${NODE_VERSION} \
		--build-arg LIBSODIUM_VERSION=${LIBSODIUM_VERSION} \
		--tag coincodile/cardano-$@:${NODE_VERSION} \
		--tag coincodile/cardano-$@:latest .



