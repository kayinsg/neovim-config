return function()
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
