return {
	"mfussenegger/nvim-lint",
	ft = { "python", "perl", "html", "js", "css" },
	config = function()
		-- Set transparent background for diagnostic virtual text
		vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { bg = "NONE", fg = "#ff5555" })
		vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { bg = "NONE", fg = "#ffb86c" })
		vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { bg = "NONE", fg = "#50fa7b" })
		vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { bg = "NONE", fg = "#89ddff" })

		-- Configure pylint
		local pylint = require("lint").linters.pylint
		pylint.args = {
			"--disable=C0103", -- Disable snake_case enforcement
			"--from-stdin",
			"%filepath",
		}

		-- Set up linters per filetype
		require("lint").linters_by_ft = {
			perl == { "perlnavigator" },
			python = { "pylint", "mypy" },
			html = { "htmlhint" },
			css = { "stylelint" },
			scss = { "stylelint" },
			bash = { "shellcheck" },
		}

		-- Configure pylint to work with virtualenv
		require("lint").linters.pylint.cmd = "python"
		require("lint").linters.pylint.args = { "-m", "pylint", "-f", "json" }

		-- Enable inline diagnostics with brace formatting
		vim.diagnostic.config({
			virtual_text = {
				source = "always",
				spacing = 0,
			},
			signs = false,
			underline = true,
			update_in_insert = false,
		})

		-- Set up autocommands
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				require("lint").try_lint()
			end,
		})

		-- Show diagnostic float on cursor hold
		vim.api.nvim_create_autocmd("CursorHold", {
			group = lint_augroup,
			callback = function()
				vim.diagnostic.open_float({ focusable = false })
			end,
		})

		-- Manual lint trigger
		vim.keymap.set("n", "<leader>ll", function()
			require("lint").try_lint()
		end, { desc = "Trigger linting" })

		-- Manual float trigger
		vim.keymap.set("n", "<leader>lf", function()
			vim.diagnostic.open_float()
		end, { desc = "Show diagnostic float" })
	end,
}
