local FZFTABLE = {}

function FZFTABLE.setup()
	require("fzf-lua").setup({
		files = {
			cmd = "rg --files --hidden --glob '!.git/*'",
		},
		previewer = {
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
			},
		},
	})
end

return FZFTABLE
