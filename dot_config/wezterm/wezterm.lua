local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Gruvbox Dark color scheme
config.colors = {
	foreground = "#ebdbb2",
	background = "#282828",
	cursor_bg = "#ebdbb2",
	cursor_fg = "#282828",
	cursor_border = "#ebdbb2",
	selection_fg = "#282828",
	selection_bg = "#ebdbb2",
	scrollbar_thumb = "#504945",
	split = "#504945",

	ansi = {
		"#282828", -- black
		"#cc241d", -- red
		"#98971a", -- green
		"#d79921", -- yellow
		"#458588", -- blue
		"#b16286", -- magenta
		"#689d6a", -- cyan
		"#a89984", -- white
	},

	brights = {
		"#928374", -- bright black
		"#fb4934", -- bright red
		"#b8bb26", -- bright green
		"#fabd2f", -- bright yellow
		"#83a598", -- bright blue
		"#d3869b", -- bright magenta
		"#8ec07c", -- bright cyan
		"#ebdbb2", -- bright white
	},

	indexed = {
		[16] = "#fe8019",
		[17] = "#d65d0e",
	},

	-- Tab bar colors
	tab_bar = {
		background = "#1d2021",
		active_tab = {
			bg_color = "#282828",
			fg_color = "#ebdbb2",
			intensity = "Normal",
			underline = "None",
			italic = false,
			strikethrough = false,
		},
		inactive_tab = {
			bg_color = "#3c3836",
			fg_color = "#a89984",
		},
		inactive_tab_hover = {
			bg_color = "#504945",
			fg_color = "#ebdbb2",
			italic = true,
		},
		new_tab = {
			bg_color = "#3c3836",
			fg_color = "#a89984",
		},
		new_tab_hover = {
			bg_color = "#504945",
			fg_color = "#ebdbb2",
			italic = true,
		},
	},
}

-- Font configuration
config.font = wezterm.font("JetBrains Mono", { weight = "Regular" })
config.font_size = 12.0

-- Window configuration
config.window_padding = {
	left = 5,
	right = 5,
	top = 5,
	bottom = 5,
}

config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false

-- Other settings
config.window_background_opacity = 1.0
config.text_background_opacity = 1.0

config.window_close_confirmation = "AlwaysPrompt"
config.keys = {
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
}
-- add this config
config.skip_close_confirmation_for_processes_named = {}

return config
