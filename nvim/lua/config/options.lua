vim.opt.number = true
vim.opt.relativenumber = true

local function transparent()
  local groups = {
    "Normal","NormalNC","EndOfBuffer",
    "SignColumn","LineNr","FoldColumn",
    "NormalFloat","FloatBorder",

    "NvimTreeNormal","NvimTreeNormalNC",
    "NvimTreeEndOfBuffer","NvimTreeWinSeparator",
  }

  for _, g in ipairs(groups) do
    vim.api.nvim_set_hl(0, g, { bg = "none" })
  end
end

transparent()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = transparent,
})
