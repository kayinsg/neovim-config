function getAbstractions()
	callback = require("abstractions")
	return callback
end

getAbstractions()

-- Key Mappings for Neovim
-- Directories
Normal("<Leader>1", ":Oil /home/kayinfire/.config/nvim/lua<CR>") -- Open General Configuration Directory
Normal("<Leader>2", ":Oil /home/kayinfire/.config/nvim/lua/keybindings<CR>") -- Open Keybindings Directory
Normal("<Leader>3", ":Oil /home/kayinfire/.config/nvim/lua/plugins<CR>") -- Open Plugins Directory
Normal("<Leader>5", ":Oil /home/kayinfire/.config/nvim/lua/lsp/main<CR>") -- Open General IDE Directory
Normal("<Leader>55", ":Oil /home/kayinfire/.config/nvim/lua/lsp/LanguageServerProtocolSettings<CR>") -- Open LSP Specific Settings
Normal("<Leader>`", ":cd /home/kayinfire/kayinProgramming/python/projects | lua require('fzf-lua').grep()<CR>") -- Go to Main Python Directory

-- Files
Normal("<Leader>11", ":e! /home/kayinfire/.config/nvim/init.lua<CR>") -- Edit Neovim Initialization File
Normal("<Leader>33", ":e! /home/kayinfire/.config/nvim/lua/plugins.lua<CR>") -- Edit Plugins Configuration File
Normal("<Leader>4", ":e! /home/kayinfire/.config/nvim/lua/abstractions.lua<CR>") -- Edit Abstractions File
Normal("<Leader>44", ":e! /home/kayinfire/.config/nvim/lua/customPrompts.lua<CR>") -- Edit Custom Prompts File
Normal(
	"<Leader>d",
	":e! /home/kayinfire/projects/python/doSomething/projects/dataAnalysisDataCleaner/dataCleaner.py<CR>"
) -- Edit Data Cleaner Script
Normal(
	"<leader>dd",
	":e! /home/kayinfire/projects/python/doSomething/projects/convertTimeRepository/videoContentTimeManagerRefactoringInProcess.py<CR>"
) -- Edit Video Content Time Manager Script
