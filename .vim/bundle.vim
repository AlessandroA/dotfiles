"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" required
set nocompatible
filetype off

""" set the runtime path to include Vundle and initialize it
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

""" Vundle
Plugin 'gmarik/Vundle.vim'                  " let Vundle manage Vundle

""" General plugins
Plugin 'vim-scripts/Gundo'                  " visualize vim undo tree
Plugin 'terryma/vim-multiple-cursors'       " multi-cursors
Plugin 'kien/ctrlp.vim'                     " fuzzy file search
Plugin 'tpope/vim-fugitive'                 " git features from within vim
Plugin 'mileszs/ack.vim'                    " ack in vim
Plugin 'Lokaltog/vim-easymotion'            " jump anywhere quickly
Plugin 'airblade/vim-gitgutter'             " git diff in sign column
Plugin 'scrooloose/syntastic'               " syntax checking
Plugin 'ervandew/supertab'                  " tab auto-completion
Plugin 'ntpeters/vim-better-whitespace'     " highlight unwanted whitespaces
Plugin 'sjl/badwolf'                        " colorscheme
Plugin 'scrooloose/nerdtree'                " file and folder structure
Plugin 'bling/vim-airline'                  " status bar
Plugin 'dbakker/vim-projectroot'            " guess project root from file
Plugin 'RobertAudi/vis.vim'                 " substitute visual blocks
Plugin 'clones/vim-cecutil'                 " needed by vis
Plugin 'tpope/vim-commentary'               " easily comment lines out
Plugin 'neilagabriel/vim-geeknote'          " integrate geeknote in vim
Plugin 'tpope/vim-markdown'                 " markdown syntax highlighting
Plugin 'AlessandroA/vim-instant-markdown'   " realtime markdown browser preview
Plugin 'vim-scripts/applescript.vim'        " applescript syntax highlighting
Plugin 'Xuyuanp/nerdtree-git-plugin'        " git status in NERDTree

""" required
call vundle#end()
filetype plugin indent on
