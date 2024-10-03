local json = require("dkjson")
local modItem = require("ModItem")

local sortedData = {}
for key, value in pairs(modItem) do
    local itemType = value.type
    if not sortedData[itemType] then
        sortedData[itemType] = {}
    end
    sortedData[itemType][key] = value
end

for itemType, items in pairs(sortedData) do
    local filePath = string.format("%s.json", itemType)
    local content = json.encode(items, { indent = true })
    local file = io.open(filePath, "w")
    if not file then return nil end
    file:write(content)
    file:close()
end



