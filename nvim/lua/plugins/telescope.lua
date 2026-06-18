return {
  {
    "nvim-telescope/telescope.nvim",
    version = "*",

    dependencies = {
      "nvim-lua/plenary.nvim",

      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },

    keys = {
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files({
            cwd = vim.loop.cwd(),
          })
        end,
        desc = "Find Files (cwd)",
      },

      {
        "<leader>fg",
        function()
          require("telescope.builtin").live_grep({
            cwd = vim.loop.cwd(),
          })
        end,
        desc = "Live Grep (cwd)",
      },
    },

    config = function()
      local telescope = require("telescope")

      telescope.setup({})

      pcall(telescope.load_extension, "fzf")
    end,
  },
}
