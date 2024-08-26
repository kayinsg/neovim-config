-- Retrieve Abstractions
--{{
function getAbstractions()
	callback = require("abstractions")
	return callback
end

getAbstractions()
--}}
require("keybindings.01-globalKeymapSettings")

-- Already reserved for saving and quitting
Normal("qw", "<nop>")
Visual("qw", "<nop>")

-- Already reserved for deleting buffer
Normal("qo", "<nop>")
Visual("qo", "<nop>")

-- Already reserved for saving buffer
Normal("qp", "<nop>")
Visual("qp", "<nop>")

-- Reserved for Making delimiters pretty and code significantly more readable
Visual("-0", "<nop>")

-- Already reserved for mini.surround
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
