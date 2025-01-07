-- Retrieve Abstractions
--{{
function getAbstractions()
	callback = require("abstractions")
	return callback
end

getAbstractions()
--}}
-- Visual Mode
-- Move Text Up and Down
Visual("<A-j>", ":m .+1<CR>==")
Visual("<S-j>", ":move'>+<CR>gv=gv")
Visual("<S-k>", ":move-2<CR>gv=gv")

-- Copy to Clipboard
Visual("<C-c>", "+y")

-- Terminal Mode
--  Better Terminal Navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Better Window Navigation
Normal("<C-h>", "<C-w>h")
Normal("<C-j>", "<C-w>j")
Normal("<C-k>", "<C-w>k")
Normal("<C-l>", "<C-w>l")
