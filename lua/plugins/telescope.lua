return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = "Find Files (Project)" })
            vim.keymap.set('n', '<leader>ps', function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") })
            end, { desc = "Grep String (Project)" })
            vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = "Help Tags" })
            vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })

            require("telescope").setup {}
        end
    }
}
