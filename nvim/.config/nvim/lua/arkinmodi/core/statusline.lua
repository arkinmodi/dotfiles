vim.opt.statusline = string.format(
	"[%s] %s %s %s %s%s %s/%s | %s | %s %s %s",
	"%{get(b:, 'gitsigns_head', 'No Git')}", -- current git HEAD
	"%f", -- short file name
	"%m", -- file modified flag
	"%=", -- right align following items
	"%h", -- help flag
	"%r", -- read-only flag
	"%l", -- current line number
	"%L", -- total line numbers
	"%{v:lua.StatuslineLspClients()}", -- attached LSPs
	"%{strlen(&fenc)?&fenc:'none'}", -- file encoding
	"%{&ff}", -- file format
	"%y" -- file type
)

function StatuslineLspClients()
	local clients = vim.lsp.buf_get_clients()
	local client_names = {}
	for _, client in pairs(clients) do
		table.insert(client_names, client["name"])
	end
	local concatenated_string = table.concat(client_names, ", ")
	if concatenated_string == "" then
		return "[No LSP]"
	end
	return concatenated_string
end
