-- lua/plugins/colorscheme.lua
return {
  {
    "folke/tokyonight.nvim",
    lazy = false,    -- Cargar inmediatamente al inicio
    priority = 1000, -- Cargar antes que todo lo demás
    config = function()
      -- Variantes: "storm", "moon", "night", "day"
      vim.cmd([[colorscheme tokyonight-moon]])
    end,
  }
}
