local function getAbstractions()
	local callback = require("abstractions")
	return callback
end

getAbstractions()

autocommandGroup("pagePositioning")
autocommandGroup("Autostart")
autocommandGroup("Buffers")
autocommandGroup("Assorted")
autocommandGroup("LSP")
autocommandGroup("GitCommitAutocommands")
autocommandGroup("Plugins")

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

autocommand("BufWinEnter", {
	group = "Assorted",
	pattern = "*",
	desc = "Remove Automatic Commenting Present in Neovim's Default Behavior",
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
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
-- Git
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
-- Formatting
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

autocommand({ "InsertEnter", "CursorMoved" }, {
	group = vim.api.nvim_create_augroup("Assorted", { clear = true }),
	pattern = "*",
	desc = "Clear the search highlights after the cursor is moved",
	callback = function()
		vim.schedule(function()
			vim.cmd("nohlsearch")
		end)
	end,
})
