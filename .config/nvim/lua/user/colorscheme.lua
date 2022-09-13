local catppuccin = load_plugin("catppuccin")
if not catppuccin then
	return
end

local custom_colors = {
	fg = "#CDD6F4",
	bg = "#151726",
	bg_brighter = "#1f1f30",
	grey14 = "#242932",
}

vim.g.catppuccin_flavour = "mocha"

catppuccin.setup({
	transparent_background = true,
	term_colors = true,
	custom_highlights = {

		VertSplit = { fg = custom_colors.grey14 },
		BufferLineIndicatorSelected = { fg = custom_colors.cyan, bg = custom_colors.bg },
		NvimTreeNormal = { bg = custom_colors.bg_brighter },
		WhichKeyFloat = { bg = custom_colors.bg_brighter },
		--
		NormalFloat = { bg = custom_colors.bg_brighter },
		FloatBorder = { bg = custom_colors.bg_brighter, fg = custom_colors.bg_brighter },

		TelescopePromptPrefix = { bg = custom_colors.bg_brighter },
		TelescopePromptNormal = { bg = custom_colors.bg_brighter },
		TelescopeResultsNormal = { bg = custom_colors.bg },
		TelescopePreviewNormal = { bg = custom_colors.bg_brighter },

		TelescopePromptBorder = { bg = custom_colors.bg_brighter, fg = custom_colors.bg_brighter },
		TelescopeResultsBorder = { bg = custom_colors.bg, fg = custom_colors.bg },
		TelescopePreviewBorder = { bg = custom_colors.bg_brighter, fg = custom_colors.bg_brighter },

		TelescopePromptTitle = { fg = custom_colors.bg_brighter },
		TelescopeResultsTitle = { fg = custom_colors.bg },
		TelescopePreviewTitle = { fg = custom_colors.bg_brighter },

		LspFloatWinNormal = { fg = custom_colors.fg, bg = custom_colors.bg_brighter },
		LspFloatWinBorder = { fg = custom_colors.bg_brighter },

		PmenuSel = { fg = custom_colors.bg_brighter, bg = custom_colors.green },
		Pmenu = { bg = custom_colors.bg_brighter },
	},
})

vim.cmd([[colorscheme catppuccin]])
