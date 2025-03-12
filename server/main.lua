lib.callback.register('Kai_changeItemName_backpack:server:SetName', function(source, slot, data, text)
	local src = source
	local metadata = data.metadata


    metadata.original_label = data.label

    if metadata.label and not metadata.original_label then
        metadata.original_label = metadata.label
    end

	metadata.label = text

    exports["ox_inventory"]:SetMetadata(src, slot, metadata)

    return src
end)
