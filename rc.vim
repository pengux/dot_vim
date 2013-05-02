" General {
	set nocompatible
	set encoding=utf-8
	set fileencoding=utf-8
	set fileencodings=ucs-bom,utf-8
	" Display incomplete commands
	set showcmd
	" Allow switching buffsers without saving changes to file
	set hidden
	" Don't add invisible linebreak at EOF
	set binary noeol
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
	
	Bundle 'beyondwords/vim-twig'
	Bundle 'Lokaltog/vim-distinguished'
	Bundle 'tpope/vim-markdown'
	Bundle 'scrooloose/syntastic'
	Bundle 'kien/ctrlp.vim'
	Bundle 'tpope/vim-fugitive'
	Bundle 'Lokaltog/vim-powerline'
	Bundle 'airblade/vim-rooter'
	Bundle 'vim-scripts/Smart-Tabs'
	Bundle 'scrooloose/nerdtree'
	Bundle 'fholgado/minibufexpl.vim'
	
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

" Rooter {
	let g:rooter_use_lcd = 1
" }

" minibufexpl {
	let g:miniBufExplCloseOnSelect = 1
	let g:miniBufExplMapCTabSwitchBufs = 1
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
	
	" Different tab-width on YAML files
	autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=2
	" Python should be indented with spaces preferrably
	autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4
" }

" Font and Color {
	
	if has("gui_running")
		set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h13
		set antialias

		" Force MacVim to skip colors
		let macvim_skip_colorscheme=1
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

	colorscheme carvedwood
" }

" UI {
	set list
	set listchars=eol:¬,tab:▸\ ,trail:·
	
	" Line numbers on
	set number
	
	" Highlight all search matches
	set showmatch
	
	" Incremental search (ie. search while you type)
	set incsearch
	set hlsearch
	
	" Ignore case for search unless it contains uppercase characters
	set ignorecase
	set smartcase
	
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
	
	" Don't allow arrow keys in insert mode
	inoremap <Left>  <NOP>
	inoremap <Right> <NOP>
	inoremap <Up>    <NOP>
	inoremap <Down>  <NOP>

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

	" MiniBufExplorer on <Tab>

	map <Tab> :MiniBufExplorer<CR>

	map <C-Tab> :bnext<CR>
	map <C-S-Tab> :bprevious<CR>

	" Remap CMD + F to fullscreen mode
	if has("gui_running")
		set fuopt+=maxhorz
		macmenu &Edit.Find.Find\.\.\. key=<nop>
		map <D-f> :set invfu<CR>
	endif
" }