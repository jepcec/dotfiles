return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter", -- Cargar solo cuando entras en modo edición (ahorra tiempo de inicio)
    dependencies = {
      -- 1. Motor de Snippets (Obligatorio para nvim-cmp)
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*", -- Usar la versión 2 (importante para evitar errores)
        build = "make install_jsregexp", -- Opcional: mejora el soporte de regex (requiere 'make')
      },
      "saadparwaiz1/cmp_luasnip", -- Conector entre nvim-cmp y LuaSnip

      -- 2. Otras fuentes de autocompletado
      "hrsh7th/cmp-nvim-lsp", -- Autocompletado inteligente (funciones, variables)
      "hrsh7th/cmp-buffer",   -- Palabras que ya están en el archivo abierto
      "hrsh7th/cmp-path",     -- Rutas de archivos (ej: /home/usuario/...)

      -- 3. Iconos bonitos (Tipo VSCode)
      "onsails/lspkind.nvim",
      
      -- 4. Colección de snippets predefinidos (React, Python, HTML, etc.)
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")

      -- Cargar snippets de la comunidad (friendly-snippets)
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body) -- Indicarle a cmp cómo expandir snippets
          end,
        },
        window = {
          completion = cmp.config.window.bordered(), -- Bordes redondeados en el menú
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item(), -- Navegar arriba en el menú
          ["<C-j>"] = cmp.mapping.select_next_item(), -- Navegar abajo en el menú
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(), -- Forzar abrir el menú
          ["<C-e>"] = cmp.mapping.abort(), -- Cerrar menú
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Enter para confirmar selección
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" }, -- Prioridad 1: LSP (Inteligente)
          { name = "luasnip" },  -- Prioridad 2: Snippets
          { name = "buffer" },   -- Prioridad 3: Texto del archivo
          { name = "path" },     -- Prioridad 4: Rutas
        }),
        -- Configuración de iconos
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text", -- Muestra icono + texto (ej: 𝑓 Function)
            maxwidth = 50, -- Ancho máximo
            ellipsis_char = "...",
          }),
        },
      })
    end,
  },
}
