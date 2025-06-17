return {
	{
		"stevearc/conform.nvim",
		opts = {
			format_on_save = {
				timeout = 500,
			},
			formatters = {
				biome = {
					require_cwd = true,
				},
				prettier = {
					require_cwd = true,
				},
			},
		},
	},
}
