-- Built-in Neovim Configuration
--{{
local options = {
	backup = false, -- creates a backup file
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	cmdheight = 1, -- more space in the neovim command line for displaying messages
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	conceallevel = 0, -- so that `` is visible in markdown files
	fileencoding = "utf-8", -- the encoding written to a file
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	mouse = "", -- allow the mouse to be used in neovim
	pumheight = 10, -- pop up menu height
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	showtabline = 2, -- always show tabs
	smartcase = true, -- smart case
	smartindent = true, -- make indenting smarter again
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	-- termguicolors = true,                    -- set term gui colors (most terminals support this)
	timeoutlen = 450, -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true, -- enable persistent undo
	updatetime = 300, -- faster completion (4000ms default)
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = true, -- convert tabs to spaces
	shiftwidth = 4, -- the number of spaces inserted for each indentation
	textwidth = 0,
	tabstop = 8, -- insert 2 spaces for a tab
	cursorline = true, -- highlight the current line
	number = true, -- set numbered lines
	relativenumber = true, -- set relative numbered lines
	numberwidth = 4, -- set number column width to 2 {default 4}
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	wrap = true, -- display lines as one long line
	linebreak = true, -- companion to wrap, don't split words
	-- scrolloff     = 8,                           -- minimal number of screen lines to keep above and below the cursor
	-- sidescrolloff = 8,                       -- minimal number of screen columns either side of cursor if wrap is `false`
	guifont = "Jet Brains Mono NL:h17", -- the font used in graphical neovim applications
	whichwrap = "bs<>[]hl", -- which "horizontal" keys are allowed to travel to prev/next line
	foldmethod = "marker",
	foldnestmax = 3, --Limit on nested folds to avoid excessive folding
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
--}}
---- Ancillary
--{{
--Function to configure short messages
local function configureShortMessages()
	--Append 'c' to prevent ins-completion-menu messages
	vim.opt.shortmess:append("c")
end

----Function to configure keyword recognition
local function configureKeywordRecognition()
	--Recognize hyphenated words in searches
	vim.opt.iskeyword:append("-")
end

----Function to separate Vim and Neovim plugins
local function separateVimAndNeovimPlugins()
	--Remove Vim runtime path to separate Vim plugins from Neovim
	vim.opt.runtimepath:remove("/usr/share/vim/vimfiles")
end

--Execute configuration functions
configureShortMessages()
configureKeywordRecognition()
separateVimAndNeovimPlugins()
--}}
