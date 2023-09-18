-- TODO: Seems that this autocommand isn't needed anymore? See #150, or the comment the dude had made. 
--
--
--
-- TODO: Fix this stupid ass bullshit
-- This cokeline config file needs to be re-sourced every time you change a theme, or else the colors won't change, the issue is known (#72)
-- To get around this, you can either bind the sourcing to a key so that you manually refresh it,
-- or you can actually use NeoVim like you're supposed to, and use the following autocommand.
local group = vim.api.nvim_create_augroup("Alo Bre", { clear = true }) -- A group with clear on true is created so that the autocmd isn't being duplicated on every run in the :autocmd ColorScheme list
vim.api.nvim_create_autocmd("ColorScheme",
	{ command = "source ~/.config/nvim/lua/stankovictab/specifics/cokeline.lua", group = group })
-- This also fixes the issue of cokeline taking the highlights of the default NeoVim theme on startup, as it's config is sourced in plugins.lua and not at the end of themes.lua, where the new colorscheme actually gets applied (doesn't matter, this works)

local extractHexColor = require('cokeline.hlgroups').get_hl_attr -- NOTE: The require('cokeline/utils').extractHexColor is depricated, you should use this instead

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
