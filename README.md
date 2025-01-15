# Vimrc

A set of my configuration files for Vim text editor. This is a compilation of
many different configs I made for myself over the long time since I was
introduced to Vim in the year 2002. All gathered together, cleaned up and
updated. It's my oldest and longest evolving work I've ever published!

## Setup

### Prerequisites

Working Git installation available from command line is necessary.

### Windows

Clone the whole repository into `~/vimfiles` directory:

    git clone https://github.com/mikomatyk/vimrc ~/vimfiles

### Linux

Clone the whole repository into `~/.vim` directory:

    git clone https://github.com/mikomatyk/vimrc ~/.vim

That's it, done!

## Optional settings

### Smart tabs

To make Vim use tabs for code indentation and spaces for alignment, run the
following script:

    smart_tabs

This script downloads and locally installs the [Smart Tabs][00] plugin made by
Michael Geddes. Although this plugin has not been maintained for many years, it
still works for me.

### Case labels in Shell scripts

To disable indenting of case labels in Shell scripts code, run the following
script:

    shell_indent

This script will create a local copy of the Vim Shell indent file, and modify it
so that `case` labels in Shell scripts are no longer indented. Reverting to the
original default behavior is as simple as deleting the local `./indent/sh.vim`
file.

### Polish spellcheck dictionary

To install Polish spellcheck dictionary, run the following script:

    polish_spell

This script will download Polish [Hunspell][01] dictionary from the
[LibreOffice][02] repository and then convert it into local
`./spell/pl.utf-8.spl` file that is suitable for Vim's spellchecker.

## Author

Created and [unlicensed][98] by [Mikołaj Bartnicki][99]

[00]:https://www.vim.org/scripts/script.php?script_id=231
[01]:https://hunspell.github.io
[02]:https://libreoffice.org
[98]:UNLICENSE
[99]:mailto:mikolaj@bartnicki.org
