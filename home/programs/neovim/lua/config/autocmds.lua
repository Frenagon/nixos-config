vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local function mapbufr(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, desc = desc })
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
})
