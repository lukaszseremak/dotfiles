local notify = load_plugin("notify")
if not notify then
	return
end

vim.notify = notify
notify.setup({
	background_colour = "#000000",
})
