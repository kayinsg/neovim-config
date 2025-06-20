return {
	{
		"mfussenegger/nvim-fzy",
		dependencies = { "romgrk/fzy-lua-native" },
		config = function()
			local fzy = require("fzy")

			-- Override vim.ui.select to use nvim-fzy
			vim.ui.select = function(items, opts, on_choice)
				opts = opts or {}
				local label_fn = function(item)
					if type(item) == "table" and item.label then
						return item.label
					end
					return tostring(item)
				end

				fzy.pick_one(items, opts.prompt or "Select item:", label_fn, on_choice)
			end
		end,
	},
}
