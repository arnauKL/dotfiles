return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      -- set the default theme to ivy
      require("telescope").setup {
        pickers = {
          find_files = { theme = "ivy" },
          buffers = { theme = "ivy" },
          help_tags = { theme = "ivy" }
        },
        extensions = {
          fzf = {}
        }
      }

      require('telescope').load_extension('fzf')

      -- keymap to set 'ff' for "find files" in directory
      vim.keymap.set("n", "<space>ff", require("telescope.builtin").find_files, { desc = "[f]ind [f]iles in directory" })

      -- keymap to search helps
      vim.keymap.set("n", "<space>fh", require("telescope.builtin").help_tags, { desc = "[f]ind [h]elp" })

      -- keymap to set 'fn' for 'find neovim' config files from anywhere
      vim.keymap.set("n", "<space>fn", function()
          require("telescope.builtin").find_files {
            cwd = vim.fn.stdpath("config")
          }
        end,
        { desc = "[f]ind [n]eovim config files" })

      -- keymap to set 'space-space' to show opened buffers
      vim.keymap.set("n", "<space><space>", require("telescope.builtin").buffers, { desc = "show opened buffers" })

      -- keymap to set 'fu' for 'find uni' files (2n semestre de 3r) from anywhere :) (Arnau 2025 special)
      vim.keymap.set("n", "<space>fu", function()
          require("telescope.builtin").find_files {
            cwd = "C:/Users/depre/Desktop/Uni/3r/"
          }
        end,
        { desc = "[f]ind [u]ni files" })
    end
  }
}
