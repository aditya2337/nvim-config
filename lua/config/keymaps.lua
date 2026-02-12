
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open File Explorer (Netrw)" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Selection Down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Selection Up" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join Lines (Keep Cursor)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll Down (Centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll Up (Centered)" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next Search Result (Centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Prev Search Result (Centered)" })



-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste Over (Keep Buffer)" })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = "Copy to System Clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy Line to System Clipboard" })

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]], { desc = "Delete to Void Register" })

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "Open Tmux Sessionizer" })
vim.keymap.set("n", "<leader>f", function()
    require("conform").format({ lsp_fallback = true })
end, { desc = "Format Buffer" })

-- Tmux navigation
vim.keymap.set("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "Navigate Left (Tmux)" })
vim.keymap.set("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "Navigate Right (Tmux)" })

-- Quickfix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next Quickfix" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Prev Quickfix" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next Location" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Prev Location" })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Search & Replace Word" })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make Executable" })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

local autocmd = vim.api.nvim_create_autocmd

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

