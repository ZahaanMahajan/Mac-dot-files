return {
	"neovim/nvim-lspconfig",
	opts = {
		inlay_hints = { enabled = false },
		---@type lspconfig.options
		servers = {
			dartls = {},
			["*"] = {
				-- Global LSP keymaps for all servers
				keys = {
					{
						"gd",
						function()
							require("telescope.builtin").lsp_definitions({ reuse_win = false })
						end,
						desc = "Goto Definition",
						has = "definition",
					},
				},
			},
			cssls = {},
			tailwindcss = {
				root_dir = function(...)
					return require("lspconfig.util").root_pattern(".git")(...)
				end,
			},
			tsserver = {
				root_dir = function(...)
					return require("lspconfig.util").root_pattern(".git")(...)
				end,
				single_file_support = false,
				settings = {
					typescript = {
						inlayHints = {
							includeInlayParameterNameHints = "literal",
							includeInlayFunctionParameterTypeHints = true,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayEnumMemberValueHints = true,
						},
					},
					javascript = {
						inlayHints = {
							includeInlayParameterNameHints = "all",
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayEnumMemberValueHints = true,
						},
					},
				},
			},
			html = {},
			yamlls = {
				settings = { yaml = { keyOrdering = false } },
			},
			lua_ls = {
				single_file_support = true,
				settings = {
					Lua = {
						workspace = { checkThirdParty = false },
						completion = { workspaceWord = true, callSnippet = "Both" },
						hint = {
							enable = true,
							setType = false,
							paramType = true,
							paramName = "Disable",
							semicolon = "Disable",
							arrayIndex = "Disable",
						},
						diagnostics = {
							disable = { "incomplete-signature-doc", "trailing-space" },
							unusedLocalExclude = { "_*" },
						},
						format = {
							enable = false,
							defaultConfig = {
								indent_style = "space",
								indent_size = "2",
								continuation_indent_size = "2",
							},
						},
					},
				},
			},
		},
		setup = {},
	},
}
