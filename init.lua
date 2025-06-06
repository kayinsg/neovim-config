vim.api.nvim_create_autocmd("VimEnter", {
	callback = function(args)
		local arg = args.file
		if vim.fn.isdirectory(arg) == 1 then
			vim.cmd("Oil " .. arg)
		end
	end,
})
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
