return {
	-- doc [[ https://docs.rockylinux.org/books/nvchad/nvchad_ui/nvimtree/ ]]
	"nvim-tree/nvim-tree.lua",
	dependincies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {},
	config = function()
		local nvimtree = require("nvim-tree")

		-- disable netrw at the very start of your init.lua
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- set termguicolors to enable highlight groups
		vim.opt.termguicolors = true

		local function my_on_attach(bufnr)
			local api = require("nvim-tree.api")

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			-- 默认映射
			api.config.mappings.default_on_attach(bufnr)

			-- 自定义映射
			--[[ vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up')) ]]
			vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))

			-- 添加 'l' 作为打开文件或目录的映射
			vim.keymap.set("n", "l", api.node.open.edit, opts("Edit"))
		end

		-- OR setup with some options
		require("nvim-tree").setup({
			on_attach = my_on_attach,
			sort = {
				sorter = "case_sensitive",
			},
			git = {
				enable = true,
			},
			view = {
				width = 30,
				side = "left",
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = false,
				custom = {
					"!.git",
				},
			},
		})

		local keymap = vim.keymap

		function FocusNvimTree()
			local view = require("nvim-tree.view")

			if view.is_visible() then
				view.focus()
			else
				require("nvim-tree").toggle()
			end
		end

		vim.api.nvim_set_keymap("n", "<leader>ee", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>ef", ":lua FocusNvimTree()<CR>", { noremap = true, silent = true })
	end,
}
