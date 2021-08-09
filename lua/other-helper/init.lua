local M = {}

function M.check(expr)
    return vim.inspect(expr)
end

function M.reload_package(my_pkg)
    package.loaded[my_pkg] = nil
    return require(my_pkg)
end

return M
