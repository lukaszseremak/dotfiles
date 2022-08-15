local neogen = load_plugin("neogen")
if not neogen then
	return
end

neogen.setup({
	enabled = true,
	languages = {
		python = {
			template = {
				annotation_convention = "google_docstrings",
			},
		},
	},
	snippet_engine = "luasnip",
})
