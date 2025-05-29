local M = {}

function M.create_debug_print()
	-- Get user inputs
	local debug_label = vim.fn.input("Debug label: ")
	local variable_to_debug = vim.fn.input("Variable to debug: ")

	-- Get current line and indentation
	local current_line = vim.api.nvim_get_current_line()
	local indent = string.match(current_line, "^%s*") or ""

	-- Create the debug print statement
	local debug_print = string.format("print('\\n%s:\\n', %s)", debug_label, variable_to_debug)

	-- Create new line below with proper indentation
	vim.api.nvim_buf_set_lines(
		0,
		vim.api.nvim_win_get_cursor(0)[1],
		vim.api.nvim_win_get_cursor(0)[1],
		true,
		{ indent .. debug_print }
	)

	-- Move cursor to new line
	vim.api.nvim_win_set_cursor(0, { vim.api.nvim_win_get_cursor(0)[1] + 1, #indent })
end

return M
