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
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'neomake/neomake'
call vundle#end()

filetype plugin indent on

"set defaults
set splitright

call neomake#configure#automake('w')

"allow backspacing over autoindent, line breaks, and start of insert action
set backspace=indent,eol,start

set autoindent

"stop certain movements from going to first character of line.
"
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
autocmd BufWritePost *.tex silent !nohup latexmk -pdf % </dev/null &>/dev/null &

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

"skip to errors
nnoremap  <Tab> :lnext<cr>
nnoremap <S-Tab> :lprev<cr>

"General Remappings
"disable arrow keys, so that I am not weak
noremap <Up>  <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

noremap <F12> :vsplit ~/.vimrc<CR>
noremap <F2> :vsplit ~/Dropbox/school/resources/general-bibliography.bib


"LATEX Shortcuts	
	autocmd FileType plaintex,tex nnoremap `r :!pdflatex %<cr>
	autocmd FileType plaintex,tex inoremap \align \begin{align}<Enter><Enter>\end{align}<Enter><++><Esc>2kA
	autocmd FileType plaintex,tex inoremap \equation \begin{equation}<Enter><Enter>\end{equation}<Enter><++><Esc>2kA
	autocmd FileType plaintex,tex inoremap \bold \textbf{}<++><Esc>4hi
	autocmd FileType plaintex,tex inoremap \emph \emph{}<++><Esc>4hi
	autocmd FileType plaintex,tex inoremap \bib \bibliography{/home/connor/Dropbox/school/resources/general-bibliography.bib}
	autocmd FileType plaintex,tex nnoremap `n :read !vimtemplate<CR> ggdd
	autocmd FileType plaintex,tex inoremap \itemize \begin{itemize}<Enter><Tab>\item<Space><Enter>\end{itemize}<Enter><++><Esc>2kA

	"physics stuff that's useful
	autocmd FileType plaintex,tex inoremap \epn \epsilon_0
	autocmd FileType plaintex,tex inoremap \bfield \vec{B}
	autocmd FileType plaintex,tex inoremap \efield \vec{E}

"Python Shortcuts/Setup
	autocmd FileType python set colorcolumn=80
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
	autocmd FileType rmarkdown,plaintex,tex inoremap \frac \frac{}{<++>}<++><Esc>10hi
	autocmd FileType rmarkdown,plaintex,tex nnoremap `o :!zathura <C-R>=expand("%:t:r")<cr>.pdf &<cr>
	autocmd FileType rmarkdown,plaintex,tex inoremap \tikz \begin{center}<Enter>\begin{tikzpicture}<Enter><Enter>\end{tikzpicture}<Enter>\end{center}<Enter><++><Esc>3ki

"Linting/Correction Shortcuts
	autocmd FileType javascript nnoremap + :w<cr>:!eslint '%:p' --fix<cr>



syntax on
