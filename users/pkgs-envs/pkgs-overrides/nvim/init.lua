vim.o.exrc = true
vim.o.secure = true



vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true


vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = "a"
vim.opt.showmode = false

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

vim.cmd 'colorscheme habamax'
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<leader>m", ":make<CR>")
vim.keymap.set("n", "<Leader>t", "q:iterm ", {
	desc = "qucik term command"
})

-- terminal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- window
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<C-m>", "<C-w>-", { desc = "smaller" })
vim.keymap.set("n", "<C-p>", "<C-w>+", { desc = "bigger" })

-- buffers
--
vim.keymap.set('n', '<leader>q', '<cmd>bd<CR>', { desc = 'close current buffer' })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- auto complete
require("blink.cmp").setup({
	-- does not work on wsl :(
	cmdline = { enabled = false },
	term    = { enabled = false },
})
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })

vim.keymap.set('n', '<leader>ae', builtin.diagnostics, { desc = 'all errors' })
vim.keymap.set('n', '<leader>e', '<cmd>Telescope diagnostics bufnr=0<CR>', { desc = 'errors in current buffer' })

vim.keymap.set('n', '<leader>o', '<cmd>Oil<CR>', { desc = 'oil' })
vim.keymap.set('n', '<leader>w', builtin.grep_string, { desc = 'grep word' })

vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc, mode)
			mode = mode or 'n'
			vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
		end

		map('<leader>ca', vim.lsp.buf.code_action, 'Code [A]ction', { 'n', 'x' })
		map('<leader>f', vim.lsp.buf.format, 'format buffer', { 'n' })

		-- local function format_all_in_cwd()
		-- 	vim.cmd("args " .. vim.fn.getcwd() .. "/*")
		-- 	vim.cmd("argdo lua vim.lsp.buf.format() | update")
		-- end
		-- map('<leader>fa', format_all_in_cwd, 'format all files in cwd', { 'n' })

		map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
		map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
		map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
		map('gi', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
		map('gtd', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')
		map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')
		map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')


		-- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
		---@param client vim.lsp.Client
		---@param method vim.lsp.protocol.Method
		---@param bufnr? integer some lsp support methods only in specific files
		---@return boolean
		local function client_supports_method(client, method, bufnr)
			return client:supports_method(method, bufnr)
		end

		-- The following two autocommands are used to highlight references of the
		-- word under your cursor when your cursor rests there for a little while.
		--    See `:help CursorHold` for information about when this is executed
		--
		-- When you move your cursor, the highlights will be cleared (the second autocommand).
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
			local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight',
				{ clear = false })
			vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})

			vim.api.nvim_create_autocmd('LspDetach', {
				group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
				end,
			})
		end

		if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
			map('<leader>th', function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
			end, '[T]oggle Inlay [H]ints')
		end
	end,

})



vim.diagnostic.config {
	severity_sort = true,
	float = { border = 'rounded', source = 'if_many', wrap = true },
	underline = { severity = vim.diagnostic.severity.ERROR },
	signs = vim.g.have_nerd_font and {
		text = {
			[vim.diagnostic.severity.ERROR] = '󰅚 ',
			[vim.diagnostic.severity.WARN] = '󰀪 ',
			[vim.diagnostic.severity.INFO] = '󰋽 ',
			[vim.diagnostic.severity.HINT] = '󰌶 ',
		},
	} or {},
	virtual_text = {
		source = 'if_many',
		spacing = 2,
		format = function(diagnostic)
			local diagnostic_message = {
				[vim.diagnostic.severity.ERROR] = diagnostic.message,
				[vim.diagnostic.severity.WARN] = diagnostic.message,
				[vim.diagnostic.severity.INFO] = diagnostic.message,
				[vim.diagnostic.severity.HINT] = diagnostic.message,
			}
			return diagnostic_message[diagnostic.severity]
		end,
	},
}

-- do we even use this?
vim.lsp.config('lua_ls', {
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if
			    path ~= vim.fn.stdpath('config')
			    and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
			then
				return
			end
		end

		client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
			runtime = {
				version = 'LuaJIT',
				path = {
					'lua/?.lua',
					'lua/?/init.lua',
				},
			},
			-- Make the server aware of Neovim runtime files
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME
				}
			}
		})
	end,
	settings = {
		Lua = {}
	}
})


vim.lsp.enable('lua_ls')
vim.lsp.enable('zls')
vim.lsp.enable('nil_ls')
vim.lsp.enable('pyright')
vim.lsp.enable('gopls')

require 'nvim-treesitter.configs'.setup {
	highlight = {
		enable = true,
		disable = function(_, buf)
			local max_filesize = 300 * 1024
			local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
		additional_vim_regex_highlighting = false,
	},
}


require("oil").setup()
vim.keymap.set('n', '<leader>o', '<cmd>Oil<CR>', { desc = 'oil' })

-- debugger golang
local dap = require("dap")
local dapui = require("dapui")
local dapgo = require("dap-go")

-- Setup dap-ui
dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"]     = function() dapui.close() end

dap.adapters.go                                       = function(callback, _)
	callback({
		type = "server",
		host = "127.0.0.1",
		port = 2345,
	})
end

dap.configurations.go                                 = {
	{
		type = "go",
		name = "Attach to Windows Delve",
		request = "attach",
		mode = "remote",
		port = 2345,
		host = "127.0.0.1",
	},
}

dapgo.setup({
	dap_configurations = {
	},
	delve = {
		path = "dlv",
	},
})

vim.keymap.set("n", "<leader>r", function() dap.continue() end, { desc = "DAP Continue" })
vim.keymap.set("n", "<leader>b", function() dap.toggle_breakpoint() end, { desc = "DAP Toggle Breakpoint" })

-- vim.keymap.set("n", "<F10>", function() dap.step_over() end, { desc = "DAP Step Over" })
-- vim.keymap.set("n", "dsi", function() dap.step_into() end, { desc = "DAP Step Into" })
-- vim.keymap.set("n", "dso", function() dap.step_out() end, { desc = "DAP Step Out" })
vim.keymap.set("n", "<leader>dt", function() dapgo.debug_test() end, { desc = "DAP Debug Test" })
vim.keymap.set("n", "<leader>dl", function() dapgo.debug_last_test() end, { desc = "DAP Debug Last Test" })
--
vim.keymap.set("n", "<leader>dq", function() dap.terminate() end, { desc = "kill debug session" })
vim.keymap.set("n", "<F5>", function()
	dap.continue()
end, { desc = " dap continue" })


require("nvim-surround").setup({
})
