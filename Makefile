HUGO := hugo

.PHONY: preview
preview:
	$(HUGO) server &
	open http://localhost:1313

build:
	$(HUGO) --minify -d ./docs

theme-update:
	git submodule update --remote
