require("keybindings.globalKeymapSettings")

-- Visual Mode
-- Move Text Up and Down
Visual("<A-j>", ":m .+1<CR>==")
Visual("<S-j>", ":move'>+<CR>gv=gv")
Visual("<S-k>", ":move-2<CR>gv=gv")

-- Copy to Clipboard
Visual("<C-c>", "+y")

-- Better Window Navigation
Normal("<C-h>", "<C-w>h")
Normal("<C-j>", "<C-w>j")
Normal("<C-k>", "<C-w>k")
Normal("<C-l>", "<C-w>l")
