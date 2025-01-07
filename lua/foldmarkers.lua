-- Retrieve Abstractions
--{{
function getAbstractions()
	callback = require("abstractions")
	return callback
end

getAbstractions()
--}}

-- Fold Markers
autocommandGroup("FoldMarkers")
local homeDirectory = os.getenv("HOME")

-- Create an autocommand group for fold markers
vim.api.nvim_create_augroup("FoldMarkers", { clear = true })

-- Set custom fold markers for Lua files
vim.api.nvim_create_autocmd("FileType", {
	group = "FoldMarkers",
	pattern = "lua",
	desc = "Fold Markers for Lua Files",
	callback = function()
		vim.opt_local.foldmarker = "--{{,--}}"
	end,
})

-- Set custom fold markers for script files
vim.api.nvim_create_autocmd("FileType", {
	group = "FoldMarkers",
	pattern = { "zsh", "sh", "txt", homeDirectory .. "/.config/i3/config" },
	desc = "Fold Markers for Script Files",
	callback = function()
		vim.opt_local.foldmarker = "##++,##--"
	end,
})
