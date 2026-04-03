return {
    -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
        -- Load the colorscheme here.
        -- Like many other themes, this one has different styles, and you could load
        -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
        vim.cmd.colorscheme 'catppuccin-macchiato'
    end,
}

-- return {
--     'shaunsingh/nord.nvim',
--     name = 'nord',
--     priority = 1000,
--     config = function()
--         vim.g.nord_borders = true
--         vim.g.nord_enable_sidebar_background = true
--         vim.cmd.colorscheme 'nord'
--     end,
-- }

-- return {
--     -- You can easily change to a different colorscheme.
--     -- Change the name of the colorscheme plugin below, and then
--     -- change the command in the config to whatever the name of that colorscheme is.
--     --
--     -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
--     'olimorris/onedarkpro.nvim',
--     name = 'onedarkpro',
--     priority = 1000, -- Make sure to load this before all the other start plugins.
--     config = function()
--         -- Load the colorscheme here.
--         -- Like many other themes, this one has different styles, and you could load
--         -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
--         vim.cmd.colorscheme 'onedark'
--     end,
-- }

-- return {
--     'navarasu/onedark.nvim',
--     priority = 1000, -- make sure to load this before all the other start plugins
--     config = function()
--         require('onedark').setup {
--             style = 'deep',
--         }
--         vim.cmd.colorscheme 'onedark'
--     end,
