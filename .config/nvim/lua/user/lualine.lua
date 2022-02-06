local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

lualine.setup({
	options = {
		icons_enabled = true,
		padding = 1,
		theme = "ayu_dark",
		component_separators = { "", "" },
		section_separators = { "", "" },
		disabled_filetypes = {},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			{ "branch", icon = "" },
			{ "diff", color_added = "#a7c080", color_modified = "#ffdf1b", color_removed = "#ff6666" },
		},
		lualine_c = { "filename" },
		lualine_x = {
			{
				"diagnostics",
				sources = { "nvim_lsp" },
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
			},
			"encoding",
			"filetype",
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = { "fugitive" },
})
