local M = {}

M.generate_index_ts = function()
  local allowed_extensions = { ".ts", ".tsx" }
  local excluded_files = { "index.ts", "types.ts" }

  local function has_allowed_extension(filename)
    for _, ext in ipairs(allowed_extensions) do
      if filename:sub(- #ext) == ext then
        return true
      end
    end
    return false
  end

  local function is_excluded(filename)
    for _, name in ipairs(excluded_files) do
      if filename == name then
        return true
      end
    end
    return false
  end

  local dir = vim.fs.dirname(vim.api.nvim_buf_get_name(0))
  local exports = {}

  for name, type in vim.fs.dir(dir) do
    if not is_excluded(name) then
      if type == "file" and has_allowed_extension(name) then
        local base = name:gsub("%.[^.]+$", "") -- remove last extension
        table.insert(exports, string.format('export * from "./%s";', base))
      elseif type == "directory" then
        table.insert(exports, string.format('export * from "./%s";', name))
      end
    end
  end

  table.sort(exports)
  local index_path = dir .. "/index.ts"
  local fd = assert(io.open(index_path, "w"))
  for _, line in ipairs(exports) do
    fd:write(line .. "\n")
  end
  fd:close()

  print("index.ts generated with " .. #exports .. " exports")
end

return M
