""""""""""""""""""""""""""""
" DK's vimrc configuration " 
""""""""""""""""""""""""""""
filetype plugin indent on

map <F8> :NERDTreeToggle<CR>
map <F5> :GoRun %<CR>
map <F4> :Tagbar Toggle<CR>

call plug#begin('~/.vim/plugged')
"Plug 'scrooloose/nerdcommenter'
Plug 'fatih/vim-go'
Plug 'preservim/nerdtree'

call plug#end()

""""""""""""""""""""""""""""
" Configuration Section    "
""""""""""""""""""""""""""""
set number
set mouse=a " 마우스를 클릭하는 곳으로 커서를 옮긴다
set paste
set autoindent "indent를 다음줄에도 유지한다
set smartindent "문법에 맞게 자동으로 indent를 넣어준다
                "(e.g., 괄호 다음줄에 자동으로 indent 적용
set clipboard=unnamedplus
autocmd FileType c,cpp,java :set cindent "지정된 filetype에 대해 cindent를 적용한다
set cinoptions=g0,t0 "switch~case문 등 세부 indent를 정의한다
                    "참고(http://vimdoc.sourceforge.net/htmldoc/indent.html)

set tabstop=4 "Tab의 크기를 결정한다
set shiftwidth=4 "indent의 크기를 결정한다
set expandtab "Tab을 공백(space)으로 자동 전환한다
"set spell
set ignorecase "검색할 때 대소문자 구분을 하지 않는다
set smartcase "검색할 때 대문자를 섞어 사용하면 대소문자 구분하여 검색하고,
                "소문자로만 쓰면 대소문자 구분을 하지 않는다

set incsearch "검색시 단어 전체를 입력하지 않아도, 입력된 글자까지 순차적으로 검색한다
set hlsearch "검색된 단어를 highlight 한다

set title "상단에 파일 이름을 표시해준다
set ruler "하단에 현재 커서의 위치를 표시해준다

set textwidth=90
set colorcolumn=+1 "91번째줄 색을 바꾼다(line length 맞추기 위한 guideline)
hi ColorColumn ctermbg=235 "세로줄 색깔
" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
         autocmd!
                 autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
         augroup END
endif
