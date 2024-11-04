local pylint = require("lint").linters.pylint

pylint.args = {
	-- Disable snake_case enforcement
	"--disable=C0103",
	"--from-stdin",
	"%filepath",
}

require("lint").linters_by_ft = {
	python = { "pylint", "mypy" },
	-- "flake8"
	bash = { "shellcheck" },
}
-- lua = { "selene" },
-- Set pylint to work in virtualenv
require("lint").linters.pylint.cmd = "python"
require("lint").linters.pylint.args = { "-m", "pylint", "-f", "json" }
-- Get Autocommand Data
--{{
function getAbstractions()
	callback = require("autocommands")
	return callback
end

getAbstractions()
--}}
-- Call Linter Everytime Neovim Enters A new Buffer
--{{
autocommand("BufWinEnter", {
	group = "LSP",
	pattern = "*",
	desc = "Call Linter Everytime Neovim Enters A new Buffer ",
	callback = function()
		-- try_lint without arguments runs the linters defined in `linters_by_ft`
		-- for the current filetype
		require("lint").try_lint()

		-- You can call `try_lint` with a linter name or a list of names to always
		-- run specific linters, independent of the `linters_by_ft` configuration
		-- require("lint").try_lint("mypy")
	end,
})
--}}
-- Refresh Linter everytime I exit insert mode
--{{
autocommand("BufWritePost", {
	group = "LSP",
	pattern = "*",
	desc = "",
	callback = function()
		-- try_lint without arguments runs the linters defined in `linters_by_ft`
		-- for the current filetype
		require("lint").try_lint()

		-- You can call `try_lint` with a linter name or a list of names to always
		-- run specific linters, independent of the `linters_by_ft` configuration
		-- require("lint").try_lint("mypy")
	end,
})
--}}
