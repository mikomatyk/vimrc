# vimrc

A set of my configuration files for Vim text editor. This is a compilation of
many different configs I made for myself over the long time since I was
introduced to Vim in the year 2002. All gathered together, cleaned up and
updated. It's my oldest and longest evolving work I've ever published!

## Setup

### Prerequisites

Working Git installation available from command line is necessary.

### Windows

Clone the whole repository into `~/vimfiles` directory:

    git clone https://gitlab.com/bartnicki/vim-config ~/vimfiles

### Linux

Clone the whole repository into `~/.vim` directory:

    git clone https://gitlab.com/bartnicki/vim-config ~/.vim

That's it, done!

## Indentation tuning

If you dislike Vim's default indentation of `case` labels in Shell scripts,
you can use the provided `make-indent` script:

    make-indent

This script will create a local copy of the Vim Shell indent file, modified so
that `case` labels in Shell scripts are no longer indented.

Reverting to the original default behavior is as simple as deleting the local
`./indent/sh.vim` file.

## Author

Written and unlicensed by [Mikołaj Bartnicki](mailto:mikolaj@bartnicki.org); see
[LICENSE](LICENSE) for details.
