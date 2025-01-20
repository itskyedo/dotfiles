-- Pull in the wezterm API
local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font_size = 11.0

config.font = wezterm.font_with_fallback({
	{ family = "MartianMono Nerd Font Mono", weight = "Medium" },
	"JetBrainsMono Nerd Font Mono",
	"Noto Color Emoji",
})

config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 0,
}

config.window_frame = {
	font_size = 11.0,
	active_titlebar_bg = "#000000",
	inactive_titlebar_bg = "#000000",
}

config.colors = {
	split = "#111",

	cursor_fg = "#000000",
	cursor_bg = "#00FF26",
	cursor_border = "#00FF26",

	tab_bar = {
		background = "rgba(0,0,0,0)",
		active_tab = {
			bg_color = "#000000",
			fg_color = "#ffffff",
		},
		inactive_tab = {
			bg_color = "#000000",
			fg_color = "#ffffff",
		},
		inactive_tab_hover = {
			bg_color = "#000000",
			fg_color = "#ffffff",
		},
	},
}

-- config.background = {
-- 	{
-- 		source = {
-- 			File = "/path/to/image.png",
-- 		},
-- 		hsb = {
-- 			brightness = 0.1,
-- 		},
-- 	},
-- }

config.scrollback_lines = 200000
config.use_fancy_tab_bar = true
config.tab_max_width = 24
config.use_dead_keys = false
config.show_new_tab_button_in_tab_bar = false
-- config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
config.force_reverse_video_cursor = false
config.initial_cols = 80
config.initial_rows = 36

return config
