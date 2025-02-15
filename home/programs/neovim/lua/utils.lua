M = {}

M.map = function(mode, keys, action, desc)
	desc = desc or ""
	local opts = { noremap = true, silent = true, desc = desc }
	vim.keymap.set(mode, keys, action, opts)
end

local state = 0
M.toggle_flow = function()
	if state == 0 then
		vim.o.relativenumber = false
		vim.o.number = false
		vim.opt.signcolumn = "yes:4"
		vim.o.winbar = ""
		state = 1
	else
		vim.o.relativenumber = true
		vim.o.number = true
		vim.opt.signcolumn = "auto"
		vim.o.winbar = "%{%v:lua.dropbar()%}"
		state = 0
	end
end

return M
