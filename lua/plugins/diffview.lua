return {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewFileHistory" },
    keys = {
        { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diff View" },
        { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File History" },
        { "<leader>gc", "<cmd>DiffviewClose<cr>", desc = "Close Diff View" },
    },
    config = true,
}
