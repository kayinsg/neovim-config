-- Retrieve Abstractions
--{{
function getAbstractions()
	callback = require("abstractions")
	return callback
end

getAbstractions()
--}}

--Quick shortcuts
-- Normal("rt", ":so /home/kayinfire/.config/nvim/init.lua<CR>")
Normal("<leader>r", ":reg / a b c d e f g j k l  w x z  <CR>")
Normal("qq", ":qa!<CR>")
Normal("qw", ":bdelete!<CR>")
Normal("Qw", "<cmd> lua closeAllBuffersExceptCurrent()<CR>")
Normal("qo", ":w!<CR>")
Normal("qp", ":wq!<CR>")
-- Navigate buffers
-- Normal("kl", "<cmd> lua changeToNextBuffer()<CR>")
-- Normal("jh", ":bprevious<CR>")
-- Switch To Most Recent Buffer
-- Normal("<Tab>", ":e#<CR>")
-- Open File Manager
Normal("<Tab>", ":lua require('oil').open()<CR>")
-- Open Terminal
Normal("<S-Tab>", ":lua require('FTerm').toggle()<CR>")
