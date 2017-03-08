if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <C-Space> 
imap <Nul> <C-Space>
inoremap <expr> <Up> pumvisible() ? "\" : "\<Up>"
inoremap <expr> <S-Tab> pumvisible() ? "\" : "\<S-Tab>"
inoremap <expr> <Down> pumvisible() ? "\" : "\<Down>"
inoremap <D-BS> 
inoremap <M-BS> 
inoremap <M-Down> }
inoremap <D-Down> <C-End>
inoremap <M-Up> {
inoremap <D-Up> <C-Home>
noremap! <M-Right> <C-Right>
noremap! <D-Right> <End>
noremap! <M-Left> <C-Left>
noremap! <D-Left> <Home>
inoremap <silent> <SNR>15_AutoPairsReturn =AutoPairsReturn()
nmap ,t :Tagbar
nmap ,r :NERDTreeFind
nmap ,l :NERDTreeToggle
xmap S <Plug>VSurround
nnoremap \d :YcmShowDetailedDiagnostic
nmap cS <Plug>CSurround
nmap cs <Plug>Csurround
nmap cgc <Plug>ChangeCommentary
nmap ds <Plug>Dsurround
vmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
xmap gS <Plug>VgSurround
nmap gcu <Plug>Commentary<Plug>Commentary
nmap gcc <Plug>CommentaryLine
omap gc <Plug>Commentary
nmap gc <Plug>Commentary
xmap gc <Plug>Commentary
nmap ySS <Plug>YSsurround
nmap ySs <Plug>YSsurround
nmap yss <Plug>Yssurround
nmap yS <Plug>YSurround
nmap ys <Plug>Ysurround
noremap <M-Down> }
noremap <D-Down> <C-End>
noremap <M-Up> {
noremap <D-Up> <C-Home>
noremap <M-Right> <C-Right>
noremap <D-Right> <End>
noremap <M-Left> <C-Left>
noremap <D-Left> <Home>
vnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx : '<cfile>')),netrw#CheckIfRemote())
nnoremap <silent> <Plug>SurroundRepeat .
nmap <silent> <Plug>CommentaryUndo <Plug>Commentary<Plug>Commentary
nnoremap <silent> <Plug>(ale_next_wrap) :ALENextWrap
nnoremap <silent> <Plug>(ale_next) :ALENext
nnoremap <silent> <Plug>(ale_previous_wrap) :ALEPreviousWrap
nnoremap <silent> <Plug>(ale_previous) :ALEPrevious
vmap <BS> "-d
imap S <Plug>ISurround
imap s <Plug>Isurround
inoremap <expr> 	 pumvisible() ? "\" : "\	"
imap  <Plug>Isurround
let &cpo=s:cpo_save
unlet s:cpo_save
set autochdir
set autoindent
set background=dark
set backspace=indent,eol,start
set backupdir=~/.vim/backup//
set complete=.,w,b,u,t
set completefunc=youcompleteme#Complete
set completeopt=preview,menuone
set cpoptions=aAceFsB
set directory=~/.vim/swap//
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set guitablabel=%M%t
set helplang=en
set incsearch
set langmenu=none
set listchars=tab:⇥\ 
set makeprg=pdflatex\ %\ &&\ open\ %:r.pdf
set mouse=a
set path=.,/usr/include,,,**
set printexpr=system('open\ -a\ Preview\ '.v:fname_in)\ +\ v:shell_error
set pythondll=/usr/local/Frameworks/Python.framework/Versions/2.7/Python
set pythonhome=/usr/local/Frameworks/Python.framework/Versions/2.7
set pyxversion=2
set ruler
set runtimepath=~/.vim,~/.vim/bundle/ale,~/.vim/bundle/auto-pairs,~/.vim/bundle/codi.vim,~/.vim/bundle/nerdtree,~/.vim/bundle/tagbar,~/.vim/bundle/vim-commentary,~/.vim/bundle/vim-gutentags,~/.vim/bundle/vim-surround,~/.vim/bundle/YouCompleteMe,/usr/local/Cellar/macvim/8.0-121/MacVim.app/Contents/Resources/vim/vimfiles,/usr/local/Cellar/macvim/8.0-121/MacVim.app/Contents/Resources/vim/runtime,/usr/local/Cellar/macvim/8.0-121/MacVim.app/Contents/Resources/vim/vimfiles/after,~/.vim/after
set shiftwidth=4
set shortmess=filnxtToOc
set tabstop=4
set termencoding=utf-8
set textwidth=80
set undodir=~/.vim/undo//
set updatetime=2000
set wildmenu
set window=60
" vim: set ft=vim :
