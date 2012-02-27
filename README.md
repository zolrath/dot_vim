# Matt Furden's vim dotfiles for Ruby and Clojure

## Installation

1. `git clone http://github.com/zolrath/dot_vim.git` in your home folder.
2. `mv dot_vim .vim`
3. `cd .vim`
4. `rake vim:init` to make the .vimrc symbolic link and install Vundle.
6. Run Vim and type `:BundleInstall` to install the plugins with Vundle.

## Requirements

**Mac**

 * [MacVim](https://github.com/b4winckler/macvim) - I'm currently using terminal vim, but MacVim works too!

**Windows**

 * [gVim](http://www.vim.org/download.php#pc) - For PC you can use [Wu Yongwei's](http://wyw.dcweb.cn) pre-compiled [gVim 7.3.333](http://wyw.dcweb.cn/download.asp?path=vim&file=gvim73.zip) because it has Ruby support and the latest patches

## Notes

Be sure to always edit the vimrc using `,v`, which opens the vimrc in the .vim folder. Vim has a nasty habit of overriding symlinks.
Keybindings and Plugin Specific options are located in the plugin/settings directory.

## Plugin Installation / Requirements

 * [Fugitive](https://github.com/tpope/vim-fugitive) Requires Git to be installed
 * [syntastic](https://github.com/scrooloose/syntastic) Requires many different binaries installed depending on what filetypes you want it to check
 * [ack.vim](https://github.com/mileszs/ack.vim) Requires [ack](http://betterthangrep.com/) to be installed

## Plugin List

 * [ZoomWin](https://github.com/vim-scripts/ZoomWin) - Zoom in/out  of windows (toggle between one window and multi-window)
 * [vim-buffergator](https://github.com/jeetsukumaran/vim-buffergator) - Vim plugin to list, select and switch between buffers.
 * [nerdtree](https://github.com/scrooloose/nerdtree) - A tree explorer plugin for vim.
 * [ctrlp.vim](https://github.com/kien/ctrlp.vim) - Fuzzy file, buffer, mru and tag finder
 * [vim-tagbar](https://github.com/timgreen/vim-tagbar) - Vim plugin that displays tags in a window, ordered by class etc.
 * [vim-indent-guides](https://github.com/mutewinter/vim-indent-guides) - A Vim plugin for visually displaying indent levels in code
 * [vim-powerline](https://github.com/Lokaltog/vim-powerline) - The ultimate vim statusline utility.
 * [gundo.vim](https://github.com/sjl/gundo.vim) - A git mirror of gundo.vim
 * [ColorV](https://github.com/Rykka/ColorV) - A color tool in Vim
 * [vim-css-color](https://github.com/ap/vim-css-color) - Highlight colors in css files
 * [tslime.vim](https://github.com/kikijump/tslime.vim) - Send command from vim to a running tmux session
 * [jellybeans.vim](https://github.com/nanotech/jellybeans.vim) - A colorful, dark color scheme for Vim.
 * [vim-commentary](https://github.com/tpope/vim-commentary) - commentary.vim: comment stuff out
 * [vim-surround](https://github.com/tpope/vim-surround) - surround.vim: quoting/parenthesizing made simple
 * [vim-fugitive](https://github.com/tpope/vim-fugitive) - fugitive.vim: a Git wrapper so awesome, it should be illegal
 * [vim-unimpaired](https://github.com/tpope/vim-unimpaired) - unimpaired.vim: pairs of handy bracket mappings
 * [tabular](https://github.com/godlygeek/tabular) - Vim script for text filtering and alignment
 * [sudo-gui.vim](https://github.com/gmarik/sudo-gui.vim) - sudo GUI for a GUI vim
 * [ack.vim](https://github.com/mileszs/ack.vim) - Vim plugin for the Perl module / CLI script 'ack'
 * [syntastic](https://github.com/scrooloose/syntastic) - Syntax checking hacks for vim
 * [supertab](https://github.com/ervandew/supertab) - Perform all your vim insert mode completions with Tab
 * [vim-ruby](https://github.com/vim-ruby/vim-ruby) - Vim/Ruby Configuration Files
 * [vim-endwise](https://github.com/tpope/vim-endwise) - endwise.vim: wisely add "end" in ruby, endfunction/endif/more in vim script, etc
 * [vim-rails](https://github.com/tpope/vim-rails) - rails.vim: Ruby on Rails power tools
 * [vim-haml](https://github.com/tpope/vim-haml) - Vim runtime files for Haml, Sass, and SCSS
 * [vim-capybara](https://github.com/asux/vim-capybara) - Capybara VIM bundle
 * [vim-slim](https://github.com/bbommarito/vim-slim) - A clone of the slim vim plugin from stonean. For use with Pathogen.
 * [scss-syntax.vim](https://github.com/cakebaker/scss-syntax.vim) - Vim syntax file for scss (Sassy CSS)
 * [vim-rspec](https://github.com/skwp/vim-rspec) - Beautiful rspec output in vim. See also: https://github.com/skwp/vim-ruby-conque for non-blocking rspec through ConqueTerm
 * [vim-ruby-refactoring](https://github.com/ecomba/vim-ruby-refactoring) - Refactoring tool for Ruby in vim!
 * [vim-coffee-script](https://github.com/kchmck/vim-coffee-script) - CoffeeScript support for vim
 * [vim-json](https://github.com/leshill/vim-json) - Pathogen friendly packaging of vim-json from Jeroen Ruigrok van der Werven http://www.vim.org/scripts/script.php?script_id=1945
 * [vim-jquery](https://github.com/itspriddle/vim-jquery) - Fork of bronson's vim-jquery which is now gone
 * [vim-repeat](https://github.com/tpope/vim-repeat) - repeat.vim: enable repeating supported plugin maps with "."
 * [vim-easytags](https://github.com/xolox/vim-easytags) - Automated tag file generation and syntax highlighting of tags in Vim
 * [vim-markdown](https://github.com/tpope/vim-markdown) - Vim Markdown runtime files
 * [gist-vim](https://github.com/mattn/gist-vim) - vimscript for gist
 * [matchit.zip](https://github.com/vim-scripts/matchit.zip) - extended % matching for HTML, LaTeX, and many other languages
 * [vim-textobj-user](https://github.com/kana/vim-textobj-user) - Vim plugin: Support for user-defined text objects
 * [vim-textobj-rubyblock](https://github.com/nelstrom/vim-textobj-rubyblock) - A custom text object for selecting ruby blocks.
 * [vim-indentobject](https://github.com/austintaylor/vim-indentobject) - A text object for manipulating blocks based on their indentation
