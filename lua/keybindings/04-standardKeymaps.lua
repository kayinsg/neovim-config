-- Retrieve Abstractions
--{{
function getAbstractions()
	callback = require("abstractions")
	return callback
end

getAbstractions()
--}}

-- Normal --
-- Move text up and down
Visual("<A-j>", ":m .+1<CR>==")
Visual("v", "<A-k>")
-- Visual --
-- Stay in indent mode
Visual("<", "<gv^")
Visual(">", ">gv^")
Visual("<C-c>", "+y")

-- Visual Block --
-- Move text up and down
-- keymap ( "x", "J", ":m '>+1<CR>gv=gv", opts )
-- keymap ( "x", "K", ":m '<-2<CR>gv=gv", opts )
Visual("<S-k>", ":move-2<CR>gv=gv")
Visual("<S-j>", " :move'>+<CR>gv=gv")
Normal("--", ":MinimapToggle<CR>")

-- Terminal --
-- Better terminal navigation
-- keymap ( "t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts )
-- keymap ( "t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts )
-- keymap ( "t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts )
-- keymap ( "t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts )

-- [Informational] marks.nvim keymaps
-- mx              Set mark x
-- m,              Set the next available alphabetical (lowercase) mark
-- m;              Toggle the next available mark at the current line
-- dmx             Delete mark x
-- dm-             Delete all marks on the current line
-- dm<space>       Delete all marks in the current buffer
-- m]              Move to next mark
-- m[              Move to previous mark
-- m:              Preview mark. This will prompt you for a specific mark to
--                 preview; press <cr> to preview the next mark.
-- m[0-9]          Add a bookmark from bookmark group[0-9].
-- dm[0-9]         Delete all bookmarks from bookmark group[0-9].
-- m}              Move to the next bookmark having the same type as the bookmark under
--                 the cursor. Works across buffers.
-- m{              Move to the previous bookmark having the same type as the bookmark under
--                 the cursor. Works across buffers.
-- dm=             Delete the bookmark under the cursor.

-- Better window navigation
Normal("<C-h>", "<C-w>h")
Normal("<C-j>", "<C-w>j")
Normal("<C-k>", "<C-w>k")
Normal("<C-l>", "<C-w>l")

-- Better window navigation
-- keymap ( "n", "<C-h>", "<C-w>h", opts )
-- keymap ( "n", "<C-j>", "<C-w>j", opts )
-- keymap ( "n", "<C-k>", "<C-w>k", opts )
-- keymap ( "n", "<C-l>", "<C-w>l", opts )
