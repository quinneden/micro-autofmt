install:
	mkdir -p ~/.config/micro/plug/micro-autofmt/{help,bin}
	cp autofmt.lua ~/.config/micro/plug/micro-autofmt/autofmt.lua
	cp repo.json ~/.config/micro/plug/micro-autofmt/repo.json
	cp help/autofmt.md ~/.config/micro/plug/micro-autofmt/help/autofmt.md
	cp bin/nixfmt_shim ~/.config/micro/plug/micro-autofmt/bin/nixfmt_shim

