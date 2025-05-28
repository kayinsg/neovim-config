local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

function Normal(keybinding, actions)
	vim.keymap.set("n", keybinding, actions, opts)
end

function Visual(keybinding, actions)
	vim.keymap.set("v", keybinding, actions, opts)
end

function Command(keybinding, actions)
	vim.keymap.set("c", keybinding, actions, opts)
end

function Insert(keybinding, actions)
	vim.keymap.set("i", keybinding, actions, opts)
end

function changeToNextBuffer()
	vim.schedule(function()
		executeOnCommandLine("bnext")
	end)
end
