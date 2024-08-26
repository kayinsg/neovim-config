local globalKeymapSettings = require("keybindings.01-globalKeymapSettings")

-- Current Line
Normal("<Leader>k", ":norm zt<CR>") -- Position Current Line at the top of the page
Normal("<Leader>g", ":norm zz<CR>") -- Position Current Line at the middle of the page
Normal("<Leader>j", ":norm zb<CR>") -- Position Current Line at the bottom of the page

-- Search
-- Previous Search Entry
Normal("<Leader>h", ":norm Nzt<CR>") -- Position At The Top of The Page
Normal("<Leader>hh", ":norm Nzz<CR>") -- Position At The Middle of The Page
-- Next Search Entry
Normal("<Leader>l", ":norm nzt<CR>") -- Position At The Top of The Page
Normal("<Leader>ll", ":norm nzz<CR>") -- Position At The Middle of The Page
