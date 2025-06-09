return {
	"Wansmer/treesj",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	keys = {
		{ "<leader>s", mode = "n", desc = "Toggle node (split/join)" },
	},
	opts = {
		-- Use default keymaps (<space>m - toggle, <space>j - join, <space>s - split)
		use_default_keymaps = false,

		-- Node with syntax error will not be formatted
		check_syntax_error = false,

		-- If line after join will be longer than max value, node will not be formatted
		max_join_length = 80,

		-- Cursor behavior:
		-- hold - cursor follows the node/place on which it was called
		-- start - cursor jumps to the first symbol of the node
		-- end - cursor jumps to the last symbol of the node
		cursor_behavior = "hold",

		-- Notify about possible problems or not
		notify = true,

		-- Use `dot` (.) for repeat action
		dot_repeat = true,

		-- Callback for treesj error handler (optional)
		on_error = nil,

		-- Language-specific presets (override defaults here)
		langs = {
			-- Example for JavaScript:
			-- javascript = {
			--   object = {
			--     split = {
			--       last_separator = true,
			--     },
			--   },
			-- },
			-- Add other language configurations as needed
		},
	},
	config = function(opts)
		require("treesj").setup(opts)
	end,
}
