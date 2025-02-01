prefix ?= ${HOME}/.config/micro/plug/autofmt
nixfmt_shim ?= bin/nixfmt_shim

install:
	mkdir -p $(prefix)/{help,bin}
	cp autofmt.lua $(prefix)/autofmt.lua
	cp repo.json $(prefix)/repo.json
	cp help/autofmt.md $(prefix)/help/autofmt.md
	cp $(nixfmt_shim) $(prefix)/bin/nixfmt_shim

