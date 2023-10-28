return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- VS Code Like Icons
  config = function()
    local lualine = require('lualine')
    local lazy_status = require('lazy.status') -- to configure lazy pending updates count

    local trans = {}
    trans.theme = function()
      local colors = {
        darkgray = '#16161d',
        gray = '#727169',
        innerbg = nil,
        outerbg = '#16161D',
        normal = '#7e9cd8',
        insert = '#98bb6c',
        visual = '#ffa066',
        replace = '#e46876',
        command = '#e6c384',
      }

      return {
        inactive = {
          a = { fg = colors.gray, bg = colors.outerbg, gui = 'bold' },
          b = { fg = colors.gray, bg = colors.outerbg },
          c = { fg = colors.gray, bg = colors.innerbg },
        },
        visual = {
          a = { fg = colors.darkgray, bg = colors.visual, gui = 'bold' },
          b = { fg = colors.gray, bg = colors.outerbg },
          c = { fg = colors.gray, bg = colors.innerbg },
        },
        replace = {
          a = { fg = colors.darkgray, bg = colors.replace, gui = 'bold' },
          b = { fg = colors.gray, bg = colors.outerbg },
          c = { fg = colors.gray, bg = colors.innerbg },
        },
        normal = {
          a = { fg = colors.darkgray, bg = colors.normal, gui = 'bold' },
          b = { fg = colors.gray, bg = colors.outerbg },
          c = { fg = colors.gray, bg = colors.innerbg },
        },
        insert = {
          a = { fg = colors.darkgray, bg = colors.insert, gui = 'bold' },
          b = { fg = colors.gray, bg = colors.outerbg },
          c = { fg = colors.gray, bg = colors.innerbg },
        },
        command = {
          a = { fg = colors.darkgray, bg = colors.command, gui = 'bold' },
          b = { fg = colors.gray, bg = colors.outerbg },
          c = { fg = colors.gray, bg = colors.innerbg },
        },
      }
    end

    -- Configure lualine with modified theme
    lualine.setup({
      options = {
        theme = trans.theme(),
      },
      sections = {
        lualine_x = {
          { -- Showing pending updates
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = '#ff9e64' },
          },
          { 'encoding' },
          { 'fileformat' },
          { 'filetype' },
        },
      },
    })
  end,
}
