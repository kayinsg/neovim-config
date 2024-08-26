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
--{{
-- Set custom fold markers for Lua files
autocommand("FileType", {
	group = "FoldMarkers",
	pattern = "lua",
	desc = "Folder Markers for Lua Files",
	callback = function()
		vim.opt_local.foldmarker = "--{{,--}}"
	end,
})

-- Set custom fold markers for Lua files
autocommand("FileType", {
	group = "FoldMarkers",
	pattern = "zsh, sh, txt, '/home/kayinfire/.config/i3/config'",
	desc = "Fold Markers fro Script Files",
	callback = function()
		vim.opt_local.foldmarker = "##++,##--"
	end,
})
--}}
