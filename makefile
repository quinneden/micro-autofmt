# prefix = ${HOME}/.config/micro/plug/autofmt
prefix = @prefix@

install:
	mkdir -p $(prefix)/{help,bin}
	cp autofmt.lua $(prefix)/autofmt.lua
	cp repo.json $(prefix)/repo.json
	cp help/autofmt.md $(prefix)/help/autofmt.md
	cp bin/nixfmt_shim $(prefix)/bin/nixfmt_shim
	chmod +x $(prefix)/bin/nixfmt_shim

