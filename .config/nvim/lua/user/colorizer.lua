local colorizer = load_plugin("colorizer")
if not colorizer then
	return
end

colorizer.setup({ "*" }, {
	RGB = true,
	RRGGBB = true,
	names = true,
	RRGGBBAA = true,
	rgb_fn = true,
	hsl_fn = true,
	css = true,
	css_fn = true,
})
