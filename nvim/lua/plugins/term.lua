require("toggleterm").setup({
  size = 15,
  open_mapping = [[<C-\>]],
  direction = "float",
  float_opts = {
    border = "curved",
    winblend = 10,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
})
