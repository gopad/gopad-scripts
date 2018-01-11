HAS_BASHATE := $(shell command -v bashate)

.PHONY: test
test: bashate

.PHONY: bashate
bashate: bashate-deps
	bashate $(shell find scripts -type f -iname *.sh)

.PHONY: bashate-deps
bashate-deps:
ifndef HAS_BASHATE
	pip install bashate
endif
