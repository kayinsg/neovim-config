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

function setUpPythonTestSuite()
	local filename = vim.api.nvim_buf_get_name(0)

	if not string.lower(filename):find("test") then
		return
	end

	vim.api.nvim_buf_set_lines(0, 0, 0, false, { "import unittest" })

	vim.api.nvim_buf_set_lines(0, 1, 1, false, { "from colour_runner.runner import ColourTextTestRunner" })

	local last_line = vim.api.nvim_buf_line_count(0)

	vim.api.nvim_buf_set_lines(
		0,
		last_line,
		last_line,
		false,
		{ "", "if __name__ == '__main__':", "    unittest.main(testRunner=ColourTextTestRunner(verbosity=2))" }
	)
end

function generateTestCase()
	local filename = vim.api.nvim_buf_get_name(0)

	if not string.lower(filename):find("test") then
		return
	end

	vim.fn.inputsave()
	local structure_type = vim.fn.input("Create function or class? [f/c]: ")
	vim.fn.inputrestore()

	local buf = vim.api.nvim_get_current_buf()
	local line_count = vim.api.nvim_buf_line_count(buf)
	local insert_line = line_count

	while insert_line > 0 do
		local line_content = vim.api.nvim_buf_get_lines(buf, insert_line - 1, insert_line, false)[1]
		if line_content:match("^%s*$") then
			break
		end
		insert_line = insert_line - 1
	end

	vim.api.nvim_win_set_cursor(0, { insert_line, 0 })

	if string.lower(structure_type) == "c" or string.lower(structure_type) == "class" then
		vim.fn.inputsave()
		local test_case_name = vim.fn.input("Enter General Test Case name: ")
		vim.fn.inputrestore()

		local class_def = "class " .. test_case_name .. "Tests(unittest.TestCase):"
		vim.api.nvim_buf_set_lines(buf, insert_line, insert_line, false, { class_def })

		vim.api.nvim_buf_set_lines(buf, insert_line + 1, insert_line + 1, false, { "", "" })
		insert_line = insert_line + 2
	end

	vim.fn.inputsave()
	local test_func_name = vim.fn.input("Enter specific test case name (e.g. OpenFileWhenPathIsGiven): ")
	vim.fn.inputrestore()

	local func_def = "    def testShould" .. test_func_name .. "(self):"
	vim.api.nvim_buf_set_lines(buf, insert_line, insert_line, false, { func_def })
	insert_line = insert_line + 1

	vim.api.nvim_buf_set_lines(
		buf,
		insert_line,
		insert_line,
		false,
		{ "        # GIVEN the following preconditions corresponding to the system under test:" }
	)
	insert_line = insert_line + 1

	vim.api.nvim_buf_set_lines(buf, insert_line, insert_line, false, { "        " })
	insert_line = insert_line + 1

	vim.api.nvim_buf_set_lines(
		buf,
		insert_line,
		insert_line,
		false,
		{ "        # WHEN the following module is executed:" }
	)
	insert_line = insert_line + 1

	vim.api.nvim_buf_set_lines(buf, insert_line, insert_line, false, { "        " })
	insert_line = insert_line + 1

	vim.api.nvim_buf_set_lines(
		buf,
		insert_line,
		insert_line,
		false,
		{ "        # THEN the observable behavior should be verified as stated below:" }
	)
	insert_line = insert_line + 1

	vim.api.nvim_buf_set_lines(buf, insert_line, insert_line, false, {
		"        self.assertEqual()",
		"",
		"        ",
	})

	vim.api.nvim_win_set_cursor(0, { insert_line + 1, 0 })
	local given_line = vim.fn.search("^\\s*# GIVEN", "bnW")

	local target_line = given_line + 1

	vim.api.nvim_win_set_cursor(0, { target_line, 0 })
	local current_line = vim.api.nvim_win_get_cursor(0)[1]
	vim.api.nvim_buf_set_text(0, current_line - 1, 0, current_line - 1, 0, { "         " })

	vim.api.nvim_win_set_cursor(0, { current_line, 8 })
end

function multiLineComment()
	local relative_number = vim.wo.relativenumber
	local number = vim.wo.number

	vim.wo.relativenumber = false
	vim.wo.number = true

	local start_line = tonumber(vim.fn.input("Start line: "))
	if not start_line then
		print("Invalid start line")
		return
	end

	local end_line = tonumber(vim.fn.input("End line: "))
	if not end_line then
		print("Invalid end line")
		return
	end

	vim.wo.relativenumber = relative_number
	vim.wo.number = number

	for i = start_line, end_line do
		vim.api.nvim_win_set_cursor(0, { i, 0 })
		vim.cmd("normal gcc")
	end
end

function navigateToNextTestStep()
	local filename = vim.api.nvim_buf_get_name(0):lower()

	if not filename:match("test") then
		return
	end

	local step_patterns = {
		g = "# given",
		w = "# when",
		t = "# then",
	}

	local input = vim.fn.input("Go to step (g/w/t): ")
	input = input:lower()

	if not step_patterns[input] then
		print("Invalid input. Use 'g', 'w', or 't'")
		return
	end

	local current_line = vim.api.nvim_get_current_line():lower()
	local pattern = step_patterns[input]

	if current_line:match(pattern) then
		vim.cmd("normal! j")
	end

	local line_num = vim.fn.search(pattern, "nW")
	if line_num == 0 then
		print("Pattern not found: " .. pattern)
		if vim.api.nvim_win_get_cursor(0)[1] > 1 then
			vim.cmd("normal! k")
		end
		return
	end

	vim.api.nvim_win_set_cursor(0, { line_num, 0 })
	vim.cmd("normal! z.")
end

function navigateToPreviousTestStep()
	local filename = vim.api.nvim_buf_get_name(0):lower()

	if not filename:match("test") then
		return
	end

	local step_patterns = {
		g = "# given",
		w = "# when",
		t = "# then",
	}

	local input = vim.fn.input("Go to previous step (g/w/t): ")
	input = input:lower()

	if not step_patterns[input] then
		print("Invalid input. Use 'g', 'w', or 't'")
		return
	end

	local current_line = vim.api.nvim_get_current_line():lower()
	local pattern = step_patterns[input]

	if current_line:match("^%s*" .. pattern .. "%s*$") then
		vim.cmd("normal! k")
	end

	local line_num = vim.fn.search("^\\s*" .. pattern, "bnW")
	if line_num == 0 then
		print("Pattern not found: " .. pattern)
		if vim.api.nvim_win_get_cursor(0)[1] < vim.api.nvim_buf_line_count(0) then
			vim.cmd("normal! j")
		end
		return
	end

	vim.api.nvim_win_set_cursor(0, { line_num, 0 })
	vim.cmd("normal! z.")
end
