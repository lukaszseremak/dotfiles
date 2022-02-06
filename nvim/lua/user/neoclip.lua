local status_ok, neoclip = pcall(require, "neoclip")
if not status_ok then
	return
end

neoclip.setup({
	enable_persistant_history = true,
  default_register = {"unnamed", "star", "plus", "unnamedplus"},
})
