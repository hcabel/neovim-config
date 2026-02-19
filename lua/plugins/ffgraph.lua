return {
  {
    "ffmpeg-syntax",
    name = "ffmpeg-syntax",
    virtual = true,
    lazy = false,
    config = function()
      vim.filetype.add({
        extension = {
          ffgraph = "ffmpeg",
        },
      })

      vim.api.nvim_set_hl(0, "FfPad", { fg = "#e06c75", bold = true, default = true })
      vim.api.nvim_set_hl(0, "FfOperator", { link = "Operator", default = true })
      vim.api.nvim_set_hl(0, "FfNumber", { link = "Number", default = true })
      vim.api.nvim_set_hl(0, "FfFilter", { link = "Function", default = true })
      vim.api.nvim_set_hl(0, "FfParam", { link = "Identifier", default = true })
      vim.api.nvim_set_hl(0, "FfKeyword", { link = "String", default = true })
      vim.api.nvim_set_hl(0, "FfExpr", { link = "Keyword", default = true })

      local augroup = vim.api.nvim_create_augroup("FfmpegSyntax", { clear = true })

      local function apply_syntax()
        if vim.bo.filetype ~= "ffmpeg" then return end

        if vim.w.ffmpeg_matches then
          for _, id in ipairs(vim.w.ffmpeg_matches) do
            pcall(vim.fn.matchdelete, id)
          end
        end

        vim.w.ffmpeg_matches = {
          vim.fn.matchadd("FfPad", "\\[\\zs[^\\]]\\+\\ze\\]"),

          vim.fn.matchadd("FfOperator", "[+-=:,]"),
          vim.fn.matchadd("FfNumber", "[-]\\?\\d\\+\\(\\.\\d\\+\\)\\?[ms]*\\>"),
          vim.fn.matchadd("FfFilter", "\\(^\\|\\s\\|;\\|,\\)\\@<=[a-zA-Z0-9_]\\+\\ze="),
          vim.fn.matchadd("FfParam", "\\([:=]\\)\\@<=[a-zA-Z0-9_]\\+\\ze="),
          vim.fn.matchadd("FfExpr", "\\<\\(PTS\\|TB\\|STARTPTS\\|pass\\)\\>")
        }
      end

      local function clear_syntax()
        if vim.w.ffmpeg_matches then
          for _, id in ipairs(vim.w.ffmpeg_matches) do
            pcall(vim.fn.matchdelete, id)
          end
          vim.w.ffmpeg_matches = nil
        end
      end

      vim.api.nvim_create_autocmd({ "FileType", "WinEnter", "BufEnter" }, {
        group = augroup,
        callback = apply_syntax,
      })

      vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
        group = augroup,
        callback = clear_syntax,
      })
    end,
  }
}
