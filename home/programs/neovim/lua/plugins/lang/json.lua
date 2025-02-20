return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				jsonls = {
					cmd = { "vscode-json-languageserver", "--stdio" },
				},
			},
		},
	},

	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				json = { "prettier" },
				jsonc = { "prettier" },
			},
		},
	},
}
