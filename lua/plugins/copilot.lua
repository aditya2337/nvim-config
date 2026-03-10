return {
  {
    "zbirenbaum/copilot.lua",
    lazy = false,
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      copilot_node_command = "/opt/homebrew/bin/node",
      suggestion = {
        enabled = true,
        auto_trigger = true,
          keymap = {
            accept = "<Tab>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      panel = {
        enabled = false,
      },
    },
  },
}
