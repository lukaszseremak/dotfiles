local opts = { noremap = true, silent = true }
local on_attach = function(client, bufnr)
	client.resolved_capabilities.document_formatting = false
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

local status_ok, nvim_lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
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

nvim_lsp_installer.setup({
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
