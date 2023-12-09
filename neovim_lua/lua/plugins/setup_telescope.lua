return {
    { "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = "nvim-lua/plenary.nvim",
        keys = {
            { "<C-t>", "<CMD>Telescope<CR>", mode = { "n", "i", "v" } },
            { "<leader>ff", "<CMD>Telescope find_files<CR>", mode = { "n", "i", "v" } },
            { "<leader>fg", "<CMD>Telescope live_grep<CR>", mode = { "n", "i", "v" } },
            { "<leader>fc", "<CMD>Telescope commands<CR>", mode = { "n", "i", "v" } },
            { "<leader>fk", "<CMD>Telescope keymaps<CR>", mode = { "n", "i", "v" } },
            { "<leader>fs", "<CMD>Telescope grep_string<CR>", mode = { "n", "i", "v" } },
            { "<leader>fb", "<CMD>Telescope buffers<CR>", mode = { "n", "i", "v" } },
        },
        config = true
    }
}

