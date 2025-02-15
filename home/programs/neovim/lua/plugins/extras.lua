---@module "snacks"

return {
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
			"Snacks Explorer",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			"Find Files",
		},
	},
	opts = {
		indent = {
			animate = {
				enabled = false,
			},
		},
	},
}
