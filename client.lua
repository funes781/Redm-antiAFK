Citizen.CreateThread(function()
	while true do
        Wait(1000) 
        local playerPed = PlayerPedId()
        if playerPed then
            local currentPos = GetEntityCoords(playerPed, true)
            if prevPos and currentPos == prevPos then
                if timeLeft > 0 then
                    if Config.kickWarning and timeLeft == math.ceil(Config.secondsUntilKick/4) then
                        TriggerEvent('chatMessage', '^1[SYSTEM]', {255, 0, 0}, 'Niedługo zostaniesz wyrzucony za bycie w bezruchu przez zbyt długo czas!')
                    end
                    timeLeft = timeLeft - 1 
                else
                    TriggerServerEvent("fundev:server:kick")
                end
            else
                timeLeft = Config.secondsUntilKick
            end

            prevPos = currentPos
        end
    end
end)

