return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			ensure_installed = {
				"nix",
				"lua",
				"javascript",
				"typescript",
				"tsx",
				"json",
				"html",
				"css",
				"scss",
				"markdown",
				"markdown_inline",
			},
			highlight = { enable = true, use_languagetree = true },
			indent = { enable = true },
			incremental_selection = { enable = true },
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},

	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		opts = {
			enable_autocmd = false,
		},
	},
}
