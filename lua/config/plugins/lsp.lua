return {
  {
    {
      "neovim/nvim-lspconfig",
      dependencies = {
        "saghen/blink.cmp",
        {
          "folke/lazydev.nvim", -- gives the Lua lsp info on nvim stuff
          ft = "lua",           -- only load on lua files
          opts = {
            library = {
              -- See the configuration section for more details
              -- Load luvit types when the `vim.uv` word is found
              { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
          },
        },
      },
      config = function()
        local capabilities = require('blink.cmp').get_lsp_capabilities()
        local lspconfig = require("lspconfig")
        lspconfig.lua_ls.setup({ capabilities = capabilities })  -- Setup lua lsp
        lspconfig.pyright.setup({ capabilities = capabilities }) -- Setup python lsp, etc
        lspconfig.clangd.setup({
          capabilities = capabilities,
          cmd = {
            "clangd",
            filetypes = { "c", "cpp", "objc", "objcpp" },
          }
        })
        -- Setup auto format
        vim.api.nvim_create_autocmd('LspAttach', {
          callback = function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            if not client then return end -- if for some reason the client wasnt found, return

            if client.supports_method('textDocument/formatting') then
              -- Format the current buffer on save if the client supports it
              vim.api.nvim_create_autocmd('BufWritePre', {
                buffer = args.buf,
                callback = function()
                  vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                end,
              })
            end
          end,
        })
      end,
    },
    -- Linting stuff
    {
      "mfussenegger/nvim-lint",
      config = function()
        require('lint').linters_by_ft = {
          c = { 'clangtidy' }, -- Run Clang-Tidy for C files
        }
        vim.api.nvim_create_autocmd("BufWritePost", {
          pattern = "*.c",
          callback = function()
            require("lint").try_lint()
          end,
        })
      end,
    }
  }
}

-- In order to find new lsp servers the command is:
-- :help lspconfig-all
--
-- This will show all the available lsps. Then look for the
-- specific one and follow the installation instructions
--
-- Anyway, I believe mason should take kare of it now.
