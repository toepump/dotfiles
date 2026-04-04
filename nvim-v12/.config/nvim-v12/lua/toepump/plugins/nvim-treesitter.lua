return { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        local treesitter = require 'nvim-treesitter'
        treesitter.setup()
        treesitter.install { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc', 'gdscript' }
        vim.api.nvim_create_autocmd('FileType', {
            pattern = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc', 'gdscript' },
            callback = function()
                -- syntax highlighting, provided by Neovim
                vim.treesitter.start()
                -- folds, provided by Neovim (commented out because folds confusing)
                -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                -- vim.wo.foldmethod = 'expr'
                -- indentation, provided by nvim-treesitter
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
}
