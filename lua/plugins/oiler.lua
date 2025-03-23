-- Retrieve Abstractions
--{{
function getAbstractions()
	callback = require("abstractions")
	return callback
end

getAbstractions()
--}}

-- Function to disable Netrw in Neovim
local function disableNetrw()
	vim.g.loadedNetrw = 1
	vim.g.loadedNetrwPlugin = 1
end

-- Execute the function to disable Netrw
disableNetrw()
local function setupOilBufferOptions()
	return {
		buflisted = false,
		bufhidden = "hide",
	}
end

local function setupOilWindowOptions()
	return {
		wrap = false,
		signcolumn = "yes",
		cursorcolumn = false,
		foldcolumn = "0",
		spell = false,
		list = false,
		conceallevel = 3,
		concealcursor = "nvic",
	}
end

local function setupOilKeymaps()
	return {
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
		["yp"] = {
			callback = function()
				copyFullPathToClipboard()
			end,
		},
	}
end

local function setupOilViewOptions()
	return {
		show_hidden = false,
		is_hidden_file = function(name, bufnr)
			return vim.startswith(name, ".")
		end,
		is_always_hidden = function(name, bufnr)
			return false
		end,
		natural_order = true,
		sort = {
			{ "type", "asc" },
			{ "name", "asc" },
		},
	}
end

local function setupOilPreviewConfig()
	return {
		max_width = 0.9,
		min_width = { 40, 0.4 },
		width = nil,
		max_height = 0.9,
		min_height = { 5, 0.1 },
		height = nil,
		border = "rounded",
		win_options = {
			winblend = 0,
		},
		update_on_cursor_moved = true,
	}
end

local function setupOilProgressConfig()
	return {
		max_width = 0.9,
		min_width = { 40, 0.4 },
		width = nil,
		max_height = { 10, 0.9 },
		min_height = { 5, 0.1 },
		height = nil,
		border = "rounded",
		minimized_border = "none",
		win_options = {
			winblend = 0,
		},
	}
end

local function setupOilFloatConfig()
	return {
		padding = 2,
		max_width = 0,
		max_height = 0,
		border = "rounded",
		win_options = {
			winblend = 0,
		},
		override = function(conf)
			return conf
		end,
	}
end

local function setupOilGitConfig()
	return {
		add = function(path)
			return false
		end,
		mv = function(srcPath, destPath)
			return false
		end,
		rm = function(path)
			return false
		end,
	}
end

require("oil").setup({
	disableNetrw(),
	default_file_explorer = true,
	columns = { "icon" },
	buf_options = setupOilBufferOptions(),
	win_options = setupOilWindowOptions(),
	delete_to_trash = false,
	skip_confirm_for_simple_edits = false,
	prompt_save_on_select_new_entry = true,
	cleanup_delay_ms = 2000,
	lsp_file_methods = {
		timeout_ms = 1000,
		autosave_changes = false,
	},
	constrain_cursor = "editable",
	experimental_watch_for_changes = false,
	keymaps = setupOilKeymaps(),
	use_default_keymaps = true,
	view_options = setupOilViewOptions(),
	extra_scp_args = {},
	git = setupOilGitConfig(),
	float = setupOilFloatConfig(),
	preview = setupOilPreviewConfig(),
	progress = setupOilProgressConfig(),
	ssh = { border = "rounded" },
	keymaps_help = { border = "rounded" },
})
