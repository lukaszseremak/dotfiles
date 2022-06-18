local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local status_ok, nvim_gps = pcall(require, "nvim-gps")
if not status_ok then
	return
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "onenord",
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
			{ "diff", color_added = "#91B362", color_modified = "#FAE994", color_removed = "#EA6C73" },
		},
		lualine_c = {
			{ "filename" },
			{
				nvim_gps.get_location,
				cond = nvim_gps.is_available,
				color = { fg = "#97bc7c" },
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
