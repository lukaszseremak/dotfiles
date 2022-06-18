local status_ok, onenord = pcall(require, "onenord")
if not status_ok then
	return
end

local M = {}

M.base_30 = {
	white = "#abb2bf",
	darker_black = "#1b1f27",
	black = "#1e222a", --  nvim bg
	black2 = "#252931",
	one_bg = "#282c34", -- real bg of onedark
	one_bg2 = "#353b45",
	one_bg3 = "#30343c",
	grey = "#42464e",
	grey_fg = "#565c64",
	grey_fg2 = "#6f737b",
	light_grey = "#6f737b",
	red = "#d47d85",
	baby_pink = "#DE8C92",
	pink = "#ff75a0",
	line = "#2a2e36", -- for lines like vertsplit
	green = "#A3BE8C",
	vibrant_green = "#7eca9c",
	nord_blue = "#81A1C1",
	blue = "#61afef",
	yellow = "#e7c787",
	sun = "#EBCB8B",
	purple = "#b4bbc8",
	dark_purple = "#c882e7",
	teal = "#519ABA",
	orange = "#fca2aa",
	cyan = "#a3b8ef",
	statusline_bg = "#22262e",
	lightbg = "#2d3139",
	lightbg2 = "#262a32",
	pmenu_bg = "#A3BE8C",
	folder_bg = "#61afef",
}

local custom_colors = {
	fg = "#C8D0E0",
	fg_light = "#E5E9F0",
	bg = "#1c1f26",
	grey = "#282c34", -- real bg of onedark
	grey14 = "#242932",
	grey15 = "#1e222a",
	grey16 = "#1c1f26",
	light_gray = "#6C7A96",
	cyan = "#88C0D0",
	blue = "#81A1C1",
	dark_blue = "#5E81AC",
	green = "#A3BE8C",
	light_green = "#8FBCBB",
	dark_red = "#BF616A",
	red = "#D57780",
	light_red = "#DE878F",
	pink = "#E85B7A",
	dark_pink = "#E44675",
	orange = "#D08F70",
	yellow = "#EBCB8B",
	purple = "#B988B0",
	light_purple = "#B48EAD",
	none = "NONE",
}

onenord.setup({
	styles = {
		comments = "italic",
		strings = "NONE",
		keywords = "NONE",
		functions = "italic",
		variables = "NONE",
		diagnostics = "underline",
	},
	disable = {
		background = false,
		cursorline = false,
		eob_lines = true,
	},
	custom_highlights = {
		VertSplit = { fg = custom_colors.grey14 },
		BufferLineIndicatorSelected = { fg = custom_colors.cyan, bg = custom_colors.bg },
		BufferLineFill = { fg = custom_colors.fg, bg = custom_colors.grey14 },
		NvimTreeNormal = { bg = custom_colors.grey14 },
		WhichKeyFloat = { bg = custom_colors.grey14 },

		NormalFloat = { bg = custom_colors.grey14 },
		FloatBorder = { bg = custom_colors.grey14, fg = custom_colors.grey14 },

		TelescopePromptPrefix = { bg = custom_colors.grey14 },
		TelescopePromptNormal = { bg = custom_colors.grey14 },
		TelescopeResultsNormal = { bg = custom_colors.grey15 },
		TelescopePreviewNormal = { bg = custom_colors.grey16 },

		TelescopePromptBorder = { bg = custom_colors.grey14, fg = custom_colors.grey14 },
		TelescopeResultsBorder = { bg = custom_colors.grey15, fg = custom_colors.grey15 },
		TelescopePreviewBorder = { bg = custom_colors.grey16, fg = custom_colors.grey16 },

		TelescopePromptTitle = { fg = custom_colors.grey14 },
		TelescopeResultsTitle = { fg = custom_colors.grey15 },
		TelescopePreviewTitle = { fg = custom_colors.grey16 },

		LspFloatWinNormal = { fg = custom_colors.fg, bg = custom_colors.grey14 },
		LspFloatWinBorder = { fg = custom_colors.grey14 },

		PmenuSel = { fg = custom_colors.grey, bg = custom_colors.green },
		Pmenu = { bg = custom_colors.grey },
		PMenuThumb = { bg = custom_colors.grey16 },
	},
	custom_colors = custom_colors,
})
