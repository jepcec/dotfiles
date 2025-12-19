return {
  "nvim-mini/mini.pairs",
  event = "VeryLazy",  -- Cargar el plugin cuando sea necesario
  opts = {
    modes = { insert = true, command = true, terminal = false },
    skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
    skip_ts = { "string" },
    skip_unbalanced = true,
    markdown = true,
  },
  config = function(_, opts)
    require("mini.pairs").setup(opts)  -- Usa directamente la configuración de mini.pairs
  end,
}
