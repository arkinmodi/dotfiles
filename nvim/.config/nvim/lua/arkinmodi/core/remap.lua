vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "open netrw" })

-- Move selected blocks of text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move selected block of text down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move selected block of text up" })

-- cursor remain in same place
vim.keymap.set(
	"n",
	"J",
	"mzJ`z",
	{ desc = "inline the next line with a space seperator without moving cursor" }
)

-- keep cursor in middle
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move screen down 1/2 page and center cursor" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move screen up 1/2 page and center cursor" })
vim.keymap.set("n", "n", "nzzzv", { desc = "repeat search in same direction and center cursor" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "repeat search in reverse direction and center cursor" })

vim.keymap.set("n", "Q", "<nop>", { desc = "never use ex mode" })
vim.keymap.set("n", "x", '"_x', { desc = "delete character without yanking" })

-- quick-fix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "cnext with centered cursor" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "cpext with centered cursor" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "lnext with centered cursor" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "lpext with centered cursor" })

-- global replace word cursor is on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {
	desc = "find and replace the word the cursor is over (globally and not ignoring case for the pattern)",
})

vim.keymap.set("i", "<S-Tab>", "<C-d>", { desc = "un-indent" })
