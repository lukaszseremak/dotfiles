local nvim_window = load_plugin("nvim-window")
if not nvim_window then
	return
end

nvim_window.setup({
	normal_hl = "PmenuSel",
	border = "none",
})
