require("keybindings.globalKeymapSettings")

-- Already reserved for saving and quitting
Normal("qw", "<nop>")
Visual("qw", "<nop>")

-- Already reserved for deleting buffer
Normal("qo", "<nop>")
Visual("qo", "<nop>")

-- Already reserved for saving buffer
Normal("qp", "<nop>")
Visual("qp", "<nop>")

Visual("-", "<nop>")

--Replace Default Forward and Backward
Normal("<C-b", "<nop>")
Normal("<C-f", "<nop>")

-- Replace default Backward page and Forward page
Normal("<C-b>", ":norm Hz-<CR>")
Normal("<C-f>", ":norm Lzt<CR>")

-- Switch ' and ` for marks
Normal("'", "`")
--Ban gh
Normal("gh", "<nop>")

Normal("D", ":norm _d$<CR>")

-- Replace LSP wrapping hotkey with Instrinsic textwidth wrapping
Normal("gq", ":norm gw<CR>")
