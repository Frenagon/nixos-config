return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				nixd = {
					settings = {},
				},
			},
		},
	},

	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				nix = { "alejandra" },
			},
		},
	},
}
