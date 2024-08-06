local wezterm = require("wezterm")

function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return "Dark"
end

function scheme_for_appearance(appearance)
	print(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Macchiato"
	else
		return "Catppuccin Latte"
	end
end

local config = wezterm.config_builder()
config = {
	automatically_reload_config = true,
	window_close_confirmation = "NeverPrompt",
	enable_tab_bar = false,
	window_decorations = "RESIZE", -- disable title bar
	color_scheme = scheme_for_appearance(get_appearance()),
	font_size = 16.0,
}

return config
