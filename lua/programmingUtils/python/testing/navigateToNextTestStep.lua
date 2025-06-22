return function()
	-- Get current buffer filename
	local filename = vim.api.nvim_buf_get_name(0):lower()

	-- Exit if not a test file
	if not filename:match("test") then
		return
	end

	-- Define step patterns
	local step_patterns = {
		g = "# given",
		w = "# when",
		t = "# then",
	}

	-- Prompt user for input
	local input = vim.fn.input("Go to step (g/w/t): ")
	input = input:lower()

	-- Validate input
	if not step_patterns[input] then
		print("Invalid input. Use 'g', 'w', or 't'")
		return
	end

	-- Get current line and target pattern
	local current_line = vim.api.nvim_get_current_line():lower()
	local pattern = step_patterns[input]

	-- If already on the pattern line, move down once
	if current_line:match(pattern) then
		vim.cmd("normal! j")
	end

	-- Search forward for the pattern
	local line_num = vim.fn.search(pattern, "nW")

	-- Handle pattern not found
	if line_num == 0 then
		print("Pattern not found: " .. pattern)
		if vim.api.nvim_win_get_cursor(0)[1] > 1 then
			vim.cmd("normal! k")
		end
		return
	end

	-- Jump to the line and center it
	vim.api.nvim_win_set_cursor(0, { line_num, 0 })
	vim.cmd("normal! z.")
end
