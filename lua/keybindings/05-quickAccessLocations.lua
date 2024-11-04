function getAbstractions()
	callback = require("abstractions")
	return callback
end

getAbstractions()

-- Directories
-- General Configuration Directory
Normal("<Leader>1", ":Oil /home/kayinfire/.config/nvim/lua<CR>")
-- Keybindings Directory
Normal("<Leader>2", ":Oil /home/kayinfire/.config/nvim/lua/keybindings<CR>")
-- Plugins Directory
Normal("<Leader>33", ":Oil /home/kayinfire/.config/nvim/lua/plugins<CR>")
-- General IDE Directory
Normal("<Leader>5", ":Oil /home/kayinfire/.config/nvim/lua/lsp/main<CR>")
-- LSP Specific Settings
Normal("<Leader>55", ":Oil /home/kayinfire/.config/nvim/lua/lsp/LanguageServerProtocolSettings<CR>")

-- Files
Normal("<Leader>11", ":e! /home/kayinfire/.config/nvim/init.lua<CR>")
Normal("<Leader>3", ":e! /home/kayinfire/.config/nvim/lua/plugins.lua<CR>")
Normal("<Leader>4", ":e! /home/kayinfire/.config/nvim/lua/abstractions.lua<CR>")
Normal("<Leader>44", ":e! /home/kayinfire/.config/nvim/lua/customPrompts.lua<CR>")
Normal(
	"<Leader>d",
	":e! /home/kayinfire/projects/python/doSomething/projects/dataAnalysisDataCleaner/dataCleaner.py<CR>"
)
Normal(
	"<leader>dd",
	":e! /home/kayinfire/projects/python/doSomething/projects/convertTimeRepository/videoContentTimeManagerRefactoringInProcess.py<CR>"
)
