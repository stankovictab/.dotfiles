local get_hex = require("cokeline/utils").get_hex

require('cokeline').setup {
	show_if_buffers_are_at_least = 2, -- Don't show if there's only one buffer

	mappings = {
		cycle_prev_next = true,
	},

	default_hl = {
		fg = function(buffer)
			return
				buffer.is_focused and nil or get_hex("Comment", "fg")
		end,
		-- TODO: Make this not hardcoded, use get_hex()
		bg = "#141414", -- Background of buffers themselves, and not the left over line
		-- bg = get_hex("ColorColumn", "bg")
		-- bg = "none"
	},

	sidebar = {
		filetype = 'NvimTree',
		components = {
			{
				text = '           NvimTree',
				-- fg = "#f0ff99",
				-- TODO: Make this not hardcoded, use get_hex()
				fg = "#78dce8",
				bg = "#141414", -- bg = get_hex('NvimTreeNormal', 'bg'),
				style = 'bold',
			},
		}
	},

	components = {
		{ text = " " }, -- Adjust the padding here
		{
			text = function(buffer)
				return buffer.devicon.icon
			end,
			fg = function(buffer)
				return buffer.devicon.color
			end
		},
		{
			-- Unique prefix is for when you have multiple buffers with the same name, so you print the parent directory beforehand
			text = function(buffer)
				return buffer.unique_prefix
			end,
			fg = function(buffer)
				if buffer.is_focused then
					-- TODO: Make this not hardcoded, use get_hex()
					return "#456575"
				else
					-- TODO: Make this not hardcoded, use get_hex()
					return "#456575"
				end
			end,
			style = "italic",
		},
		{
			text = function(buffer)
				return buffer.filename
			end,
			fg = function(buffer)
				if buffer.is_focused then
					-- TODO: Make this not hardcoded, use get_hex()
					return "#78dce8"
				end
			end,
			style = function(buffer)
				if buffer.is_focused then
					return "underline,bold" -- "underline"
				end
				return nil
			end
		},
		{
			text = function(buffer)
				if buffer.is_modified then
					return " "
				else
					return " "
				end
			end,
			-- TODO: Make this not hardcoded, use get_hex()
			fg = "#e5c463"
		},
		{
			text = function(buffer)
				if buffer.is_readonly then
					return "  "
				end
				return ""
			end,
			-- TODO: Make this not hardcoded, use get_hex()
			fg = "#ff8262"
		},
		{ text = " " },
	}
}
