setCursor = vim.api.nvim_win_set_cursor
executeOnCommandLine = vim.cmd

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

function positionLineAtCenter()
	executeOnCommandLine("normal! zz")
end

function positionLineAtTop()
	executeOnCommandLine("normal! zt")
end

function closeAllBuffersExceptCurrent()
	executeOnCommandLine("%bd!")

	executeOnCommandLine("e#")

	executeOnCommandLine("bd#")
end

function setColorScheme(schemeName)
	vim.cmd.colorscheme(schemeName)
end

function setHighlight(group, attributes)
	vim.api.nvim_set_hl(0, group, attributes)
end
function formatVimCommand(command)
	return string.format("vim.cmd [[%s]]", command)
end

local function setHighlight(group, attributes)
	vim.api.nvim_set_hl(0, group, attributes)
end

function indentLine()
	local startAtBeginning = true
	local indentLevel = tonumber(vim.fn.input("Indentation level (0-5): ")) or 0
	local numberOfSpaces = indentLevel * 4
	local currentLine = vim.api.nvim_get_current_line()
	currentLine = currentLine:match("^%s*(.*)")
	local indentation = string.rep(" ", numberOfSpaces)
	local newLine = indentation .. currentLine
	vim.api.nvim_set_current_line(newLine)
end

function joinLines()
	local function deleteCharacterAtStartOfLine()
		vim.cmd("normal! _d0X")
	end

	local function insertSpaceAtCursor()
		vim.cmd("normal! i ")
	end

	local function executeCommandSequence()
		deleteCharacterAtStartOfLine()
		insertSpaceAtCursor()
	end

	executeCommandSequence()
end
