today := `date +%F`

default:
  @just --list --unsorted

test:
  open http://localhost:1313
  hugo server --disableFastRender --navigateToChanged

clean:
  rm -rf public/*
  rm -rf resources/*

build: clean
  hugo

