local fishing = false
local caughtFish = false

RegisterCommand("startfishing", function(source, args, rawCommand)
    if fishing then
        print("You are already fishing!")
        return
    end

    fishing = true
    caughtFish = false
    print("You start fishing. Press E to reel in.")

    Citizen.CreateThread(function()
        while fishing do
            Citizen.Wait(0)
            if IsControlJustPressed(0, 38) then -- E key to reel in
                local randomNumber = math.random(1, 10)
                if randomNumber == 1 then
                    caughtFish = true
                    print("You caught a fish!")
                else
                    print("No fish bites...")
                end
                fishing = false
            end
        end
    end)
end,false)

RegisterCommand("stopfishing", function(source, args, rawCommand)
    if fishing then
        fishing = false
        caughtFish = false
        print("You stopped fishing.")
    else
        print("You are not fishing.")
    end
end,false)

RegisterCommand("eatfish", function(source, args, rawCommand)
    if caughtFish then
        caughtFish = false
        print("You eat the fish and start feeling dizzy...")
        SetTimecycleModifier("spectator5") -- Apply drunk effect
        SetPedMotionBlur(player, true) -- Add motion blur
        Citizen.Wait(60000) -- Drunk effect lasts for 60 seconds
        print("You start feeling sober again.")
        SetTimecycleModifier("") -- Remove drunk effect
        SetPedMotionBlur(player, false) -- Remove motion blur
    else
        print("You need to catch a fish first.")
    end
end,false)
