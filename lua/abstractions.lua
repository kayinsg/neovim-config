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

function ripgrepSearch()
	-- Get and format the working directory for display
	local pwd = vim.fn.getcwd()
	local display_path = vim.fn.fnamemodify(pwd, ":~") -- Get shortened path
	local final_components = display_path:match("([^/]+/[^/]+/[^/]+/?)$")
		or display_path:match("([^/]+/[^/]+/?)$")
		or display_path

	local search = vim.fn.input("search(" .. final_components .. "):")
	if search == "" then
		return
	end

	-- Convert Vim regex to Perl-compatible for rg
	local pattern = vim.fn.substitute(search, [[\\v]], "", "g")
	local cmd = string.format(
		'rg --vimgrep --smart-case --hidden --glob "!{.git,node_modules}" -- %s',
		vim.fn.shellescape(pattern)
	)
	vim.fn.setqflist({}, " ", { lines = vim.fn.systemlist(cmd) })
	vim.cmd("copen")
end

function ripgrepCurrentBuffer()
	local filepath = vim.api.nvim_buf_get_name(0) -- Get current buffer path
	if filepath == "" then
		vim.notify("No file is currently open", vim.log.levels.WARN)
		return
	end

	local search_term = vim.fn.input("search(CurrentFile):")
	if search_term == "" then
		return
	end

	-- Use rg with --file flag to search only in current file
	local cmd = string.format(
		"rg --vimgrep --smart-case -- %s %s",
		vim.fn.shellescape(search_term),
		vim.fn.shellescape(filepath)
	)

	local results = vim.fn.systemlist(cmd)
	if vim.v.shell_error ~= 0 then
		vim.notify("No matches found", vim.log.levels.INFO)
		return
	end

	vim.fn.setqflist({}, " ", {
		lines = results,
		efm = "%f:%l:%c:%m", -- Explicit error format matching
	})
	vim.cmd("copen")
end

function ripgrepCurrentWord()
	-- Get word under cursor with Vim's smartcase behavior
	local current_word = vim.fn.expand("<cword>")
	local smartcase = ""

	-- Implement Vim-style smartcase: lowercase = case insensitive, uppercase = sensitive
	if current_word:lower() == current_word then
		smartcase = "--ignore-case"
	else
		smartcase = "--case-sensitive"
	end

	-- Get and format working directory
	local pwd = vim.fn.getcwd()
	local display_path = vim.fn.fnamemodify(pwd, ":~")
	local final_components = display_path:gsub("(.*[/\\])([^/\\]+[/\\][^/\\]+[/\\][^/\\]+)$", "%2")
		or display_path:gsub("(.*[/\\])([^/\\]+[/\\][^/\\]+)$", "%2")
		or display_path

	-- Build ripgrep command
	local cmd = string.format(
		'rg --vimgrep %s --hidden --glob "!{.git,node_modules}" -- %s',
		smartcase,
		vim.fn.shellescape(current_word)
	)

	-- Execute and show results
	vim.fn.setqflist({}, " ", { lines = vim.fn.systemlist(cmd) })
	vim.cmd("copen")
	local pwd = vim.fn.getcwd()
	local display_path = vim.fn.fnamemodify(pwd, ":~") -- Get shortened path
	local final_components = display_path:match("([^/]+/[^/]+/[^/]+/?)$")
		or display_path:match("([^/]+/[^/]+/?)$")
		or display_path
	vim.api.nvim_echo({ { "search(" .. final_components .. "):" .. current_word, "Comment" } }, true, {})
end

function setUpPythonTestSuite()
	-- Insert at line 0 (becomes first line)
	vim.api.nvim_buf_set_lines(0, 0, 0, false, { "import unittest" })

	-- Insert at line 1 (now line 1 after first insert)
	vim.api.nvim_buf_set_lines(0, 1, 1, false, { "from colour_runner.runner import ColourTextTestRunner" })

	-- Get last line number
	local last_line = vim.api.nvim_buf_line_count(0)

	-- Append to end of file
	vim.api.nvim_buf_set_lines(
		0,
		last_line,
		last_line,
		false,
		{ "", "if __name__ == '__main__':", "    unittest.main(testRunner=ColourTextTestRunner())" }
	)
end

