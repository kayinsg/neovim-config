require("keybindings.globalKeymapSettings")

-- Quick Shortcuts
Normal("<leader>r", ":reg / 1 2 3 4 5 a b c d e f g j k l w x z <CR>")
Normal("qq", ":qa!<CR>")
Normal("qw", function()
	if vim.fn.win_gettype() == "command" then
		vim.cmd("q")
	else
		vim.cmd("bdelete!")
	end
end)
Normal("Qw", "<cmd> lua closeAllBuffersExceptCurrent()<CR>")
Normal("qo", ":w!<CR>")
Normal("qp", ":wq!<CR>")

-- Buffer Navigation
Normal("[<Tab>", ":norm [[zt<CR>")
Normal("]<Tab>", ":norm ]]zt<CR>")

-- Open File Manager
-- Normal("oil", ":lua require('oil').open()<CR>")
