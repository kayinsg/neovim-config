function getAbstractions()
	callback = require("abstractions")
	return callback
end

getAbstractions()

-- Directory-Related
-- Native
-- Quick Exploration of Directory
Command("<C-c>", "edit %:h")
-- Copy realpath of Current File to clipboard
Command("kl", ':let @+ = expand("%:p")<CR>')
-- Copy Current Directory of file to clipboard
Command("kj", ":r !cd %:p:h && pwd | xsel -ib<CR>")
-- Misc
-- Exit CommandLine Mode
Normal("<Leader>q", ":q<CR>")
-- Open command line history for Neovim
Normal("<Leader><Leader>", "q:")

-- QuickFix
-- Open QuickFix
Normal("<Leader>o", ":copen<CR>")
-- Close QuickFix
Normal("<Leader>oo", ":cclose<CR>")
-- Previous Entry on Quickfix
Normal("<Leader>p", ":cp<CR>")
-- Next Entry On QuickFix
Normal("<Leader>n", ":cn<CR>")

-- Ripgrep
Normal("<Leader>f", ":Rg ")
-- Search Files Within Current Directory
-- Normal("<Leader>fj", ":FzfLua files<CR>")
-- Search Buffers
Normal("kl", ":lua require('fzf-lua').buffers()<CR>")
-- Search Registers
Normal("jh", ":lua require('fzf-lua').registers()<CR>")
-- Search Keymaps
Normal("gh", ":lua require('fzf-lua').keymaps()<CR>")
