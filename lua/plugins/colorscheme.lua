return {
  -- Catppuccin theme - soothing pastel theme
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- or "frappe", "macchiato", "latte"
        transparent_background = false,
        show_end_of_buffer = false,
        term_colors = true,
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        color_overrides = {
          mocha = {
            base = "#000000",  -- Make background darker
            mantle = "#0a0a0a", -- Darker floating windows
            crust = "#050505",  -- Even darker borders
          },
        },
        custom_highlights = {
          LineNr = { fg = "#6e7381" },  -- Normal line numbers
          CursorLineNr = { fg = "#f38ba8", bg = "#1e1e2e", bold = true },  -- Current line number highlight
        },
        integrations = {
          telescope = true,
          treesitter = true,
          which_key = true,
        },
      })
      vim.cmd([[colorscheme catppuccin]])
    end,
  },
}