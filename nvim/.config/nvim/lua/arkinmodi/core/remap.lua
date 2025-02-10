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
vim.keymap.set("n", "%", "%zz", { desc = "move cursor to matching character and center cursor" })
vim.keymap.set(
	"n",
	"*",
	"*zz",
	{ desc = "move cursor to next occurrence of hovered word and center cursor" }
)
vim.keymap.set(
	"n",
	"#",
	"#zz",
	{ desc = "move cursor to previous occurrence of hovered word and center cursor" }
)
vim.keymap.set("n", "{", "{zz", { desc = "jump to next paragraph and center cursor" })
vim.keymap.set("n", "}", "}zz", { desc = "jump to previous paragraph and center cursor" })
vim.keymap.set(
	"n",
	"<C-i>",
	"<C-i>zz",
	{ desc = "go to newer position in jump list and center cursor" }
)
vim.keymap.set(
	"n",
	"<C-o>",
	"<C-o>zz",
	{ desc = "go to older position in jump list and center cursor" }
)

vim.keymap.set("n", "Q", "<nop>", { desc = "never use ex mode" })
vim.keymap.set("n", "x", '"_x', { desc = "delete character without yanking" })

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "copy selection to clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "copy current line to clipboard" })

vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "delete selection without yanking" })
vim.keymap.set("n", "<leader>D", '"_D', { desc = "delete current line without yanking" })

-- quick-fix navigation
vim.keymap.set("n", "[q", "<cmd>cprev<CR>zz", { desc = "cpext with centered cursor" })
vim.keymap.set("n", "]q", "<cmd>cnext<CR>zz", { desc = "cnext with centered cursor" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "lnext with centered cursor" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "lpext with centered cursor" })

-- global replace word cursor is on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {
	desc = "find and replace the word the cursor is over (globally and not ignoring case for the pattern)",
})

vim.keymap.set("i", "<S-Tab>", "<C-d>", { desc = "un-indent" })

-- diagnostics
vim.keymap.set("n", "<leader>d", vim.diagnostic.setqflist, { desc = "vim.diagnostic.setqflist" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "vim.diagnostic.goto_prev" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "vim.diagnostic.goto_next" })
vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "vim.diagnostic.open_float" })
vim.diagnostic.config({
	update_in_insert = true,
	float = { focusable = false, source = true },
})

-- buffer
vim.keymap.set("n", "[b", "<cmd>bprev<CR>", { desc = "bprev" })
vim.keymap.set("n", "]b", "<cmd>bnext<CR>", { desc = "bnext" })
vim.keymap.set("n", "<leader>bq", "<cmd>bdelete<CR>", { desc = "bdelete" })

-- LSP
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border
		or {
			{ "┌", "FloatBorder" },
			{ "─", "FloatBorder" },
			{ "┐", "FloatBorder" },
			{ "│", "FloatBorder" },
			{ "┘", "FloatBorder" },
			{ "─", "FloatBorder" },
			{ "└", "FloatBorder" },
			{ "│", "FloatBorder" },
		}
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

vim.keymap.set("n", "\\", "<cmd>noh<CR>", { desc = "clear search highlighting" })
