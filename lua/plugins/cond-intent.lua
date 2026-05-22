return {
  {
    'IAMLEIzZ/code-intent',
    dependencies = {
      'nvim-treesitter/nvim-treesitter', -- optional but recommended
    },
    keys = {
      { '<leader>ia', '<cmd>IntentAnalyze<cr>', desc = 'Intent: Analyze function' },
      { '<leader>it', '<cmd>IntentToggle<cr>', desc = 'Intent: Toggle panel' },
      { '<leader>ir', '<cmd>IntentRefresh<cr>', desc = 'Intent: Refresh (ignore cache)' },
      { '<leader>iR', ':IntentRetag ', desc = 'Intent: Retag block' },
    },
    config = function()
      require('code-intent').setup({
        model = 'deepseek-v4-pro',
        api_key = 'sk-db52bd162e1e42479b5387a2dc65fc57',
        api_base = 'https://api.deepseek.com/v1/chat/completions',
        -- Optional: customize colors
        colors = {
          validation     = '#4CAF50', -- Green: input validation
          query          = '#2196F3', -- Blue: data query/IO
          core_logic     = '#FF9800', -- Orange: core business logic
          error_handling = '#F44336', -- Red: error handling
          side_effect    = '#9C27B0', -- Purple: side effects/async/cleanup
          default        = '#9E9E9E', -- Gray: others
        },
        panel_position = 'right', -- 'right' | 'left' | 'float'
        auto_analyze = false,     -- auto-analyze on file open
      })
    end,
  },
}
