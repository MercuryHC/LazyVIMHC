-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    animate = {},
    bigfile = {},
    bufdelete = {},
    debug = { enabled = false },
    dim = {},
    git = {},
    gitbrowse = {},
    indent = {},
    input = {},
    lazygit = {},
    notify = {},
    notifier = {
      timeout = 3000,
    },
    quickfile = {},
    rename = { enabled = false },
    scope = {},
    scroll = {},
    statuscolumn = {},
    terminal = {},
    toggle = {},
    win = {},
    words = {},
    zen = {},
    styles = {
      notification = {
        wo = { wrap = true }, -- Wrap notifications
      },
    },
    dashboard = {
      sections = {
        -- { section = "header" },
        {
          header = [[
██╗  ██╗███████╗██╗     ██╗      ██████╗     ███╗   ██╗██╗   ██╗██╗███╗   ███╗
██║  ██║██╔════╝██║     ██║     ██╔═══██╗    ████╗  ██║██║   ██║██║████╗ ████║
███████║█████╗  ██║     ██║     ██║   ██║    ██╔██╗ ██║██║   ██║██║██╔████╔██║
██╔══██║██╔══╝  ██║     ██║     ██║   ██║    ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║  ██║███████╗███████╗███████╗╚██████╔╝    ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝ ╚═════╝     ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
]],
        },
        { section = "keys", padding = 1 },
        { pane = 1, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { pane = 1, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        {
          pane = 1,
          icon = " ",
          title = "Git Status",
          section = "terminal",
          enabled = function()
            return Snacks.git.get_root() ~= nil
          end,
          cmd = "git status --short --branch --renames",
          height = 5,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        },
        { section = "startup" },
      },
    },
  },
  keys = {
    {
      "<leader>un",
      function()
        Snacks.notifier.hide()
      end,
      desc = "Dismiss All Notifications",
    },
    {
      "<leader>bd",
      function()
        Snacks.bufdelete()
      end,
      desc = "Delete buffer",
    },
    {
      "<leader>bda",
      function()
        Snacks.bufdelete.all()
      end,
      desc = "Delete all buffer",
    },
    {
      "<leader>bdh",
      function()
        Snacks.bufdelete.other()
      end,
      desc = "Delete other buffer",
    },
    {
      "<leader>gg",
      function()
        Snacks.lazygit()
      end,
      desc = "Lazygit",
    },
    {
      "<leader>gb",
      function()
        Snacks.git.blame_line()
      end,
      desc = "Git Blame Line",
    },
    {
      "<leader>gB",
      function()
        Snacks.gitbrowse()
      end,
      desc = "Git Browse",
    },
    {
      "<leader>gf",
      function()
        Snacks.lazygit.log_file()
      end,
      desc = "Lazygit Current File History",
    },
    {
      "<leader>gl",
      function()
        Snacks.lazygit.log()
      end,
      desc = "Lazygit Log (cwd)",
    },
    {
      "<leader>x",
      function()
        Snacks.terminal()
      end,
      desc = "Toggle Terminal",
    },
    {
      "<leader>ld",
      function()
        Snacks.terminal("lazydocker")
      end,
      desc = "Toggle Terminal",
    },
    {
      "<leader>ob",
      function()
        Snacks.terminal("overmind connect backend")
      end,
      desc = "Toggle Terminal",
    },
    {
      "<leader>gpr",
      function()
        Snacks.terminal("gh pr list && echo 'Press enter...'; read")
      end,
      desc = "PR list",
    },
    {
      "<leader>gprc",
      function()
        Snacks.terminal("gh pr create")
      end,
      desc = "PR Create",
    },
    {
      "<leader>gprm",
      function()
        Snacks.terminal("gh pr ready ; gh pr merge")
      end,
      desc = "PR merge",
    },
    {
      "<leader>gi",
      function()
        Snacks.terminal("gh issue list && echo 'Press enter...'; read")
      end,
      desc = "Issue list",
    },
    {
      "<leader>gio",
      function()
        Snacks.terminal("gh issue create")
      end,
      desc = "Issue create",
    },
    {
      "<leader>gic",
      function()
        local issue_number = vim.fn.input("Issue Number -> ")
        Snacks.terminal("gh issue close " .. issue_number)
      end,
    },
    {
      "]]",
      function()
        Snacks.words.jump(vim.v.count1)
      end,
      desc = "Next Reference",
    },
    {
      "[[",
      function()
        Snacks.words.jump(-vim.v.count1)
      end,
      desc = "Prev Reference",
    },
    {
      "<leader>.",
      function()
        Snacks.scratch()
      end,
      desc = "Toggle Scratch Buffer",
    },
    {
      "<leader>S",
      function()
        Snacks.scratch.select()
      end,
      desc = "Select Scratch Buffer",
    },
    {
      "<F8>",
      function()
        Snacks.zen()
      end,
      desc = "ZEN",
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Create some toggle mappings
        Snacks.toggle.treesitter():map("<leader>uT")
        Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
      end,
    })
  end,
}
