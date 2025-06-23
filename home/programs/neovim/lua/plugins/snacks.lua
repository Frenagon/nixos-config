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
				{ "<leader>n", snacks.notifier.show_history, desc = "Show notifications" },
				{ "<leader>gb", snacks.git.blame_line, desc = "Show git blame" },
				{ "<leader>gr", snacks.gitbrowse.open, desc = "Open file in browser" },
				{ "<leader>gg", snacks.lazygit.open, desc = "Open lazygit" },
				{ "<leader>gL", snacks.lazygit.log, desc = "Show git logs" },
				{ "<leader>gl", snacks.lazygit.log_file, desc = "Show git file history" },
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
