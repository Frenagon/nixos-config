return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				astro = {
					capabilities = require("blink.cmp").get_lsp_capabilities(),
				},
			},
		},
	},

	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				astro = { "biome", "prettier", stop_after_first = true },
			},
		},
	},
}
