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
      adaptive_size = true,
    },
    filters = {
      dotfiles = false,
      git_ignored = false,
    },
    hijack_directories = {
      enable = false,
    },
  },
}

