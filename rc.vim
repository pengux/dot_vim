" General {
	set nocompatible
	set encoding=utf-8
	setglobal fileencoding=utf-8
	set fileencodings=ucs-bom,utf-8
	" Display incomplete commands
	set showcmd
	" Allow switching buffsers without saving changes to file
	set hidden
	" Don't add invisible linebreak at EOF
	set binary noeol

	let mapleader = "§"
" }

" Vundle {
	" Brief help
	" :BundleList          - list configured bundles
	" :BundleInstall(!)    - install(update) bundles
	" :BundleSearch(!) foo - search(or refresh cache first) for foo
	" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
	"
	" see :h vundle for more details or wiki for FAQ
	" NOTE: comments after Bundle command are not allowed..

	set rtp+=~/.vim/bundle/vundle/
	call vundle#rc()

	" Let Vundle manage Vundle
	" Required!
	Bundle 'gmarik/vundle'

	" Syntax
	Bundle 'beyondwords/vim-twig'
	Bundle 'groenewege/vim-less'
	Bundle 'guns/vim-clojure-static'
	Bundle 'jnwhiteh/vim-golang'
	Bundle 'kchmck/vim-coffee-script'
	Bundle 'othree/html5.vim'
	Bundle 'tpope/vim-markdown'
	Bundle 'vim-scripts/nginx.vim'
	Bundle 'hail2u/vim-css3-syntax'

	" Tools
	Bundle 'airblade/vim-rooter'
	Bundle 'christoomey/vim-tmux-navigator'
	Bundle 'FuzzyFinder'
	Bundle 'godlygeek/tabular'
	Bundle 'kien/ctrlp.vim'
	Bundle 'L9'
	Bundle 'Lokaltog/vim-powerline'
	Bundle 'scrooloose/nerdtree'
	Bundle 'scrooloose/syntastic'
	Bundle 'tpope/vim-fugitive'
	Bundle 'vim-scripts/bufkill.vim'
	Bundle 'terryma/vim-multiple-cursors'
	Bundle 'vim-scripts/trailing-whitespace'
	Bundle 'sickill/vim-pasta'
	Bundle 'Blackrush/vim-gocode'
	Bundle 'majutsushi/tagbar'
	Bundle 'vim-scripts/AutoComplPop'
	Bundle 'Shougo/neocomplete.vim'
	Bundle 'Shougo/neosnippet.vim'
	Bundle 'tpope/vim-surround'
	Bundle 'Raimondi/delimitMate'
	Bundle 'tomtom/tcomment_vim'
	Bundle 'mileszs/ack.vim'
	Bundle 'mattn/emmet-vim'
	Bundle 'mantiz/vim-plugin-dirsettings'

	" Colorschemes
	Bundle 'Lokaltog/vim-distinguished'

	" Required!
	filetype plugin indent on
" }

" Syntastic {
	let g:syntastic_check_on_open=1

	" It uses PHP Mess Detector and PHP_CodeSniffer, I do not like how those behaves
	let g:syntastic_php_checkers=['php']
	let g:syntastic_css_checkers=['csslint', 'prettycss']

	let g:syntastic_error_symbol='✗'
	let g:syntastic_warning_symbol='⚠'
" }

" vim-powerline {
	set laststatus=2
	let g:Powerline_symbols = 'fancy'
" }

" vim-golang {
	augroup filetype_html
    	autocmd!
		autocmd FileType go autocmd BufWritePre <buffer> Fmt
	augroup END
" }

" Rooter {
	let g:rooter_use_lcd = 1
" }

" Bufkill {
	let g:BufKillCreateMappings = 0
" }

" Backup, Swap and View Files {
	" Create dirs
	silent execute '!mkdir -p $HOME/.vim/.backup'
	silent execute '!mkdir -p $HOME/.vim/.swap'
	silent execute '!mkdir -p $HOME/.vim/.views'
	silent execute '!mkdir -p $HOME/.vim/.undo'
	" Store backups in $HOME to keep the directory trees clean
	set backup
	set undofile
	set backupdir=$HOME/.vim/.backup/
	set directory=$HOME/.vim/.swap/
	set viewdir=$HOME/.vim/.views/
	set undodir=$HOME/.vim/.undo/
" }

