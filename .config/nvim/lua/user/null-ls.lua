local null_ls = load_plugin("null-ls")
if not null_ls then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.black,
		formatting.djhtml,
		formatting.isort,
		formatting.json_tool,
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.shfmt,
		formatting.stylua,
		formatting.trim_newlines,
		formatting.trim_whitespace,
	},
})
