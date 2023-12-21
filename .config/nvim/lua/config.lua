-- Neovim Configuration
-- 

-- [[ Configure ALE ]]
-- See `:help ale`
vim.g.ale_fix_on_save = 1
vim.g.ale_linters_explicit = 1
vim.g.ale_linters = {
    ['ansible'] = { 'ansible-lint' },
    ['bash'] = { 'shellcheck' },
    ['c'] = { 'clang' },
    ['cpp'] = { 'clang' },
    ['css'] = { 'prettier' },
    ['dockerfile'] = { 'hadolint' },
    ['html'] = { 'tidy' },
    ['javascript'] = { 'prettier' },
    ['json'] = { 'jq' },
    ['lua'] = { 'luacheck' },
    ['python'] = { 'flake8' },
    ['rust'] = { 'rustc' },
    ['scss'] = { 'stylelint' },
    ['terraform'] = { 'terraform' },
    ['tsx'] = { 'prettier' },
    ['typescript'] = { 'prettier' },
    ['yaml'] = { 'yamllint' },
}

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = '*',
})

-- [[ Configure Telescope and FZF ]]
require('telescope').setup {
	defaults = {
		preview = {
			timeout = 500,
		},
		multi_icon = " ",
	    prompt_prefix = "❯ ",
    	selection_caret = "❯ ",
		sorting_strategy = 'ascending',
		layout_config = {
			prompt_position = 'bottom',
			horizontal = {
				width_padding = 0.04,
				height_padding = 0.1,
				preview_width = 0.6,
			},
			vertical = {
				width_padding = 0.05,
				height_padding = 1,
				preview_height = 0.5,
			},
		},
		mappings = {
			i = {
				['<C-u>'] = false,
				['<C-d>'] = false,
			},
		},
		dynamic_preview_title = true,
		winblend = 4
	},
	extensions = {
		fzf = {
			fuzzy = true,					 -- false will only do exact matching
			override_generic_sorter = true,  -- override the generic sorter
			override_file_sorter = true,	 -- override the file sorter
			case_mode = 'smart_case',		 -- or "ignore_case" or "respect_case"
		}
	},
}

-- Enable telescope fzf natived
-- require('telescope').load_extension('fzf')


-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
	-- Add languages to be installed here that you want installed for treesitter
	ensure_installed = { 'bash', 'c', 'cpp', 'dockerfile', 'go', 'html', 'javascript', 'latex', 'lua', 'python', 'rust', 'scss', 'terraform', 'tsx', 'typescript', 'vimdoc', 'vim' },

	-- Autoinstall languages that are not installed. Defaults to false 
	auto_install = false,

	highlight = { enable = true },
	indent = { enable = true },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = '<c-space>',
			node_incremental = '<c-space>',
			scope_incremental = '<c-s>',
			node_decremental = '<M-space>',
		},
	},
}
-- Enable treesitter folding
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = false

-- [[ Configure Copilot ]]
--
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""


-- [[ Configure CMP ]]
-- See `:help nvim-cmp`
local cmp = require('cmp')
-- Configure Luasnip
local luasnip = require('luasnip')
require('luasnip/loaders/from_vscode').lazy_load() -- Lazy load snippets from runtime
luasnip.config.setup {}

-- Configure CMP Completion Signature Icons
local kind_icons = {
	Text = "",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
	Field = "󰇽",
	Variable = "󰂡",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "󰅲",
	Copilot = "",
}
local kind_codicons = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
	Copilot = "",
}

cmp.setup({
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered()
	},
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	mapping = {
		['<Up>'] = cmp.mapping.select_prev_item(),
		['<Down>'] = cmp.mapping.select_next_item(),
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true
		},
		['<Tab>'] = cmp.mapping(function(fallback)
--			if cmp.visible() and has_words_before() then
			if cmp.visible() then
--				cmp.select_next_item()
                local entry = cmp.get_selected_entry()
				cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
--                if not entry then
--                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
--                else
--                    cmp.confirm()
--                end
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
            else
				local copilot_keys = vim.fn["copilot#Accept"]()
				if copilot_keys ~= "" then
					vim.api.nvim_feedkeys(copilot_keys, "i", true)
				else
					fallback()
				end
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	},
	sources = {
		{ name = 'nvim_lsp', group_index = 2 },
		{ name = 'treesitter', group_index = 2 },
		{ name = 'luasnip', group_index = 2 },
		{ name = 'buffer', group_index = 3, priority=-1 },
	},
	formatting = {
		format = function(entry, vim_item)
			fields = { "kind", "abbr", "menu" }
			vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item
			local menu_icon = {
				nvim_lsp = 'λ',
				luasnip = '⋗',
				treesitter = '',
				buffer = 'Ω',
				path = '🖫',
			}
			vim_item.menu = menu_icon[entry.source.name]
			return vim_item
		end,
	},
})
cmp.setup.cmdline({'/', '?'}, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' },
	},
})
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	}),
})


-- [[ Configure Mason ]]
-- See `:help mason`
local servers = {'ansiblels', 'bashls', 'clangd', 'dockerls', 'eslint', 'html', 'jsonls', 'lua_ls', 'pyright', 'rust_analyzer', 'tailwindcss', 'tsserver', 'vimls', 'yamlls'}
require('mason').setup()
require('mason-lspconfig').setup({
--	ensure_installed = servers
})

-- [[ Configure LSP ]]
-- See `:help nvim-lspconfig`
-- See `:help lspconfig`
local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        capabilities = capabilities,
    }
end

-- Custom Server configs
--
-- Lua
lspconfig.lua_ls.setup{
	on_init = function(client)
		client.config.settings = vim.tbl_deep_extend(
			'force',
			client.config.settings.Lua or {},
			{
				Lua = {
					diagnostics = {
						globals = { 'vim' },
					},
				},
			}
		)
	end
}


-- [[ Configure Diagnostics ]]
local sign = function(opts)
	vim.fn.sign_define(opts.name, {
		text = opts.text,
		texthl = opts.name,
		numhl = '',
	})
end

sign({ name = 'LspDiagnosticsSignError', text = '' })
sign({ name = 'LspDiagnosticsSignWarn', text = '' })
sign({ name = 'LspDiagnosticsSignHint', text = '' })
sign({ name = 'LspDiagnosticsSignInfo', text = '' })

vim.diagnostic.config({
	underline = true,
	virtual_text = true,
	float = {
		source = 'always',
		border = 'rounded',
	},
	signs = true,
	update_in_insert = false,
	severity_sort = false,
})

