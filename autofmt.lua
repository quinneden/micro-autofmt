VERSION = "2.0.3"

local config = import("micro/config")
local shell = import("micro/shell")
local filepath = import("path/filepath")
local micro = import("micro")

local fmtCommands = {}
fmtCommands["python"] = "black -q"
fmtCommands["c"]      = "clang-format -i"
fmtCommands["c++"]    = "clang-format -i"
fmtCommands["csharp"] = "clang-format -i"
fmtCommands["racket"] = "raco fmt --width 80 --max-blank-lines 2 -i"
fmtCommands["javascript"] = "prettier --write --loglevel silent"
fmtCommands["rust"] = "rustfmt +nightly"
fmtCommands["nix"] = filepath.Join(os.getenv("HOME"), ".config/micro/plug/autofmt/bin/nixfmt_shim")

config.RegisterCommonOption("autofmt", "fmt-onsave", true)

function init()
    config.MakeCommand("fmt", fmtCmd, config.NoComplete)
    config.AddRuntimeFile("fmt", config.RTHelp, "help/autofmt.md")
end

function onSave(bp)
    tryFmt(bp)
end

function tryFmt(bp)
    if bp.Buf.Settings["autofmt.fmt-onsave"] then
        if fmtCommands[bp.Buf:FileType()] ~= nil then
            doFmt(bp, fmtCommands[bp.Buf:FileType()])
        end
    end
end

function fmtCmd(bp)
    if fmtCommands[bp.Buf:FileType()] ~= nil then
        doFmt(bp, fmtCommands[bp.Buf:FileType()])
    end
end

function doFmt(bp, fmtCmd)
    local error = shell.RunCommand(fmtCmd .. " " .. bp.Buf.Path)
    if error ~= nil then
        micro.InfoBar():Error(error)
    end
    bp.Buf:ReOpen()
end
