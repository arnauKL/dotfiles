vim.keymap.set('t', '<esc><esc>', '<c-\\><c-n>')

-- Keep a state
local state = {
  floating = {
    buf = -1, -- Invalid buf and windows
    win = -1,
  }
}

local function create_floating_window(opts)
  opts = opts or {}

  local width = opts.width or math.floor(vim.o.columns * 0.8)
  local height = opts.height or math.floor(vim.o.lines * 0.8)

  -- Calculate center position of the window
  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  -- Create a buffer if it is not valid. Otherwise, reuse the buffer from 'opts' (to be able to toggle the same buffer)
  local buf = nil
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
  end

  -- Define window config
  local win_config = {
    relative = 'editor',
    width = width,
    height = height,
    col = col,
    row = row,
    style = 'minimal',
    border = 'solid',
    title = ' Floaterminal ',
    title_pos = 'center'
  }

  local win = vim.api.nvim_open_win(buf, true, win_config)

  return { buf = buf, win = win }
end


local toggle_terminal = function()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = create_floating_window { buf = state.floating.buf }
    -- if the buffer type is not a terminal, call terminal inside of this buffer
    if vim.bo[state.floating.buf].buftype ~= 'terminal' then
      vim.cmd.terminal()
    end
  else
    vim.api.nvim_win_hide(state.floating.win)
  end

  vim.cmd('normal i')
  --print(vim.inspect(state.floating))
end

vim.api.nvim_create_user_command("Floaterminal", toggle_terminal, {}) -- Create the custom user command
vim.keymap.set({ 'n', 't' }, '<space>tt', toggle_terminal)            -- Create keymap for the custom command
