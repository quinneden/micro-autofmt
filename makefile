install:
	mkdir -p ~/.config/micro/plug/autofmt/{help,bin}
	cp autofmt.lua ~/.config/micro/plug/autofmt/autofmt.lua
	cp repo.json ~/.config/micro/plug/autofmt/repo.json
	cp help/autofmt.md ~/.config/micro/plug/autofmt/help/autofmt.md
	cp bin/nixfmt_shim ~/.config/micro/plug/autofmt/bin/nixfmt_shim
	chmod +x ~/.config/micro/plug/autofmt/bin/nixfmt_shim

