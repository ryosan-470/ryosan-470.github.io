HUGO_VERSION := 0.135.0
HUGO := ./.bin/hugo

# OSとアーキテクチャの検出
OS := $(shell uname -s)
ARCH := $(shell uname -m)

# ダウンロードURLの設定
ifeq ($(OS),Darwin)
	DOWNLOAD_URL := https://github.com/gohugoio/hugo/releases/download/v$(HUGO_VERSION)/hugo_extended_$(HUGO_VERSION)_darwin-universal.tar.gz
else ifeq ($(OS),Linux)
	ifeq ($(ARCH),x86_64)
		DOWNLOAD_URL := https://github.com/gohugoio/hugo/releases/download/v$(HUGO_VERSION)/hugo_extended_$(HUGO_VERSION)_linux-amd64.tar.gz
	else ifeq ($(ARCH),aarch64)
		DOWNLOAD_URL := https://github.com/gohugoio/hugo/releases/download/v$(HUGO_VERSION)/hugo_extended_$(HUGO_VERSION)_linux-arm64.tar.gz
	endif
endif

$(HUGO):
	@echo "Hugo not found. Running setup..."
	$(MAKE) setup

setup:
	@echo "Setting up Hugo for $(OS) ($(ARCH))..."
	mkdir -p .bin
	curl -L $(DOWNLOAD_URL) | tar -xz -C .bin
	chmod +x .bin/hugo
	$(HUGO) version
	@echo "Hugo setup complete."

.PHONY: preview build setup
preview: $(HUGO)
	$(HUGO) server &
	open http://localhost:1313

build: $(HUGO)
	$(HUGO) --minify -d ./docs

.PHONY: theme-update
theme-update:
	git submodule update --remote