function generateTestCase()
	-- Step 0: Determine Structure Type and Insertion Point
	vim.fn.inputsave()
	local structure_type = vim.fn.input("Create function or class? [f/c]: ")
	vim.fn.inputrestore()

	-- 0.1-0.3 Find insertion point (last empty line)
	local buf = vim.api.nvim_get_current_buf()
	local line_count = vim.api.nvim_buf_line_count(buf)
	local insert_line = line_count

	while insert_line > 0 do
		local line_content = vim.api.nvim_buf_get_lines(buf, insert_line - 1, insert_line, false)[1]
		if line_content:match("^%s*$") then -- Check if line is empty/whitespace
			break
		end
		insert_line = insert_line - 1
	end

	-- Move cursor to insertion point
	vim.api.nvim_win_set_cursor(0, { insert_line + 1, 0 })

	-- Handle class case
	if string.lower(structure_type) == "c" or string.lower(structure_type) == "class" then
		-- Steps 1-3.1: Create class definition
		vim.fn.inputsave()
		local test_case_name = vim.fn.input("Enter General Test Case name: ")
		vim.fn.inputrestore()

		local class_def = "class " .. test_case_name .. "Tests(unittest.TestCase)"
		vim.api.nvim_buf_set_lines(buf, insert_line, insert_line, false, { class_def })

		-- Steps 4-5: Add empty lines
		vim.api.nvim_buf_set_lines(buf, insert_line + 1, insert_line + 1, false, { "", "" })
		insert_line = insert_line + 2
	end

	-- Common steps for both cases
	-- Step 6: Get test function name
	vim.fn.inputsave()
	local test_func_name = vim.fn.input("Enter test case name (e.g. OpenFileWhenPathIsGiven): ")
	vim.fn.inputrestore()

	-- Step 7: Insert function definition
	local func_def = "    def testShould" .. test_func_name .. "(self):"
	vim.api.nvim_buf_set_lines(buf, insert_line, insert_line, false, { func_def })
	insert_line = insert_line + 1

	-- Step 8: Empty line
	-- vim.api.nvim_buf_set_lines(buf, insert_line, insert_line, false, { "" })
	-- insert_line = insert_line + 1

	-- Steps 9-10: # GIVEN
	vim.api.nvim_buf_set_lines(buf, insert_line, insert_line, false, { "        # GIVEN" })
	insert_line = insert_line + 1

	-- Step 11: 5 empty lines
	for _ = 1, 5 do
		vim.api.nvim_buf_set_lines(buf, insert_line, insert_line, false, { "        " })
		insert_line = insert_line + 1
	end

	-- Step 12: # WHEN
	vim.api.nvim_buf_set_lines(buf, insert_line, insert_line, false, { "        # WHEN" })
	insert_line = insert_line + 1

	-- Step 13: Empty line
	vim.api.nvim_buf_set_lines(buf, insert_line, insert_line, false, { "        " })
	insert_line = insert_line + 1

	-- Step 14: # THEN
	vim.api.nvim_buf_set_lines(buf, insert_line, insert_line, false, { "        # THEN" })
	insert_line = insert_line + 1

	-- Insert self.assertEqual() and two empty lines after it (all properly indented)
	vim.api.nvim_buf_set_lines(buf, insert_line, insert_line, false, {
		"        self.assertEqual()",
		"        ",
		"        ",
	})

	-- Position cursor inside assertEqual parentheses
	vim.api.nvim_win_set_cursor(0, { insert_line + 1, string.len("        self.assertEqual(") })
	-- 1. Retrieve line number of previous "# GIVEN" search
	local given_line = vim.fn.search("^\\s*# GIVEN", "bnW")

	-- 2. Store in variable and 3. Increment by one
	local target_line = given_line + 1

	-- 4. Move cursor to the target line
	vim.api.nvim_win_set_cursor(0, { target_line, 0 })
	--
	-- 1. Insert 9 spaces at current line
	local current_line = vim.api.nvim_win_get_cursor(0)[1]
	vim.api.nvim_buf_set_text(0, current_line - 1, 0, current_line - 1, 0, { "         " })

	-- 2. Place cursor at column 9 (Lua uses 0-based columns)
	vim.api.nvim_win_set_cursor(0, { current_line, 7 })
end
