-- Lazy.nvim Startup
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

	{
		"Wansmer/treesj",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("plugins.splitjoin")
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter" },
		config = function()
			require("plugins.cmp")
		end,
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"kristijanhusak/vim-dadbod-completion",
		},
	},

	{
		"L3MON4D3/LuaSnip",
		config = function()
			require("plugins.luasnip")
		end,
	},

	{ "nvim-lua/plenary.nvim" },
	-- Enhanced Buffer Tab
	{ "nvim-neotest/nvim-nio" },
	{
		"vim-test/vim-test",
		config = function()
			vim.cmd([[
            let test#strategy = "basic"
            let test#neovim#term_position = "belowright"
            nmap <silent> <leader>T :TestNearest<CR>
            nmap <silent> <leader>t :TestFile<CR>
            nmap <silent> <leader>a :TestSuite<CR>
            nmap <silent> <leader>l :TestLast<CR>
            "nmap <silent> <leader>g :TestVisit<CR>
        ]])
		end,
	},
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
		"2KAbhishek/markit.nvim",
		config = function()
			require("markit").setup()
		end,
	},
	{
		"folke/persistence.nvim",
		config = function()
			require("persistence").setup()
		end,
	},
	-- FZF
	{
		"ibhagwan/fzf-lua",
		cmd = "FzfLua",
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
	{ "rbong/vim-buffest" },
	{ "iruzo/ripgrep.nvim", run = ':lua require("rg_setup").install_rg()' },

	-- Tree-sitter
	{
		"nvim-treesitter/nvim-treesitter",
		ft = { "lua", "python" },
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
		event = "BufReadPost",
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

	-- Eliminate Lag When Escaping From Insert Mode
	{ "max397574/better-escape.nvim" },
	{ "dstein64/vim-startuptime" },

	-- Colorschemes
	{ "projekt0n/github-nvim-theme", name = "github-theme" },
	{ "bluz71/vim-moonfly-colors" },
	{ "iagorrr/noctishc.nvim" },
	{ "uncleTen276/dark_flat.nvim" },
	{ "rebelot/kanagawa.nvim" },
	{ "bluz71/vim-nightfly-colors" },
	{ "dasupradyumna/midnight.nvim" },
	{ "ellisonleao/gruvbox.nvim" },

	-- LSP
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("lsp.settings.lspconfig")
		end,
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
		event = "BufRead",
		config = function()
			require("range-highlight").setup({})
		end,
		dependencies = { "winston0410/cmd-parser.nvim" },
	},

	{ "mfussenegger/nvim-jdtls" },

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
	},

	{
		"numToStr/FTerm.nvim",
	},

	{
		"sitiom/nvim-numbertoggle",
	},

	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
}

-- Call Lazy on the plugins
require("lazy").setup(plugins)
