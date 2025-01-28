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
}
