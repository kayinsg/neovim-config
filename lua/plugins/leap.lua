return {
	"ggandor/leap.nvim",
	config = function()
		local leap = require("leap")
		vim.keymap.set({ "n", "x", "o", "v" }, "r", "<Plug>(leap-anywhere)", { desc = "Leap anywhere" })
	end,
}
