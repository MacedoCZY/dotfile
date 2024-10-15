#!/bin/bash
#if zsh dont run on terminal, exec zsh at line 1 on .bashrc
sudo apt update -y && sudo apt upgrade -y && sudo apt install i3-wm polybar neovim ranger brightnessctl git alacritty picom snap wget zsh rofi flameshot build-essential nodejs binutils openjdk-21-jdk openjdk-21-jre -y && clear

sudo snap install brave

if [ ! -d ~/.config ]; then
  mkdir -p ~/.config;
fi

if [ ! -d ~/.config/i3 ]; then
    mkdir -p ~/.config/i3;
fi

cat > ~/.config/i3/config << EOF 
# This file has been auto-generated by i3-config-wizard(1).
# It will not be overwritten, so edit it as you like.
#
# Should you change your keyboard layout some time, delete
# this file and re-run i3-config-wizard(1).
#

# i3 config file (v4)
#
# Please see https://i3wm.org/docs/userguide.html for a complete reference!

set \$mod Mod1

# Font for window titles. Will also be used by the bar unless a different font
# is used in the bar {} block below.
font pango:monospace 8

#no bip  -----X-----
exec setterm -blength 0
exec setterm -breq 0
exec xset b off

#executar polybar - foi para baixo -----X-----
exec --no-startup-id ~/.config/polybar/launch.sh --cuts

#executar picom -----X-----
exec --no-startup-id picom

#border workspace
client.focused #FF33FF #46004D #FFFFFF #990099 #4D004D
client.unfocused #6A6A68 #40403F #FFFFFF #CDCDCB #4D4D4C

#hide window title
default_border pixel 4
default_floating_border pixel 4

# Screen brightness controls, need brightnessctl installed
bindsym XF86MonBrightnessUp exec brightnessctl set 10%+
bindsym XF86MonBrightnessDown exec brightnessctl set 10%-

#restore light
exec brightnessctl -r

# This font is widely installed, provides lots of unicode glyphs, right-to-left
# text rendering and scalability on retina/hidpi displays (thanks to pango).
#font pango:DejaVu Sans Mono 8

# Start XDG autostart .desktop files using dex. See also
# https://wiki.archlinux.org/index.php/XDG_Autostart
exec --no-startup-id dex --autostart --environment i3

# The combination of xss-lock, nm-applet and pactl is a popular choice, so
# they are included here as an example. Modify as you see fit.

# xss-lock grabs a logind suspend inhibit lock and will use i3lock to lock the
# screen before suspend. Use loginctl lock-session to lock your screen.
exec --no-startup-id xss-lock --transfer-sleep-lock -- i3lock --nofork

# NetworkManager is the most popular way to manage wireless networks on Linux,
# and nm-applet is a desktop environment-independent system tray GUI for it.
exec --no-startup-id nm-applet

# Use pactl to adjust volume in PulseAudio.
set \$refresh_i3status killall -SIGUSR1 i3status
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10% && \$refresh_i3status
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10% && \$refresh_i3status
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && \$refresh_i3status
bindsym XF86AudioMicMute exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && \$refresh_i3status

# Use Mouse+\$mod to drag floating windows to their wanted position
floating_modifier \$mod

# move tiling windows via drag & drop by left-clicking into the title bar,
# or left-clicking anywhere into the window while holding the floating modifier.
tiling_drag modifier titlebar

# start a terminal
#bindsym \$mod+Return exec i3-sensible-terminal
bindsym \$mod+Return exec alacritty

# kill focused window
bindsym \$mod+Shift+q kill

#bind open drun ----X----
bindsym \$mod+d exec rofi -show drun

#bind open brave ----X----
bindsym \$mod+b exec brave

# start dmenu (a program launcher)
# bindsym \$mod+d exec --no-startup-id dmenu_run
# A more modern dmenu replacement is rofi:
# bindcode \$mod+40 exec "rofi -modi drun,run -show drun"
# There also is i3-dmenu-desktop which only displays applications shipping a
# .desktop file. It is a wrapper around dmenu, so you need that installed.
# bindcode \$mod+40 exec --no-startup-id i3-dmenu-desktop

# change focus
bindsym \$mod+j focus left
bindsym \$mod+k focus down
bindsym \$mod+l focus up
bindsym \$mod+ccedilla focus right

# alternatively, you can use the cursor keys:
bindsym \$mod+ISO_Level3_Shift focus left
bindsym \$mod+Super_R focus down
bindsym \$mod+Print focus up

# alternatively, you can use the cursor keys:
bindsym \$mod+Left focus left
bindsym \$mod+Down focus down
bindsym \$mod+Up focus up
bindsym \$mod+Right focus right

# move focused window
bindsym \$mod+Shift+j move left
bindsym \$mod+Shift+k move down
bindsym \$mod+Shift+l move up
bindsym \$mod+Shift+ccedilla move right

