local textcase_status_ok, textcase = pcall(require, "textcase")
if not textcase_status_ok then
	return
end

textcase.setup({})
