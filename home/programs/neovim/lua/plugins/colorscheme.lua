return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		enabled = true,
		priority = 1000,
		init = function()
			vim.cmd.colorscheme("catppuccin")
		end,
		opts = {
			flavour = "macchiato",
			integrations = {
				snacks = true,
				treesitter = true,
				mason = true,
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
