return {
	"stevearc/conform.nvim",
	event = "BufWritePre", -- Optional: load on format events
	config = function()
		-- Set formatexpr
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

		-- Configure Conform
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				html = { "prettierd" },
				-- python = { "ruff_format", "ruff_fix" },
				-- Add other filetypes as needed
			},
		})
	end,
}
