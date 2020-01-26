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

" Use 24-bit (true-color) mode in Vim/Neovim when outside tmux or screen.
" If you're using tmux version 2.2 or later, you can remove the outermost $TMUX
" check and use tmux's 24-bit color support
" (http://sunaku.github.io/tmux-24bit-color.html#usage for more information.)
if empty($TMUX) && empty($STY)
  " See https://gist.github.com/XVilka/8346728.
  if $COLORTERM =~# 'truecolor' || $COLORTERM =~# '24bit'
    if has('termguicolors')
      " See :help xterm-true-color
      if $TERM =~# '^screen'
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
      endif
      set termguicolors
    endif
  endif
endif

"Themes 
set background=light
set termguicolors
"colorscheme open-color
"colorscheme kuroi
"colorscheme material-monokai
"colorscheme monokai_phoenix
"colorscheme solarized
"colorscheme desert
colorscheme lucius 

let g:indent_guides_enable_on_vim_startup = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


let g:airline#extensions#tabline#enabled = 1

set laststatus=2

" Configure Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
" let g:syntastic_javascript_checkers = ['eslint','jshint', 'jscs']
" let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_vue_checkers = ['eslint']

let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
let g:syntastic_html_checkers=['tidy', 'validator', 'w3']
let g:syntastic_vim_checkers=['vimlint']
let g:syntastic_json_checkers=['jsonlint']
let g:syntastic_yaml_checkers=['js-yaml']
let g:syntastic_scss_checkers=['scss-lint']
let g:syntastic_css_checkers=['csslint']
let g:syntastic_handlebars_checkers=['handlebars']
let g:syntastic_tpl_checkers=['handlebars']

" let g:syntastic_mode_map = {
    " \ 'mode': 'active',
    " \ 'active_filetypes': ['javascript']
    " \ }


" get available js linters
function! GetJslinters()
    let l:linters = [ ['eslint', '.eslintrc'], ['jshint', '.jshintrc'] ]
    let l:available = []
    for l:linter in l:linters
       if executable(l:linter[0])
            call add(l:available, l:linter)
       endif
    endfor
    return l:available
endfunction

" check if the path to see if a linter config is present
function! Jslinter(path, linters)
    let l:dir = fnamemodify(a:path, ':p:h')

    if(l:dir == '/')
        return ''
    endif

    for l:linter in a:linters
        if filereadable(l:dir . '/' . l:linter[1])
            return l:linter[0]
        endif
    endfor

    return Jslinter(fnamemodify(l:dir, ':h'), a:linters)
endfunction

" set the jslinter into Syntastic
function! SyntasticSetJsLinter()

    let l:availableLinters = GetJslinters()

    " look for linter config in the current folder
    let l:jslinter = Jslinter(expand('%:p'), l:availableLinters)
    if l:jslinter == ''
        " otherwise look into the home dir
        let l:jslinter = Jslinter($HOME, l:availableLinters)
    endif

    " configure the linter
    if l:jslinter != ''
        let g:syntastic_javascript_checkers=[l:jslinter]
    endif
endfunction

call SyntasticSetJsLinter() 

" [> Javascript libraries syntax <]

let g:used_javascript_libs = 'jquery,underscore,requirejs,chai,handlebars'


" Configure la police de caracteres
set guifont=DejaVu\ Sans\ Mono\ 9
set antialias

" don't create temp files everywhere, but in the ~/.vim/tmp
let $VIMTMP = glob('~/.vim/tmp')
set backupdir=$VIMTMP
set directory=$VIMTMP
set undodir  =$VIMTMP
set undofile

" to fix syntax highlighting stops working randomly for vue files
autocmd FileType vue syntax sync fromstart

" prevents vim-vue from supporting every pre-processor language highlighting
let g:vue_disable_pre_processors=1

" Start gVim maximized
"function Maximize_Window()
"  silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
" Start gVim with specific size
" set lines=45 columns=140
"endfunction
