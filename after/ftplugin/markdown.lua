local set = vim.opt_local

set.number = false
set.relativenumber = false
set.wrap = true
set.linebreak = true   -- Break lines at spaces, not in the middle of words
set.breakindent = true -- Keep indentation when breaking lines

-- Convert Markdown to PDF with Pandoc
vim.keymap.set("n", "<leader>pd", ":!pandoc % -o %:r.pdf<CR>", {
  buffer = true, -- Make it buffer-local (Markdown only)
  noremap = true,
  silent = true,
  desc = "[p]an[d]oc: Markdown to PDF"
})
