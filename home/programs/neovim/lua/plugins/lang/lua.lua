return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			on_init = function(client)
				if client.workspace_folders then
					local path = client.workspace_folders[1].name
					if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
						return
					end
				end

				client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
					runtime = {
						-- Tell the language server which version of Lua you're using
						-- (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
					},
					-- Make the server aware of Neovim runtime files
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
							-- Depending on the usage, you might want to add additional paths here.
							"${3rd}/luv/library",
							-- "${3rd}/busted/library",
						},
					},
				})
			end,
			on_attach = function()
				vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = 0 })
				vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { buffer = 0 })

				vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
				vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
				vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { buffer = 0 })

				vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
			end,
			settings = {
				Lua = {},
			},
		},
		config = function(_, opts)
			require("lspconfig").lua_ls.setup(opts)
		end,
	},
}
