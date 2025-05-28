function Normal(keybinding, actions)
	vim.keymap.set("n", keybinding, actions, { noremap = true, silent = true })
end

function Visual(keybinding, actions)
	vim.keymap.set("v", keybinding, actions, { noremap = true, silent = true })
end

function Command(keybinding, actions)
	vim.keymap.set("c", keybinding, actions, { noremap = true, silent = true })
end

function Insert(keybinding, actions)
	vim.keymap.set("i", keybinding, actions, { noremap = true, silent = true })
end

vim.keymap.set("", "<space>", "<nop>", opts)
vim.g.mapleader = " "
