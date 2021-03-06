autocmd VimEnter * call MyCommandT()

function! MyCommandT()
    if exists(":CommandT") != 2
        return
    end

    let g:CommandTMaxHeight = 15
    set wildignore+=*.o,*.obj,.git,*.pyc
    noremap <leader>j :CommandT<cr>
    noremap <leader>y :CommandTFlush<cr>

endfunction