# alternatively, you can use the cursor keys:
bindsym \$mod+Shift+Left move left
bindsym \$mod+Shift+Down move down
bindsym \$mod+Shift+Up move up
bindsym \$mod+Shift+Right move right

# split in horizontal orientation
bindsym \$mod+h split h

# split in vertical orientation
bindsym \$mod+v split v

# enter fullscreen mode for the focused container
bindsym \$mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym \$mod+s layout stacking
bindsym \$mod+w layout tabbed
bindsym \$mod+e layout toggle split

# toggle tiling / floating
bindsym \$mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym \$mod+space focus mode_toggle

# focus the parent container
bindsym \$mod+a focus parent

# focus the child container
#bindsym \$mod+d focus child

# Define names for default workspaces for which we configure key bindings later on.
# We use variables to avoid repeating the names in multiple places.
set \$ws1 "1"
set \$ws2 "2"
set \$ws3 "3"
set \$ws4 "4"
set \$ws5 "5"
set \$ws6 "6"
set \$ws7 "7"
set \$ws8 "8"
set \$ws9 "9"
set \$ws10 "10"

# switch to workspace
bindsym \$mod+1 workspace number \$ws1
bindsym \$mod+2 workspace number \$ws2
bindsym \$mod+3 workspace number \$ws3
bindsym \$mod+4 workspace number \$ws4
bindsym \$mod+5 workspace number \$ws5
bindsym \$mod+6 workspace number \$ws6
bindsym \$mod+7 workspace number \$ws7
bindsym \$mod+8 workspace number \$ws8
bindsym \$mod+9 workspace number \$ws9
bindsym \$mod+0 workspace number \$ws10

# move focused container to workspace
bindsym \$mod+Shift+1 move container to workspace number \$ws1
bindsym \$mod+Shift+2 move container to workspace number \$ws2
bindsym \$mod+Shift+3 move container to workspace number \$ws3
bindsym \$mod+Shift+4 move container to workspace number \$ws4
bindsym \$mod+Shift+5 move container to workspace number \$ws5
bindsym \$mod+Shift+6 move container to workspace number \$ws6
bindsym \$mod+Shift+7 move container to workspace number \$ws7
bindsym \$mod+Shift+8 move container to workspace number \$ws8
bindsym \$mod+Shift+9 move container to workspace number \$ws9
bindsym \$mod+Shift+0 move container to workspace number \$ws10

# reload the configuration file
bindsym \$mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym \$mod+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym \$mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really wan>

# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym j resize shrink width 10 px or 10 ppt
        bindsym k resize grow height 10 px or 10 ppt
        bindsym l resize shrink height 10 px or 10 ppt
        bindsym ccedilla resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape or $mod+r
        bindsym Return mode "default"
        bindsym Escape mode "default"
        bindsym \$mod+r mode "default"
}

bindsym \$mod+r mode "resize"
EOF

if [ ! -d ./polybar-themes ]; then
    git clone https://github.com/adi1090x/polybar-themes.git
fi

chmod +x ./polybar-themes/setup.sh && cd ./polybar-themes && ./setup.sh

cd ..

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if [ ! -d ~/.config/nvim ]; then
    mkdir -p ~/.config/nvim;
fi

cat > ~/.config/nvim/init.vim << EOF
" Global Sets """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on            " Enable syntax highlight
set nu               " Enable line numbers
set tabstop=4        " Show existing tab with 4 spaces width
set softtabstop=4    " Show existing tab with 4 spaces width
set shiftwidth=4     " When indenting with '>', use 4 spaces width
set expandtab        " On pressing tab, insert 4 spaces
set smarttab         " insert tabs on the start of a line according to shiftwidth
set smartindent      " Automatically inserts one extra level of indentation in some cases
set hidden           " Hides the current buffer when a new file is openned
set incsearch        " Incremental search
set ignorecase       " Ingore case in search
set smartcase        " Consider case if there is a upper case character
set scrolloff=8      " Minimum number of lines to keep above and below the cursor
set colorcolumn=100  " Draws a line at the given line to keep aware of the line size
set signcolumn=yes   " Add a column on the left. Useful for linting
set cmdheight=2      " Give more space for displaying messages
set updatetime=100   " Time in miliseconds to consider the changes
set encoding=utf-8   " The encoding should be utf-8 to activate the font icons
set nobackup         " No backup files
set nowritebackup    " No backup files
set splitright       " Create the vertical splits to the right
set splitbelow       " Create the horizontal splits below
set autoread         " Update vim after file update from outside
set mouse=a          " Enable mouse support
filetype on          " Detect and set the filetype option and trigger the FileType Event
filetype plugin on   " Load the plugin file for the file type, if any
filetype indent on   " Load the indent file for the file type, if any

