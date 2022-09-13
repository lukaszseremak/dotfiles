local lualine = load_plugin("lualine")
local nvim_gps = load_plugin("nvim-gps")
if not (lualine and nvim_gps) then
	return
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "catppuccin",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {},
		globalstatus = true,
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			{ "branch", icon = "" },
			{ "diff", color_added = "#A6E3A1", color_modified = "#F9E2AF", color_removed = "#F38BA8" },
		},
		lualine_c = {
			{ "filename" },
			{
				nvim_gps.get_location,
				cond = nvim_gps.is_available,
				color = { fg = "#A6E3A1" },
			},
		},
		lualine_x = {
			{
				"diagnostics",
				sources = { "nvim_lsp" },
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
			},
			"encoding",
			"fileformat",
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
