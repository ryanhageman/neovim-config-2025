local function null_ls_servers()
	local null_ls_s, null_ls = pcall(require, "null-ls")
	local servers = {}

	if null_ls_s then
		local sources = null_ls.get_sources()
		local buf_ft = vim.bo.filetype

		for _, source in ipairs(sources) do
			if source._validated then
				for ft_name, ft_active in pairs(source.filetypes) do
					if ft_name == buf_ft and ft_active then
						table.insert(servers, source.name)
					end
				end
			end
		end
	end

	return servers
end

local function get_attached_lsp_servers()
	local current_buffer = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients({ bufnr = current_buffer })
	local servers = {}

	for _, client in pairs(clients) do
		if client.name == "null-ls" then
			local null_clients = null_ls_servers()

			for _, null_client in pairs(null_clients) do
				table.insert(servers, null_client)
			end

			goto continue
		end

		table.insert(servers, client.name)
		::continue::
	end

	return servers
end

local function lsp_servers()
	local server_list = get_attached_lsp_servers()
	if #server_list <= 1 then
		return table.concat(server_list, ", ")
	else
		return "[" .. table.concat(server_list, ", ") .. "]"
	end
end

return lsp_servers
