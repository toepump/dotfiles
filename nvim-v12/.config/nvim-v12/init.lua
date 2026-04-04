--: OPTIONS =======================================================================================
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = 'a'
vim.o.showmode = false
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.o.inccommand = 'split'
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.confirm = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
    vim.o.clipboard = 'unnamedplus'
end)

--: BASIC KEYMAPS =================================================================================
-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Show the diagnostic menu popover
vim.keymap.set('n', '<leader>dd', function()
    return vim.diagnostic.open_float()
end, { noremap = true, silent = true, desc = 'Show diagnostic in popup' })

-- Project wide search and replace
vim.api.nvim_create_user_command('Replace', function()
    local search = vim.fn.input 'Search for: '
    if search == '' then
        return
    end
    local replace = vim.fn.input('Replace "' .. search .. '" with: ')

    -- Execute across quickfix and handle the "quit" case gracefully
    local success = pcall(function()
        vim.cmd('cfdo %s/' .. search .. '/' .. replace .. '/gc | update')
    end)

    if not success then
        print 'Substitution aborted or failed.'
    end
end, { desc = 'Project-wide search and replace' })
vim.keymap.set('n', '<leader>spr', ':Replace<CR>', { desc = '[S]earch Project and [R]eplace' })

--: BASIC AUTOCOMMANDS ============================================================================
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

--: PLUGINS =======================================================================================
-- help neovim identify filestypes better for LSP purposes
require 'toepump.filetypes'
-- install plugins with Lazy plugin manager
require 'toepump.lazy'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
