return {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  config = function()
    require("ibl").setup({
      indent = { char = "│", tab_char = "│" },
      scope = { enabled = true },
      exclude = {
        filetypes = {
          "help", "alpha", "dashboard", "neo-tree",
          "Trouble", "lazy", "mason", "notify",
          "toggleterm", "lazyterm",
        },
      },
    })
  end,
}
