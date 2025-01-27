return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				tailwindcss = {
					settings = {},
				},
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
