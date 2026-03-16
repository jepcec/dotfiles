return {
  "echasnovski/mini.files",
  version = false,
  keys = {
    {
      "<leader>f",
      function()
        require("mini.files").open(vim.api.nvim_buf_get_name(0))
      end,
      desc = "Mini Files",
    },
  },
  config = function()
    require("mini.files").setup()
  end,
}

