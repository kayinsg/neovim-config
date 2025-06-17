return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = "Oil",
	keys = {
		{ "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
	},
	config = function()
		-- Disable Netrw completely
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		require("oil").setup({
			-- Core configuration
			default_file_explorer = true,
			columns = { "icon" },
			delete_to_trash = false,
			cleanup_delay_ms = 2000,
			experimental_watch_for_changes = false,

			-- Buffer and window options
			buf_options = {
				buflisted = false,
				bufhidden = "hide",
			},
			win_options = {
				wrap = false,
				signcolumn = "yes",
				cursorcolumn = false,
				foldcolumn = "0",
				spell = false,
				list = false,
				conceallevel = 3,
				concealcursor = "nvic",
			},

			-- Keymaps
			keymaps = {
				["g?"] = "actions.show_help",
				["<CR>"] = "actions.select",
				["<C-s>"] = "actions.select_vsplit",
				["<C-h>"] = "actions.select_split",
				["<C-t>"] = "actions.select_tab",
				["<C-p>"] = "actions.preview",
				["<C-c>"] = "actions.close",
				["<C-l>"] = "actions.refresh",
				["-"] = "actions.parent",
				["_"] = "actions.open_cwd",
				["`"] = "actions.cd",
				["~"] = "actions.tcd",
				["gs"] = "actions.change_sort",
				["gx"] = "actions.open_external",
				["g."] = "actions.toggle_hidden",
				["g\\"] = "actions.toggle_trash",
			},
			use_default_keymaps = true,

			-- View options
			view_options = {
				show_hidden = false,
				natural_order = true,
				sort = {
					{ "type", "asc" },
					{ "name", "asc" },
				},
			},

			-- UI configurations
			preview = {
				max_width = 0.9,
				min_width = { 40, 0.4 },
				border = "rounded",
				win_options = { winblend = 0 },
			},
			progress = {
				max_width = 0.9,
				min_width = { 40, 0.4 },
				border = "rounded",
				win_options = { winblend = 0 },
			},
			float = {
				padding = 2,
				border = "rounded",
				win_options = { winblend = 0 },
			},

			-- Git integration (disabled by default)
			git = {
				add = function(path)
					return false
				end,
				mv = function(src, dest)
					return false
				end,
				rm = function(path)
					return false
				end,
			},
		})
	end,
}
