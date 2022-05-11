vim.g.mapleader = " "

local keymap = vim.api.nvim_set_keymap

local opts = { noremap = true }

-- Normal Mode --

-- Better Window Navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Navigate Buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<S-W>", ":Bdelete<CR>", opts)

-- Format
keymap("n", "<M-f>", "<CMD>:Format<CR>", opts)

-- Visual Mode --

-- macOS sends encoded characters when combined with the Alt/Option key
-- In iTerm, Preferences > Profiles > Keys > Change Option Key to Esc+
-- https://stackoverflow.com/a/35705895
-- <Alt-j> = <M-j>
-- <Alt-k> = <M-k>
keymap("v", "<M-j>", ":m '>+1<CR>gv=gv", opts) -- shift selected lines up
keymap("v", "<M-k>", ":m '<-2<CR>gv=gv", opts) -- shift selected lines down

keymap("v", "p", '"_dP', opts) -- paste without yank

-- Indent left and right
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Terminal --

-- Telescope
keymap("n", "<C-p>", "<CMD>lua require('telescope.builtin').git_files()<CR>", opts)
keymap("n", "<S-p>", "<CMD>lua require('telescope.builtin').find_files()<CR>", opts)
keymap("n", "<S-f>", "<CMD>lua require('telescope.builtin').live_grep()<CR>", opts) -- NEEDS ripgrep installed

-- Nvim Tree (Side Bar File Explorer)
keymap("n", "<M-e>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<M-r>", ":NvimTreeRefresh<CR>", opts)
