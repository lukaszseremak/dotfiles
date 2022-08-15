local startup = load_plugin("startup")
if not startup then
	return
end

startup.setup({ theme = "startify" })
