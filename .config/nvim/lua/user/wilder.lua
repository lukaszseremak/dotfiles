vim.cmd([[
  call wilder#setup({
        \ 'modes': [':', '/', '?'],
        \ 'next_key': '<Tab>',
        \ 'previous_key': '<S-Tab>',
        \ 'accept_key': '<Down>',
        \ 'reject_key': '<Up>',
        \ })
  call wilder#set_option('renderer', wilder#popupmenu_renderer({
        \ 'highlighter': wilder#basic_highlighter(),
        \ 'left': [
        \   ' ', wilder#popupmenu_devicons(),
        \ ],
        \ 'right': [
        \   ' ', wilder#popupmenu_scrollbar(),
        \ ],
        \ }))

  call wilder#set_option('pipeline', [
        \   wilder#branch(
        \     [
        \       wilder#check({_, x -> empty(x)}),
        \       wilder#history(),
        \       wilder#result({
        \         'draw': [{_, x -> ' ' . x}],
        \       }),
        \     ],
        \     wilder#cmdline_pipeline(),
        \     wilder#search_pipeline(),
        \     wilder#python_file_finder_pipeline({
        \       'file_command': ['find', '.', '-type', 'f', '-printf', '%P\n'],
        \       'dir_command': ['find', '.', '-type', 'd', '-printf', '%P\n'],
        \       'filters': ['fuzzy_filter', 'difflib_sorter'],
        \     }),
        \     wilder#cmdline_pipeline(),
        \     wilder#python_search_pipeline(),
        \   ),
        \ ])
]])

-- local status_ok, wilder = pcall(require, "wilder")
-- if not status_ok then
-- 	return
-- end
--
-- wilder.setup({
-- 	modes = { ":", "/", "?" },
-- 	next_key = "<Tab>",
-- 	previous_key = "<S-Tab>",
-- 	accept_key = "<Down>",
-- 	reject_key = "<Up>",
-- })
--
-- wilder.set_option(
-- 	"renderer",
-- 	wilder.popupmenu_renderer({
-- 		highlighter = wilder.basic_highlighter(),
-- 		left = { " ", wilder.popupmenu_devicons() },
-- 		right = { " ", wilder.popupmenu_scrollbar() },
-- 	})
-- )
--
-- wilder.set_option("pipeline", {
-- 	wilder.branch(
-- 		{
-- 			wilder.check(function(ctx, x)
-- 				return x == ""
-- 			end),
-- 			wilder.history(),
-- 			wilder.result({ draw = {
-- 				function(ctx, x)
-- 					return "  " .. x
-- 				end,
-- 			} }),
-- 		},
-- 		wilder.cmdline_pipeline(),
-- 		wilder.python_search_pipeline(),
-- 		wilder.python_file_finder_pipeline({
-- 			file_command = { "rg", "--files" },
-- 			dir_command = { "fd", "-td" },
-- 			filters = { "fuzzy_filter", "difflib_sorter" },
-- 		})
-- 	),
-- })
