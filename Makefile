all: build

.PHONY: build hello-world

build: termbox.dylan
	dylan-compiler -build termbox

hello-world:
	dylan-compiler -build hello-world
	./_build/bin/hello-world
