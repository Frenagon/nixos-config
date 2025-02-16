---@module "snacks"

return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		keys = {
			{
				"<leader>.",
				function()
					Snacks.scratch()
				end,
				desc = "Scratch Pad",
			},
			{
				"<leader>E",
				function()
					Snacks.picker.explorer()
				end,
				desc = "Snacks Explorer",
			},
			{
				"<leader>ff",
				function()
					Snacks.picker.files()
				end,
				desc = "Find Files",
			},
		},
		opts = {
			indent = {
				animate = {
					enabled = false,
				},
			},
		},
	},
}
