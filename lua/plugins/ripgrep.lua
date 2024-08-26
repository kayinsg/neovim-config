-- Setup the rg plugin with optional quickfix formatting
function setupRgPlugin()
	require("rg").setup({
		qf_format = nil,
	})
end

-- Check if rg is executable and set grepprg and grepformat options
function configureRgAsGrepTool()
	if vim.fn.executable("rg") == 1 then
		vim.o.grepprg = "rg --vimgrep --no-heading --smart-case --ignore-case"
		vim.o.grepformat = "%f:%l:%c:%m,%f:%l:%m"
	end
end

-- Attach keymap and configure rg plugin for a buffer
function attachRgToBuffer(bufferNumber)
	require("rg").rg("a pattern", { "H", "I" }, "/a/path")

	vim.keymap.set("n", "<C-f>", function()
		local node = require("nvim-tree.api").tree.get_node_under_cursor()
		require("rg").rgui(node.absolute_path)
	end, { buffer = bufferNumber, noremap = true, silent = true })
end

-- Main setup function
function main()
	setupRgPlugin()
	configureRgAsGrepTool()
	-- Assuming you want to call attachRgToBuffer within main, you can pass a buffer number as needed
	-- Example: attachRgToBuffer(0) -- Using buffer number 0 as an example
end

main()
