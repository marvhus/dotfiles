require("marvhus.set")
require("marvhus.remap")
require("marvhus.packer")

require("presence"):setup {
	neovim_image_text = "Neovim",
	presence_log_level = "error",
	presence_editing_text = "Editing « %s »",
	presence_file_explorer_text = "Browsing files",
	presence_reading_text = "Reading  « %s »",
	presence_workspace_text = "Working on « %s »",
}

-- lsp

local luasnip = require "luasnip"
local cmp = require "cmp"
cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert {
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true },
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { "i", "s" }),
	},
	sources = { { name = "nvim_lsp" }, { name = "luasnip" } },
}

local servers = {
	"bashls",
	"clangd",
	"cssls",
	"gopls",
	"html",
	"pyright",
	"rust_analyzer",
	"sumneko_lua",
	"tailwindcss",
	"tsserver",
}
local has_formatter = { "gopls", "html", "rust_analyzer", "sumneko_lua", "tsserver" }
for _, name in pairs(servers) do
	local found, server = require("nvim-lsp-installer").get_server(name)
	if found and not server:is_installed() then
		print("Installing " .. name)
		server:install()
	end
end
local setup_server = {
	sumneko_lua = function(opts)
		opts.settings = { Lua = { diagnostics = { globals = { "vim" } } } }
	end,
}
require("nvim-lsp-installer").on_server_ready(function(server)
	local opts = {
		on_attach = function(client, bufnr)
			vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
			local opts = { buffer = bufnr }
			vim.keymap.set("n", "<Leader>h", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "<Leader>i", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "<Leader>r", vim.lsp.buf.rename, opts)
			local should_format = true
			for _, value in pairs(has_formatter) do
				if client.name == value then
					should_format = false
				end
			end
			if not should_format then
				client.resolved_capabilities.document_formatting = false
			end
		end,
		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	}
	if setup_server[server.name] then
		setup_server[server.name](opts)
	end
	server:setup(opts)
end)

-- Null ls
local null_ls = require "null-ls"
null_ls.setup {
	sources = {
		null_ls.builtins.diagnostics.eslint_d,
		null_ls.builtins.formatting.autopep8,
		null_ls.builtins.formatting.eslint_d,
		null_ls.builtins.formatting.gofmt,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.rustfmt,
		null_ls.builtins.formatting.stylua,
	},
}

-- Gitsigns
require("gitsigns").setup {
	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
	},
}

local telescope = require "telescope"
telescope.setup {
	defaults = {
		mappings = { n = { ["o"] = require("telescope.actions").select_default } },
		initial_mode = "normal",
		hidden = true,
		file_ignore_patterns = { ".git/", "node_modules/", "target/" },
	},
	extensions = { file_browser = { hidden = true } },
}
telescope.load_extension "file_browser"
vim.keymap.set("n", "<Leader>n", telescope.extensions.file_browser.file_browser)
vim.keymap.set("n", "<Leader>f", require("telescope.builtin").find_files)
vim.keymap.set("n", "<Leader>t", require("telescope.builtin").treesitter)

require("nvim-treesitter.configs").setup {
	ensure_installed = {
		"bash",
		"cpp",
		"css",
		"go",
		"html",
		"lua",
		"make",
		"python",
		"rust",
		"tsx",
		"typescript",
		"yaml",
	},
	highlight = { enable = true },
}

require("rust-tools").setup {}

vim.keymap.set({ "n", "v" }, "<Leader>c", ":Commentary<CR>", { silent = true })

require("nvim-autopairs").setup {}

require("lsp_lines").setup {}
vim.keymap.set("n", "<Leader>x", require("lsp_lines").toggle)
