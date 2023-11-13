vim.opt.statusline = string.format(
	"[%s] %s %s %s %s %s,%s%s | %s | %s %s %s",
	"%{get(b:, 'gitsigns_head', 'No Git HEAD')}", -- current git HEAD
	"%f", -- short file name
	"%m", -- file modified flag
	"%r", -- read-only flag
	"%=", -- right align following items
	"%l", -- line number
	"%c", -- column number
	"%V", -- virtual column number
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
	if #client_names == 0 then
		return "[No LSP]"
	end
	return table.concat(client_names, " ")
end
