" things that need to run last after all plugins
set formatoptions-=cro " disable continuation of comments onto the next line

" vim-xdebug overrides
"
"
"
if !exists('g:debuggerRunning')
  let g:debuggerRunning = 0
endif

function! ToggleDebugger()
if (g:debuggerRunning == 0)
  exec(":python debugger_run()")
  let g:debuggerRunning=1
else
  exec(":python debugger_quit()")
  let g:debuggerRunning=0
endif
endfunction

map <F5> :call ToggleDebugger()

" ack recursively search cwd
map <F3> <Esc>:Ack 

" easytags recursive update cwd
map <silent> <F4> <Esc>:UpdateTags -R %:p:h<CR>:echo "tags updated for ".expand("%:p:h")<CR>

" whitespace cleanup
map <silent> <F2> :let _s=@/<Bar>:%s/\t/  /eg<CR>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:echo "cleaned code in ".expand("%")<CR>
