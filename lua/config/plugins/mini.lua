-- I only use this pluggin to get a nice statusbar (line just above the command line)

--  {
 --   'echasnovski/mini.nvim',
  --  dependencies = { "echasnovski/mini-git" },
   -- config = function()

    --  local statusline = require 'mini.statusline'
     -- statusline.setup { use_icons = true }
   -- end
  --}

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        theme = 'gruvbox-material',  -- Add the theme option here
      },
    }
  end,
}
