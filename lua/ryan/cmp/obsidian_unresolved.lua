-- -------------------------------------------------------------------
-- Project Config - In .nvim.lua -------------------------------------
-- -------------------------------------------------------------------

-- -- Initialize unresolved wikilink index
-- require("ryan.utils.wikilinks").init()

-- -- Update index only when a file is saved
-- vim.api.nvim_create_autocmd("BufWritePost", {
--   pattern = "*.md",
--   callback = function(args)
--     require("ryan.utils.wikilinks").update_file(args.file)
--   end,
-- })

-- local cmp = require("cmp")
-- cmp.register_source("obsidian_unresolved", require("ryan.cmp.obsidian_unresolved"))

-- cmp.setup({
--   sources = cmp.config.sources({
--     { name = "obsidian_unresolved" },
--     { name = "obsidian" },
--     { name = "obsidian_tags" },
--     { name = "obsidian_new" },
--     { name = "nvim_lsp" },
--     { name = "luasnip" },
--     { name = "buffer" },
--     { name = "path" },
--   }),
-- })

-- -------------------------------------------------------------------

local source = {}

-- Only activate in markdown
function source:is_available()
	return vim.bo.filetype == "markdown"
end

-- Only trigger inside wikilinks
function source:get_trigger_characters()
	return { "[" }
end

function source:get_keyword_pattern()
	return [[\[\[\k*]]
end

function source:complete(request, callback)
	local cursor = request.context and request.context.cursor_before_line or ""

	if not cursor:match("%[%[[^%]]*$") then
		return callback({ items = {}, isIncomplete = false })
	end

	local unresolved = require("ryan.utils.wikilinks").get_links().unresolved
	local items = {}

	for _, link in ipairs(unresolved) do
		local label = "[[" .. link .. "]]"

		table.insert(items, {
			label = label,
			abbr = label,
			filterText = label,
			insertText = "[[" .. link,
			sortText = link,
			kind = vim.lsp.protocol.CompletionItemKind.Reference,
			menu = "[unresolved]",
			documentation = {
				kind = "markdown",
				value = "**Unresolved** wikilink\nNote does not exist yet.",
			},
		})
	end

	callback({ items = items, isIncomplete = false })
end

return source