" Tabs and Indentation {
	set noexpandtab
	set autoindent

	set tabstop=4
	set shiftwidth=4

	" Different tab-width on YAML and Ruby files
	autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=2
	autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
	autocmd FileType coffee setlocal expandtab shiftwidth=2 tabstop=2
	" Python should be indented with spaces preferrably
	autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4
" }

" Font and Color {
	if has("gui_running")
		set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h11
		set antialias
		set linespace=3

		" Force MacVim to skip colors
		let macvim_skip_colorscheme=1

		set transparency=4
	else
		set t_Co=256
	endif

	syntax on

	" Function for fixing many problems with colorschemes
	function! CorrectColorScheme()
		" Fix the listchars style
		hi clear NonText
		hi clear SpecialKey
		hi NonText ctermfg=240 guifg=#585858
		hi SpecialKey ctermfg=240 guifg=#585858

		" Change vertical bar styling
		hi VertSplit ctermfg=238 guifg=#444444 ctermbg=238 guibg=#444444

		" Fix LineNr styling, so it matches with most themes
		hi clear LineNr
		hi LineNr ctermfg=240 guifg=#585858

		" Fix autocomplete, the standard is "OMG MY EYES ARE BLEEDING!"
		hi Pmenu ctermfg=245 ctermbg=0 guifg=#8a8a8a guibg=#000000
		hi PmenuSel ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000

		" Fix todo highlight
		hi clear Todo
		hi Todo ctermfg=124 guifg=#af0000

		" Fix sign column where syntastic errors are displayed
		hi SignColumn ctermfg=238 guifg=#444444 ctermbg=238 guibg=#444444
	endfunction

	autocmd ColorScheme * call CorrectColorScheme()

	colorscheme railscasts
" }

" UI {
	set list
	set listchars=eol:¬,tab:▸\ ,trail:·
	" Display hidden unicode characters as hex
	set display+=uhex

	" Relative line numbers on, with current line showing current line number
	set relativenumber
	set number

	" Highlight all search matches
	set showmatch

	" Incremental search (ie. search while you type)
	set incsearch
	set hlsearch

	" Ignore case for search unless it contains uppercase characters
	set ignorecase
	set smartcase

	" After vertical split, select lower pane
	" (hozontal splitting, keep default: select left pane)
	set splitbelow

	" Always keep this many lines below the line currently being edited
	set scrolloff=5

	" Remove scrollbars
	set guioptions+=lrbRL
	set guioptions-=lrbRL

	" No audio bell
	set vb
" }

" Key Mappings {
	" Normal backspace
	set backspace=2

	" Avoid escape
	inoremap jj <Esc>

	" Make so that J and K moves up and down a line while keeping the caret in the
	" same column
	nmap j gj
	nmap k gk

	" easier cursor navigation between split windows using CTRL and h,j,k, or l
	noremap <C-h> <C-w>h
	noremap <C-j> <C-w>j
	noremap <C-k> <C-w>k
	noremap <C-l> <C-w>l

	nnoremap <F3> :set hlsearch!<CR>

	" Allow saving of files as sudo when vim is not running under sudo
	" NOTE: Does not work in gvim
	cmap w!! w !sudo tee > /dev/null %

	map <C-Tab> :bnext<CR>
	map <C-S-Tab> :bprevious<CR>

	map <Leader>w :bp\|bd #<CR>

	map <C-b> :CtrlPBuffer<CR>

	map <Leader>= <C-w>=

	map <Leader><Tab> :NERDTreeToggle<CR>

	" Remap CMD + F to fullscreen mode
	if has("gui_running")
		set fuopt+=maxhorz
		macmenu &Edit.Find.Find\.\.\. key=<nop>
		map <D-f> :set invfu<CR>
	endif

	nmap <F8> :TagbarToggle<CR>

	function! s:swap_lines(n1, n2)
		let line1 = getline(a:n1)
		let line2 = getline(a:n2)
		call setline(a:n1, line2)
		call setline(a:n2, line1)
	endfunction

	function! s:swap_up()
		let n = line('.')
		if n == 1
			return
		endif

		call s:swap_lines(n, n - 1)
		exec n - 1
	endfunction

	function! s:swap_down()
		let n = line('.')
		if n == line('$')
			return
		endif

		call s:swap_lines(n, n + 1)
		exec n + 1
	endfunction

	nmap <D-j> :call <SID>swap_down()<CR>
	nmap <D-k> :call <SID>swap_up()<CR>

