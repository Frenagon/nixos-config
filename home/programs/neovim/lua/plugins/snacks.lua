---@module "snacks"

return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		keys = function()
			local snacks = require("snacks")

			return {
				{ "<leader>.", snacks.scratch.open, desc = "Scratch pad" },
				{ "<leader>E", snacks.picker.explorer, desc = "Snacks explorer" },
				{ "<leader>ff", snacks.picker.files, desc = "Find files" },
			}
		end,
		opts = {
			statuscolumn = {
				left = { "fold", "git" },
				right = { "mark", "sign" },
			},
			notifier = {},
			indent = {
				scope = {
					treesitter = {
						enabled = false,
					},
				},
				animate = {
					enabled = false,
				},
			},
		},
	},
}
