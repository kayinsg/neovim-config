-- plugins/treeSJ.lua

local tsj = require("treesj")

local langs = { --[[ configuration for languages ]]
}

return {
	use_default_keymaps = false, -- Use default keymaps (<space>m - toggle, <space>j - join, <space>s - split)
	check_syntax_error = true, -- Node with syntax error will not be formatted
	max_join_length = 72, -- If line after join will be longer than max value, node will not be formatted
	cursor_behavior = "hold", -- Cursor behavior: 'hold', 'start', or 'end'
	notify = true, -- Notify about possible problems or not
	dot_repeat = true, -- Use `dot` for repeat action
	on_error = nil, -- Callback for treesj error handler
	langs = langs, -- Presets for languages (fill this in as needed)
}
