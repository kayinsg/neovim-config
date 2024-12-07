-- Lazy.nvim Startup
--{{
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	--}}
	-- Plugins
	--{{
	-- UI Component for Neovim
	{ "MunifTanjim/nui.nvim" },
	-- Suite of Plugins
	{
		"echasnovski/mini.nvim",
		event = "VeryLazy",
		config = function()
			require("plugins.mini-nvim")
		end,
	},
	-- Auto-Complete
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		config = function()
			require("ibl").setup({
				indent = {
					char = "│",
					tab_char = "│",
				},
				scope = { enabled = true },
				exclude = {
					filetypes = {
						"help",
						"alpha",
						"dashboard",
						"neo-tree",
						"Trouble",
						"lazy",
						"mason",
						"notify",
						"toggleterm",
						"lazyterm",
					},
				},
			})
		end,
	},
	-- {
	-- 	"shellRaining/hlchunk.nvim",
	-- 	event = { "BufReadPre", "BufNewFile" },
	-- 	config = function()
	-- 		require("hlchunk").setup(highlightcode)
	-- 	end,
	-- },
	{
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter" },
		config = function()
			require("plugins.cmp")
		end,
		dependencies = {
			-- For Buffers
			"hrsh7th/cmp-buffer",
			-- For File Directories
			"hrsh7th/cmp-path",
			-- For The Ex-Command Line
			"hrsh7th/cmp-cmdline",
			-- LSP
			"hrsh7th/cmp-nvim-lsp",
			-- Lua Snippets
			"L3MON4D3/LuaSnip",
			-- For Auto Complete
			"saadparwaiz1/cmp_luasnip",
			-- More Snippets
			"rafamadriz/friendly-snippets",
			-- For SQL Querying
			"kristijanhusak/vim-dadbod-completion",
		},
	},
	-- },

	{
		"L3MON4D3/LuaSnip",
		config = function()
			require("plugins.luasnip")
		end,
	},

	{ "nvim-lua/plenary.nvim" },
	-- Enhanced Buffer Tab
	{
		"akinsho/bufferline.nvim",
		event = "BufReadPost",
		config = function()
			require("bufferline").setup()
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	-- File Navigation
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugins.oiler")
		end,
		cmd = "Oil",
		keys = {
			{ "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
		},
	},
	-- Enhanced Marks
	{
		"chentoast/marks.nvim",
		event = "VeryLazy",
		config = function()
			require("marks").setup()
		end,
	},
	-- FZF
	{
		"ibhagwan/fzf-lua",
		cmd = "FzfLua",
		keys = {
			{ "<leader>fi", ":FzfLua files<CR>", desc = "FzfLua" },
		},
		config = function()
			require("plugins.fzf").setup()
		end,
	},
	-- Integrated RipGrep
	{
		"doums/rg.nvim",
		config = function()
			require("plugins.ripgrep")
		end,
	},

	-- Plugin To Edit Non-System Buffers
	{
		"rbong/vim-buffest",
	},

	{ "iruzo/ripgrep.nvim", run = ':lua require("rg_setup").install_rg()' },
	-- Tree-sitter
	{
		"nvim-treesitter/nvim-treesitter",
		ft = { "lua", "python" }, -- add your frequently used filetypes
		config = function()
			require("lsp.main.treesitter")
		end,
	},

	-- Debugger
	-- {
	-- "mfussenegger/nvim-dap",
	-- event = "VeryLazy",
	-- dependencies = {
	-- "rcarriga/nvim-dap-ui",
	-- "theHamsta/nvim-dap-virtual-text",
	-- },
	-- config = function()
	-- require("plugins.debugger")
	-- require("plugins.debuggerUI")
	-- end,
	-- },

	-- Linter
	{
		"mfussenegger/nvim-lint",
		ft = "python",
		config = function()
			require("lsp.main.linter")
		end,
	},
	-- Enhanced Statusbar
	{
		"nvim-lualine/lualine.nvim",
		event = "BufReadPost ",
		config = function()
			require("plugins.lualine")
		end,
	},

	-- Automatically Create Pairs Around When A delimiter Is Entered
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("plugins.autopairs")
		end,
	},
	-- Elimnate Lag When Escaping From Insert Mode
	{ "max397574/better-escape.nvim" },
	-- { "dhruvasagar/vim-open-url" },
	{ "dstein64/vim-startuptime" },
	-- Colorschemes
	{ "projekt0n/github-nvim-theme", name = "github-theme" },
	{ "bluz71/vim-moonfly-colors" },
	{ "uncleTen276/dark_flat.nvim" },
	{ "rebelot/kanagawa.nvim" },
	{ "bluz71/vim-nightfly-colors" },
	{ "dasupradyumna/midnight.nvim" },
	{ "ellisonleao/gruvbox.nvim" },
	{ "scottmckendry/cyberdream.nvim" },

	-- LSP
	-- Enable LSP
	{
		"neovim/nvim-lspconfig",
		require("lsp.settings.lspconfig"),
	},
	-- Language Server Installer
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
	},
	-- Linters
	{ "mfussenegger/nvim-lint" },
	-- Formatting
	{
		"stevearc/conform.nvim",
		config = function()
			require("lsp.main.formatter")
		end,
	},

	{
		"winston0410/range-highlight.nvim",
		config = function()
			require("range-highlight").setup({})
		end,
		dependencies = { "winston0410/cmd-parser.nvim" },
	},
	-- Lua Formatter
	{ "ckipp01/stylua-nvim" },
	-- Git
	{ "tpope/vim-fugitive" },
	-- SQL
	{
		"tpope/vim-dadbod",
		dependencies = {
			"kristijanhusak/vim-dadbod-ui",
		},
		config = function()
			-- require("plugins.dadbod")
		end,
	},

	{
		"numToStr/FTerm.nvim",
	},
	{
		"sitiom/nvim-numbertoggle",
	},
	-- { "nvim-neotest/nvim-nio" },
	-- { "folke/neodev.nvim" },

	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
}

-- Persist And Toggle Multiple Terminals During An Editing Session
-- { "akinsho/toggleterm.nvim" },
--}}
-- Call Lazy on the plugins
--{{
require("lazy").setup(plugins)
--}}