" }

" Autocomplete {
	inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
	inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
	inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
	inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
	inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
	inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
	set completeopt+=longest,menuone
" }

" Autocommands {
	autocmd FileType php set omnifunc=phpcomplete#CompletePHP
" }

" Go Tagbar {
 let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

let g:tagbar_type_css = {
\ 'ctagstype' : 'Css',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
    \ ]
\ }

let g:tagbar_type_javascript = {
    \ 'ctagsbin' : 'jsctags'
\ }

let g:tagbar_type_markdown = {
	\ 'ctagstype' : 'markdown',
	\ 'kinds' : [
		\ 'h:Heading_L1',
		\ 'i:Heading_L2',
		\ 'k:Heading_L3'
	\ ]
\ }
" }

" Neocomplete {
	"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
	" Disable AutoComplPop.
	let g:acp_enableAtStartup = 0
	" Use neocomplete.
	let g:neocomplete#enable_at_startup = 1
	" Use smartcase.
	let g:neocomplete#enable_smart_case = 1
	" Set minimum syntax keyword length.
	let g:neocomplete#sources#syntax#min_keyword_length = 3
	let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

	" Define dictionary.
	let g:neocomplete#sources#dictionary#dictionaries = {
		\ 'default' : '',
		\ 'vimshell' : $HOME.'/.vimshell_hist',
		\ 'scheme' : $HOME.'/.gosh_completions'
			\ }

	" Define keyword.
	if !exists('g:neocomplete#keyword_patterns')
		let g:neocomplete#keyword_patterns = {}
	endif
	let g:neocomplete#keyword_patterns['default'] = '\h\w*'

	" Plugin key-mappings.
	inoremap <expr><C-g>     neocomplete#undo_completion()
	inoremap <expr><C-l>     neocomplete#complete_common_string()

	" Recommended key-mappings.
	" <CR>: close popup and save indent.
	inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
	function! s:my_cr_function()
	  return neocomplete#close_popup() . "\<CR>"
	  " For no inserting <CR> key.
	  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
	endfunction
	" <TAB>: completion.
	inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
	" <C-h>, <BS>: close popup and delete backword char.
	inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
	inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
	inoremap <expr><C-y>  neocomplete#close_popup()
	inoremap <expr><C-e>  neocomplete#cancel_popup()
	" Close popup by <Space>.
	"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

	" For cursor moving in insert mode(Not recommended)
	"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
	"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
	"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
	"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
	" Or set this.
	"let g:neocomplete#enable_cursor_hold_i = 1
	" Or set this.
	"let g:neocomplete#enable_insert_char_pre = 1

	" AutoComplPop like behavior.
	"let g:neocomplete#enable_auto_select = 1

	" Shell like behavior(not recommended).
	"set completeopt+=longest
	"let g:neocomplete#enable_auto_select = 1
	"let g:neocomplete#disable_auto_complete = 1
	"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

	" Enable omni completion.
	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
	autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

	" Enable heavy omni completion.
	if !exists('g:neocomplete#sources#omni#input_patterns')
	  let g:neocomplete#sources#omni#input_patterns = {}
	endif
	"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
	"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
	"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

	set completeopt+=preview

	" For perlomni.vim setting.
	" https://github.com/c9s/perlomni.vim
	let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" }

" Neosnippet {
	" Plugin key-mappings.
	imap <C-k>     <Plug>(neosnippet_expand_or_jump)
	smap <C-k>     <Plug>(neosnippet_expand_or_jump)
	xmap <C-k>     <Plug>(neosnippet_expand_target)

	" SuperTab like snippets behavior.
	imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
	\ "\<Plug>(neosnippet_expand_or_jump)"
	\: pumvisible() ? "\<C-n>" : "\<TAB>"
	smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
	\ "\<Plug>(neosnippet_expand_or_jump)"
	\: "\<TAB>"

	" For snippet_complete marker.
	if has('conceal')
	  set conceallevel=2 concealcursor=i
	endif

	let g:neosnippet#enable_snipmate_compatibility = 1
" }

" Ack {
	let g:ackprg = 'ag --nogroup --nocolor --column'
" }

set exrc
set secure