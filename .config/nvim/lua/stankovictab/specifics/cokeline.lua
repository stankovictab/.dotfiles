-- WARN: DEPRECATED! Use bufferline!
--
-- The highlighting of cokeline should be fixed, see #72 for more details
-- But of course, it's not

local extractHexColor = require('cokeline.hlgroups').get_hl_attr

require('cokeline').setup({
	show_if_buffers_are_at_least = 2, -- Don't show if there's only one buffer

	mappings = {
		cycle_prev_next = true,
	},

	default_hl = {
		fg = function(buffer)
			return
				buffer.is_focused and nil or extractHexColor("Comment", "fg")
		end,
		bg = extractHexColor("NormalFloat", "bg")
	},

	sidebar = {
		filetype = 'NvimTree',
		components = {
			{
				text = '           NvimTree',
				fg = extractHexColor("Boolean", "fg"),
				bg = extractHexColor("NormalFloat", "bg"),
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
					return extractHexColor("Comment", "fg")
				else
					return extractHexColor("Comment", "fg")
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
					return extractHexColor("Boolean", "fg")
				else
					return extractHexColor("Comment", "fg")
				end
			end,
			style = function(buffer)
				if buffer.is_focused then
					return "bold,underline" -- Can be "underline,bold", for example
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
			fg = extractHexColor("Warnings", "fg")
		},
		{
			text = function(buffer)
				if buffer.is_readonly then
					return "  "
				end
				return ""
			end,
			fg = extractHexColor("Warnings", "fg")
		},
		{ text = " " },
	}
})
