


-- LocalScript
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

-- Rejoin-Funktion
local function rejoin()
	local player = Players.LocalPlayer
	if player then
		TeleportService:Teleport(game.96408287210417, player)
	end
end

-- Beispiel: Alle 5 Sekunden rejoinen (NICHT empfohlen)
while true do
	wait(5)
	rejoin()
end
