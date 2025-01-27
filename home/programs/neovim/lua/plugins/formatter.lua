return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				["javascript.jsx"] = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				["typescript.jsx"] = { "prettier" },
				html = { "prettier" },
			},
			format_on_save = {
				timeout = 500,
			},
			formatters = {
				prettier = {
					require_cwd = true,
				},
			},
		},
	},
}
