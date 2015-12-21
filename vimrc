" VIM Configuration - Nicolas Delebecque

" Activation de Pathogen
call pathogen#infect()

" Activation de NERDTree au lancement de Vim
"autocmd vimenter * NERDTree

" Annule la compatibilité avec Vi
set nocompatible

" Encoding
set fileencoding=utf-8

" -- Affichage
set title		" Met a jour le titre de la fenetre ou du terminal
set number		" Affiche le numero des lignes
set ruler		" Affiche la position actuelle du curseur
set wrap		" Affiche les lignes trop longues sur plusieurs lignes
set encoding=utf-8

set scrolloff=3		" Affiche un minimum de 3 lignes autour du curseur
			            " (pour le scroll)

" sane editing
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent

set ff=unix
" convert all typed tabs to spaces
set expandtab

" -- Recherche
set ignorecase		" Ignore la casse lors d'une recherche
set smartcase		" Si une recherche contient une majuscule, re-active la sensibilite a la casse
set incsearch		" Surligne les resultats de recherche pendant la saisie
set hlsearch		" Surligne les resultats de recherche

" -- Beep
set visualbell		" Empeche Vim de beeper
set noerrorbells	" Empeche Vim de beeper

" Active le comportement 'habituel' de la touche retour en arriere
set backspace=indent,eol,start

" Cache les fichiers lors de l'ouverture d'autres fichiers
set hidden

" Active la coloration syntaxique
syntax enable
" Active les comportements specifiques aux types de fichiers comme la syntaxe et l'indentation
filetype on
filetype plugin on
filetype indent on

" Utilise la version sombre de Solarized
"set background=dark
colorscheme monokai
"colorscheme solarized

let indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"X":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ }
      \ }
set laststatus=2

" Configure Syntastic
"let g:syntastic_javascript_checkers = ['eslint','jshint', 'jscs']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_mode_map = {
    \ 'mode': 'active',
    \ 'active_filetypes': ['javascript']
    \ }

" Configure la police de caracteres
set guifont=DejaVu\ Sans\ Mono\ 9
set antialias

" don't create temp files everywhere, but in the ~/.vim/tmp
let $VIMTMP = glob('~/.vim/tmp')
set backupdir=$VIMTMP
set directory=$VIMTMP
set undodir  =$VIMTMP
set undofile

" Start gVim maximized
"function Maximize_Window()
"  silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
" Start gVim with specific size
" set lines=45 columns=140
"endfunction
