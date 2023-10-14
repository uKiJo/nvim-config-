local M = {
  filetype = {
    javascript = {
      require("formatter.filetypes.javascript").prettier,
    },
    typescript = {
      require("formatter.filetypes.typescript").prettier,
    },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace,
    },
    lua = {
      require("formatter.filetypes.lua").stylua,
    },
    cpp = {
      require("formatter.filetypes.cpp")["clang-format"],
    },
  },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  command = "FormatWriteLock",
})

return M
