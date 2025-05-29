return {
	"winston0410/range-highlight.nvim",
	event = "BufRead",
	config = function()
		require("range-highlight").setup({})
	end,
	dependencies = { "winston0410/cmd-parser.nvim" },
}
