local nvim_autopairs = load_plugin("nvim-autopairs")
local cmp_autopairs = load_plugin("nvim-autopairs.completion.cmp")
local cmp = load_plugin("cmp")

if not (nvim_autopairs and cmp_autopairs and cmp) then
	return
end

nvim_autopairs.setup({
	check_ts = true,
})

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
