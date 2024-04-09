return {
  "laytan/cloak.nvim",
  config = function()
    require("cloak").setup({
      cloak_character = "*",
      enabled = true,
      highlight_group = "Comment",
      patterns = {
        file_pattern = ".env*",
        cloak_pattern = "=.+",
      }
    })
  end
}
