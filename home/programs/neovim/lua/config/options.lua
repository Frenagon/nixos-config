vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.laststatus = 3
vim.opt.fillchars:append({ eob = " " })
vim.opt.shortmess:append("aIF")
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.ruler = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.breakindent = true
vim.opt.linebreak = true
vim.opt.equalalways = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.scrolloff = 2
vim.opt.sidescrolloff = 2

vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.swapfile = false
vim.opt.undofile = true

vim.opt.statusline = ""

vim.diagnostic.config({
	virtual_text = {
		prefix = "",
		suffix = "",
		format = function(diagnostic)
			return " " .. diagnostic.message .. " "
		end,
	},
	underline = {
		severity = { min = vim.diagnostic.severity.WARN },
	},
	signs = {
		text = {
			[vim.diagnostic.severity.HINT] = "󱐮",
			[vim.diagnostic.severity.ERROR] = "✘",
			[vim.diagnostic.severity.INFO] = "◉",
			[vim.diagnostic.severity.WARN] = "",
		},
	},
})
