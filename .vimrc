" vim plugin manager configuration
call pathogen#infect()
" vim configuration
filetype plugin on
"filetype plugin indent on " I don't like auto-indent
set nu " line numbers on
set guifont=Monaco\ for\ Powerline\ 10
let g:Powerline_symbols = 'fancy'
set nowrap " wrapping off
set nocp " not sure how this got here ???
set autoindent " try to preserve indentation for new lines
set mouse=a " allow mouse
set sw=2 ts=2 et " indent with 2 spaces
set hlsearch " highlight search matches in document
set incsearch " highlight search matches dynamically as you type them
set nofoldenable " disable folding; never used
set tw=0 " don't auto-insert linebreaks to wrap
" store vim lockfiles in a centralized directory
set backupdir=/tmp
set directory=/tmp
set ttyscroll=0 " attempt to eliminate visual fragments in gvim large res uber
" automatically chdir to current file on window focus
"autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
" show whitespace chars
set listchars=tab:»\ ,trail:·,extends:>,precedes:<
set list
"BufWritePre :%s/\s\+$//g
"" syntax highlighting
au! Syntax gherkin source ~/.vim/bundle/vim-cucumber/syntax/cucumber.vim
au Bufread,BufNewFile *.feature set filetype=gherkin
au Bufread,BufNewFile *.scss set filetype=sass
au Bufread,BufNewFile *.hamstache set filetype=haml
"syntax on " for some reason this breaks Gherkin
" enable 256 color for themes to look good in tmux
set t_Co=256

" gvim like vim
set guitablabel=%t " prefer file basenames only
colorscheme darkspectrum " best looking imho
colorscheme darkspectrum " best looking imho
"colorscheme gummybears
"colorscheme vividchalk
set guioptions+=LlRrbmTi " quirky requirement
"set guioptions-=m  " no file menu bar
set guioptions-=T  " no toolbar
set guioptions-=Rr " no right scrollbar
set guioptions-=i  " no icon
set guioptions-=Ll " no left scrollbar
set guioptions-=b  " no bottom/horizontal scrollbar


"-- tabs like Firefox
"---- ctrl+t new tab
"nnoremap <C-t> :tabnew<CR> " conflicts with ctags
"---- ctrl+tab next tab
nmap <C-Tab> :tabn<CR>
imap <C-Tab> <Esc><C-Tab>i
"---- ctrl+shift+tab previous tab
nmap <C-S-Tab> :tabp<CR>
imap <C-S-Tab> <Esc><C-S-Tab>i
"---- ctrl+w close tab or window
"nmap <C-w> :confirm :q<CR>
"imap <C-w> <Esc><C-w>
"---- ctrl+q close tab or window
nmap <C-q> :confirm :q<CR>
nmap <S-q> <C-S-q>
imap <C-q> <Esc><C-q>

