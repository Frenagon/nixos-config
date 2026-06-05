local browser = "zen-twilight"
local browserClass = "zen-twilight"
local defaultGameVault = "Campaign Notes"
local defaultVault = "Coinquest"
local mainMod = "SUPER"
local music = "ytmdesktop"
local musicTitle = ".*YouTube Music.*"
local obsidianTitle = ".*Obsidian.*"
local terminal = "kitty"
local theme = require("themes/catppuccin")

hl.curve("fluent_decel", { type = "bezier", points = { { 0, 0.2 }, { 0.4, 1 } } })
hl.curve("easeOutCirc", { type = "bezier", points = { { 0, 0.55 }, { 0.45, 1 } } })
hl.curve("easeOutCubic", { type = "bezier", points = { { 0.33, 1 }, { 0.68, 1 } } })
hl.curve("easeinoutsine", { type = "bezier", points = { { 0.37, 0 }, { 0.63, 1 } } })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 1.5, bezier = "easeinoutsine", style = "popin 60%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.5, bezier = "easeOutCubic", style = "popin 60%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 1.5, bezier = "easeinoutsine", style = "slide" })
hl.animation({ leaf = "fade", enabled = true, speed = 2.5, bezier = "fluent_decel" })
hl.animation({ leaf = "fadeLayersIn", enabled = false })
hl.animation({ leaf = "border", enabled = false })
hl.animation({ leaf = "layers", enabled = true, speed = 1.5, bezier = "easeinoutsine", style = "popin" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "fluent_decel", style = "slide 60%" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 2, bezier = "fluent_decel", style = "slidefade 10%" })

hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("uwsm app -- " .. terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind(mainMod .. " + ALT + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + CTRL + SHIFT + Q", hl.dsp.exec_cmd("uwsm stop"))
hl.bind(mainMod .. " + ALT + P", hl.dsp.exec_cmd("uwsm app -- rofi_powermenu 2 7"))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("uwsm app -- hyprpicker -ad"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("uwsm app -- " .. terminal .. " --class clipse -e 'clipse'"))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("pgrep hyprlock || hyprlock"))
hl.bind(mainMod .. " + ALT + R", function()
	hl.dispatch(hl.dsp.exec_cmd("kill $(pgrep waybar)"))
	hl.dispatch(hl.dsp.exec_cmd("uwsm app -- waybar"))
	hl.dispatch(hl.dsp.exec_cmd("hyprctl reload"))
end)
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("toggle-process waybar"))
hl.bind("SHIFT + SPACE", hl.dsp.exec_cmd("rofi_launcher 4 5"))
hl.bind(mainMod .. " + PERIOD", hl.dsp.exec_cmd("bemoji -n"))
hl.bind("CTRL + SPACE", hl.dsp.exec_cmd("change_kb_layout next"))
hl.bind("CTRL + SHIFT + SPACE", hl.dsp.exec_cmd("change_kb_layout prev"))
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(
	mainMod .. " + 1",
	hl.dsp.exec_cmd("run_if_closed --class '" .. browserClass .. "' --workspace 1 -- " .. browser)
)
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + 2", hl.dsp.exec_cmd("run_if_closed --class '" .. terminal .. "' --workspace 2 -- " .. terminal))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(
	mainMod .. " + 3",
	hl.dsp.exec_cmd(
		"run_if_closed --title '"
			.. obsidianTitle
			.. "' --regex --workspace 3 -- xdg-open 'obsidian://open?vault="
			.. defaultVault
			.. "'"
	)
)
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(
	mainMod .. " + 4",
	hl.dsp.exec_cmd(
		"run_if_closed --title '"
			.. obsidianTitle
			.. "' --regex --workspace 4 -- xdg-open 'obsidian://open?vault="
			.. defaultGameVault
			.. "'"
	)
)
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(
	mainMod .. " + 5",
	hl.dsp.exec_cmd("run_if_closed --title '" .. musicTitle .. "' --regex --workspace 5 -- " .. music)
)
hl.bind(mainMod .. " + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + 6", hl.dsp.exec_cmd("run_if_closed --class 'Godot' --workspace 6 -- godot"))
hl.bind(mainMod .. " + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))
hl.bind(mainMod .. " + ALT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + ALT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + ALT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + ALT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + ALT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + ALT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + ALT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + ALT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + ALT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind(mainMod .. " + ALT + 0", hl.dsp.window.move({ workspace = 10 }))
hl.bind(mainMod .. " + ALT + left", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + ALT + right", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + ALT + up", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + ALT + down", hl.dsp.window.move({ direction = "d" }))
hl.bind(mainMod .. " + ALT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + ALT + L", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + ALT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + ALT + J", hl.dsp.window.move({ direction = "d" }))
hl.bind(mainMod .. " + A", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + ALT + A", hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("grimblast --notify copy area"))
hl.bind(mainMod .. " + ALT + S", hl.dsp.exec_cmd("grimblast --notify save area"))
hl.bind(mainMod .. " + CTRL + S", hl.dsp.exec_cmd("grimblast --notify copy active"))
hl.bind(mainMod .. " + CTRL + ALT + S", hl.dsp.exec_cmd("grimblast --notify save active"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("grimblast --notify copy output"))
hl.bind(mainMod .. " + SHIFT + ALT + S", hl.dsp.exec_cmd("grimblast --notify save output"))

hl.bind(mainMod .. " + CTRL + left", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + up", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + down", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + H", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + L", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + K", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + J", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("volume_control up"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("volume_control down"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("volume_control mute"), { locked = true, repeating = true })
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightness_control up"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightness_control down"), { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())

hl.monitor({
	output = "eDP-1",
	mode = "preferred",
	position = "auto",
	scale = "1.875",
	bitdepth = 10,
	cm = "hdr",
	sdrbrightness = 1.2,
	sdrsaturation = 0.98,
})

hl.monitor({
	output = "DP-1",
	mode = "3440x1440@144",
	position = "auto",
	scale = "1.25",
	bitdepth = 10,
	cm = "hdr",
	sdrbrightness = 2,
	sdrsaturation = 0.98,
})

hl.monitor({
	output = "DP-3",
	mode = "3440x1440@144",
	position = "auto",
	scale = "1.25",
	bitdepth = 10,
	cm = "hdr",
	sdrbrightness = 2,
	sdrsaturation = 0.98,
})

-- Helper function to read the lid state
local function get_lid_state()
	local file = io.open("/proc/acpi/button/lid/LID0/state", "r")
	if not file then
		-- Try alternate LID node if LID0 doesn't exist
		file = io.open("/proc/acpi/button/lid/LID/state", "r")
	end

	if file then
		local content = file:read("*all")
		file:close()
		-- Content typically looks like "state: open" or "state: closed"
		if content:match("closed") then
			return "closed"
		else
			return "open"
		end
	end
	return "unknown"
end

-- Monitor event handling
hl.bind("switch:on:Lid Switch", function()
	if #hl.get_monitors() > 1 then
		hl.monitor({ output = "eDP-1", disabled = true })
	end
end, { locked = true })

hl.bind("switch:off:Lid Switch", function()
	hl.monitor({
		output = "eDP-1",
		disabled = false,
		mode = "preferred",
		position = "auto",
		scale = "1.875",
		bitdepth = 10,
		cm = "hdr",
		sdrbrightness = 1.2,
		sdrsaturation = 0.98,
	})
end, { locked = true })

hl.on("monitor.added", function()
	if get_lid_state() == "closed" and #hl.get_monitors() > 1 then
		hl.monitor({ output = "eDP-1", disabled = true })
	end
end)

hl.window_rule({
	match = { fullscreen = true },
	border_color = theme.peach,
})

hl.window_rule({
	name = "suppress-maximize-events",
	match = {
		class = ".*",
	},
	suppress_event = "maximize",
})

hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		float = true,
		fullscreen = false,
		pin = false,
		title = "^$",
		xwayland = true,
	},
	no_focus = true,
})

hl.window_rule({
	name = "move-hyprland-run",
	match = {
		class = "hyprland-run",
	},
	float = true,
	move = "20 monitor_h-120",
})

hl.window_rule({
	name = "godot-tile",
	match = {
		class = "Godot",
	},
	float = false,
})

hl.window_rule({
	name = "godot-float",
	match = {
		class = "Godot",
		title = "negative:Godot",
	},
	center = true,
	float = true,
})

hl.window_rule({
	name = "clipse-float",
	match = {
		class = "clipse",
	},
	center = true,
	float = true,
	size = "622 652",
	stay_focused = true,
})

hl.window_rule({
	name = "obsidian-notes-workspace",
	match = {
		class = "obsidian|electron",
		title = "negative:.*(Campaign Notes|D&D 5E)" .. obsidianTitle,
	},
	workspace = "3",
})

hl.window_rule({
	name = "obsidian-games-workspace",
	match = {
		class = "obsidian|electron",
		title = ".*(Campaign Notes|D&D 5E)" .. obsidianTitle,
	},
	workspace = "4",
})

hl.window_rule({
	name = "music-workspace",
	match = {
		title = musicTitle,
	},
	workspace = "5",
})

hl.window_rule({
	name = "godot-workspace",
	match = {
		class = "Godot",
	},
	workspace = "6",
})

hl.window_rule({
	name = "gaming-workspace",
	match = {
		class = "net.lutris.Lutris|steam",
	},
	workspace = "10",
})

hl.config({
	animations = {
		enabled = true,
	},
	decoration = {
		blur = {
			enabled = true,
			passes = 1,
			size = 3,
			vibrancy = 0.169600,
		},
		shadow = {
			color = theme.crustAlpha .. "99",
			enabled = true,
			range = 4,
			render_power = 3,
		},
		active_opacity = 1.000000,
		inactive_opacity = 1.000000,
		rounding = 2,
		rounding_power = 4.000000,
	},
	general = {
		allow_tearing = false,
		border_size = 2,
		col = {
			active_border = theme.accent,
			inactive_border = theme.overlay0,
		},
		gaps_in = 2,
		gaps_out = 0,
		layout = "dwindle",
		resize_on_border = false,
	},
	input = {
		touchpad = {
			natural_scroll = false,
		},
		follow_mouse = 1,
		kb_layout = "us,us",
		kb_variant = ",intl",
		sensitivity = 0,
	},
	dwindle = {
		preserve_split = true,
	},
	master = {
		new_status = "master",
	},
	scrolling = {
		fullscreen_on_one_column = true,
	},
	misc = {
		background_color = theme.base,
		disable_hyprland_logo = true,
	},
	xwayland = {
		force_zero_scaling = true,
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
	scale = 4,
})

hl.on("hyprland.start", function()
	hl.exec_cmd("uwsm app -- " .. browser, { workspace = "1 silent" })
	hl.exec_cmd("uwsm app -- " .. terminal, { workspace = "2 silent" })
	hl.exec_cmd(
		"uwsm app -- xdg-open 'obsidian://open?vault="
			.. defaultVault
			.. "' & uwsm app -- xdg-open 'obsidian://open?vault="
			.. defaultGameVault
			.. "'"
	)
	hl.exec_cmd("uwsm app -- " .. music, { workspace = "5 silent" })
	hl.exec_cmd("uwsm app -- waybar")
	hl.exec_cmd("uwsm app -- clipse -listen")
	hl.exec_cmd("1password --silent")
end)

hl.on("config.reloaded", function()
	if get_lid_state() == "closed" and #hl.get_monitors() > 1 then
		hl.monitor({ output = "eDP-1", disabled = true })
	end
end)
