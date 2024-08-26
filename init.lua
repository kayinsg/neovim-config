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
--}}
-- Config For Specifcally For Programming
--{{
-- LSP Settings
--{{
-- require("lsp.settings.LSPResponseProcessors")
-- require("lsp.main.IDEPackageManager")
-- require("lsp.main.formatter")
-- require("lsp.main.debugger")
-- require("lsp.main.treesitter")
-- require("lsp.main.linter")
-- require("lsp.languageSpecificConfig.python.pynvim")
-- require("lsp.LanguageServerProtocolSettings.pyright")
-- require("lsp.LanguageServerProtocolSettings.lua_ls.lua")
--}}
-- Pynvim
--{{
require("lsp.languageSpecificConfig.python.pynvim")
--}}
