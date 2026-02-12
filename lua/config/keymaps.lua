
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

-- Auto-generate CHEATSHEET.md
vim.api.nvim_create_user_command("GenCheatsheet", function()
    local modes = { "n", "i", "v", "x" }
    local keymaps = {}

    -- Helper to collect maps
    local function collect(mode, maps)
        for _, map in pairs(maps) do
            local desc = map.desc
            local lhs = map.lhs
            
            -- Filter out noisy internal descriptions
            local is_noisy = false
            if desc then
                if desc:match("^vim%.") then is_noisy = true end       -- e.g. vim.lsp.buf...
                if desc:match("^cmp%.") then is_noisy = true end       -- e.g. cmp.utils...
                if desc:match("^:help") then is_noisy = true end       -- e.g. :help v_@-default
                if desc:match("keymap%.set_map") then is_noisy = true end
            end

            if desc and desc ~= "" and not is_noisy then
                table.insert(keymaps, { mode = mode, lhs = lhs, desc = desc })
            end
        end
    end

    -- Manually add CMP and other tricky keymaps that don't show up well
    table.insert(keymaps, { mode = "i", lhs = "<C-p>", desc = "Autocomplete: Previous Item" })
    table.insert(keymaps, { mode = "i", lhs = "<C-n>", desc = "Autocomplete: Next Item" })
    table.insert(keymaps, { mode = "i", lhs = "<C-y>", desc = "Autocomplete: Confirm" })
    table.insert(keymaps, { mode = "i", lhs = "<C-Space>", desc = "Autocomplete: Trigger" })
    
    -- Manually add Neovim builtin defaults that are useful
    table.insert(keymaps, { mode = "n", lhs = "gx", desc = "Open Link Under Cursor" })

    -- Collect Global & Buffer-Local
    for _, mode in ipairs(modes) do
        collect(mode, vim.api.nvim_get_keymap(mode))
        collect(mode, vim.api.nvim_buf_get_keymap(0, mode))
    end

    -- Deduplicate based on LHS + Mode
    local unique_maps = {}
    local seen = {}
    for _, map in ipairs(keymaps) do
        local id = map.mode .. "|" .. map.lhs
        if not seen[id] then
            seen[id] = true
            table.insert(unique_maps, map)
        end
    end

    -- Sort by description
    table.sort(unique_maps, function(a, b) return a.desc < b.desc end)

    -- Generate Markdown in Config Dir
    local config_path = vim.fn.stdpath("config")
    local filepath = config_path .. "/CHEATSHEET.md"
    local file = io.open(filepath, "w")
    
    if file then
        file:write("# Neovim Cheatsheet\n\n")
        file:write("| Mode | Key | Description |\n")
        file:write("|---|---|---|\n")
        for _, map in ipairs(unique_maps) do
            -- Escape pipes for Markdown table
            local safe_lhs = map.lhs:gsub("|", "\\|")
            file:write(string.format("| %s | `%s` | %s |\n", map.mode, safe_lhs, map.desc))
        end
        file:close()
        print("Cheatsheet generated at " .. filepath)
    else
        print("Error writing file to " .. filepath)
    end
end, {})

