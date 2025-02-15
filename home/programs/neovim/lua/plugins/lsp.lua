return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"saghen/blink.cmp",
		},
		opts = function()
			return {
				on_attach = function(_, buffer)
					local function map(mode, keys, action, desc)
						desc = desc or ""
						local opts = {
							noremap = true,
							silent = true,
							buffer = buffer,
							desc = desc,
						}
						vim.keymap.set(mode, keys, action, opts)
					end

					map("n", "K", vim.lsp.buf.hover, "Open Hover Menu")
					map("n", "<leader>r", vim.lsp.buf.rename, "Rename")
					map({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, "Code Actions")

					map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
					map("n", "gD", vim.lsp.buf.declaration, "Go to Declaration")
					map("n", "gt", vim.lsp.buf.type_definition, "Go to Type Definition")
					map("n", "gi", vim.lsp.buf.implementation, "Go to Implementation")
					map("n", "gr", vim.lsp.buf.references, "Go to References")
				end,
			}
		end,
		config = function(_, opts)
			for server, config in pairs(opts.servers) do
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)

				if not config.on_attach then
					config.on_attach = opts.on_attach
				end

				if config.setup then
					if config.setup(config) then
						return
					end
				end
				require("lspconfig")[server].setup(config)
			end
		end,
	},
}
