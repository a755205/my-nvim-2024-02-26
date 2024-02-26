return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"BurntSushi/ripgrep",
			"sharkdp/fd",
			"nvim-treesitter/nvim-treesitter",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			telescope.setup({
				defaults = {
					path_display = { "truncate " },
					mappings = {
						i = {
							["<S-k>"] = actions.move_selection_previous, -- move to prev result
							["<S-j>"] = actions.move_selection_next, -- move to next result
						},
					},
				},
			})

			telescope.load_extension("fzf")

			local builtin = require("telescope.builtin")
			local keymap = vim.keymap

			keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in cwd 尋找檔案" })
			keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Find string in cwd 尋找字串 " })
			keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Fuzzy find buffers" })
			keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Fuzzy find help tags" })
			keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
			keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find all todos" })

			--show keymaps
			keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Fuzzy find keymaps" })

			--[[ keymap.set('n', '<C-p>', builtin.git_files, {}) ]]
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
