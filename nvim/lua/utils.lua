local M = {}

--- Gets a path to a package in the Mason registry.
--- Prefer this to `get_package`, since the package might not always be
--- available yet and trigger errors.
---@param pkg string
---@param path? string
function M.get_pkg_path(pkg, path)
  return (vim.env.MASON or (vim.fn.stdpath("data") .. "/mason")) .. "/packages/" .. pkg .. "/" .. (path or "")
end

--- This extends a deeply nested list with a key in a table
--- that is a dot-separated string.
--- The nested list will be created if it does not exist.
---@generic T
---@param base T[]
---@param key string
---@param values T[]
---@return T[]?
function M.extend(base, key, values)
  local keys = vim.split(key, ".", { plain = true })
  for i = 1, #keys do
    local k = keys[i]
    base[k] = base[k] or {}
    if type(base) ~= "table" then
      return
    end
    base = base[k]
  end
  return vim.list_extend(base, values)
end

return M
