" vim-xdebug overrides
map <F5> :call ToggleDebugger()

" ack recursively search cwd
map <F3> <Esc>:Ack 

" easytags recursive update cwd
map <silent> <F4> <Esc>:UpdateTags -R %:p:h<CR>:echo "tags updated for ".expand("%:p:h")<CR>

" whitespace cleanup
map <silent> <F2> :let _s=@/<Bar>:%s/\t/  /eg<CR>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:echo "cleaned code in ".expand("%")<CR>
