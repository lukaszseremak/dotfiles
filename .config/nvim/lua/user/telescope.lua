local telescope = load_plugin("telescope")
if not telescope then
	return
end

telescope.setup({
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
		file_ignore_patterns = { ".git/", ".cache/", ".kodi/"},
	},
	pickers = {
		find_files = {
			hidden = true,
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("notify")
telescope.load_extension("env")
