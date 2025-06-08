return {
	"ibhagwan/fzf-lua",
	cmd = "FzfLua",
	dependencies = {
		"sharkdp/fd",
		"sharkdp/bat",
	},
	config = function()
		local fzf_lua = require("fzf-lua")

		fzf_lua.setup({
			files = {
				-- Using fd instead of rg for file finding
				cmd = "fd --type f --hidden --exclude .git",
			},
			grep = {
				-- Still using rg for grep as it's generally better for content search
				cmd = "rg --column --line-number --no-heading --color=always --smart-case",
			},
			previewers = {
				builtin = {
					extensions = {
						["png"] = "chafa",
						["jpg"] = "chafa",
						-- Add more file extensions as needed
					},
				},
			},
			winopts = {
				relative = "editor",
				width = 1.0,
				height = 1.0,
				row = 0.5,
				col = 0.5,
				border = "rounded",
				preview = {
					hidden = "nohidden",
					border = "rounded",
					layout = "horizontal",
					horizontal = "right:70%",
					-- Enable bat for syntax highlighting in preview
					default = "bat",
					-- bat specific options
					bat = {
						theme = "ansi",
						style = "plain",
						-- line numbers in preview
						line_number = true,
					},
				},
			},
			-- Enable bat for file previews
			previewers = {
				bat = {
					theme = "ansi",
				},
			},
		})
	end,
}
