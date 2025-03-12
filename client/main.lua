local ox_inventory = exports.ox_inventory


RegisterNetEvent('Kai_changeItemName_backpack:client:setname', function(slot, data)
    ox_inventory:closeInventory()

    local input = lib.inputDialog('Change Bag Name', {
        { type = 'input', label = 'Tag Text', description = 'Set A custom Name To Your Bag For Example ("aru mac10 backpack or drugs backpack")', required = true, min = 3, max = 30 },
    })

    if input then
        lib.callback('Kai_changeItemName_backpack:server:SetName', false, function(player)
            ox_inventory:openInventory('player', player)
        end, slot, data, input[1])
    end
end)


RegisterNetEvent('Kai_changeItemName:client:RenameMenu', function()

    local Bags = exports.ox_inventory:Search('slots', Config.RenameAbleItem)

   
    if not Bags or #Bags == 0 then
        lib.notify({ description = 'You have no Items to rename.', type = 'error' })
        return
    end

   
        local options = {}
        for _, slotData in pairs(Bags) do
            local slot = slotData.slot
            local metadata = slotData.metadata or {}
            local label = "BackPack"

 
            if metadata.serial then
                label = label .. " - Serial: " .. metadata.serial
            elseif metadata.label then
                label = label .. " - " .. metadata.label
            else
                label = label .. " - Slot " .. slot
            end

            table.insert(options, {
                title = label,
                icon = 'https://github.com/wasabirobby/wasabi_backpack/blob/main/_inventory_images/backpack.png?raw=true', -- image source: https://github.com/wasabirobby/wasabi_backpack
                onSelect = function()
                    TriggerEvent('Kai_changeItemName_backpack:client:setname', slot, slotData)
                end
            })
        end


       
        lib.registerContext({
            id = "ItemRenamer-menu",
       
            title = 'Select A Bag to Rename',
            options = options
        })
        lib.showContext("ItemRenamer-menu")

end)


RegisterCommand(Config.Command, function()
    TriggerEvent('Kai_changeItemName:client:RenameMenu')
end, false)