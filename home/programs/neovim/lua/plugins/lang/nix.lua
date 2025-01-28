return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				nixd = {
					nixpkgs = {
						expr = "import <nixpkgs> { }",
					},
					options = {
						nixos = {
							expr = '(builtins.getFlake "~/.nixos-config").nixosConfigurations.Ada.options',
						},
					},
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
