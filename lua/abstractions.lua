-- Abstractions For Config Files
--{{
-- autocommands.lua
--{{
-- Create An Autocommand
--{{
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

--}}
-- Create An Autocommand Group
--{{
function autocommandGroup(group_name)
	-- Create the autocommand group with the provided name
	local group_id = vim.api.nvim_create_augroup(group_name, { clear = true })

	-- Return the group_id for potential future use
	return group_id
end

--}}
-- Simple API Calls That Were Made Into More Concise Names
--{{
setCursor = vim.api.nvim_win_set_cursor
executeOnCommandLine = vim.cmd

--}}
-- Page Positioning Suite
--{{
-- Center The Current Line
--{{
function positionLineAtCenter()
	-- Execute the 'zz' command to center the current line
	executeOnCommandLine("normal! zz")
end

--}}
-- Place Current Line At The Top Of The Buffer
--{{
function positionLineAtTop()
	-- Execute the 'zz' command to center the current line
	executeOnCommandLine("normal! zt")
end

--}}
--}}
-- LSP
-- Miscellaneous Abstractions For Autocommands
--{{
-- For Deleting Unnamed Buffers
--{{
function isDeletableBuffer(event, buffer_options)
	return event.file == "" and buffer_options.buftype == "" and not buffer_options.modified
end

function deleteBuffer(buffer_number)
	vim.schedule(function()
		pcall(vim.api.nvim_buf_delete, buffer_number, {})
	end)
end

--}}
-- Highlight Line
--{{
-- [[
--  Highlights the current line in the specified highlight group for a given duration.
--
--  @param hiGroup string The highlight group to use for the current line.
--  @param timeout number The duration (in milliseconds) for which the highlight should persist.
-- ]]
-- [[
--  Highlights the current line in the specified highlight group for a given duration.
--
--  @param hiGroup string The highlight group to use for the current line.
--  @param timeout number The duration (in milliseconds) for which the highlight should persist.
-- ]]
function highlightLine(hiGroup, timeout)
	-- Ensure that the provided arguments are valid
	local isValidHiGroup = type(hiGroup) == "string" and #hiGroup > 0
	local isValidTimeout = type(timeout) == "number" and timeout > 0

	if not (isValidHiGroup and isValidTimeout) then
		error("Invalid arguments provided to highlightLine")
		return
	end

	-- Get the current line number
	local currentLine = vim.fn.line(".")

	-- Define the highlight options
	local highlightOptions = {
		higroup = hiGroup,
		timeout = timeout,
	}

	-- Call the Neovim API to highlight the current line
	require("vim.highlight").range(0, currentLine - 1, currentLine, 0, -1, highlightOptions)
end

--}}

-- Function to handle cursor movement
function handleCursorMovement()
	-- Define a table to store cursor positions
	local cursorPositions = {}

	-- Get the new cursor position
	local newPosition = vim.fn.getpos(".")

	-- Get the current buffer number
	local currentBufferNumber = vim.api.nvim_get_current_buf()

	-- Check if the old position exists in the table
	local oldPosition = cursorPositions[currentBufferNumber]
	if oldPosition then
		-- Check if the cursor moved horizontally
		if newPosition[3] ~= oldPosition[3] then
			-- Cursor moved horizontally
			positionLineAtCenter()
		end
	end

	-- Store the new cursor position in the table
	cursorPositions[currentBufferNumber] = newPosition
end

-- Unused
--{{
-- function setNormalModeKeymap(mode, lhs, rhs)
-- Check if the mode is valid
-- local validModes = { "n", "v", "s", "x", "o", "l", "t" }
-- if not vim.tbl_contains(validModes, mode) then
-- vim.api.nvim_err_writeln("Invalid mode: " .. mode)
-- return
-- end

-- Create the keymap
-- vim.api.nvim_buf_set_keymap(0, mode, lhs, rhs, { silent = true, noremap = true })
-- end
--}}
--}}
--}}
-- keymaps.lua
--{{
-- For Non-recursive keymaps. This means that when an action is assigned to a keystroke, if the action is commensurate with other actions, it will not call on thoes other actions
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

function Normal(keybinding, actions)
	vim.keymap.set("n", keybinding, actions, opts)
end

function Visual(keybinding, actions)
	vim.keymap.set("v", keybinding, actions, opts)
end

function Command(keybinding, actions)
	vim.keymap.set("c", keybinding, actions, opts)
end

function Insert(keybinding, actions)
	vim.keymap.set("i", keybinding, actions, opts)
end

function changeToNextBuffer()
	vim.schedule(function()
		executeOnCommandLine("bnext")
	end)
end
-- Close All Buffers Except Current Closes All Buffers Except The Current One
--{{
function closeAllBuffersExceptCurrent()
	-- Execute the command to close all buffers
	executeOnCommandLine("%bd!")

	-- Reopen the current buffer
	executeOnCommandLine("e#")

	-- Close the alternate buffer
	executeOnCommandLine("bd#")
end

--}}

--{{
function EnterVimgrepCommand()
	-- Enter the command in the command line
	vim.api.nvim_feedkeys(":vimgrep //g %", "n", false)

	-- Move the cursor to the position after the first forward slash
	vim.api.nvim_feedkeys("\x80\xfdl", "n", false)
end

--}}
--}}
-- nvim-lint.lua
-- oiler.lua
--{{
-- Copy Full Path Of Specified File In Oil.nvim To System Clipboard
function copyFullPathToClipboard()
	local function copyEntryPathToRegister()
		require("oil.actions").copy_entry_path.callback()
	end

	local function copyRegisterToClipboard()
		vim.fn.setreg("+", vim.fn.getreg(vim.v.register))
	end

	copyEntryPathToRegister()
	copyRegisterToClipboard()
end

--}}
-- TODO
--{{
-- local setHighlight = vim.api.nvim_set_hl
-- local deferFunction = vim.defer_fn

-- function makeCodePretty()
--     buf = vim.api.nvim_get_current_buf()
--     lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
--
--     -- Characters to add spaces around
--     chars_to_space = {"%(", "%)", "%[", "%]", "=", "-", "%+" , "&", "|", ">", "<", ",", "%*"}
--
--     -- Temporary Move
--         -- {"* *" , "**"    },
--
--     -- Patterns for removing spaces between specific character sets
--     patterns_to_remove_space =
--     {
--         {"%+ =", "+="      }   ,
--         {"%- >", "->"      }   ,
--         {"%* =", "*="      }   ,
--         {"/ = ", "/="      }   ,
--         {"= = ", " == "    }   ,
--         {"! = ", " != "    }   ,
--         {"> = ", " >= "    }   ,
--         {"< = ", " <= "    }   ,
--         {"& &" , "&&"      }   ,
--         {"| |" , "||"      }   ,
--
--     }
--
--     for i, line in ipairs(lines) do
--         -- Add spaces around specified characters
--         for _, char in ipairs(chars_to_space) do
--             line = line:gsub("(%S)" .. char, "%1 " .. char)
--             line = line:gsub(char .. "(%S)", char .. " %1")
--         end
--
--         -- Remove spaces between specific character sets
--         for _, pattern in ipairs(patterns_to_remove_space) do
--             line = line:gsub(pattern[1], pattern[2])
--         end
--
--         -- Remove trailing whitespace
--         line = line:gsub("%s+$", "")
--
--         -- Eliminate double spaces after the first non-blank character
--         line = line:gsub("(%S)%s%s+", "%1 ")
--
--         lines[i] = line
--     end
--
--     -- Update the buffer with the formatted lines
--     vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
-- end
--}}
-- colorscheme.lua
--{{
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
--}}
-- luasnip.lua
--{{
local function indentLine(numberOfSpaces, startAtBeginning)
	-- Get the current line content
	local currentLine = vim.api.nvim_get_current_line()

	-- If startAtBeginning is true, remove leading whitespace
	if startAtBeginning then
		currentLine = currentLine:match("^%s*(.*)")
	end

	-- Create indentation string
	local indentation = string.rep(" ", numberOfSpaces)

	-- Indent the line
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
