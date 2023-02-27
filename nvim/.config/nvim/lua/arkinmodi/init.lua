require("arkinmodi.remap")
require("arkinmodi.set")

local augroup = vim.api.nvim_create_augroup

-- Highlight Yanks
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

-- Auto-Remove Whitespace
local whitespace_group = augroup('Whitespace', {})

autocmd({"BufWritePre"}, {
    group = whitespace_group,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})
