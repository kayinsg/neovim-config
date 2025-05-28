vim.api.nvim_create_autocmd("VimEnter", {
	callback = function(args)
		local arg = args.file
		if vim.fn.isdirectory(arg) == 1 then
			vim.cmd("Oil " .. arg)
		end
	end,
})

require("plugins.init")
require("keybindings.globalKeymapSettings")
require("keybindings.overiddenDefaultKeys")
require("keybindings.navigation")
require("keybindings.standard")
require("keybindings.quickAccessLocations")
require("keybindings.utilities")
require("keybindings.positioning")
require("keybindings.commandLine")
require("keybindings.functions")

require("options")
require("plugins")
require("autocommands")
require("colorscheme")
require("foldmarkers")
require("lsp.init")
