return {
	{
		"echasnovski/mini.nvim",
		version = false,
		lazy = false,
		init = function()
			package.preload["nvim-web-devicons"] = function()
				package.loaded["nvim-web-devicons"] = {}
				MiniIcons.mock_nvim_web_devicons()
				return package.loaded["nvim-web-devicons"]
			end
		end,
		keys = function()
			local builtin = require("mini.pick").builtin
			local files = require("mini.files")
			local bufremove = require("mini.bufremove")
			local extra = require("mini.extra")
			local visits = require("mini.visits")

			return {
				-- Find
				{ "<leader>F", builtin.files, desc = "Find files" },
				{ "<leader>fb", builtin.buffers, desc = "Find buffers" },
				{ "<leader>fr", builtin.resume, desc = "Resume find" },
				{ "<leader>fa", builtin.grep_live, desc = "Find all (grep live)" },
				{ "<leader>fh", extra.pickers.hl_groups, desc = "Find highlight groups" },

				-- Explorer
				{
					"<leader>e",
					function()
						if not files.close() then
							files.open()
						end
					end,
					desc = "Mini explorer",
				},

				-- Buffers
				{ "<leader>bq", bufremove.delete, desc = "Close buffer" },

				-- To-do list
				{
					"<A-a>",
					function()
						visits.add_label("todo")
					end,
					desc = "Add file to todolist",
				},
				{
					"<A-d>",
					function()
						visits.remove_label("todo")
					end,
					desc = "Remove file from todolist",
				},
				{
					"<A-s>",
					function()
						extra.pickers.visit_paths({ filter = "todo" })
					end,
					desc = "Open to-do list",
				},

				-- Git
				{ "<leader>gc", extra.pickers.git_commits, desc = "Show git commits" },
				{ "<leader>gh", extra.pickers.git_hunks, desc = "Show git hunks" },
				{ "<leader>gb", extra.pickers.git_branches, desc = "Show git branches" },

				-- Diagnostics
				{ "<leader>d", extra.pickers.diagnostic, desc = "Show diagnostics" },
			}
		end,
		opts = {
			-- Text Editing
			ai = {},
			comment = {},
			move = {
				mappings = {
					left = "<S-h>",
					right = "<S-l>",
					down = "<S-j>",
					up = "<S-k>",
					line_left = "<S-h>",
					line_right = "<S-l>",
					line_down = "<S-j>",
					line_up = "<S-k>",
				},
			},
			operators = {},
			pairs = {
				mappings = {
					["<"] = {
						action = "closeopen",
						pair = "<>",
						neigh_pattern = "[^\\].",
						register = {
							cr = false,
						},
					},
				},
			},
			splitjoin = {},
			surround = {},

			-- General
			bracketed = {},
			bufremove = {
				silent = true,
			},
			diff = {
				view = {
					style = "sign",
				},
			},
			files = {
				windows = {
					width_focus = 30,
					width_nofocus = 20,
				},
			},
			git = {},
			jump = {},
			pick = {
				options = {
					use_cache = true,
				},
			},
			visits = {
				store = {
					path = vim.fn.stdpath("cache") .. "mini-visits-index",
				},
			},
			extra = {},

			-- Appearance
			icons = {},
		},
		config = function(_, opts)
			local utils = require("utils")

			-- General
			local clue = require("mini.clue")
			opts.clue = {
				triggers = {
					{ mode = "n", keys = "<Leader>" },
					{ mode = "x", keys = "<Leader>" },

					{ mode = "i", keys = "<C-x>" },

					{ mode = "n", keys = "g" },
					{ mode = "x", keys = "g" },

					{ mode = "n", keys = "'" },
					{ mode = "n", keys = "`" },
					{ mode = "x", keys = "'" },
					{ mode = "x", keys = "`" },

					{ mode = "n", keys = '"' },
					{ mode = "x", keys = '"' },
					{ mode = "i", keys = "<C-r>" },
					{ mode = "c", keys = "<C-r>" },

					{ mode = "n", keys = "<C-w>" },

					{ mode = "n", keys = "z" },
					{ mode = "x", keys = "z" },

					{ mode = "n", keys = "]" },
					{ mode = "x", keys = "]" },
					{ mode = "n", keys = "[" },
					{ mode = "x", keys = "[" },

					{ mode = "n", keys = "s" },
					{ mode = "x", keys = "s" },
				},
				clues = {
					clue.gen_clues.builtin_completion(),
					clue.gen_clues.g(),
					clue.gen_clues.marks(),
					clue.gen_clues.registers(),
					clue.gen_clues.windows(),
					clue.gen_clues.z(),
				},
			}

			-- Appearance
			local hipatterns = require("mini.hipatterns")
			opts.hipatterns = {
				highlighters = {
					fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
					hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
					todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
					note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
					hex_color = hipatterns.gen_highlighter.hex_color(),
				},
			}

			local header = table.concat({
				[[                                                                       ]],
				[[                                                                     ]],
				[[       ████ ██████           █████      ██                     ]],
				[[      ███████████             █████                             ]],
				[[      █████████ ███████████████████ ███   ███████████   ]],
				[[     █████████  ███    █████████████ █████ ██████████████   ]],
				[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
				[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
				[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
				[[                                                                       ]],
			}, "\n")
			local pad = string.rep(" ", 27)
			local new_section = function(name, action, section)
				return { name = name, action = action, section = pad .. section }
			end
			local starter = require("mini.starter")
			local extra = require("mini.extra")
			local builtin = require("mini.pick").builtin
			opts.starter = {
				evaluate_single = true,
				header = header,
				items = {
					new_section("Recent Files", extra.pickers.oldfiles, ""),
					new_section("Find Files", builtin.files, ""),
					new_section("To-do list", function()
						extra.pickers.visit_paths({ filter = "todo" })
					end, ""),
					new_section("Lazy Update", ":Lazy update", ""),
					new_section("Quit", ":q!", ""),
				},
				footer = "",
				content_hooks = {
					starter.gen_hook.adding_bullet(pad .. "• ", false),
					starter.gen_hook.aligning("center", "center"),
				},
			}

			local statusline = require("mini.statusline")
			local git = require("mini.git")
			local icons = require("mini.icons")
			opts.statusline = {
				content = {
					active = function()
						local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
						local bg_mode = "Other"
						for _, v in ipairs({ "Normal", "Insert", "Visual", "Replace", "Command" }) do
							if v == mode then
								bg_mode = mode
								break
							end
						end
						local mode_hl_bg = "StatuslineBGMode" .. bg_mode
						local border = "%#" .. mode_hl_bg .. "# "

						local recording = ""
						if vim.fn.reg_recording() ~= "" then
							recording = "@" .. vim.fn.reg_recording()
						end

						local search = statusline.section_searchcount({ trunc_width = 75 })
						local location = statusline.section_location({ trunc_width = 9999 })

						local filename = statusline.section_filename({ trunc_width = 9999 })
						local filename_hl = "MiniStatuslineFilename" .. (vim.o.mod and "Mod" or "")

						local diagnostics = statusline.section_diagnostics({
							trunc_width = 75,
							icon = "",
							signs = {
								ERROR = "%#SatuslineDiagnosticsError# ✘ ",
								WARN = "%#SatuslineDiagnosticsWarn#  ",
								INFO = "%#SatuslineDiagnosticsInfo# ◉ ",
								HINT = "%#SatuslineDiagnosticsHint# 󱐮 ",
							},
						})

						local filetype = vim.o.filetype
						local filetype_section = ""
						if filetype ~= "" then
							local icon, icon_hl = icons.get("file", vim.fn.expand("%"))
							filetype_section = "%#"
								.. icon_hl
								.. "# "
								.. icon
								.. " %#MiniStatuslineFileinfo#"
								.. filetype
								.. " "
						end

						local git_data = git.get_buf_data(0)
						local git_section = ""
						if git_data then
							if git_data.head_name then
								git_section = git_section
									.. " "
									.. git_data.head_name
									.. (utils.is_repo_modified() and "*" or "")
							end
							if git_data.in_progress then
								git_section = git_section .. (git_section and " ") .. git_data.in_progress
							end
						end

						return statusline.combine_groups({
							border,
							{ hl = mode_hl, strings = { mode } },
							{ hl = mode_hl_bg, strings = { recording } },
							{ hl = "MiniStatuslineFileinfo", strings = { search } },
							{ hl = "MiniStatuslineFileinfo", strings = { location } },
							{ hl = "MiniStatuslineFileinfo", strings = { "%P" } },
							"%<", -- Mark general truncate point
							{ hl = filename_hl, strings = { filename } },
							"%=", -- End left alignment
							{ hl = "MiniStatuslineDevinfo", strings = { diagnostics } },
							filetype_section,
							{ hl = "StatuslineGit", strings = { git_section } },
							border,
						})
					end,
				},
			}

			for plugin, config in pairs(opts) do
				require("mini." .. plugin).setup(config)
			end
		end,
	},
}
