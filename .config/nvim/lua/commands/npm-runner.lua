-- Function to read package.json and get script names
local function get_npm_scripts()
  local json_file = io.open("package.json", "r")
  if not json_file then
    return {}
  end

  local package_json = json_file:read("*a")
  json_file:close()

  -- Use vim.json.decode for parsing JSON content (Neovim 0.8+)
  local package_data = vim.json.decode(package_json)
  if not package_data or not package_data.scripts then
    return {}
  end

  -- Extract script names as a list
  local script_names = {}
  for script_name, _ in pairs(package_data.scripts) do
    table.insert(script_names, script_name)
  end

  return script_names
end

-- Function to open a floating window and create a buffer
local function create_floating_window()
  -- Create a new buffer
  local buf = vim.api.nvim_create_buf(false, true)

  -- Open a floating window with the buffer
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = math.floor(vim.o.columns * 0.8),
    height = math.floor(vim.o.lines * 0.8),
    row = math.floor((vim.o.lines - math.floor(vim.o.lines * 0.8)) / 2),
    col = math.floor((vim.o.columns - math.floor(vim.o.columns * 0.8)) / 2),
    style = "minimal",
    border = "rounded",
  })

  -- Optional: Set some window options (e.g., no line numbers, no cursorline)
  vim.wo[win].number = false
  vim.wo[win].relativenumber = false
  vim.wo[win].cursorline = false

  -- Map <Esc> key to close the popup window
  vim.api.nvim_buf_set_keymap(buf, 'n', '<Esc>', '<Cmd>q!<CR>', { noremap = true, silent = true })

  return buf, win
end

-- Function to decode output to UTF-8
local function decode_to_utf8(data)
  if not data then
    return {}
  end
  -- Decode each line to UTF-8
  local decoded = {}
  for _, line in ipairs(data) do
    table.insert(decoded, vim.fn.iconv(line, "utf-8", "utf-8"))
  end
  return decoded
end

-- Function to run the npm script and display live output in the popup window
local function run_npm_script(script_name)
  -- Create the popup window and get buffer and window handles
  local buf, _ = create_floating_window()

  -- Start the npm script job
  vim.fn.jobstart({ "npm", "run", script_name }, {
    stdout_buffered = false,
    stderr_buffered = false,
    on_stdout = function(_, data)
      -- Decode and append new lines to the buffer
      local decoded = decode_to_utf8(data)
      vim.api.nvim_buf_set_lines(buf, -1, -1, false, decoded)
      -- Keep the cursor at the latest output
      vim.api.nvim_win_set_cursor(0, { vim.api.nvim_buf_line_count(buf), 0 })
    end,
    on_stderr = function(_, data)
      -- Decode and append error lines to the buffer
      local decoded = decode_to_utf8(data)
      vim.api.nvim_buf_set_lines(buf, -1, -1, false, decoded)
      -- Keep the cursor at the latest output
      vim.api.nvim_win_set_cursor(0, { vim.api.nvim_buf_line_count(buf), 0 })
    end,
    on_exit = function()
      -- Optionally handle job exit, e.g., show a message or clean up
      vim.api.nvim_buf_set_lines(buf, -1, -1, false, { "Process finished." })
    end,
  })
end

-- Create a user command with autocompletion for npm scripts
vim.api.nvim_create_user_command("NpmRun", function(opts)
  run_npm_script(opts.args)
end, {
  nargs = 1,
  complete = function(ArgLead, CmdLine, CursorPos)
    return get_npm_scripts()
  end,
})
