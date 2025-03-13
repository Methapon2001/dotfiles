local M = {}

--- Gets a path to a package in the Mason registry.
--- Prefer this to `get_package`, since the package might not always be
--- available yet and trigger errors.
---@param pkg string
---@param path? string
function M.get_pkg_path(pkg, path)
  return (vim.env.MASON or (vim.fn.stdpath("data") .. "/mason")) .. "/packages/" .. pkg .. "/" .. (path or "")
end

return M
