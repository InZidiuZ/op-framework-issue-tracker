-- Define the Twitter app
local twitterApp = {
    tweets = {}
}

-- Define the Contacts app
local contactsApp = {
    contacts = {
        {name = "John Doe", number = "1234567890"},
        {name = "Jane Smith", number = "9876543210"}
    }
}

-- Define the Calling app
local callingApp = {
    currentCall = nil
}

-- Define the ChatGPT app
local chatGPTApp = {
    chatHistory = {}
}

-- Register commands for the custom phone
RegisterCommand("twitter", function(source, args, rawCommand)
    -- Logic for Twitter app goes here
    print("Opening Twitter app")
end)

RegisterCommand("contacts", function(source, args, rawCommand)
    -- Logic for Contacts app goes here
    print("Opening Contacts app")
end)

RegisterCommand("call", function(source, args, rawCommand)
    local contactName = args[1]
    
    for _, contact in ipairs(contactsApp.contacts) do
        if contact.name == contactName then
            callingApp.currentCall = contact.number
            print("Calling " .. contactName .. "...")
            break
        end
    end
end,false)

RegisterCommand("chatgpt", function(source, args, rawCommand)
    local question = table.concat(args)