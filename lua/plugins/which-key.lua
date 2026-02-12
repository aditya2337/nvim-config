return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
    config = function() 
        local wk = require("which-key")
        wk.add({
            { "<leader>f", group = "File/Format" },
            { "<leader>g", group = "Git" },
            { "<leader>h", group = "Git Hunk" },
            { "<leader>p", group = "Project/Paste" },
            { "<leader>s", group = "Search" },
            { "<leader>t", group = "Toggle" },
            { "<leader>v", group = "LSP/View" },
        })
    end,
}

