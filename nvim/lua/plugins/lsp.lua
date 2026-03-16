return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- 1. Iniciar Mason
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- 2. Configurar Mason-LSPConfig (NUEVA SINTAXIS)
    mason_lspconfig.setup({
      ensure_installed = {
        "ts_ls",       -- TypeScript / JavaScript
        "html",
        "cssls",
        "tailwindcss",
        "lua_ls",
	"pyright",
	"clangd",
	"emmet_language_server",
	"astro"
      },
      -- AQUÍ ESTÁ EL CAMBIO: 'handlers' ahora va dentro del setup
      handlers = {
        -- El manejador por defecto (se aplica a todos los servidores no listados abajo)
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,

        -- Manejador específico para Lua (para evitar alertas molestas)
        ["lua_ls"] = function()
          lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
              },
            },
          })
        end,

	["emmet_language_server"] = function()
  	lspconfig.emmet_language_server.setup({
    	capabilities = capabilities,
    	filetypes = {
      	"html",
      	"css",
      	"scss",
      	"javascriptreact",
      	"typescriptreact",
    		},
  	})
	end,

      },
    })

    -- 3. Atajos de teclado (Igual que antes)
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      end,
    })
  end,
}
