local M = {}

local vault_path = vim.fn.expand("/Users/ryan/Library/CloudStorage/Dropbox/Excella Notes")

local exclude_dirs = { ".git", ".obsidian", "Ξ Templates", "Ξ Neovim Templates", "Ξ Attachments", "Ξ Images" }
local exclude_files = { ".nvim_wikilink_index.json" }

local link_index = {
	resolved = {},
	unresolved = {},
	per_file = {},
}

local function get_markdown_files()
	local cmd = {
		"rg",
		"--files",
		"--iglob",
		"*.md",
		vault_path,
	}

	for _, dir in ipairs(exclude_dirs) do
		table.insert(cmd, "--glob")
		table.insert(cmd, "!" .. dir .. "/**")
	end

	for _, file in ipairs(exclude_files) do
		table.insert(cmd, "--glob")
		table.insert(cmd, "!" .. file)
	end

	return vim.fn.systemlist(cmd)
end

local function extract_links_from_lines(lines)
	local links = {}
	for _, line in ipairs(lines) do
		for link in line:gmatch("%[%[([^%]|%]]+)") do
			link = link:match("^[^|]+") -- strip off alias if present
			table.insert(links, link)
		end
	end
	return links
end

local function get_note_title(path)
	return vim.fn.fnamemodify(path, ":t:r")
end

local function rebuild_index()
	local existing_titles = {}
	local all_links = {}
	local per_file = {}

	for _, file in ipairs(get_markdown_files()) do
		local title = get_note_title(file)
		existing_titles[title] = true

		local lines = vim.fn.readfile(file)
		local links = extract_links_from_lines(lines)

		if #links > 0 then
			per_file[file] = links
			for _, l in ipairs(links) do
				all_links[l] = true
			end
		end
	end

	local resolved, unresolved = {}, {}
	for link in pairs(all_links) do
		if existing_titles[link] then
			table.insert(resolved, link)
		else
			table.insert(unresolved, link)
		end
	end

	link_index = {
		resolved = resolved,
		unresolved = unresolved,
		per_file = per_file,
	}
end

function M.update_file(path)
	local lines = vim.fn.filereadable(path) == 1 and vim.fn.readfile(path) or {}
	local new_links = extract_links_from_lines(lines)
	link_index.per_file[path] = new_links

	local all_links = {}
	for _, links in pairs(link_index.per_file) do
		for _, l in ipairs(links) do
			all_links[l] = true
		end
	end

	local existing_titles = {}
	for _, file in ipairs(get_markdown_files()) do
		existing_titles[get_note_title(file)] = true
	end

	local resolved, unresolved = {}, {}
	for link in pairs(all_links) do
		if existing_titles[link] then
			table.insert(resolved, link)
		else
			table.insert(unresolved, link)
		end
	end

	link_index.resolved = resolved
	link_index.unresolved = unresolved
end

function M.init()
	rebuild_index()
end

function M.full_rebuild()
	rebuild_index()
end

function M.get_links()
	return link_index
end

return M
