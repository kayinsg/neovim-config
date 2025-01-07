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

-- QuickFix
-- Open QuickFix
Normal("<Leader>o", ":copen<CR>")
-- Close QuickFix
Normal("<Leader>oo", ":cclose<CR>")
-- Previous Entry on Quickfix
Normal("<Leader>p", ":cprev | norm zz<CR>")
-- Next Entry On QuickFix
Normal("<Leader>n", ":cnext | norm zz<CR>")

-- Ripgrep
Normal("<Leader>f", ":lua require('fzf-lua').grep()<CR>")
Normal("<leader>fi", ":lua require('fzf-lua').files({ resume = true })<CR>")
-- Search Buffers
Normal("kl", ":lua require('fzf-lua').buffers()<CR>")
-- Access Old Files
Normal("o<Tab>", ":lua require('fzf-lua').oldfiles()<CR>")
-- Grep For Word Under Cursor
Normal("<leader>fw", function()
	require("fzf-lua").grep_cword()
end)
-- Grep Command History
Normal("<Leader><Leader>", ":lua require('fzf-lua').command_history()<CR>")
-- Grep Search History
Normal("<leader>\\", ":lua require('fzf-lua').search_history()<CR>")
