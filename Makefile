.PHONY: test
test: shellcheck

.PHONY: shellcheck
shellcheck:
	shellcheck $(shell find scripts -type f -iname \*.sh)
