return function()
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
