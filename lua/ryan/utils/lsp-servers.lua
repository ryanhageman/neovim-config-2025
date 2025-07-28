local function get_conform_formatters()
	local conform_ok, conform = pcall(require, "conform")
	if not conform_ok then
		return {}
	end

	local buf_ft = vim.bo.filetype
	local formatters = conform.list_formatters(0) -- 0 = current buffer
	local formatter_names = {}

	for _, formatter in ipairs(formatters) do
		if formatter.available then
			table.insert(formatter_names, formatter.name)
		end
	end

	return formatter_names
end

local function get_lint_linters()
	local lint_ok, lint = pcall(require, "lint")
	if not lint_ok then
		return {}
	end

	local buf_ft = vim.bo.filetype
	local linters = lint.linters_by_ft[buf_ft] or {}
	local available_linters = {}

	for _, linter_name in ipairs(linters) do
		-- Check if linter is actually available (you could add more sophisticated checking here)
		table.insert(available_linters, linter_name)
	end

	return available_linters
end

local function get_attached_lsp_servers()
	local current_buffer = vim.api.nvim_get_current_buf()
	local clients = vim.lsp.get_clients({ bufnr = current_buffer })
	local servers = {}

	for _, client in pairs(clients) do
		table.insert(servers, client.name)
	end

	return servers
end

local function lsp_servers()
	local lsp_servers = get_attached_lsp_servers()
	local formatters = get_conform_formatters()
	local linters = get_lint_linters()

	local all_tools = {}

	-- Add LSP servers
	for _, server in ipairs(lsp_servers) do
		table.insert(all_tools, server)
	end

	-- Add formatters
	for _, formatter in ipairs(formatters) do
		table.insert(all_tools, formatter .. " (✨)")
	end

	-- Add linters
	for _, linter in ipairs(linters) do
		table.insert(all_tools, linter .. " (🔍)")
	end

	if #all_tools == 0 then
		return "none"
	elseif #all_tools == 1 then
		return all_tools[1]
	else
		return "[" .. table.concat(all_tools, ", ") .. "]"
	end
end

return lsp_servers
