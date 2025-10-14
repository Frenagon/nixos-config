return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			ensure_installed = {
				"astro",
				"bash",
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
			matchup = {
				enable = true,
			},
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

	{
		"andymass/vim-matchup",
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
	},
}
