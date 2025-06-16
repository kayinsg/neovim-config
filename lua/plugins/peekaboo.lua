return {
	{
		"junegunn/vim-peekaboo",
		config = function()
			vim.g.peekaboo_width = 50 -- Set preview window width
			vim.g.peekaboo_compact = 1 -- Hide empty registers
		end,
	},
}
