today := `date +%F`

default:
  @just --list --unsorted

test:
  open http://localhost:1313
  hugo server --buildDrafts --disableFastRender --navigateToChanged

test-links:
  muffet --buffer-size=8192 http://localhost:1313

clean:
  -rm -r public/*
  -rm -r resources/*

build: clean
  hugo

update-theme:
  git submodule foreach git sm
