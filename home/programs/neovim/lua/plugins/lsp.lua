return {
	"neovim/nvim-lspconfig",
	opts = function()
		return {
			on_attach = function(_, buffer)
				local function mapbufr(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, { buffer = buffer, desc = desc })
				end

				mapbufr("n", "<leader>r", vim.lsp.buf.rename, "Rename")
				mapbufr({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, "Code Actions")

				mapbufr("n", "gd", vim.lsp.buf.definition, "Go to Definition")
				mapbufr("n", "gD", vim.lsp.buf.declaration, "Go to Declaration")
				mapbufr("n", "gT", vim.lsp.buf.type_definition, "Go to Type Definition")
				mapbufr("n", "gi", vim.lsp.buf.implementation, "Go to Implementation")
				mapbufr("n", "gr", vim.lsp.buf.references, "Go to References")

				mapbufr("n", "K", vim.lsp.buf.hover, "Open Hover Menu")
			end,
		}
	end,
	config = function(_, opts)
		local function setup(name, server)
			local settings = server.settings
			if not settings.on_attach then
				settings.on_attach = opts.on_attach
			end

			if server.setup then
				if server.setup(settings) then
					return
				end
			end
			require("lspconfig")[name].setup(settings)
		end

		for name, server in pairs(opts.servers) do
			setup(name, server)
		end
	end,
}
