local nvim_treesitter_configs = load_plugin("nvim-treesitter.configs")
local treesitter_context = load_plugin("treesitter-context")
if not (nvim_treesitter_configs and treesitter_context) then
	return
end

nvim_treesitter_configs.setup({
	ensure_installed = "all",
	sync_install = false,
	ignore_install = { "phpdoc", "swift" },
	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})

treesitter_context.setup({
	enable = true,
	throttle = true,
	max_lines = 0,
	patterns = {
		default = {
			"class",
			"function",
			"method",
			"for",
			"while",
			"if",
			"switch",
			"case",
		},
	},
})
