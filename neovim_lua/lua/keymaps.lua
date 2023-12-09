local map = vim.keymap.set

-- exit insert mode with jj
map("i", "jj", "<esc>")

-- easier exit to { and } via ö and ä
map("i", "öö", "{")
map("i", "ää", "}")

-- move between panes faster
map("n", "C-h", "C-w-h")
map("n", "C-j", "C-w-j")
map("n", "C-k", "C-w-k")
map("n", "C-l", "C-w-l")
