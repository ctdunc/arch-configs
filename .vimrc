set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-pandoc/vim-rmarkdown'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'neomake/neomake'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
call vundle#end()

filetype plugin indent on

"set defaults
set splitright

"allow backspacing over autoindent, line breaks, and start of insert action
set backspace=indent,eol,start

set autoindent

set colorcolumn=80
"stop certain movements from going to first character of line.
set nostartofline

"display cursor position on the last line of screen or in status line
set ruler

"hybrid number
set number relativenumber

"start laststatus
set laststatus=2
let g:lightline = {
      \ 'colorscheme':'default', 
      \ 'active': {
      \		'left': [ ['mode', 'paste'],
      \			  ['gitbranch', 'readonly', 'filename', 'modified'] ]
      \ },
      \ 'component_function' : {
      \		'gitbranch' : 'fugitive#head'
      \ },
      \ }


" clean tex build files on close.
autocmd VimLeave *.tex !texclear %

"character and word counts mapped to F-5
map <F5> :!wc <C-R>%<CR>

"spell check set to F-6
map <F6> :setlocal spell! spelllang=en_us<CR>

"open nerdtree on ctrl-n
nnoremap <C-n> :NERDTreeToggle<CR>
"navigation with guides
inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
map <Space><Tab> <Esc>/<++><Enter>"_c4l

"General Remappings
noremap <Up>  <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <F12> :vsplit ~/.vimrc<CR>
noremap <F2> :vsplit ~/Dropbox/school/resources/general-bibliography.bib


"LATEX Shortcuts	
	autocmd FileType plaintex,tex nnoremap ,r :!pdflatex %<cr>
	autocmd FileType plaintex,tex inoremap \align \begin{align}<Enter><Enter>\end{align}<Enter><++><Esc>2kA
	autocmd FileType plaintex,tex inoremap \equation \begin{equation}<Enter><Enter>\end{equation}<Enter><++><Esc>2kA
	autocmd FileType plaintex,tex inoremap \bold \textbf{}<++><Esc>4hi
	autocmd FileType plaintex,tex inoremap \emph \emph{}<++><Esc>4hi
	autocmd FileType plaintex,tex inoremap \bib \bibliography{/home/connor/Dropbox/school/resources/general-bibliography.bib}
	autocmd FileType plaintex,tex nnoremap `n :read !vimtemplate<CR> ggdd
	autocmd FileType plaintex,tex inoremap \itemize \begin{itemize}<Enter><Tab>\item<Space><Enter>\end{itemize}<Enter><++><Esc>2kA

"Python Shortcuts
	autocmd FileType python nnoremap `r :!python %<cr>
	autocmd FileType python inoremap `np import numpy as np
	autocmd FileType python inoremap `plt import matplotlib.pyplot as plt

"RMarkdown shortcuts
	autocmd FileType rmarkdown nnoremap `rp :RMarkdown pdf<cr>
	autocmd FileType rmarkdown nnoremap `rh :RMarkdown<cr>
	autocmd FileType markdown,rmarkdown inoremap `n ---
	autocmd FileType markdown,rmarkdown inoremap `b ****<++><Esc>F*hi
	autocmd FileType markdown,rmarkdown inoremap `i **<++><Esc>F*i
	autocmd FileType markdown,rmarkdown inoremap \1 #<Space><Enter><++><Esc>kA
	autocmd FileType markdown,rmarkdown inoremap \2 ##<Space><Enter><++><Esc>kA
	autocmd FileType markdown,rmarkdown inoremap \3 ###<Space><Enter><++><Esc>kA
	autocmd FileType rmarkdown inoremap `p ```{python, eval=}<Enter><++><Enter>```<Esc>2k$i
	autocmd FileType rmarkdown inoremap \align \begin{align}<Enter><Enter>\end{align}<Enter><++><Esc>2kA
	autocmd FileType rmarkdown inoremap \equation \begin{equation}<Enter><Enter>\end{equation}<Enter><++><Esc>2kA
	autocmd FileType rmarkdown inoremap \braket \bra{}\ket{<++>}<++><Esc>14hi

"Rmarkdown+LaTeX shortcuts
	autocmd Filetype rmarkdown,plaintex,tex inoremap \frac \frac{}{<++>}<++><Esc>10hi
	autocmd Filetype rmarkdown,plaintex,tex nnoremap `o :!zathura <C-R>=expand("%:t:r")<cr>.pdf &<cr>
	autocmd Filetype rmarkdown,plaintex,tex inoremap \tikz \begin{center}<Enter>\begin{tikzpicture}<Enter><Enter>\end{tikzpicture}<Enter>\end{center}<Enter><++><Esc>3ki
syntax on

