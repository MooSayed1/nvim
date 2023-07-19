local present, prettyFold = pcall(require, "pretty-fold")

if not present then
  return
end

prettyFold.setup {
  keep_indentation = true,
  fill_char = ".",
  sections = {
    left = {
      function()
        return string.rep("*", vim.v.foldlevel)
      end,
      "content",
    },
    right = {},
  },
  ft_ignore = {
    "nvdash",
    "terminal",
    "NvimTree",
    "nvcheatsheet"
  }
}
