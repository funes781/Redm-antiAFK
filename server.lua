RegisterServerEvent("fundev:server:kick")
AddEventHandler("fundev:server:kick", function()
	DropPlayer(source, Config.KickMsg)
end)  
