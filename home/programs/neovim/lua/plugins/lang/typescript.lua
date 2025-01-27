return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				ts_ls = {
					settings = {},
				},
			},
		},
	},

	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				["javascript.jsx"] = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				["typescript.jsx"] = { "prettier" },
			},
		},
	},
}
