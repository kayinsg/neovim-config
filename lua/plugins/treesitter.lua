return {
	"nvim-treesitter/nvim-treesitter",
	ft = { "perl", "lua", "python", "html", "js", "css" },
	config = function()
		local treesitter = {}
		function treesitter.config()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {
					"perl",
					"python",
					"lua",
					"html",
					"css",
					"javascript",
					"markdown",
					"markdown_inline",
					"bash",
				},
				sync_install = true,
				highlight = { enable = true },
				autopairs = { enable = true },
				indent = { enable = true, disable = { "python" } },
				context_commentstring = { enable = true, enable_autocmd = false },
			})
		end
		treesitter.config()
	end,
}
