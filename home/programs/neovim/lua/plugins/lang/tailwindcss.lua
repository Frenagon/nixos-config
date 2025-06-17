return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				tailwindcss = {},
			},
		},
	},

	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				html = { "biome", "prettier", stop_after_first = true },
				css = { "biome", "prettier", stop_after_first = true },
				less = { "biome", "prettier", stop_after_first = true },
				sass = { "biome", "prettier", stop_after_first = true },
				scss = { "biome", "prettier", stop_after_first = true },
			},
		},
	},

	{
		"eero-lehtinen/oklch-color-picker.nvim",
		event = "VeryLazy",
		version = "*",
		keys = {
			{
				"<leader>v",
				function()
					require("oklch-color-picker").pick_under_cursor()
				end,
				desc = "Color pick under cursor",
			},
		},
		opts = {
			auto_download = false,
		},
	},
}
