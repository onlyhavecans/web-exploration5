default:
    @just --list --unsorted

update:
    nix flake update

# Start the dev server with drafts and live reload
[parallel]
test: serve-local open-local

serve-local:
    hugo server --disableFastRender --cleanDestinationDir --navigateToChanged --logLevel warn

[linux]
open-local:
    xdg-open http://localhost:1313

[macos]
open-local:
    open http://localhost:1313

test-links:
    muffet --buffer-size=8192 http://localhost:1313

lint:
    markdownlint-cli2 --fix 'content/**/*.md'

clean:
    -rm -r public/*
    -rm -r resources/*

build: clean
    hugo

update-theme:
    git submodule update --init --recursive
    git submodule update --remote --merge
