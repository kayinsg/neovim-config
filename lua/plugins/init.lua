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
	require("plugins.vimtest"),
	require("plugins.oil"),
	require("plugins.fzf"),
	require("plugins.ripgrep"),
	require("plugins.leap"),
	require("plugins.persistence"),
	require("plugins.quicker"),
	require("plugins.autopairs"),
	require("plugins.peekaboo"),
	require("plugins.autocomplete"),
	{ "itchyny/lightline.vim" },
	{ "tpope/vim-surround" },
	{ "chrisgrieser/nvim-early-retirement" },
	{ "jedrzejboczar/possession.nvim" },
	require("plugins.aerial"),
	{ "nvimdev/hlsearch.nvim" },
	{ "ChuufMaster/buffer-vacuum" },
	{ "EL-MASTOR/bufferlist.nvim" },
	{ "MagicDuck/grug-far.nvim" },
	{ "gbprod/substitute.nvim" },
	require("plugins.harpoon"),
	require("plugins.range-highlight"),

	require("plugins.formatter"),
	require("plugins.linter"),
	require("plugins.nvim-lspconfig"),
	require("plugins.treesitter"),
	require("plugins.blankline"),
	require("plugins.treesj"),
	{ "ckipp01/stylua-nvim" },
	{ "mfussenegger/nvim-lint" },
	{ "williamboman/mason-lspconfig.nvim" },
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate", -- optional
		config = true,
	},

	{ "max397574/better-escape.nvim" },
	{ "dstein64/vim-startuptime" },
	{ "tpope/vim-fugitive" },
	{ "sitiom/nvim-numbertoggle" },
	{ "MunifTanjim/nui.nvim" },
	{ "rbong/vim-buffest" },
	{ "nvim-lua/plenary.nvim" },
	{ "axelf4/vim-strip-trailing-whitespace" },

	{ "projekt0n/github-nvim-theme", name = "github-theme" },
	{ "bluz71/vim-moonfly-colors" },
	{ "olimorris/onedarkpro.nvim" },
	{ "iagorrr/noctishc.nvim" },
	{ "uncleTen276/dark_flat.nvim" },
	{ "rebelot/kanagawa.nvim" },
	{ "bluz71/vim-nightfly-colors" },
	{ "dasupradyumna/midnight.nvim" },
	{ "Abstract-IDE/Abstract-cs" },
	{ "ellisonleao/gruvbox.nvim" },
}

require("lazy").setup(plugins)
