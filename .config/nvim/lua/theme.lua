-- [[ Configure Colorscheme ]]
-- Catppuccino colorscheme

require("catppuccin").setup({
    flavor = "mocha",
    dim_inactive = {
        enabled = true, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.40, -- percentage of the shade to apply to the inactive window
    },
    integrations = {
        cmp = true,
        treesitter = true,
	    treesitter_context = true,
        mason = true,
        telescope = {
            enabled = true,
        },
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
            },
            underlines = {
                errors = { "underline" },
                hints = { "underline" },
                warnings = { "underline" },
                information = { "underline" },
            },
            inlay_hints = {
                background = true,
            },
        },
    },
	compile_path = vim.fn.stdpath "cache" .. "/catppuccin"
})
--vim.cmd.colorscheme "catppuccin" -- Set colorscheme

vim.cmd.colorscheme "gruvbox-material"
