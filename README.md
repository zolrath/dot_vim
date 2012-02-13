# Matt Furden's vim dotfiles for Ruby and Clojure

## Installation

1. `git clone http://github.com/zolrath/dot_vim.git` in your home folder.
2. `mv dot_vim .vim`
3. `cd .vim`
4. `rake vim:init` to make the .vimrc symbolic link and install Vundle.
6. Run Vim and type `:BundleInstall` to install the plugins with Vundle.
7. Enjoy enhanced productivity, increased levitation, reduced watermelon-related accidents, and startling sex appeal.

## Screenshots

**MacVim** / **Windows gVim**

[![MacVim](https://github.com/mutewinter/dot_vim/raw/master/screenshots/MacVim1_small.png)](https://github.com/mutewinter/dot_vim/raw/master/screenshots/MacVim1.png) [![Windows gVim](https://github.com/mutewinter/dot_vim/raw/master/screenshots/Windows1_small.png)](https://github.com/mutewinter/dot_vim/raw/master/screenshots/Windows1.png)

## Requirements

**Mac**

 * [MacVim](https://github.com/b4winckler/macvim) - I'm currently using [snapshot 64](https://github.com/b4winckler/macvim/downloads)

**Windows**

 * [gVim](http://www.vim.org/download.php#pc) - I'm currently using [Wu Yongwei's](http://wyw.dcweb.cn) pre-compiled [gVim 7.3.333](http://wyw.dcweb.cn/download.asp?path=vim&file=gvim73.zip) because it has Ruby support and the latest patches

## Notes

Be sure to always edit the vimrc using `,v`, which opens the vimrc in the .vim folder. Vim has a nasty habit of overriding symlinks.
Keybindings and Plugin Specific options are located in the plugin/settings directory.

## Plugin Installation / Requirements

 * [Fugitive](https://github.com/tpope/vim-fugitive) Requires Git to be installed
 * [syntastic](https://github.com/scrooloose/syntastic) Requires many different binaries installed depending on what filetypes you want it to check
 * [ack.vim](https://github.com/mileszs/ack.vim) Requires [ack](http://betterthangrep.com/) to be installed

## Plugin List

 * [vundle](https://github.com/gmarik/vundle) - Vundle, the plug-in manager for Vim
 * [ZoomWin](https://github.com/vim-scripts/ZoomWin) - Zoom in/out  of windows (toggle between one window and multi-window)
 * [vim-space](https://github.com/christoomey/vim-space) - space.vim - Smart Space key for Vim
 * [vim-easymotion](https://github.com/Lokaltog/vim-easymotion) - Vim motions on speed!
 * [bufexplorer](https://github.com/corntrace/bufexplorer) - Clone of Jeff Lanzarotta's bufexplorer from vim.org
 * [ctrlp.vim](https://github.com/kien/ctrlp.vim) - Fuzzy file, buffer, mru and tag finder
 * [vim-easytags](https://github.com/xolox/vim-easytags) - Automated tag file generation and syntax highlighting of tags in Vim
 * [vim-tagbar](https://github.com/timgreen/vim-tagbar) - Vim plugin that displays tags in a window, ordered by class etc.
 * [vim-indent-guides](https://github.com/mutewinter/vim-indent-guides) - A Vim plugin for visually displaying indent levels in code
 * [vim-powerline](https://github.com/Lokaltog/vim-powerline) - The ultimate vim statusline utility.
 * [nerdtree](https://github.com/scrooloose/nerdtree) - A tree explorer plugin for vim.
 * [ColorV](https://github.com/Rykka/ColorV) - A color tool in Vim
 * [jellybeans.vim](https://github.com/nanotech/jellybeans.vim) - A colorful, dark color scheme for Vim.
 * [vim-colors-solarized](https://github.com/altercation/vim-colors-solarized) - precision colorscheme for the vim text editor
 * [nerdcommenter](https://github.com/scrooloose/nerdcommenter) - Vim plugin for intensely orgasmic commenting
 * [vim-surround](https://github.com/tpope/vim-surround) - surround.vim: quoting/parenthesizing made simple
 * [vim-speeddating](https://github.com/tpope/vim-speeddating) - speeddating.vim: use CTRL-A/CTRL-X to increment dates, times, and more
 * [vim-fugitive](https://github.com/tpope/vim-fugitive) - fugitive.vim: a Git wrapper so awesome, it should be illegal
 * [vim-unimpaired](https://github.com/tpope/vim-unimpaired) - unimpaired.vim: pairs of handy bracket mappings
 * [visualrepeat](https://github.com/vim-scripts/visualrepeat) - Repeat command extended to visual mode. 
 * [tabular](https://github.com/godlygeek/tabular) - Vim script for text filtering and alignment
 * [ack.vim](https://github.com/mileszs/ack.vim) - Vim plugin for the Perl module / CLI script 'ack'
 * [sudo-gui.vim](https://github.com/gmarik/sudo-gui.vim) - sudo GUI for a GUI vim
 * [IndexedSearch](https://github.com/vim-scripts/IndexedSearch) - shows  'Nth match out of M'  at every search (index of match+total # matches)
 * [vim-session](https://github.com/xolox/vim-session) - Extended session management for Vim (:mksession on steroids)
 * [delimitMate](https://github.com/Raimondi/delimitMate) - Vim plugin, provides insert mode auto-completion for quotes, parens, brackets, etc.
 * [syntastic](https://github.com/scrooloose/syntastic) - Syntax checking hacks for vim
 * [supertab](https://github.com/ervandew/supertab) - Perform all your vim insert mode completions with Tab
 * [MatchTag](https://github.com/gregsexton/MatchTag) - MatchParen for HTML tags
 * [neocomplcache](https://github.com/Shougo/neocomplcache) - Ultimate auto-completion system for Vim.
 * [snipmate-snippets](https://github.com/honza/snipmate-snippets) - vim-snipmate default snippets
 * [vim-conque](https://github.com/rson/vim-conque) - Auto-mirror of the official svn repo (syncs once per day)
 * [vim-ruby-conque](https://github.com/zolrath/vim-ruby-conque) - Vim plugin to display ruby, rake, and rspec output colorized in ConqueTerm
 * [vim-ruby](https://github.com/vim-ruby/vim-ruby) - Vim/Ruby Configuration Files
 * [vim-endwise](https://github.com/tpope/vim-endwise) - endwise.vim: wisely add "end" in ruby, endfunction/endif/more in vim script, etc
 * [vim-haml](https://github.com/tpope/vim-haml) - Vim runtime files for Haml, Sass, and SCSS
 * [vim-slim](https://github.com/bbommarito/vim-slim) - A clone of the slim vim plugin from stonean. For use with Pathogen.
 * [vim-rails](https://github.com/tpope/vim-rails) - rails.vim: Ruby on Rails power tools
 * [vim-rake](https://github.com/tpope/vim-rake) - rake.vim: it's like rails.vim without the rails
 * [vim-cucumber](https://github.com/tpope/vim-cucumber) - Vim Cucumber runtime files
 * [vim-ruby-refactoring](https://github.com/ecomba/vim-ruby-refactoring) - Refactoring tool for Ruby in vim!
 * [YankRing.vim](https://github.com/vim-scripts/YankRing.vim) - Maintains a history of previous yanks, changes and deletes
 * [vim-javascript](https://github.com/pangloss/vim-javascript) - Vastly improved vim's javascript indentation.
 * [vim-coffee-script](https://github.com/kchmck/vim-coffee-script) - CoffeeScript support for vim
 * [vim-json](https://github.com/leshill/vim-json) - Pathogen friendly packaging of vim-json from Jeroen Ruigrok van der Werven http://www.vim.org/scripts/script.php?script_id=1945
 * [vim-jquery](https://github.com/itspriddle/vim-jquery) - Fork of bronson's vim-jquery which is now gone
 * [vim-repeat](https://github.com/tpope/vim-repeat) - repeat.vim: enable repeating supported plugin maps with "."
 * [nginx.vim](https://github.com/mutewinter/nginx.vim) - Syntax highlighting for nginx.conf and related config files.
 * [vim-markdown](https://github.com/tpope/vim-markdown) - Vim Markdown runtime files
 * [gist-vim](https://github.com/mattn/gist-vim) - vimscript for gist
 * [Kwbd.vim](https://github.com/rgarver/Kwbd.vim) - Add a buffer close to vim that doesn't close the window
 * [matchit.zip](https://github.com/vim-scripts/matchit.zip) - extended % matching for HTML, LaTeX, and many other languages
 * [vim-textobj-user](https://github.com/kana/vim-textobj-user) - Vim plugin: Support for user-defined text objects
 * [vim-textobj-rubyblock](https://github.com/nelstrom/vim-textobj-rubyblock) - A custom text object for selecting ruby blocks.
 * [vim-indentobject](https://github.com/austintaylor/vim-indentobject) - A text object for manipulating blocks based on their indentation
