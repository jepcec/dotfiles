return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },

  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "vimdoc",
      "javascript",
      "typescript",
      "python",
      "tsx",
      "markdown",
      "markdown_inline",
      "bash",
    },
    highlight = { enable = true },
    indent = { enable = true },
  },
}

