return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				nixd = {
					cmd = { "nixd" },
					settings = {
						nixd = {
							nixpkgs = {
								expr = "import <nixpkgs> { }",
							},
							options = {
								nixosAda = {
									expr = '(builtins.getFlake "/home/frenagon/.nixos-config").nixosConfigurations.Ada.options',
								},
								nixosAdaLaptop = {
									expr = '(builtins.getFlake "/home/frenagon/.nixos-config").nixosConfigurations.AdaLaptop.options',
								},
								home_manager = {
									expr = '(builtins.getFlake "/home/frenagon/.nixos-config").homeConfigurations.AdaWSL.options',
								},
							},
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
