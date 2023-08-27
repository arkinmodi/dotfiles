local editorconfig = require("editorconfig")

-- Default behaviour is to set `textwidth`. Not a fan of forced wrapping
-- https://github.com/neovim/neovim/blob/abb8c2c453d1e084f8ab3e9bbaa8b27515c81a9f/runtime/lua/editorconfig.lua#L77-L85
editorconfig.properties.max_line_length = function(_, val)
	local n = tonumber(val)
	if n then
		vim.opt.colorcolumn = tostring(n + 1)
	else
		assert(val == "off", 'max_line_length must be a number or "off"')
		vim.opt.colorcolumn = ""
	end
end
