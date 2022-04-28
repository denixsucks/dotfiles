local present, scrollbar = pcall(require, 'scrollbar')
if not present then return end

local colors = require'catppuccin.api.colors'.get_colors()

local mark_text = {'--', '=='}

scrollbar.setup({
    show = true,
    handle = {
        text = "  ",
        color = colors.menu,
    },
    marks = {
        Search = { text = mark_text, priority = 0, color = colors.orange },
        Error = { text = mark_text, priority = 1, color = colors.red },
        Warn = { text = mark_text, priority = 2, color = colors.yellow },
        Info = { text = mark_text, priority = 3, color = colors.cyan },
        Hint = { text = mark_text, priority = 4, color = colors.green },
        Misc = { text = mark_text, priority = 5, color = colors.purple },
    },
})