"-- editing like Eclipse
"---- ctrl+alt+up duplicate block up
imap <C-M-Up> <Esc>yy<Up>pi
nmap <C-M-Up> yy<Up>p
vmap <C-M-Up> yPV'[']
"---- ctrl+alt+down duplicate block down
imap <C-M-Down> <Esc>yypi
vmap <C-M-Down> y'>pV'[']
nmap <C-M-Down> yyp
"---- alt+up move block up
nmap <M-Up> :m-2<CR>
imap <M-Up> <Esc>:m-2<CR>gi
vmap <M-Up> :m-2<CR>gv
nmap [1;3A :m-2<CR>
imap [1;3A <Esc>:m-2<CR>gi
vmap [1;3A :m-2<CR>gv
"---- alt+down move block down
nmap <M-Down> :m+<CR>
imap <M-Down> <Esc>:m+<CR>gi
vmap <M-Down> :m'>+<CR>gv
nmap [1;3B :m+<CR>
imap [1;3B <Esc>:m+<CR>gi
vmap [1;3B :m'>+<CR>gv
"---- ctrl+d delete a line (without yanking)
nmap <C-d> "_dd
imap <C-d> <Esc><C-d>i
"---- ctrl+s save current file
nmap <C-s> :confirm :w<CR>
imap <C-s> <Esc><C-s>
vmap <C-s> <Esc><C-s>

"-- editing like Notepad2
"---- alt+z chop one char from front of block
nmap <silent> <M-z> :let _s=@/<Bar>:s/^.//e<Bar>:let @/=_s<Bar>:nohl<CR>
vmap <silent> <M-z> :<Backspace><Backspace><Backspace><Backspace><Backspace>let _s=@/<Bar>:'<,'>s/^.//e<Bar>:let @/=_s<Bar>:nohl<CR>gv
imap <M-z> <Esc><M-z>i
"---- alt+u chop one char from back of block
nmap <silent> <M-u> :let _s=@/<Bar>:s/.$//e<Bar>:let @/=_s<Bar>:nohl<CR>
vmap <silent> <M-u> :<Backspace><Backspace><Backspace><Backspace><Backspace>let _s=@/<Bar>:'<,'>s/.$//e<Bar>:let @/=_s<Bar>:nohl<CR>gv
"nmap <silent> <M-u> :let _s=@/<Bar>:s/.$//e<Bar>:let @/=_s<Bar>:nohl<CR>
imap <M-u> <Esc><M-u>i

"-- visual mode hacks
"---- tab indent block
vmap <Tab> >gv
nmap <Tab> >>
" shift-tab unindent block
vmap <S-Tab> <gv
nmap <S-Tab> <<
""---- period comment block
"nmap <silent> . :let _s=@/<Bar>:s/^/# /e<Bar>:let @/=_s<Bar>:nohl<CR>
"vmap <silent> . :<Backspace><Backspace><Backspace><Backspace><Backspace>let _s=@/<Bar>:'<,'>s/^/# /e<Bar>:let @/=_s<Bar>:nohl<CR>gv
""---- comma uncomment block
"nmap <silent> , :let _s=@/<Bar>:s/# //e<Bar>:let @/=_s<Bar>:nohl<CR>
"vmap <silent> , :<Backspace><Backspace><Backspace><Backspace><Backspace>let _s=@/<Bar>:'<,'>s/# //e<Bar>:let @/=_s<Bar>:nohl<CR>gv
"---- shift+up/down begins visual line mode
nmap <S-Up> kV
imap <S-Up> <Esc><S-Up>
vmap <S-Up> <Up>
nmap <S-Down> V
imap <S-Down> <Esc><S-Down>
vmap <S-Down> <Down>
map <C-S-Home> v<Home>gg
imap <C-S-Home> <Esc><C-S-Home>
map <C-S-End> v<End>G
imap <C-S-End> <Esc>l<C-S-End>
"---- shift+left/right/home/end begins visual mode
nmap <S-Left> v
imap <S-Left> <Esc>v
vmap <S-Left> h
nmap <S-Right> vl
imap <S-Right> <Esc>l<S-Right>
vmap <S-Right> l
map <S-Home> v<Home>
imap <S-Home> <Esc><S-Home>
map <S-End> v<End>
imap <S-End> <Esc>l<S-End>
"--- ctrl+a select all
map <C-a> ggVG
"--- ctrl+left or ctrl+right move word
map <C-Right> e
map <C-Left> b


"-- completely custom key mappings
nmap o o<Esc>
nmap <S-o> <S-o><Esc>
"---- Up to increment a number selected in visual mode
vnoremap <C-S-Up> <Esc><C-a>gv
"---- Down to decrement a number selected in visual mode
vnoremap <C-S-Down> <Esc><C-x>gv
"---- ctrl+z undo
nmap <C-z> u
imap <C-z> <Esc>ui
vmap <C-z> <Esc>u
"---- ctrl+y redo
nmap <C-y> <C-r>
imap <C-y> <Esc><C-r>i
vmap <C-y> <Esc><C-r>
"---- ctrl+f find
map <C-f> <Esc>/
"map <C-f> <Esc>:promptfind<CR>
"---- ctrl+h regex find/replace
map <C-h> <Esc>:%s!!!g<Left><Left><Left>
"map <C-h> <Esc>:promptrepl<CR>
"---- f3 find next
"map <F3> <Esc>/<CR>
map <F3> <Esc>:Ack 
"---- alt+d delete whitespace multi-line
map <M-d> <Esc>i<Right><Space><Esc>d/\S<CR>:noh<CR>i<Space><Esc>

" easy block selection with alt+click/drag mouse
noremap <M-LeftMouse> <4-LeftMouse>
inoremap <M-LeftMouse> <4-LeftMouse>
onoremap <M-LeftMouse> <C-C><4-LeftMouse>
noremap <M-LeftDrag> <LeftDrag>
inoremap <M-LeftDrag> <LeftDrag>
onoremap <M-LeftDrag> <C-C><LeftDrag>

" vim plugins
"-- NERDTree
map <silent> <C-e> :NERDTreeFind<CR>
"let g:NERDTreeKeepTree = 1

"-- Launch a new Terminal window from CWD
"command! -nargs=0 Terminal :silent !urxvt &
command! -nargs=0 Terminal :silent !gnome-terminal &

"-- Launch a new Nautilus window from CWD
"command! -nargs=0 Nautilus :silent !urxvt &
command! -nargs=0 Nautilus :silent !nautilus %:p:h 2>&1 1>/dev/null &

"-- Convert current buffer from HTML to HAML
command! -nargs=0 Html2Haml :silent %!html2haml -s

"-- Convert current buffer from CSS to SASS
command! -nargs=0 Css2Sass :silent %!sass-convert --from css --to sass -s

" force write as root using sudo (for when you get read-only)
cmap w!! %!sudo tee > /dev/null %

"-- Run current script in a new vim split window horizontal
function! RunCmd(cmd)
  let fn = expand("%:p")
  let ft = &l:filetype
  botright copen
  setlocal modifiable
  %d _
  silent execute "read !".a:cmd." ".fn
  1d _
  normal! 0
  if ft != ""
    execute "setf ".ft
  else
    setlocal filetype=
  endif
  setlocal nomodifiable nomodified
  wincmd p
  wincmd p
  go 999999
  wincmd p
endfunction

command! -nargs=1 Run     call RunCmd(<q-args>)

"-- Run last command
nmap <C-F9> :<Up><CR>

"-- Ctrl+W, Ctrl+O to toggle maximize/minimize of current window
nnoremap <C-W>O :call MaximizeToggle ()<CR>
nnoremap <C-W>o :call MaximizeToggle ()<CR>
nnoremap <C-W><C-O> :call MaximizeToggle ()<CR>

function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction

"-- alternative way to toggle max/min using tabs
nmap t% :tabedit %<CR>
nmap td :tabclose<CR>

command! -nargs=0 Tasks tselect /^todo
command! -nargs=0 Ctags !ctags -R .

"-- Custom surroundings
"---- Globalization (g11n) -- press cswt
"---- see http://www.expandinghead.net/keycode.html
autocmd FileType php let b:surround_116 = "<?__('\r')?>"
"---- Globalization (g11n) -- press cswd
autocmd FileType php let b:surround_100 = "#{define '\r'}"

"-- ctags
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"-- easytags
let g:easytags_updatetime_min = 200
set tags=./tags;
let g:easytags_dynamic_files = 1
"let g:easytags_by_filetype="./.tags/"  "not working right now
let g:easytags_on_cursorhold = 0 " we'll just use my handy hotkey below to do updates manually to avoid interruption

"-- tagbar
nmap <F1> :TagbarToggle<CR>

"-- ack
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
"---- recursively search cwd
map <F3> <Esc>:Ack

"-- easytags
"---- recursive update cwd
"map <silent> <F4> <Esc>:call mkdir(expand("%:p:h").'/.tags/')<CR>:UpdateTags -R %:p:h<CR>:echo "tags updated for ".expand("%:p:h")<CR>
map <silent> <F4> <Esc>:let choice = confirm("Are you sure you want to regenerate tags for ".expand("%:p:h")."?", "&Yes\n&No")<CR>:if choice == 1<CR>:echo "generating tags for ".expand("%:p:h")."...please wait..."<CR>:sleep 1<CR>:UpdateTags -R %:p:h<CR>:echo "tags updated for ".expand("%:p:h")<CR>:endif<CR>

"code beautification
"--php
func! CleanWhitespace()
  :let _s=@/
  :%s/\t/  /eg
  :%s/\s\+$//e
  :let @/=_s
  :nohl
endfunc

func! CleanPHP()
  :w
  :exe 'g/^\_$\n\_^$/d' |
  \   %s/^[\ \t]*\n/$x = 'It puts the lotion on the skin';\r/ge |
  \   exe '%!php_beautifier -s2 --filters "ArrayNested() IndentStyles(style=k&r)"' |
  \   %s/$x = 'It puts the lotion on the skin';//ge
endfunc

autocmd FileType * map <silent> <F2> :let choice = confirm("Are you sure you want to clean file ".expand("%")."?", "&Yes\n&No")<CR>:if choice == 1<CR>:call CleanWhitespace()<CR>:echo "cleaned code in ".expand("%")<CR>:endif<CR>
autocmd FileType php map <silent> <F2> :let choice = confirm("Are you sure you want to clean file ".expand("%")."?", "&Yes\n&No")<CR>:if choice == 1<CR>:call CleanPHP()<CR>:call CleanWhitespace()<CR>:echo "cleaned code in ".expand("%")<CR>:endif<CR>

"-- vimux
" Prompt for a command to run
map <silent> <LocalLeader>rp :PromptVimTmuxCommand<CR>
" Prompt for a command to run
map <silent> <LocalLeader>bash :PromptVimTmuxCommand<CR><CR>:FocusVimTmuxRunner<CR>
" Run last command executed by RunVimTmuxCommand
map <silent> <LocalLeader>rl :RunLastVimTmuxCommand<CR>
" Inspect runner pane
map <silent> <LocalLeader>ri :InspectVimTmuxRunner<CR>
" Close all other tmux panes in current window
map <silent> <LocalLeader>rx :CloseVimTmuxPanes<CR>
" Interrupt any command running in the runner pane
map <silent> <LocalLeader>rs :InterruptVimTmuxRunner<CR>

"-- vimux-ruby-debug
map <silent> <LocalLeader>rb :wa<CR> :RunAllRubyTests<CR>
map <silent> <LocalLeader>rc :wa<CR> :RunRubyFocusedContext<CR>
map <silent> <LocalLeader>rf :wa<CR> :RunRubyFocusedTest<CR>
map <silent> <LocalLeader>rl :wa<CR> :RunLastVimTmuxCommand<CR>
map <silent> <LocalLeader>rx :wa<CR> :CloseVimTmuxPanes<CR>
map <silent> <LocalLeader>ri :wa<CR> :InspectVimTmuxRunner<CR>
map <silent> <LocalLeader>rs :!ruby -c %<CR>

map <silent> <LocalLeader>sa :wa<CR> :InferiorSlimeSpecAll<CR>
map <silent> <LocalLeader>sb :wa<CR> :InferiorSlimeSpecFile<CR>
map <silent> <LocalLeader>sf :wa<CR> :InferiorSlimeSpecLine<CR>
map <silent> <LocalLeader>sr :wa<CR> :InferiorSlimeRestart<CR>

map <LocalLeader>rd Orequire 'ruby-debug';debugger<ESC>
setlocal isk+=?

"-- terminal key translations
map [1;7A <C-M-Up>
map [1;7B <C-M-Down>
imap [1;7A <Esc><C-M-Up>i
imap [1;7B <Esc><C-M-Down>i
imap OH <Esc>0li
imap OF <Esc>$i<Right>
nmap OH 0
nmap OF $
vmap OH 0
vmap OF $
cmap OH <Home>
cmap OF <End>
map [1;5C e
map [1;5D b
imap [1;5C <Esc>lei
imap [1;5D <Esc>bi
map [1;5A k
map [1;5B j
imap [1;5B <Esc>ji
imap [1;5A <Esc>ki

func! FResetPullVimRC()
  :exe "!cd ~/.vim; git reset --hard HEAD; git pull; git submodule update --init --recursive"
  :so ~/.vimrc
endfunc
command! ResetPullVimRC :silent call FResetPullVimRC()

func! FSaveVimRC()
  :w
  :so %
  !cd ~/.vim; git shove 'snapshot'
endfunc
command! SaveVimRc :silent call FSaveVimRC()

" enable spell checking
" use zg to add word under cursor to dictionary
" e.g. the humpster
set spell
set spelllang=en_us
hi SpellBad cterm=undercurl ctermbg=NONE ctermfg=red guisp=red
" -- noun that should be proper-cased
hi SpellCap cterm=undercurl ctermbg=NONE ctermfg=red guisp=red
" -- proper spelling of word, but not in this region
hi SpellLocal cterm=undercurl ctermbg=NONE ctermfg=red guisp=red
" -- words uncommonly used
hi SpellRare cterm=undercurl ctermbg=NONE ctermfg=red guisp=red

" TODO
" on save, cleanup whitespace and beautify php
" on load, by filetype, set indentation rules
