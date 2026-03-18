local header = {
  [[      ___           ___           ___           ___       ___           ___      ]],
  [[     /__/\         /  /\         /  /\         /  /\     /  /\         /  /\     ]],
  [[     \  \:\       /  /:/_       /  /::\       /  /::\   /  /::\       /  /:/_    ]],
  [[      \  \:\     /  /:/ /\     /  /:/\:\     /  /:/\:\ /  /:/\:\     /  /:/ /\   ]],
  [[  _____\__\:\   /  /:/ /:/_   /  /:/  \:\   /  /:/  \::\  /:/  \:\   /  /:/ /:/_  ]],
  [[ /__/::::::::\ /__/:/ /:/ /\ /__/:/ \__\:\ /__/:/ \__\::\/:/ \__\:\ /__/:/ /:/ /\ ]],
  [[ \  \:\~~\~~\/ \  \:\/:/ /:/ \  \:\ /  /:/ \  \:\ /  /:/\  \:\ /  /:/ \  \:\/:/ /:/ ]],
  [[  \  \:\  ~~~   \  \::/ /:/   \  \:\  /:/   \  \:\  /:/  \  \:\  /:/   \  \::/ /:/  ]],
  [[   \  \:\        \  \:\/:/     \  \:\/:/     \  \:\/:/    \  \:\/:/     \  \:\/:/   ]],
  [[    \  \:\        \  \::/       \  \::/       \  \::/      \  \::/       \  \::/    ]],
  [[     \__\/         \__\/         \__\/         \__\/        \__\/         \__\/     ]],
  [[                                                                                  ]],
  [[                          W E L C O M E  T O  T H E  M A C H I N E                ]],
  [[ -------------------------------------------------------------------------------- ]],
  "",
}

local rules = {
  "Rule 1. You can't tell where a program is going to spend its time.",
  "",
  "Bottlenecks occur in surprising places, so don't try to second",
  "guess and put in a speed hack until you've proven that's where",
  "the bottleneck is.",
  "",
  "Rule 2. Measure.",
  "Don't tune for speed until you've measured, and even then don't ",
  "unless one part of the code overwhelms the rest.",
  "",
  "Rule 3. Fancy algorithms are slow when n is small, and n is usually small",
  "",
  "Fancy algorithms have big constants. Until you know that n",
  "is frequently going to be big, don't get fancy. (Even if n does",
  "get big, use Rule 2 first.)",
  "",
  "Rule 4. Fancy algorithms are buggier than simple ones,",
  "",
  "and they're much harder to implement. Use simple algorithms as well as",
  "simple data structures.",
  "",
  "Rule 5. Data dominates.",
  "",
  "If you've chosen the right data structures, and organized things well, the",
  " algorithms will almost always be, self-evident. Data structures, not algorithms,",
  "are central to programming.",
}

-- Combine header and rules into one table
local dashboard_content = {}
for _, v in ipairs(header) do table.insert(dashboard_content, v) end
for _, v in ipairs(rules) do table.insert(dashboard_content, v) end

local function draw_dashboard()
  local buf = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, {})

  local win_width = vim.api.nvim_win_get_width(0)
  local win_height = vim.api.nvim_win_get_height(0)
  local centered_lines = {}

  -- Calculate vertical center
  local top_padding = math.floor((win_height - #dashboard_content) / 2) - 1
  for _ = 1, math.max(0, top_padding) do table.insert(centered_lines, "") end

  -- Centering each line horizontally
  for _, line in ipairs(dashboard_content) do
    local shift = math.floor((win_width - #line) / 2)
    table.insert(centered_lines, string.rep(" ", math.max(0, shift)) .. line)
  end

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, centered_lines)

  -- UI Settings
  vim.opt_local.number = false
  vim.opt_local.relativenumber = false
  vim.opt_local.laststatus = 0 -- Hides statusline for a clean look
  vim.opt_local.cursorline = false
  vim.opt_local.bufhidden = "wipe"
  vim.opt_local.buftype = "nofile"
  vim.opt_local.modifiable = false
end

-- Trigger on startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 and vim.api.nvim_buf_get_name(0) == "" then
      draw_dashboard()
    end
  end,
})

-- Restore UI when leaving the dashboard
vim.api.nvim_create_autocmd("BufLeave", {
  callback = function()
    vim.opt.laststatus = 2 -- Brings back statusline
  end,
})
