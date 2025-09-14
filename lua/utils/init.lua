local utils = { }

local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local os_info = vim.loop.os_uname()
local os_name = os_info.sysname

function utils.opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= 'o' then scopes['o'][key] = value end
end

function utils.map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function utils.detect_os()
    if os_name == 'Linux' then
        return 'linux'
    elseif os_name == 'Darwin' then
        return 'mac'
    elseif os_name:match('Windows') then
        return 'windows'
    else
        return 'unknown'
    end
end

return utils
