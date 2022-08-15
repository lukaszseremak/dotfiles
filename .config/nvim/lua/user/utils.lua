load_plugin = function(plugin_name)
	local plugin_status, plugin = pcall(require, plugin_name)
	if not plugin_status then
		vim.notify(
			string.format("Could not load `%s` plugin!", plugin_name),
			"error",
			{ title = string.format("`%s`", plugin_name) }
		)
		return
	end

	return plugin
end
