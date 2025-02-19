return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		enabled = true,
		priority = 1000,
		lazy = false,
		init = function()
			vim.cmd.colorscheme("catppuccin")
		end,
		opts = {
			flavour = "macchiato",
			integrations = {
				snacks = true,
				treesitter = true,
				blink_cmp = true,
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
					},
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
					},
				},
				mini = {
					enabled = true,
				},
			},
			custom_highlights = function(colors)
				return {
					--[[ Statusline ]]
					-- Border
					StatuslineBGModeNormal = { bg = colors.blue, fg = colors.crust, style = { "bold" } },
					StatuslineBGModeInsert = { bg = colors.green, fg = colors.crust, style = { "bold" } },
					StatuslineBGModeVisual = { bg = colors.mauve, fg = colors.crust, style = { "bold" } },
					StatuslineBGModeReplace = { bg = colors.red, fg = colors.crust, style = { "bold" } },
					StatuslineBGModeCommand = { bg = colors.yellow, fg = colors.crust, style = { "bold" } },
					StatuslineBGModeOther = { bg = colors.teal, fg = colors.crust, style = { "bold" } },
					-- Sections
					MiniStatuslineFileinfo = { fg = colors.text, bg = colors.surface0 },
					MiniStatuslineDevinfo = { fg = colors.text, bg = colors.surface0 },
					MiniStatuslineFilename = { fg = colors.text, bg = colors.surface0 },
					MiniStatuslineFilenameMod = { fg = colors.yellow, bg = colors.surface0 },
					StatuslineGit = { fg = colors.peach, bg = colors.surface0 },
					-- Modes
					MiniStatuslineModeNormal = { fg = colors.blue, bg = colors.surface0 },
					MiniStatuslineModeInsert = { fg = colors.green, bg = colors.surface0 },
					MiniStatuslineModeVisual = { fg = colors.mauve, bg = colors.surface0 },
					MiniStatuslineModeReplace = { fg = colors.red, bg = colors.surface0 },
					MiniStatuslineModeCommand = { fg = colors.yellow, bg = colors.surface0 },
					MiniStatuslineModeOther = { fg = colors.teal, bg = colors.surface0 },
					-- Diagnostics
					SatuslineDiagnosticsError = { fg = colors.red, bg = colors.surface0 },
					SatuslineDiagnosticsWarn = { fg = colors.yellow, bg = colors.surface0 },
					SatuslineDiagnosticsInfo = { fg = colors.sky, bg = colors.surface0 },
					SatuslineDiagnosticsHint = { fg = colors.teal, bg = colors.surface0 },
					-- Icons
					MiniIconsYellow = { fg = colors.yellow, bg = colors.surface0 },
					MiniIconsPurple = { fg = colors.mauve, bg = colors.surface0 },
					MiniIconsGrey = { fg = colors.text, bg = colors.surface0 },
					MiniIconsCyan = { fg = colors.teal, bg = colors.surface0 },
					MiniIconsAzure = { fg = colors.sky, bg = colors.surface0 },
					MiniIconsRed = { fg = colors.red, bg = colors.surface0 },
					MiniIconsOrange = { fg = colors.peach, bg = colors.surface0 },
					MiniIconsGreen = { fg = colors.green, bg = colors.surface0 },
					MiniIconsBlue = { fg = colors.blue, bg = colors.surface0 },
				}
			end,
		},
	},

	{
		"olimorris/onedarkpro.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("onedark")
		end,
	},
}
