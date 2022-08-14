local nvim_window_status_ok, nvim_window = pcall(require, "nvim-window")
if not nvim_window_status_ok then
	return
end

nvim_window.setup({
	normal_hl = "Normal",
	hint_hl = "Bold",
	border = "single",
})
