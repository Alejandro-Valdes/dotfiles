autocmd VimEnter * call MyFuzzyFinder()

function! MyFuzzyFinder()
    if exists(":FufFile") != 2
        return
    end

    let g:fuf_modesDisable = []
    let g:fuf_mrufile_maxItem = 1000
    let g:fuf_mrucmd_maxItem = 400
    let g:fuf_mrufile_exclude = '\v\~$|\.(bak|sw[po])$|^(\/\/|\\\\|\/mnt\/)'
    nnoremap <silent> <C-a><C-f>    :FufCoverageFile<CR>
    nnoremap <silent> <C-a><C-b>    :FufBuffer<CR>
    " nnoremap <silent> <C-p>      :FufFileWithCurrentBufferDir<CR>
    " nnoremap <silent> <C-f><C-p> :FufFileWithFullCwd<CR>
    " nnoremap <silent> <C-f>p     :FufFile<CR>
    " nnoremap <silent> <C-f><C-d> :FufDirWithCurrentBufferDir<CR>
    " nnoremap <silent> <C-f>d     :FufDirWithFullCwd<CR>
    " nnoremap <silent> <C-f>D     :FufDir<CR>
    " nnoremap <silent> <C-j>      :FufMruFile<CR>
    " nnoremap <silent> <C-k>      :FufMruCmd<CR>
    " nnoremap <silent> <C-b>      :FufBookmarkDir<CR>
    " nnoremap <silent> <C-f><C-t> :FufTag<CR>
    " nnoremap <silent> <C-f>t     :FufTag!<CR>
    " noremap  <silent> g]         :FufTagWithCursorWord!<CR>
    " nnoremap <silent> <C-f><C-f> :FufTaggedFile<CR>
    nnoremap <silent> <C-a><C-j> :FufJumpList<CR>
    " nnoremap <silent> <C-a><C-c> :FufChangeList<CR>
    " nnoremap <silent> <C-a><C-q> :FufQuickfix<CR>
    nnoremap <silent> <C-a><C-l> :FufLine<CR>
    nnoremap <silent> <C-a><C-h> :FufHelp<CR>
    " nnoremap <silent> <C-f><C-b> :FufAddBookmark<CR>
    " vnoremap <silent> <C-f><C-b> :FufAddBookmarkAsSelectedText<CR>
    " nnoremap <silent> <C-f><C-e> :FufEditInfo<CR>
    " nnoremap <silent> <C-f><C-r> :FufRenewCache<CR>
endfunction
