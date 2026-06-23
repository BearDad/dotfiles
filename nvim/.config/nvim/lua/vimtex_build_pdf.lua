local M = {}

function M.open_pdf()
  local texfile = vim.fn.expand '%:p'
  local pdffile = vim.fn.expand '%:p:h' .. '/build/' .. vim.fn.expand '%:t:r' .. '.pdf'
  if vim.fn.filereadable(pdffile) == 0 then
    vim.notify('PDF not found: ' .. pdffile, vim.log.levels.WARN)
    return
  end

  local forward = vim.fn.line '.' .. ':' .. vim.fn.col '.' .. ':' .. texfile

  -- Try forward-jump first (works if zathura already open)
  local result = vim.fn.system('zathura --synctex-forward ' .. forward .. ' ' .. pdffile .. ' 2>/dev/null; echo $?')
  local exit = tonumber(vim.trim(result))

  -- If that failed, open fresh without the flag
  if exit ~= 0 then vim.fn.jobstart({ 'zathura', pdffile }, { detach = true }) end
end

return M
