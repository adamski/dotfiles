set nocompatible              " be iMproved, required

let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

syntax on
set background=dark
colorscheme distinguished
set laststatus=2

set backupdir=~/tmp/vim/backup//
set directory=~/tmp/vim/swap//
set undodir=~/tmp/vim/undo//
set hidden

set noswapfile

if has('persistent_undo')        "check if your vim version supports it
    set undofile                 "turn on the feature  
endif 

set fo-=t    
set number

set fillchars+=vert:\│
hi vertsplit guifg=fg guibg=bg

" netrw settings (mimic NERDTree)
" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      let g:netrw_chgwin = winnr() " this is failed attempt to get netrw to open a new file in the original window
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-E> :call ToggleVExplorer()<CR>

" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20

" Default to tree mode
let g:netrw_liststyle=3
" let g:netrw_preview = 1

" Change directory to the current buffer when opening files.
" set autochdir

" end netrw settings

" let g:vimfiler_as_default_explorer = 1
	
" Enable file operation commands.
" Edit file by tabedit.
" call vimfiler#custom#profile('default', 'context', { 'safe' : 0, 'edit_action' : 'tabopen' })
nnoremap <C-t> vimfiler#do_action('tabopen')

" Like Textmate icons.
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'

" let g:unite_enable_start_insert = 1
nnoremap <Leader>e :VimFilerExplorer<cr>
" nnoremap <Leader>f :Unite -start-insert file<CR>
" nnoremap <Leader>b :Unite buffer<cr>

" Unite settings

let g:unite_enable_start_insert = 1
let g:unite_split_rule = "botright"
let g:unite_force_overwrite_statusline = 0
let g:unite_winheight = 10

let g:ackprg = 'ag --nogroup --nocolor --column'

" call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
"       \ 'ignore_pattern', join([
"       \ '\.git/',
"       \ ], '\|'))
"
" call unite#filters#matcher_default#use(['matcher_fuzzy'])
" call unite#filters#sorter_default#use(['sorter_rank'])

" nnoremap <C-P> :<C-u>Unite  -buffer-name=files   -start-insert buffer -input= -resume file_rec/async:!<cr>
" call unite#custom#profile('files', 'ignorecase', 1)


nnoremap <space>y :Unite history/yank<cr>
nnoremap <space>s :Unite -quick-match buffer<cr>
"
" autocmd FileType unite call s:unite_settings()
"
" function! s:unite_settings()
" 	let b:SuperTabDisabled=1
" 	imap <buffer> <C-j>   <Plug>(unite_select_next_line)
" 	imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
" 	imap <silent><buffer><expr> <C-x> unite#do_action('split')
" 	imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
" 	imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
"
" 	nmap <buffer> <ESC> <Plug>(unite_exit)
" endfunction
" " end Unite settings

" Comment-T options
"let g:CommandTTraverseSCM = 'dir'
let g:CommandTFileScanner = 'git'  
let g:CommandTMaxHeight = 20
nnoremap <silent> <leader>b :CommandTMRU<CR>

if has("gui_running")
	let s:uname = system("uname")
	if s:uname == "Darwin\n"
		set guifont=Sauce\ Code\ Pro\ for\ Powerline:h15
	endif
endif

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'Shougo/vimfiler.vim'
Plugin 'Shougo/unite.vim'
Plugin 'wincent/command-t'
Plugin 'tpope/vim-surround'
Plugin 'Shougo/vimproc.vim'
Plugin 'tpope/vim-sensible'
Plugin 'Valloric/YouCompleteMe'
Plugin 'moll/vim-node'
Plugin 'marijnh/tern_for_vim'
" Plugin 'jiangmiao/auto-pairs'
Plugin 'Raimondi/delimitMate'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-scripts/closetag.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'tpope/vim-vinegar.git'

Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'othree/xml.vim'
Plugin 'idbrii/AsyncCommand'
Plugin 'mileszs/ack.vim'

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

Plugin 'terryma/vim-multiple-cursors'
" This does what it says on the tin. It will check your file on open too, not
" just on save.
" " You might not want this, so just leave it out if you don't.
let g:syntastic_check_on_open=1
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_html_tidy_exec = 'tidy5'
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-", " proprietary attribute \"cd-", "trimming empty <", "unescaped &" , "lacks \"action", "is not recognized!", "discarding unexpected"]
"
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on

set expandtab
set shiftwidth=4
set softtabstop=4

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
