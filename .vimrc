" vim plugin manager configuration
call pathogen#infect()
" vim configuration
filetype plugin on
"filetype plugin indent on " I don't like auto-indent
set nu " line numbers on
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
let g:Powerline_symbols = 'fancy'
"set paste " i like being able to paste most of the time
set nowrap " wrapping off
set nocp " not sure how this got here ???
set autoindent " try to preserve indentation for new lines
set mouse=a " allow mouse
set sw=2 ts=2 et " indent with 2 spaces
set hlsearch " highlight search matches in document
set incsearch " highlight search matches dynamically as you type them
set nofoldenable " disable folding; never used
set formatoptions-=cro " disable continuation of comments onto the next line
" store vim lockfiles in a centralized directory
set backupdir=/tmp
set directory=/tmp
set ttyscroll=0 " attempt to eliminate visual fragments in gvim large res uber
" automatically chdir to current file on window focus
"autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
" show whitespace chars
set listchars=tab:»\ ,trail:·,extends:>,precedes:<
set list
" whitespace cleanup
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\t/  /eg<CR>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
"BufWritePre :%s/\s\+$//g
"" syntax highlighting
au! Syntax gherkin source ~/.vim/bundle/vim-cucumber/syntax/cucumber.vim
au Bufread,BufNewFile *.feature set filetype=gherkin
au Bufread,BufNewFile *.scss set filetype=sass
au Bufread,BufNewFile *.hamstache set filetype=haml
"syntax on " for some reason this breaks Gherkin

" gvim like vim
set guitablabel=%t " prefer file basenames only
colorscheme darkspectrum " best looking imho
set guioptions+=LlRrbmTi " quirky requirement
set guioptions-=m  " no file menu bar
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
nnoremap <M-Up> :m-2<CR>
inoremap <M-Up> <Esc>:m-2<CR>gi
vnoremap <M-Up> :m-2<CR>gv
"---- alt+down move block down
nnoremap <M-Down> :m+<CR>
inoremap <M-Down> <Esc>:m+<CR>gi
vnoremap <M-Down> :m'>+<CR>gv
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
"---- ctrl+h regex find/replace
map <C-h> <Esc>:%s///g<Left><Left><Left>
"---- f3 find next
map <F3> <Esc>/<CR>
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
map <silent> <F11> :NERDTreeToggle<CR>
"let g:NERDTreeKeepTree = 1

"-- Taglist
let Tlist_GainFocus_On_ToggleOpen = 1
nnoremap <silent> <F10> :TlistToggle<CR>

"-- Find function
nmap <F12> :Find
"---- Find file in current directory and edit it
function! Find(name)
  let l:list=system("find . -name '".a:name."' | perl -ne 'print \"$.\\t$_\"'")
  let l:num=strlen(substitute(l:list, "[^\n]", "", "g"))
  if l:num < 1
    echo "'".a:name."' not found"
    return
  endif
  if l:num != 1
    echo l:list
    let l:input=input("Which ? (CR=nothing)\n")
    if strlen(l:input)==0
      return
    endif
    if strlen(substitute(l:input, "[0-9]", "", "g"))>0
      echo "Not a number"
      return
    endif
    if l:input<1 || l:input>l:num
      echo "Out of range"
      return
    endif
    let l:line=matchstr("\n".l:list, "\n".l:input."\t[^\n]*")
  else
    let l:line=l:list
  endif
  let l:line=substitute(l:line, "^[^\t]*\t./", "", "")
  execute ":e ".l:line
endfunction
command! -nargs=1 Find :call Find("<args>")

"-- Ack
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

"-- easytags
set updatetime=4000
let g:easytags_autorecurse = 1

"-- Launch a new Terminal window from CWD
"command! -nargs=0 Terminal :silent !urxvt &
command! -nargs=0 Terminal :silent !gnome-terminal &

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

"-- alternave way to toggle max/min using tabs
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
