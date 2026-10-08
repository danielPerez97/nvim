vim.pack.add({{ src = 'https://github.com/nvim-lualine/lualine.nvim', name = 'lualine' }})

require('lualine').setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = {
			{
				"mode",
				fmt = function(str)
					local mode_map = {
						["NORMAL"] = "NORMAL",
						["INSERT"] = "INSERT",
						["VISUAL"] = "VISUAL",
						["V-LINE"] = "V-LINE",
						["V-BLOCK"] = "V-BLOCK",
						["COMMAND"] = "COMMAND",
						["REPLACE"] = "REPLACE",
						["SELECT"] = "SELECT",
						["S-LINE"] = "S-LINE",
						["S-BLOCK"] = "S-BLOCK",
						["TERMINAL"] = "TERMINAL",
					}
					return mode_map[str] or str
				end,
			},
		},
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = {
			{
				function()
					if vim.treesitter.highlighter.active[vim.api.nvim_get_current_buf()] then
						return " TS"
					end
					return ""
				end,
				color = { fg = "#89b4fa" },
			},
			{
				function()
					local names = {}
					for _, c in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
						table.insert(names, c.name)
					end
					if #names > 0 then
						return " " .. table.concat(names, ", ")
					end
					return ""
				end,
				color = { fg = "#f9e2af" },
			},
			{
				function()
					local formatters = {}
					local buf = vim.api.nvim_get_current_buf()
					local ft = vim.bo[buf].filetype

					local ok, conform = pcall(require, "conform")
					if ok then
						local conform_formatters = conform.list_formatters(buf)
						for _, formatter in ipairs(conform_formatters) do
							table.insert(formatters, formatter.name)
						end
					end

					local null_ok, null_ls = pcall(require, "null-ls")
					if null_ok then
						local sources = require("null-ls.sources")
						local available = sources.get_available(ft, "NULL_LS_FORMATTING")
						for _, source in ipairs(available) do
							table.insert(formatters, source.name)
						end
					end

					if #formatters > 0 then
						return "󰁨 " .. table.concat(formatters, ", ")
					end
					return ""
				end,
				color = { fg = "#a6e3a1" },
			},
			"encoding",
			"fileformat",
			"filetype",
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
