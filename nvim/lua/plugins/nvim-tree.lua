return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree" },
  },
  opts = {
    view = {
      width = 30,
    },
    filters = {
      dotfiles = false,
      git_ignored = false,
    },
  },
}

