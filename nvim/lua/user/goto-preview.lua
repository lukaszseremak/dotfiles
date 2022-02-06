local status_ok, goto_preview = pcall(require, "goto-preview")
if not status_ok then
	return
end

goto_preview.setup({
	width = 90,
	height = 25,
	border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" },
	default_mappings = false,
	debug = false,
	opacity = nil,
	resizing_mappings = false,
	post_open_hook = nil,
	references = {
		telescope = require("telescope.themes").get_dropdown({ hide_preview = false }),
	},
	focus_on_open = true,
	dismiss_on_move = false,
	force_close = true,
	bufhidden = "wipe",
})
