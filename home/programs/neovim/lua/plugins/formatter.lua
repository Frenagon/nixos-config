return {
	{
		"stevearc/conform.nvim",
		opts = {
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
