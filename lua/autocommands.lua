-- Retrieve Abstractions From abstractions.lua
--{{
local function getAbstractions()
	local callback = require("abstractions")
	return callback
end

getAbstractions()
--}}
-- Autocommand Groups
--{{
autocommandGroup("pagePositioning")
autocommandGroup("Autostart")
autocommandGroup("Buffers")
autocommandGroup("Assorted")
autocommandGroup("LSP")
autocommandGroup("GitCommitAutocommands")
autocommandGroup("Plugins")
-- Page Position
--{{
autocommand("BufWinEnter", {
	group = "pagePositioning",
	pattern = "*.py, *.txt",
	desc = "Position The Line At The Middle When Opening A file",
	callback = function()
		positionLineAtCenter()
	end,
})

autocommand("BufWinEnter", {
	group = "pagePositioning",
	pattern = "/home/kayinfire/.config/nvim/lua/user/autocommands.lua",
	desc = "Go To The High-Level Section Of The Autocommands File And Position The Line At The Top Of The Page",
	callback = function()
		executeOnCommandLine("norm 10G") -- Scroll the current line to the top of the window
		positionLineAtTop()
	end,
})
autocommand("BufWinEnter", {
	group = "pagePositioning",
	pattern = "/home/kayinfire/.config/nvim/lua/plugins.lua",
	desc = "Go To The Utilities Section Of The Plugins File And Position It At The Top",
	callback = function()
		executeOnCommandLine("norm 21G")
		positionLineAtTop()
	end,
})

autocommand("BufReadPost", {
	group = "pagePositioning",
	pattern = "*",
	desc = "Open File At The Last Position It Was Edited Previously",
	command = 'silent! normal! g`"zv',
})

autocommand("InsertEnter", {
	group = "pagePositioning",
	pattern = "*",
	desc = "Reorient page everytime I type new code",
	callback = function()
		positionLineAtCenter()
	end,
})

autocommand("TextYankPost", {
	group = "Assorted",
	pattern = "*",
	desc = "Highlight copied text for 5 seconds",
	callback = function()
		require("vim.highlight").on_yank({ higroup = "Visual", timeout = 5000 })
	end,
})
autocommand("BufWinEnter", {
	group = "Assorted",
	pattern = "*",
	desc = "Remove Automatic Commenting Present in Neovim's Default Behavior",
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
})
autocommand("BufReadPre", {
	group = "Assorted",
	pattern = { "python" },
	desc = "Activate python Environment Prior to Entering a python file into buffer",
	callback = function()
		executeOnCommandLine("!source /home/kayinfire/projects/python/.venv/bin/activate")
	end,
})
autocommand("FileType", {
	group = "Buffers",
	pattern = "qf",
	desc = "Do Not List Quickfix As A Buffer When Editing.",
	callback = function()
		vim.opt_local.buflisted = false
	end,
})

autocommand("BufHidden", {
	group = "Buffers",
	desc = "Delete unnamed, unmodified buffers without a buffer type",
	callback = function(event)
		local buffer_options = vim.bo[event.buf]
		if isDeletableBuffer(event, buffer_options) then
			deleteBuffer(event.buf)
		end
	end,
})

autocommand("BufWinEnter", {
	group = "Buffers",
	desc = "Change Neovim's Current Working Directory To The Directory Of Whatever File Enters The Buffer",
	callback = function()
		local excluded_filetypes = {
			"oil", -- Exclude oil.nvim buffers
			"NvimTree", -- Exclude NvimTree file explorer
			"TelescopePrompt", -- Exclude Telescope prompt
			"fugitive", -- Exclude Fugitive git buffers
			"help", -- Exclude help files
		}

		-- Get the filetype of the current buffer
		local filetype = vim.bo.filetype

		-- Check if the current filetype is in the excluded list
		if not vim.tbl_contains(excluded_filetypes, filetype) then
			local file_path = vim.fn.expand("%:p:h")
			-- Check if the file path is not empty and the file exists
			if file_path ~= "" and vim.fn.isdirectory(file_path) == 1 then
				vim.cmd("cd " .. file_path)
			end
		end
	end,
})
autocommand("FileType", {
	group = "Buffers",
	desc = "Use appropriate quitting mechanism when in an oil.nvim buffer",
	pattern = "oil",
	callback = function()
		vim.keymap.set("n", "<space>q", ":bdelete<CR>", { noremap = true, silent = true, buffer = true })
	end,
})
--}}
-- Git
--{{
--- Sets up autocommands for Git commit messages.
--
-- This function creates an autocommand group and sets up autocommands for the
-- 'gitcommit' filetype. It enables word wrapping and spell checking for better
-- readability and accuracy when writing Git commit messages.
autocommand("FileType", {
	pattern = "gitcommit",
	desc = "Enable word wrapping for Git commit messages",
	group = "GitCommitAutocommands",
	callback = function()
		vim.opt_local.wrap = true
	end,
})

autocommand("FileType", {
	pattern = "gitcommit",
	desc = "Enable word wrapping for Git commit messages",
	group = "GitCommitAutocommands",
	callback = function()
		vim.opt_local.spell = true
	end,
})
--}}
-- Formatting
--{{
-- Organize Code
autocommand("BufWritePre", {
	group = "LSP",
	pattern = "*", -- Match all files
	desc = "Make code neat before saving",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
-- Linting
-- Markdown
--{{
-- Enable word wrapping for Markdown files
autocommand("FileType", {
	group = "Assorted",
	pattern = "markdown",
	desc = "Set Wrap For Markdown Files",
	callback = function()
		vim.opt_local.wrap = true
	end,
})
autocommand("FileType", {
	pattern = "markdown",
	group = "Assorted",
	desc = "Enable Spellchecking for Markdown Files ",
	callback = function()
		vim.opt_local.spell = true
	end,
})
--}}
--}}
-- Treesitter automatic Python format strings
vim.api.nvim_create_augroup("py-fstring", { clear = true })
vim.api.nvim_create_autocmd("InsertCharPre", {
	pattern = { "*.py" },
	group = "py-fstring",
	--- @param opts AutoCmdCallbackOpts
	--- @return nil
	callback = function(opts)
		-- Only run if f-string escape character is typed
		if vim.v.char ~= "{" then
			return
		end

		-- Get node and return early if not in a string
		local node = vim.treesitter.get_node()

		if not node then
			return
		end
		if node:type() ~= "string" then
			node = node:parent()
		end
		if not node or node:type() ~= "string" then
			return
		end

		vim.print(node:type())
		local row, col, _, _ = vim.treesitter.get_node_range(node)

		-- Return early if string is already a format string
		local first_char = vim.api.nvim_buf_get_text(opts.buf, row, col, row, col + 1, {})[1]
		vim.print("row " .. row .. " col " .. col)
		vim.print("char: '" .. first_char .. "'")
		if first_char == "f" then
			return
		end

		-- Otherwise, make the string a format string
		vim.api.nvim_input("<Esc>m'" .. row + 1 .. "gg" .. col + 1 .. "|if<Esc>`'la")
	end,
})

-- Autostart
--{{
-- Highlight Line When Opening a Buffer
-- autocommand("BufWinEnter",{
-- group="Assorted",
-- pattern="*",
-- desc="highlight current file when opening buffer",
-- callback=highlightLine("visual", 5000)
-- })
--}}

-- autocommand("VimEnter", {
-- group="Autostart",
-- desc = "Sync Lazy.nvim everytime I start Neovim",
-- callback = function()
-- executeOnCommandLine("silent! lua require('lazy').sync()")
-- end,
-- })
--}}
-- autocommand({ 'CmdlineEnter' }, {
-- group="Assorted",
-- pattern = "*",
-- desc="Center The Current Line At The Middle Of The Buffer Everytime I Enter Command Mode",
-- callback = function ()
-- positionLineAtCenter()
-- end,
--})
--}}
-- Assorted
--{{
-- Autocommand to turn off search highlighting when leaving the current buffer
-- vim.api.nvim_create_autocmd("BufLeave", {
-- callback = function()
-- vim.opt.hlsearch = false
-- end,
-- })

-- Autocommand to turn off search highlighting after saving the buffer

--}}
-- Buffers
--{{
-- TODO 2
--{{
-- local function search_forward(term)
-- Escape the search term for proper pattern matching
-- local escaped_term = vim.fn.escape(term, '\\')

-- Construct the search command
-- local search_cmd = '/' .. escaped_term .. '\\c\<CR>'

-- Use nvim_feedkeys to execute the search command
-- vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(search_cmd, true, false, true), 'n', false)
-- end

-- Call the search_forward function
-- search_forward("something")
-- Factory Autocommands

-- autocommand("CmdlineLeave", {
-- group = searchUtilities,
-- pattern = "/,\\?",
-- desc = "Clear the Assorted highlight (not CurSearch) when leaving search mode",
-- callback = function()
-- setHighlight(0, "Assorted", {})
-- deferFunction(function()
-- vim.opt.hlsearch = true
-- end, 5)
-- end,
-- })"
-- TODO (Organize)
--{{
-- autocommand({ "InsertEnter", "CursorMoved" }, {
-- group = vim.api.nvim_create_augroup("Assorted", { clear = true }),
-- pattern = "*",
-- desc = "Clear the search highlights after the cursor is moved",
-- callback = function()
-- vim.schedule(function()
-- vim.cmd("nohlsearch")
-- end)
-- end,
-- })

-- })
--}}
