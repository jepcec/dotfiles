-- lua/plugins/lualine.lua
return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy", -- Cargar cuando ya se haya iniciado la UI
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      globalstatus = true,  -- Una sola barra para todas las ventanas (moderno)
    },
  },
}
