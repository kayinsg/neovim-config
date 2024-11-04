-- Keymap Configuration
--{{
require("keybindings.01-globalKeymapSettings")
require("keybindings.02-overridedDefaultKeys")
require("keybindings.03-navigation")
require("keybindings.04-standardKeymaps")
require("keybindings.05-quickAccessLocations")
require("keybindings.06-utilities")
require("keybindings.07-positioning")
require("keybindings.08-commandLineKeyMaps")
require("keybindings.09-functionKeys")
--}}
-- Environment Settings
--{{
require("options")
require("plugins")
require("autocommands")
require("colorscheme")
require("foldmarkers")
require("lsp.init")
require("lsp.languageSpecificConfig.python.pynvim")
--}}
-- Create an event handler for the FileType autocommand
-- vim.api.nvim_create_autocmd("FileType", {
-- pattern = "python",
-- callback = function(args)
-- vim.lsp.start({
-- name = "pyright",
-- cmd = { "/usr/bin/pyright", "--stdio" },
-- root_dir = vim.fs.dirname(vim.fs.find({ "pyproject.toml", "setup.py" }, { upward = true })[1]),
-- })
-- end,
-- })
