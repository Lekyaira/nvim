-- ~/.config/nvim/lua/config/langtools.lua

local M = {}

local languages = require("config.languages")

function M.get(fields)
	local seen = {}
	local results = {}

	-- Normalize to table
	if type(fields) == "string" then
		fields = { fields }
	end

	for name, cfg in pairs(languages) do
		for _, field in ipairs(fields) do
			local value = cfg[field]
			if type(value) == "string" and not seen[value] then
				seen[value] = true
				table.insert(results, value)
			elseif type(value) == "table" then
				for _, item in ipairs(value) do
					if type(item) == "string" and not seen[item] then
						seen[item] = true
						table.insert(results, item)
					end
				end
			elseif type(value) == "boolean" and value == true and not seen[name] then
				seen[name] = true
				table.insert(results, name)
			end
		end
	end

	return results
end

return M
