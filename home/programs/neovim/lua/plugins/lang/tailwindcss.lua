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
				html = { "prettier" },
				css = { "prettier" },
				less = { "prettier" },
				sass = { "prettier" },
				scss = { "prettier" },
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
			highlight = {
				style = "virtual_left",
				virtual_text = "󰝤 ",
				emphasis = false,
			},
			auto_download = false,
		},
	},
}
