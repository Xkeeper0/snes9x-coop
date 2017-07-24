class   = require "pl.class"
pretty  = require "pl.pretty"
List    = require "pl.list"
stringx = require "pl.stringx"

require "util"
require "ircdialog"
require "pipe"
require "driver"
local _gameDriver	= nil

-- PROGRAM

if emu.emulating() then
	local data = ircDialog()
	local failed = false

	function scrub(invalid) errorMessage(invalid .. " not valid") failed = true end

	if failed then -- NOTHING
	elseif not nonempty(data.server) then scrub("Server")
	elseif not nonzero(data.port) then scrub("Port")
	elseif not nonempty(data.nick) then scrub("Nick")
	elseif not nonempty(data.partner) then scrub("Partner nick")
	end

	function connect()
		local socket = require "socket"
		local server = socket.tcp()
		result, err = server:connect(data.server, data.port)

		if not result then errorMessage("Could not connect to IRC: " .. err) failed = true return end

		statusMessage("Connecting to server...")
		_gameDriver = GameDriver()
		IrcPipe(data, _gameDriver):wake(server)
	end

	if not failed then connect() end

	if failed then gui.register(printMessage) end

else
	refuseDialog()
end

while true do
	-- Check, every frame, for updated memory values
	local changes = _gameDriver:checkValues()
	emu.frameadvance()
end
