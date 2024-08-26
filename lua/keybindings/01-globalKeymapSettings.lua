-- Shorten function name
-- Modes
-- normal_mode = "n",
-- insert_mode = "i",
-- visual_mode = "v",
-- visual_block_mode = "x",
-- term_mode = "t",
-- command_mode = "c",

keymap = vim.keymap.set

keymap("", "<space>", "<nop>", opts) --Remap space as leader key
vim.g.mapleader = " " -- Global Leader Key
