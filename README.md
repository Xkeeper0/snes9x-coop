# snes9x-coop-lua

This is pure Lua (and some libraries) and is contained entirely in the "coop" directory. These Lua scripts should be able to run exactly the same in any installation of snes9x-rr so long as LuaSockets and IUP DLLs are present in the directory with the snes9x exe.

The original repo contains the full development files of snes9x-rr and a note that you can throw them away and just copy out the co-op code. So I did.

## Usage

In snes9x-rr, open a Lua script window, and run "coop.lua".

## Contents of this repo

- Copied Penlight 1.5.2 (from github) into coop/ folder
- Built luasocket-3.0-rc1 (from github) and copied socket.lua into coop/ and core.dll into coop/socket/
- Downloaded iup-3.22_Win32_dll14_lib from SourceForge and extracted iup.dll from it, downloaded iup-3.22-Lua51_Win32_dll14_lib from SourceForge and extracted iuplua51.dll from it, renamed iuplua51.dll to iuplua.dll and also opened it in a hex editor and changed its dependency on "lua5.1.dll" to "lua51.dll\0". Copied all this into coop/

## Author / License

See LICENSES.md
