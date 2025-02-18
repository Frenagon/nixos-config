M = {}

M.map = function(mode, keys, action, desc)
	desc = desc or ""
	local opts = { noremap = true, silent = true, desc = desc }
	vim.keymap.set(mode, keys, action, opts)
end

local state = 0
M.toggle_flow = function()
	if state == 0 then
		vim.opt.signcolumn = "yes:4"
		vim.opt.number = false
		vim.opt.relativenumber = false
		vim.opt.winbar = ""
		vim.g.ministatusline_disable = true
		state = 1
	else
		vim.opt.signcolumn = "auto"
		vim.opt.number = true
		vim.opt.relativenumber = true
		vim.opt.winbar = "%{%v:lua.dropbar()%}"
		vim.g.ministatusline_disable = false
		state = 0
	end
end

return M
