return {
  {
    'iamcco/markdown-preview.nvim',
    build = 'cd app && npm install',
    ft = 'markdown',
    lazy = true,
    keys = { { 'gm', '<cmd>MarkdownPreviewToggle<cr>', desc = 'Markdown Preview' } },
  },
}
