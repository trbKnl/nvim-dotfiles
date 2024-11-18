-- My own send lines to Repl implementation in vimscript 

vim.cmd [[
" Global variables
let g:seen_blank = 0

" Global options
set splitright


function StartRepl(cmd)
    " Opens new split, starts the interpreter in a nvim terminal and store the channel id
    " Store the buffer id, so it can be killed later
    " Move cursor to end of line for auto scroll
    " Move back to previous split
    vs enew | let g:channel_id = termopen(a:cmd) 
    let g:buf_nr = bufnr('%')
    execute 'normal! G'
    wincmd p
endfunction

function Kill()
    " Kill last opened buffer with StartRepl
    execute "bd! " . g:buf_nr
endfunction


function SendLinesTermBuf()
    " Grabs text selection with getline, then process the lines and collect in a list, 
    " send the list to the running the terminal.
    "
    " For each line in the selection: if the line is empty, do not add it to
    " the output list, unless the previous line was empty, then it may indicate the end of
    " a function declaration. If the line is non-empty add it to the list. If
    " the previous line was empty, and the line begins with a
    " non-whitespace char, it might indicate the end of a function declaration, so add an
    " extra line to the output list.
    let g:seen_blank = 0
    let input = getline("'<","'>")
    let output = []
    for line in input
        if line == ''
            if g:seen_blank 
                call add(output, '')
            else
                let g:seen_blank = 1
            endif
        else
            if line =~ '\m\C^\S.*' && g:seen_blank
                call add(output, '')
                call add(output, line)
            else
                call add(output, line)
            endif
            let g:seen_blank = 0
        endif
    endfor
    call add(output, '')
    call add(output, '')
    call chansend(g:channel_id, output)
endfunction


function SendLineTermBuf()
    " Grabs current line with getline, then process it, and send it to 
    " to the running the terminal. Move to the next line.
    "
    " If the line is blank, do not send it to the terminal buffer, unless it
    " is the second line, it may indicate the end of a function declaration.
    " If the line is non-blank, send it to the terminal buffer, if the
    " previous line was blank, send an extra line, it might be needed 
    " to indicate the end of a function declaration.
    let input = getline('.')
    if input == ''
        if g:seen_blank 
            call chansend(g:channel_id, "\r")
        else
            let g:seen_blank = 1
        endif
    else
        if input =~ '\m\C^\S.*' && g:seen_blank
            call chansend(g:channel_id, "\r")
            call chansend(g:channel_id, input."\r")
        else
            call chansend(g:channel_id, input."\r")
        endif
        let g:seen_blank = 0
    endif
    execute 'normal! j0'
endfunction

function SendStringTermBuf(string)
    " Send string to terminal buffer

    call chansend(g:channel_id, a:string."\r")
endfunction


nmap <leader>s :call StartRepl('python')<CR>
nmap <leader>r :call StartRepl('R')<CR>
nmap <leader>n :call StartRepl('node')<CR>
nmap <leader>t :call StartRepl('ts-node')<CR>
nmap <leader>l :call StartRepl('lua')<CR>
nmap <leader>em :call StartRepl('iex -S mix')<CR>
nmap <leader>k :call Kill()<CR>
nmap <C-Space> :call SendLineTermBuf()<CR>
vmap <C-Space> :<c-u>call SendLinesTermBuf()<CR>
]]
