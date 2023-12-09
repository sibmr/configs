return {
    { "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = "nvim-lua/plenary.nvim",
        keys = {
            { "<C-t>", "<CMD>Telescope<CR>", mode = { "n", "i", "v" } },
            { "<C-p>", "<CMD>Telescope find_files<CR>", mode = { "n", "i", "v" } },
            { "<C-l>", "<CMD>Telescope live_grep<CR>", mode = { "n", "i", "v" } },
            { "<C-c>", "<CMD>Telescope commands<CR>", mode = { "n", "i", "v" } },
            { "<C-k>", "<CMD>Telescope keymaps<CR>", mode = { "n", "i", "v" } },
            { "<C-s>", "<CMD>Telescope grep_string<CR>", mode = { "n", "i", "v" } },
        },
        config = true
    }
}

