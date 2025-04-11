# Dotfiles

Hi and wellcome to my dotfiles collection to manage my git flows, my zshell, tmux, alacritty and nvim (almost sure i left something out).

- I use Linux, currently Fedora, with KDE or i3/sway.
- My terminal is [alacritty](https://alacritty.org/).
- I am a avid [Neovim](https://neovim.io/) user. It was not an easy path, and I do use other IDEs as well, but neovim feels right for me. I will
do a series of posts on my vim journey, the ups, the downs, the jumping-back-and-forth.
- I use [tmux](https://github.com/tmux/tmux/wiki) for my terminal sessions, locally and via ssh. It seemed like unnecesary overhead, but 
I can not let it go. Another blog post(s) promise here.

I do constantly add and improve my dotfile configs, never truly done with it, never knowing all the ins and out of neovim, tmux, git ... you name it. 
So in a way, this repo is my way of giving back and sharing some of the paths I took, in hope that someone will have it easier.

I will do my best to comment and explain the main principles and decisions in each file, but in the meantime.

## How do I use them

I have a `.dotfiles` directory in the root of my `$HOME` dir. Settings and files I do not want to appear publicly, I either add
to my `.gitignore` file, e.g. downloaded plugins for neovim, or I try to use some sort of `include` keyword, e.g. using a 
special file to manage my user info for git in `.gitconfig`

To keep my files in sync I use [GNU Stow](https://www.gnu.org/software/stow/). If you don't know it, there is no dark magic to it. 
Stow is an, granted amazing tool, to manage symlinks. OK, it does more than that, but for our use case, this is what we want.
It creates symlinks and directories that mirror the content of the stow dir, in my case `.dotfiles`. The files are here, 
so all you need to do is create a git repo and use stow.

### Stow quick tutorial

```bash
# Stow/symlink files in the stow directory
# pwd -> ~/.dotfiles
stow . # to do a dry run add -nv
```

```bash
# Remove symlinks
# pwd -> ~/.dotfiles
stow --delete path/to/directory
```
