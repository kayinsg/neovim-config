-- Retrieve Abstractions
--{{
function getAbstractions()
	callback = require("abstractions")
	return callback
end

getAbstractions()
--}}

local function setBackgroundColor()
	setHighlight("Normal", { ctermbg = 0, bg = "#000000" })
end

local function setLineNumberColors()
	setHighlight("LineNr", { ctermfg = 196, fg = "#940606" })
	setHighlight("CursorLineNr", { ctermfg = 118, fg = "#069449" })
end

local function setSearchHighlight()
	setHighlight("Search", { bg = "#940606", fg = "Black" })
end

local function setColorScheme(schemeName)
	vim.cmd("colorscheme " .. schemeName)
end

local function applyColorSettings()
	local colorScheme = "moonfly"
	setColorScheme(colorScheme)
	setBackgroundColor()
	setLineNumberColors()
	setSearchHighlight()
	vim.opt.signcolumn = "no"
end

applyColorSettings()
