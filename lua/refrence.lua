-- reference.lua
local M = {}

-- Changed to consistently use 'descriptions' (plural)
M.keymap_descriptions = {}

-- Function to set keymap and store its description
function M.set_keymap(mode, lhs, rhs, opts)
	vim.keymap.set(mode, lhs, rhs, opts)

	-- Store the keymap info for reference
	table.insert(M.keymap_descriptions, {
		mode = mode,
		lhs = lhs,
		desc = opts.desc or "No description",
	})
end

-- Changed function name to match the call in keymapping.lua
function M.list_keymaps()
	-- Create a mapping of mode names for better readability
	local mode_names = {
		n = "Normal",
		i = "Insert",
		v = "Visual",
		x = "Visual Block",
		s = "Select",
		c = "Command",
		t = "Terminal",
		[""] = "Normal+Visual",
		["n,v"] = "Normal+Visual",
	}

	-- Sort keymaps by mode
	table.sort(M.keymap_descriptions, function(a, b)
		return tostring(a.mode) < tostring(b.mode)
	end)

	-- Group keymaps by mode
	local grouped = {}
	for _, keymap in ipairs(M.keymap_descriptions) do
		local mode = type(keymap.mode) == "table" and table.concat(keymap.mode, ",") or keymap.mode
		grouped[mode] = grouped[mode] or {}
		table.insert(grouped[mode], keymap)
	end

	-- Print keymaps in a formatted way
	print("\nKeybinding Reference:")
	print("===================")
	for mode, keymaps in pairs(grouped) do
		local mode_name = mode_names[mode] or mode
		print(string.format("\n%s mode:", mode_name))
		print(string.rep("-", 40))
		for _, keymap in ipairs(keymaps) do
			print(string.format("%-15s -> %s", keymap.lhs, keymap.desc))
		end
	end
end

-- Function to search keymaps
function M.search_keymaps(search_term)
	print("\nSearching for: " .. search_term)
	print("===================")
	local found = false
	for _, keymap in ipairs(M.keymap_descriptions) do
		if
			string.find(string.lower(keymap.desc), string.lower(search_term))
			or string.find(string.lower(keymap.lhs), string.lower(search_term))
		then
			print(
				string.format(
					"%-10s %-15s -> %s",
					type(keymap.mode) == "table" and table.concat(keymap.mode, ",") or keymap.mode,
					keymap.lhs,
					keymap.desc
				)
			)
			found = true
		end
	end
	if not found then
		print("No keymaps found matching: " .. search_term)
	end
end

return M
