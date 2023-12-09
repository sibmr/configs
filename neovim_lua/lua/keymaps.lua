local map = vim.keymap.set

-- exit insert mode with jj
map("i", "jj", "<esc>")

-- easier exit to { and } via ö and ä
map("i", "öö", "{")
map("i", "ää", "}")

-- move between panes faster
map("n", "<leader>h", "<C-w>h")
map("n", "<leader>j", "<C-w>j")
map("n", "<leader>k", "<C-w>k")
map("n", "<leader>l", "<C-w>l")

-- leave terminal mode
map("t", "<esc>", "<C-\\><C-n>")
