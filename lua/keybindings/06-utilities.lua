function getAbstractions()
	callback = require("abstractions")
	return callback
end

getAbstractions()

-- Identation
-- Indent Forward Without Taking your hands off the home row
Normal("gl", ":norm >> <CR>")
Visual("gl", ":norm >> <CR>")

-- Indent Backward Without Taking your hands off the home row
Normal("Gl", ":norm << <CR>")
Visual("Gl", ":norm << <CR>")

-- Double Indent Forward
Normal("gL", ":normal >>>> <CR>")
Visual("gL", ":normal >>>> <CR>")

-- Repeats, Macros, Registers
-- Repeat Register
Normal("gk", "@@")

--Multiple Lines
-- Repeat macro with various lines ( You just need to enter the name of the register )
Visual("@", ":normal @")

-- Repeat command with various lines
Visual(".", ":normal .<CR>")

Normal("gj", ":norm! @:<CR>")

-- Go to Last Jump
Normal("<BS>", "<C-o>")

-- Handy j and k combinations
-- Escape from Insert mode
Insert("jk", "<ESC>")

-- Escape from Visual Mode
Visual("jk", "<ESC>")

-- Enter Command-Insert mode
Insert("kj", "<C-o>")

-- Vim will go to position in clipboard
Normal("==", ":e <C-r>+<CR>")

-- Comment.str Keymap Changes
Normal("<Leader>w", ":norm gcc<CR>")

-- Insert Em-Dash
Insert("<leader>-", "—")

-- Move text up and down
Visual("<A-j>", ":m '>+1<CR>gv=gv")
Visual("<A-k>", ":m '<-2<CR>gv=gv")

-- Sync Plugin Manager
Normal("+", ":Lazy sync<CR>")

-- Clear Entire Buffer
Normal("cg", ":norm ggcG<CR>")
-- Copy Entire Buffer
Normal("yg", ":norm ggyG<CR>")
-- Surround Entire Buffer and Ask Question
Normal("sg", "<cmd>lua cookieCutterQuestionTemplate()<CR>")
-- Clear all Registers
Normal("rt", ":ClearRegisters<CR>")

-- Edit Buffer (Insert name of buffer after command)
Normal("se", ":Regtabedit ")
Normal("<leader>s", ":lua require('treesj').toggle()<CR>")

Normal("/", ":SearchBoxIncSearch<CR>")
