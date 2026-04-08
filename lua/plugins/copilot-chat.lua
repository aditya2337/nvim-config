return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {},
    keys = {
      { "<leader>ac", "<cmd>CopilotChatToggle<CR>", desc = "AI: Toggle Copilot Chat", mode = "n" },
      { "<leader>ac", ":CopilotChat ", desc = "AI: Chat About Selection", mode = "v" },
    },
    cmd = {
      "CopilotChat",
      "CopilotChatToggle",
    },
  },
}
