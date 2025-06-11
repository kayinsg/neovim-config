function autocommand(event, opts)
	local autocmd_opts = {
		group = opts.group,
		pattern = opts.pattern,
		desc = opts.desc or false,
		once = opts.once or false,
		nested = opts.nested or false,
	}

	if opts.callback then
		autocmd_opts.callback = opts.callback
	elseif opts.command then
		autocmd_opts.command = opts.command
	else
		error("Either 'callback' or 'command' must be provided")
	end
	vim.api.nvim_create_autocmd(event, autocmd_opts)
end

function autocommandGroup(group_name)
	local group_id = vim.api.nvim_create_augroup(group_name, { clear = true })
	return group_id
end

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
		vim.cmd("normal! zz")
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

autocommand("BufEnter", {
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

autocommand("BufWritePre", {
	group = "LSP",
	pattern = "*", -- Match all files
	desc = "Make code neat before saving",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
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
