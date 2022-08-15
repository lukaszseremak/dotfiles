local on_attach = function(client, bufnr)
	client.resolved_capabilities.document_formatting = false
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
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

for _, lsp in pairs(servers) do
	require("lspconfig")[lsp].setup({
		on_attach = on_attach,
		flags = {
			debounce_text_changes = 150,
		},
	})
end
