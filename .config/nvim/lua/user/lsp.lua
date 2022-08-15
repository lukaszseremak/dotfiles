local mason = load_plugin("mason")
local mason_lspconfig = load_plugin("mason-lspconfig")
local lspconfig = load_plugin("lspconfig")
if not (mason and mason_lspconfig and lspconfig) then
	return
end

local servers = {
	"bashls",
	"cssls",
	"dockerls",
	"grammarly",
	"html",
	"jsonls",
	"pyright",
	"sumneko_lua",
	"taplo",
	"yamlls",
}

mason.setup({})

mason_lspconfig.setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local on_attach = function(client, bufnr)
	client.resolved_capabilities.document_formatting = false
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

for _, lsp in pairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		flags = {
			debounce_text_changes = 150,
		},
	})
end
