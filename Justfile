default:
  @just --list --unsorted

update:
  nix flake update

[linux]
test: clean
  xdg-open http://localhost:1313
  hugo server --gc --navigateToChanged

[macos]
test: clean
  open http://localhost:1313
  hugo server --gc --navigateToChanged

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
