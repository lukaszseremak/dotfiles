local status_ok, neoclip = pcall(require, "neoclip")
if not status_ok then
	return
end

neoclip.setup({
  enable_persistent_history = true,
  default_register = {"unnamed", "star", "plus", "unnamedplus"},
  db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
})
