function getAbstractions()
	callback = require("abstractions")
	return callback
end

function getPrompts()
	callback = require("customPrompts")
	return callback
end

getAbstractions()
getPrompts()

-- Function Keys
Normal("sg", "<cmd>lua cookieCutterQuestionTemplate()<CR>")
Normal("eE", "<cmd>lua explainScript()<CR>")
Normal("<Leader>c", "<cmd>lua refactoringScript()<CR>")
Normal("es", "<cmd>lua gatherDocumentationInsights()<CR>")
Normal("<leader>P", "<cmd>lua pythonScript()<CR>")
Normal("<leader>D", "<cmd>lua pythonDebugger()<CR>")
Normal("<leader>m", "<cmd>lua explainBuddhism()<CR>")
Normal("<leader>i", "<cmd>lua rephraseScript()<CR>")
Normal("<leader>G", "<cmd>lua joinLines()<CR>")
Normal("<leader>ff", "<cmd>lua formatterScript()<CR>")
