local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- 1. Bootstrapping robusto (con chequeo de errores)
-- Usa vim.uv si existe (Neovim moderno), si no usa vim.loop
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- 2. Configuración del Gestor
require("lazy").setup({
  spec = {
    -- importará plugins desde la carpeta lua/plugins
    { import = "plugins" },
  },
  defaults = {
    -- En tu configuración propia, es mejor que 'lazy = false' al principio.
    -- Significa que tus plugins se cargan al inicio por defecto (más fácil de debuggear).
    lazy = false, 
    version = false, 
  },
  -- 3. Optimización de rendimiento (Performance)
  -- Esto es genial mantenerlo, desactiva plugins basura que vienen con Vim por defecto.
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin", -- Desactivamos netrw porque usaremos Neo-tree
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
