return {
	"doums/rg.nvim",
	config = function()
		local function setupRgPlugin()
			require("rg").setup({
				qf_format = nil,
			})
		end

		local function configureRgAsGrepTool()
			if vim.fn.executable("rg") == 1 then
				vim.o.grepformat = "%f:%l:%c:%m,%f:%l:%m"
			end
		end

		local function attachRgToBuffer(bufferNumber)
			require("rg").rg("a pattern", { "H", "I" }, "/a/path")

			vim.keymap.set("n", "<C-f>", function()
				local node = require("nvim-tree.api").tree.get_node_under_cursor()
				require("rg").rgui(node.absolute_path)
			end, { buffer = bufferNumber, noremap = true, silent = true })
		end

		-- Initialize the plugin
		setupRgPlugin()
		configureRgAsGrepTool()
	end,
}
