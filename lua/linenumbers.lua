local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local group = augroup("hybrid-numbering", { clear = true })
local ignore = {}

local function toggle_relative_numbering()
    -- does nothing for specific filetypes (listed in ignore above)
    if ignore[vim.bo.filetype] then
        return
    end
    -- else use relative numbering in normal and visual modes
    local mode = vim.api.nvim_get_mode().mode
    vim.wo.relativenumber = (mode == "n" or mode == "v")
end

-- set line relative numbering
vim.o.number = true
vim.o.relativenumber = true
-- set autocmd to toggle relative numbering
--- non-focused window: absolute numbering 
autocmd({ "BufLeave", "FocusLost", "WinLeave" }, {
    pattern = "*",
    group = group,
    callback = function(event)
        vim.wo.relativenumber = false
    end,
})
--- focused window: hybrid mode-dependent numbering
autocmd({ "BufEnter", "FocusGained", "WinEnter" }, {
    pattern = { "*" },
    group = group,
    callback = function(event)
        toggle_relative_numbering()
    end
})
autocmd("ModeChanged", {
    pattern = { "*:*" },
    group = group,
    callback = function(event)
        toggle_relative_numbering()
    end,
})