call plug#begin()
" Plugins aqui
    Plug 'sainnhe/sonokai'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'
    Plug 'sheerun/vim-polyglot'
    Plug 'preservim/nerdtree'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    "Plug 'dense-analysis/ale'
    Plug 'ryanoasis/vim-devicons'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'thaerkh/vim-indentguides'
call plug#end()

" AirLine "
let g:airline_theme = 'sonokai'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Themes "
if exists('+termguicolors')
  let \&t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let \&t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 0
let g:sonokai_diagnostic_line_highlight = 1
let g:sonokai_current_word = 'bold'
colorscheme sonokai

if (has("nvim")) "Transparent background. Only for nvim
    highlight Normal guibg=NONE ctermbg=NONE
    highlight EndOfBuffer guibg=NONE ctermbg=NONE
endif

nnoremap <silent> <s-Down> :m +1<CR>
nnoremap <silent> <s-Up> :m -2<CR>
nnoremap <C-q> :qa<CR>
vnoremap <C-c> "+y<CR>
nnoremap <C-s> :w!<CR>
nmap <C-n> :NERDTreeToggle<CR>

" Configurações do Vim IndentGuides
let g:indentguides_spacechar = '▏'
let g:indentguides_tabchar = '▏'
" Fim das configurações do Vim IndentGuides
EOF

if [ ! -d ~/.config/alacritty ]; then
    mkdir -p ~/.config/alacritty;
fi

cat > ~/.config/alacritty/alacritty.toml << EOF
[colors]
draw_bold_text_with_bright_colors = true

[colors.bright]
black = "#666666"
blue = "#81a2be"
cyan = "#54ced6"
green = "#9ec400"
magenta = "#b77ee0"
red = "#ff3334"
white = "#282a2e"
yellow = "#f0c674"

[colors.cursor]
cursor = "#ffffff"
text = "#1d1f21"

[colors.normal]
black = "#1d1f21"
blue = "#81a2be"
cyan = "#70c0ba"
green = "#b5bd68"
magenta = "#b294bb"
red = "#cc6666"
white = "#373b41"
yellow = "#e6c547"

[colors.primary]
background = "#1d1f21"
foreground = "#c5c8c6"

[env]
TERM = "xterm-256color"

[font]
size = 9.0

[font.bold]
family = "FreeMono"
style = "Bold"

[font.bold_italic]
family = "FreeMono"
style = "Bold Italic"

[font.italic]
family = "FreeMono"
style = "Italic"

[font.normal]
family = "FreeMono"
style = "Regular"

[font.offset]
x = 0
y = 1

[[keyboard.bindings]]
action = "Paste"
key = "V"
mods = "Control|Shift"

[[keyboard.bindings]]
action = "Copy"
key = "C"
mods = "Control|Shift"

[[keyboard.bindings]]
action = "PasteSelection"
key = "Insert"
mods = "Shift"

[[keyboard.bindings]]
action = "ResetFontSize"
key = "Key0"
mods = "Control"

[[keyboard.bindings]]
action = "IncreaseFontSize"
key = "Equals"
mods = "Control"

[[keyboard.bindings]]
action = "IncreaseFontSize"
key = "Plus"
mods = "Control"

[[keyboard.bindings]]
action = "DecreaseFontSize"
key = "Minus"
mods = "Control"

[[keyboard.bindings]]
action = "ToggleFullscreen"
key = "F11"
mods = "None"

[[keyboard.bindings]]
action = "Paste"
key = "Paste"
mods = "None"

[[keyboard.bindings]]
action = "Copy"
key = "Copy"
mods = "None"

[[keyboard.bindings]]
action = "ClearLogNotice"
key = "L"
mods = "Control"

[[keyboard.bindings]]
chars = "\f"
key = "L"
mods = "Control"

[[keyboard.bindings]]
action = "ScrollPageUp"
key = "PageUp"
mode = "~Alt"
mods = "None"

[[keyboard.bindings]]
action = "ScrollPageDown"
key = "PageDown"
mode = "~Alt"
mods = "None"

[[keyboard.bindings]]
action = "ScrollToTop"
key = "Home"
mode = "~Alt"
mods = "Shift"

[[keyboard.bindings]]
action = "ScrollToBottom"
key = "End"
mode = "~Alt"
mods = "Shift"

[window]
decorations = "full"
dynamic_padding = false
opacity = 0.88
title = "Alacritty"

[window.class]
general = "Alacritty"
instance = "Alacritty"

[window.padding]
x = 6
y = 6
EOF

if [ ! -d ~/.fonts ]; then
    mkdir -p ~/.fonts;
fi

cd ~/.fonts

wget -O MesloLGSRegular 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf'
wget -O MesloLGSBold 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf'
wget -O MesloLGSItalic 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf'
wget -O MesloLGSBoldItalic 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf'

cd ..

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions \$ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

echo -e "plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  fzf
)" >> ~/.zshrc

echo -e "exec zsh" >> ~/.bashrc

rm -rf ~/'$ZSH_CUSTOM'
