return {
	"vim-test/vim-test",
	config = function()
		-- Set vim-test options
		vim.g["test#strategy"] = "basic"
		vim.g["test#neovim#term_position"] = "belowright"

		-- Set key mappings
		vim.keymap.set("n", " T", "<cmd>TestNearest<CR>", { silent = true, desc = "Test Nearest" })
		vim.keymap.set("n", " t", "<cmd>TestFile<CR>", { silent = true, desc = "Test File" })
		-- vim.keymap.set("n", " a", "<cmd>TestSuite<CR>", { silent = true, desc = "Test Suite" })
		vim.keymap.set("n", " l", "<cmd>TestLast<CR>", { silent = true, desc = "Test Last" })
		-- Uncomment if you want to use TestVisit
		-- vim.keymap.set("n", "<leader>g", "<cmd>TestVisit<CR>", { silent = true, desc = "Test Visit" })
	end,
}
