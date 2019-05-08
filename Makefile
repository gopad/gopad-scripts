.PHONY: shellcheck
shellcheck:
	shellcheck $(shell find scripts -type f -iname \*.sh)
