#!/bin/bash
sudo apt update -y && sudo apt upgrade -y && sudo apt install i3-wm polybar neovim  brightnessctl git alacrity -y && clear

getent passwd 1000

printf '\n%s\n\n' 'Write your user name: '

read -r user

if [ ! -d /home/$user/.config ]; then
  mkdir -p /home/$user/.config;
fi

if [ ! -d /home/$user/.config/i3 ]; then
    mkdir -p /home/$user/.config/i3;
fi

cat > /home/$user/.config/i3/configT.txt << EOF 
# This file has been auto-generated by i3-config-wizard(1).
# It will not be overwritten, so edit it as you like.
#
# Should you change your keyboard layout some time, delete
# this file and re-run i3-config-wizard(1).
#

# i3 config file (v4)
#
# Please see https://i3wm.org/docs/userguide.html for a complete reference!

set $mod Mod4

#no bip
exec setterm -blength 0
exec setterm -breq 0
exec xset b off

#executar polybar - foi para baixo
exec --no-startup-id ~/.config/polybar/launch.sh --cuts

#executar nitrogen
#exec --no-startup-id nitrogen --restore

#executar picom
#exec picom

bindsym $mod+b exec firefox

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

# Font for window titles. Will also be used by the bar unless a different font
# is used in the bar {} block below.
font pango:monospace 8

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

#foi para baixo
# NetworkManager is the most popular way to manage wireless networks on Linux,
# and nm-applet is a desktop environment-independent system tray GUI for it.
exec --no-startup-id nm-applet

# Use pactl to adjust volume in PulseAudio.
set $refresh_i3status killall -SIGUSR1 i3status
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10% && $refresh_i3status
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10% && $refresh_i3status
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status
bindsym XF86AudioMicMute exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && $refresh_i3status 

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# move tiling windows via drag & drop by left-clicking into the title bar,
# or left-clicking anywhere into the window while holding the floating modifier.
tiling_drag modifier titlebar

# start a terminal
#bindsym $mod+Return exec i3-sensible-terminal
bindsym $mod+Return exec alacritty

# kill focused window
bindsym $mod+Shift+q kill

# start dmenu (a program launcher)
#bindsym $mod+d exec --no-startup-id dmenu_run
bindsym $mod+d exec rofi -show drun

# A more modern dmenu replacement is rofi:
# bindcode $mod+40 exec "rofi -modi drun,run -show drun"
# There also is i3-dmenu-desktop which only displays applications shipping a
# .desktop file. It is a wrapper around dmenu, so you need that installed.
# bindcode $mod+40 exec --no-startup-id i3-dmenu-desktop

# change focus
bindsym $mod+j focus left
bindsym $mod+k focus down
bindsym $mod+l focus up
bindsym $mod+ccedilla focus right

# alternatively, you can use the cursor keys:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+j move left
bindsym $mod+Shift+k move down
bindsym $mod+Shift+l move up
bindsym $mod+Shift+ccedilla move right

# alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# split in horizontal orientation
bindsym $mod+h split h

# split in vertical orientation
bindsym $mod+v split v

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# focus the child container
#bindsym $mod+d focus child

# Define names for default workspaces for which we configure key bindings later on.
# We use variables to avoid repeating the names in multiple places.
set $ws1 "1"
set $ws2 "2"
set $ws3 "3"
set $ws4 "4"
set $ws5 "5"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8"
set $ws9 "9"
set $ws10 "10"

# switch to workspace
bindsym $mod+1 workspace number $ws1
bindsym $mod+2 workspace number $ws2
bindsym $mod+3 workspace number $ws3
bindsym $mod+4 workspace number $ws4
bindsym $mod+5 workspace number $ws5
bindsym $mod+6 workspace number $ws6
bindsym $mod+7 workspace number $ws7
bindsym $mod+8 workspace number $ws8
bindsym $mod+9 workspace number $ws9
bindsym $mod+0 workspace number $ws10

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace number $ws1
bindsym $mod+Shift+2 move container to workspace number $ws2
bindsym $mod+Shift+3 move container to workspace number $ws3
bindsym $mod+Shift+4 move container to workspace number $ws4
bindsym $mod+Shift+5 move container to workspace number $ws5
bindsym $mod+Shift+6 move container to workspace number $ws6
bindsym $mod+Shift+7 move container to workspace number $ws7
bindsym $mod+Shift+8 move container to workspace number $ws8
bindsym $mod+Shift+9 move container to workspace number $ws9
bindsym $mod+Shift+0 move container to workspace number $ws10

# reload the configuration file
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'"

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
        bindsym $mod+r mode "default"
}

bindsym $mod+r mode "resize"

#executar polybar
#exec --no-startup-id sleep 2s;exec --no-startup-id ~/.config/polybar/launch.sh --cuts

# NetworkManager is the most popular way to manage wireless networks on Linux,
# and nm-applet is a desktop environment-independent system tray GUI for it.
#exec --no-startup-id nm-applet

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
#bar {
#        status_command i3status
#}
EOF

git clone https://github.com/adi1090x/polybar-themes.git && chmod +x ./polybar-themes/setup.sh && cd ./polybar-themes && ./setup.sh

cd ..

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if [ ! -d /home/$user/.config/nvim ]; then
    mkdir -p /home/$user/.config/nvim;
fi

cat > /home/$user/.config/nvim/init.vim << EOF
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
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
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

if [ ! -d /home/$user/.config/alacritty ]; then
    mkdir -p /home/$user/.config/alacritty;
fi

cat > /home/$user/.config/alacritty/alacritty.yml << EOF 
# Configuration for Alacritty, the GPU enhanced terminal emulator.

# Any items in the `env` entry below will be added as
# environment variables. Some entries may override variables
# set by alacritty itself.
env:
  # TERM variable
  #
  # This value is used to set the `$TERM` environment variable for
  # each instance of Alacritty. If it is not present, alacritty will
  # check the local terminfo database and use `alacritty` if it is
  # available, otherwise `xterm-256color` is used.
  TERM: xterm-256color

window:
  # Window dimensions (changes require restart)
  #
  # Specified in number of columns/lines, not pixels.
  # If both are `0`, this setting is ignored.
  #dimensions:
  #columns: 0
  #lines: 0

  # Window position (changes require restart)
  #
  # Specified in number of pixels.
  # If the position is not set, the window manager will handle the placement.
  #position:
  #  x: 0
  #  y: 0

  # Window padding (changes require restart)
  #
  # Blank space added around the window in pixels. This padding is scaled
  # by DPI and the specified value is always added at both opposing sides.
  padding:
   x: 6
   y: 6

  # Spread additional padding evenly around the terminal content.
  dynamic_padding: false

  # Background opacity
  #
  # Window opacity as a floating point number from `0.0` to `1.0`.
  # The value `0.0` is completely transparent and `1.0` is opaque.
  #opacity: 1.0
  opacity: 0.9

  # Window decorations
  #
  # Values for `decorations`:
  #     - full: Borders and title bar
  #     - none: Neither borders nor title bar
  #
  # Values for `decorations` (macOS only):
  #     - transparent: Title bar, transparent background and title bar buttons
  #     - buttonless: Title bar, transparent background, but no title bar buttons
  decorations: full  

  # Startup Mode (changes require restart)
  #
  # Values for `startup_mode`:
  #   - Windowed
  #   - Maximized
  #   - Fullscreen
  #
  # Values for `startup_mode` (macOS only):
  #   - SimpleFullscreen
  #startup_mode: Windowed

  # Window title
  title: Alacritty

  # Window class (Linux/BSD only):
  class:
    # Application instance name
    instance: Alacritty
    # General application class
    general: Alacritty

  # GTK theme variant (Linux/BSD only)
  #
  # Override the variant of the GTK theme. Commonly supported values are `dark` and `light`.
  # Set this to `None` to use the default theme variant.
  # gtk_theme_variant: None

scrolling:
  # Maximum number of lines in the scrollback buffer.
  # Specifying '0' will disable scrolling.
  history: 5000

  # Number of lines the viewport will move for every line scrolled when
  # scrollback is enabled (history > 0).
  #multiplier: 3

  # Scroll to the bottom when new text is written to the terminal.
  #auto_scroll: false

# Spaces per Tab (changes require restart)
#
# This setting defines the width of a tab in cells.
#
# Some applications, like Emacs, rely on knowing about the width of a tab.
# To prevent unexpected behavior in these applications, it's also required to
# change the `it` value in terminfo when altering this setting.
#tabspaces: 8

# Font configuration
font:
  # Normal (roman) font face
  normal:
    # Font family
    #
    # Default:
    #   - (macOS) Menlo
    #   - (Linux/BSD) monospace
    #   - (Windows) Consolas
    # family: Source Code Pro
    # family: CodeNewRoman Nerd Font
    # family: RobotoMono Nerd Font
    # family: Hack
    # family: JetBrains Mono
    # family: UbuntuMono Nerd Font
    # family: Monofur Nerd Font
    # family: TerminessTTF Nerd Font
    # family: Mononoki Nerd Font
    family: FreeMono
      
    # The `style` can be specified to pick a specific face.
    style: Regular

  # Bold font face
  bold:
    # Font family
    #
    # If the bold family is not specified, it will fall back to the
    # value specified for the normal font.
    # family: Source Code Pro
    # family: CodeNewRoman Nerd Font
    # family: RobotoMono Nerd Font
    # family: Hack
    # family: JetBrains Mono
    # family: UbuntuMono Nerd Font
    # family: Monofur Nerd Font
    # family: TerminessTTF Nerd Font
    # family: Mononoki Nerd Font
    family: FreeMono

    # The `style` can be specified to pick a specific face.
    style: Bold

  # Italic font face
  italic:
    # Font family
    #
    # If the italic family is not specified, it will fall back to the
    # value specified for the normal font.
    # family: Source Code Pro
    # family: CodeNewRoman Nerd Font
    # family: RobotoMono Nerd Font
    # family: Hack
    # family: JetBrains Mono
    # family: UbuntuMono Nerd Font
    # family: Monofuritalic Nerd Font Mono
    # family: TerminessTTF Nerd Font
    # family: Mononoki Nerd Font
    family: FreeMono

    # The `style` can be specified to pick a specific face.
    style: Italic

  # Bold italic font face
  bold_italic:
    # Font family
    #
    # If the bold italic family is not specified, it will fall back to the
    # value specified for the normal font.
    # family: Source Code Pro
    # family: CodeNewRoman Nerd Font
    # family: RobotoMono Nerd Font
    # family: Hack
    # family: JetBrains Mono
    # family: UbuntuMono Nerd Font
    # family: Monofuritalic Nerd Font Mono
    # family: TerminessTTF Nerd Font
    # family: Mononoki Nerd Font
    family: FreeMono

    # The `style` can be specified to pick a specific face.
    style: Bold Italic

  # Point size
  size: 9.0

  # Offset is the extra space around each character. `offset.y` can be thought of
  # as modifying the line spacing, and `offset.x` as modifying the letter spacing.
  offset:
    x: 0
    y: 1

  # Glyph offset determines the locations of the glyphs within their cells with
  # the default being at the bottom. Increasing `x` moves the glyph to the right,
  # increasing `y` moves the glyph upwards.
  #glyph_offset:
  #  x: 0
  #  y: 0

  # Thin stroke font rendering (macOS only)
  #
  # Thin strokes are suitable for retina displays, but for non-retina screens
  # it is recommended to set `use_thin_strokes` to `false`
  #
  # macOS >= 10.14.x:
  #
  # If the font quality on non-retina display looks bad then set
  # `use_thin_strokes` to `true` and enable font smoothing by running the
  # following command:
  #   `defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO`
  #
  # This is a global setting and will require a log out or restart to take
  # effect.
  #use_thin_strokes: true

# If `true`, bold text is drawn using the bright color variants.
draw_bold_text_with_bright_colors: true

#######################################
##      START OF COLOR SCHEMES       ##
#######################################
schemes:
  ### Doom One ###
  DoomOne: &DoomOne
    primary:
      background: '#282c34'
      foreground: '#660066'
    cursor:
      text: CellBackground
      cursor: '#528bff'
    selection:
      text: CellForeground
      background: '#3e4451'
    normal:
      black:   '#1c1f24'
      red:     '#ff6c6b'
      green:   '#98be65'
      yellow:  '#da8548'
      blue:    '#51afef'
      magenta: '#c678dd'
      cyan:    '#5699af'
      white:   '#202328'
    bright:
      black:   '#5b6268'
      red:     '#da8548'
      green:   '#4db5bd'
      yellow:  '#ecbe7b'
      blue:    '#3071db'   # This is 2257a0 in Doom Emacs but I lightened it.
      magenta: '#a9a1e1'
      cyan:    '#46d9ff'
      white:   '#dfdfdf'

  ### Dracula ###
  Dracula: &Dracula
    primary:
      background: '#282a36'
      foreground: '#f8f8f2'
    cursor:
      text: CellBackground
      cursor: CellForeground
    vi_mode_cursor:
      text: CellBackground
      cursor: CellForeground
    search:
      matches:
        foreground: '#44475a'
        background: '#50fa7b'
      focused_match:
        foreground: '#44475a'
        background: '#ffb86c'
      bar:
        background: '#282a36'
        foreground: '#f8f8f2'
    line_indicator:
      foreground: None
      background: None
    selection:
      text: CellForeground
      background: '#44475a'
    normal:
      black:   '#000000'
      red:     '#ff5555'
      green:   '#50fa7b'
      yellow:  '#f1fa8c'
      blue:    '#bd93f9'
      magenta: '#ff79c6'
      cyan:    '#8be9fd'
      white:   '#bfbfbf'
    bright:
      black:   '#4d4d4d'
      red:     '#ff6e67'
      green:   '#5af78e'
      yellow:  '#f4f99d'
      blue:    '#caa9fa'
      magenta: '#ff92d0'
      cyan:    '#9aedfe'
      white:   '#e6e6e6'
    dim:
      black:   '#14151b'
      red:     '#ff2222'
      green:   '#1ef956'
      yellow:  '#ebf85b'
      blue:    '#4d5b86'
      magenta: '#ff46b0'
      cyan:    '#59dffc'
      white:   '#e6e6d1'

  ### Gruvbox dark ###
  GruvboxDark: &GruvboxDark
    # Default colors
    primary:
      # hard contrast: background = '0x1d2021'
      background: '#282828'
      # soft contrast: background = '0x32302f'
      foreground: '#ebdbb2'

    # Normal colors
    normal:
      black:   '#282828'
      red:     '#cc241d'
      green:   '#98971a'
      yellow:  '#d79921'
      blue:    '#458588'
      magenta: '#b16286'
      cyan:    '#689d6a'
      white:   '#a89984'

    # Bright colors
    bright:
      black:   '#928374'
      red:     '#fb4934'
      green:   '#b8bb26'
      yellow:  '#fabd2f'
      blue:    '#83a598'
      magenta: '#d3869b'
      cyan:    '#8ec07c'
      white:   '#ebdbb2'

### Monokai ###
  MonokaiPro: &MonokaiPro
    # Default colors
    primary:
      background: '#2D2A2E'
      foreground: '#FCFCFA'

    # Normal colors
    normal:
      black:   '#403E41'
      red:     '#FF6188'
      green:   '#A9DC76'
      yellow:  '#FFD866'
      blue:    '#FC9867'
      magenta: '#AB9DF2'
      cyan:    '#78DCE8'
      white:   '#FCFCFA'

    # Bright colors
    bright:
      black:   '#727072'
      red:     '#FF6188'
      green:   '#A9DC76'
      yellow:  '#FFD866'
      blue:    '#FC9867'
      magenta: '#AB9DF2'
      cyan:    '#78DCE8'
      white:   '#FCFCFA'

  ### Nord ###
  Nord: &Nord
    # Default colors
    primary:
      background: '#2E3440'
      foreground: '#D8DEE9'

    # Normal colors
    normal:
      black:   '#3B4252'
      red:     '#BF616A'
      green:   '#A3BE8C'
      yellow:  '#EBCB8B'
      blue:    '#81A1C1'
      magenta: '#B48EAD'
      cyan:    '#88C0D0'
      white:   '#E5E9F0'

    # Bright colors
    bright:
      black:   '#4C566A'
      red:     '#BF616A'
      green:   '#A3BE8C'
      yellow:  '#EBCB8B'
      blue:    '#81A1C1'
      magenta: '#B48EAD'
      cyan:    '#8FBCBB'
      white:   '#ECEFF4'

  ### Oceanic Next ###
  OceanicNext: &OceanicNext
    # Default colors
    primary:
      background: '#1b2b34'
      foreground: '#d8dee9'

    # Colors the cursor will use if `custom_cursor_colors` is true
    cursor:
      text: '#1b2b34'
      cursor: '#ffffff'

    # Normal colors
    normal:
      black:   '#343d46'
      red:     '#EC5f67'
      green:   '#99C794'
      yellow:  '#FAC863'
      blue:    '#6699cc'
      magenta: '#c594c5'
      cyan:    '#5fb3b3'
      white:   '#d8dee9'

    # Bright colors
    bright:
      black:   '#343d46'
      red:     '#EC5f67'
      green:   '#99C794'
      yellow:  '#FAC863'
      blue:    '#6699cc'
      magenta: '#c594c5'
      cyan:    '#5fb3b3'
      white:   '#d8dee9'

  ### Palenight ###
  Palenight: &Palenight
    # Default colors
    primary:
      background: '#292d3e'
      foreground: '#d0d0d0'

    # Normal colors
    normal:
      black:   '#292d3e'
      red:     '#f07178'
      green:   '#c3e88d'
      yellow:  '#ffcb6b'
      blue:    '#82aaff'
      magenta: '#c792ea'
      cyan:    '#89ddff'
      white:   '#d0d0d0'

    # Bright colors
    bright:
      black:   '#434758'
      red:     '#ff8b92'
      green:   '#ddffa7'
      yellow:  '#ffe585'
      blue:    '#9cc4ff'
      magenta: '#e1acff'
      cyan:    '#a3f7ff'
      white:   '#ffffff'

  ### Solarized Dark ###
  SolarizedDark: &SolarizedDark
    # Default colors
    primary:
      background: '#002b36' # base03
      foreground: '#839496' # base0

    # Cursor colors
    cursor:
      text:   '#002b36' # base03
      cursor: '#839496' # base0

    # Normal colors
    normal:
      black:   '#073642' # base02
      red:     '#dc322f' # red
      green:   '#859900' # green
      yellow:  '#b58900' # yellow
      blue:    '#268bd2' # blue
      magenta: '#d33682' # magenta
      cyan:    '#2aa198' # cyan
      white:   '#eee8d5' # base2

    # Bright colors
    bright:
      black:   '#002b36' # base03
      red:     '#cb4b16' # orange
      green:   '#586e75' # base01
      yellow:  '#657b83' # base00
      blue:    '#839496' # base0
      magenta: '#6c71c4' # violet
      cyan:    '#93a1a1' # base1
      white:   '#fdf6e3' # base3

  ### Solarized Light ###
  SolarizedLight: &SolarizedLight
    # Default colors
    primary:
      background: '#fdf6e3' # base3
      foreground: '#657b83' # base00

    # Cursor colors
    cursor:
      text:   '#fdf6e3' # base3
      cursor: '#657b83' # base00

    # Normal colors
    normal:
      black:   '#073642' # base02
      red:     '#dc322f' # red
      green:   '#859900' # green
      yellow:  '#b58900' # yellow
      blue:    '#268bd2' # blue
      magenta: '#d33682' # magenta
      cyan:    '#2aa198' # cyan
      white:   '#eee8d5' # base2

    # Bright colors
    bright:
      black:   '#002b36' # base03
      red:     '#cb4b16' # orange
      green:   '#586e75' # base01
      yellow:  '#657b83' # base00
      blue:    '#839496' # base0
      magenta: '#6c71c4' # violet
      cyan:    '#93a1a1' # base1
      white:   '#fdf6e3' # base3

  ### Tomorrow Night ###
  TomorrowNight: &TomorrowNight
     # Default colors
    primary:
      background: '#1d1f21'
      foreground: '#c5c8c6'

    # Colors the cursor will use if `custom_cursor_colors` is true
    cursor:
      text: '#1d1f21'
      cursor: '#ffffff'

    # Normal colors
    normal:
      black:   '#1d1f21'
      red:     '#cc6666'
      green:   '#b5bd68'
      yellow:  '#e6c547'
      blue:    '#81a2be'
      magenta: '#b294bb'
      cyan:    '#70c0ba'
      white:   '#373b41'

    # Bright colors
    bright:
      black:   '#666666'
      red:     '#ff3334'
      green:   '#9ec400'
      yellow:  '#f0c674'
      blue:    '#81a2be'
      magenta: '#b77ee0'
      cyan:    '#54ced6'
      white:   '#282a2e'

######################################################################
## SET THEME: Choose ONE color scheme from those in the above list. ##
## ###################################################################
# Available themes are:
# *DoomOne
# *Dracula
# *GruvboxDark
# *MonokaiPro
# *Nord
# *OceanicNext
# *Palenight
# *SolarizedLight
# *SolarizedDark
# *TomorrowNight

colors: *TomorrowNight

#######################################
##       END OF COLOR SCHEMES        ##
#######################################

# Visual Bell
#
# Any time the BEL code is received, Alacritty "rings" the visual bell. Once
# rung, the terminal background will be set to white and transition back to the
# default background color. You can control the rate of this transition by
# setting the `duration` property (represented in milliseconds). You can also
# configure the transition function by setting the `animation` property.
#
# Values for `animation`:
#   - Ease
#   - EaseOut
#   - EaseOutSine
#   - EaseOutQuad
#   - EaseOutCubic
#   - EaseOutQuart
#   - EaseOutQuint
#   - EaseOutExpo
#   - EaseOutCirc
#   - Linear
#
# Specifying a `duration` of `0` will disable the visual bell.
#visual_bell:
#  animation: EaseOutExpo
#  duration: 0
#  color: '#ffffff'

#selection:
  #semantic_escape_chars: ",│`|:\"' ()[]{}<>\t"

  # When set to `true`, selected text will be copied to the primary clipboard.
  #save_to_clipboard: false

# Allow terminal applications to change Alacritty's window title.
#dynamic_title: true

#cursor:
  # Cursor style
  #
  # Values for `style`:
  #   - ▇ Block
  #   - _ Underline
  #   - | Beam
  #style: Block

  # If this is `true`, the cursor will be rendered as a hollow box when the
  # window is not focused.
  #unfocused_hollow: true

# Live config reload (changes require restart)
#live_config_reload: true

# Shell
#
# You can set `shell.program` to the path of your favorite shell, e.g. `/bin/fish`.
# Entries in `shell.args` are passed unmodified as arguments to the shell.
#
# Default:
#   - (macOS) /bin/bash --login
#   - (Linux/BSD) user login shell
#   - (Windows) powershell
#shell:
#  program: /bin/bash
#  args:
#    - --login

# Startup directory
#
# Directory the shell is started in. If this is unset, or `None`, the working
# directory of the parent process will be used.
#working_directory: None

# WinPTY backend (Windows only)
#
# Alacritty defaults to using the newer ConPTY backend if it is available,
# since it resolves a lot of bugs and is quite a bit faster. If it is not
# available, the the WinPTY backend will be used instead.
#
# Setting this option to `true` makes Alacritty use the legacy WinPTY backend,
# even if the ConPTY backend is available.
#winpty_backend: false

# Send ESC (\x1b) before characters when alt is pressed.
#alt_send_esc: true

#debug:
  # Display the time it takes to redraw each frame.
  #render_timer: false

  # Keep the log file after quitting Alacritty.
  #persistent_logging: false

  # Log level
  #
  # Values for `log_level`:
  #   - None
  #   - Error
  #   - Warn
  #   - Info
  #   - Debug
  #   - Trace
  #log_level: Warn

  # Print all received window events.
  #print_events: false

  # Record all characters and escape sequences as test data.
  #ref_test: false

#mouse:
  # Click settings
  #
  # The `double_click` and `triple_click` settings control the time
  # alacritty should wait for accepting multiple clicks as one double
  # or triple click.
  #double_click: { threshold: 300 }
  #triple_click: { threshold: 300 }

  # If this is `true`, the cursor is temporarily hidden when typing.
  #hide_when_typing: false

  #url:
    # URL launcher
    #
    # This program is executed when clicking on a text which is recognized as a URL.
    # The URL is always added to the command as the last parameter.
    #
    # When set to `None`, URL launching will be disabled completely.
    #
    # Default:
    #   - (macOS) open
    #   - (Linux/BSD) xdg-open
    #   - (Windows) explorer
    #launcher:
    #  program: xdg-open
    #  args: []

    # URL modifiers
    #
    # These are the modifiers that need to be held down for opening URLs when clicking
    # on them. The available modifiers are documented in the key binding section.
    #modifiers: None

# Mouse bindings
#
# Mouse bindings are specified as a list of objects, much like the key
# bindings further below.
#
# Each mouse binding will specify a:
#
# - `mouse`:
#
#   - Middle
#   - Left
#   - Right
#   - Numeric identifier such as `5`
#
# - `action` (see key bindings)
#
# And optionally:
#
# - `mods` (see key bindings)
#mouse_bindings:
#  - { mouse: Middle, action: PasteSelection }

# Key bindings
#
# Key bindings are specified as a list of objects. For example, this is the
# default paste binding:
#
# `- { key: V, mods: Control|Shift, action: Paste }`
#
# Each key binding will specify a:
#
# - `key`: Identifier of the key pressed
#
#    - A-Z
#    - F1-F24
#    - Key0-Key9
#
#    A full list with available key codes can be found here:
#    https://docs.rs/glutin/*/glutin/event/enum.VirtualKeyCode.html#variants
#
#    Instead of using the name of the keys, the `key` field also supports using
#    the scancode of the desired key. Scancodes have to be specified as a
#    decimal number. This command will allow you to display the hex scancodes
#    for certain keys:
#
#       `showkey --scancodes`.
#
# Then exactly one of:
#
# - `chars`: Send a byte sequence to the running application
#
#    The `chars` field writes the specified string to the terminal. This makes
#    it possible to pass escape sequences. To find escape codes for bindings
#    like `PageUp` (`"\x1b[5~"`), you can run the command `showkey -a` outside
#    of tmux. Note that applications use terminfo to map escape sequences back
#    to keys. It is therefore required to update the terminfo when changing an
#    escape sequence.
#
# - `action`: Execute a predefined action
#
#   - Copy
#   - Paste
#   - PasteSelection
#   - IncreaseFontSize
#   - DecreaseFontSize
#   - ResetFontSize
#   - ScrollPageUp
#   - ScrollPageDown
#   - ScrollLineUp
#   - ScrollLineDown
#   - ScrollToTop
#   - ScrollToBottom
#   - ClearHistory
#   - Hide
#   - Minimize
#   - Quit
#   - ToggleFullscreen
#   - SpawnNewInstance
#   - ClearLogNotice
#   - ReceiveChar
#   - None
#
#   (macOS only):
#   - ToggleSimpleFullscreen: Enters fullscreen without occupying another space
#
# - `command`: Fork and execute a specified command plus arguments
#
#    The `command` field must be a map containing a `program` string and an
#    `args` array of command line parameter strings. For example:
#       `{ program: "alacritty", args: ["-e", "vttest"] }`
#
# And optionally:
#
# - `mods`: Key modifiers to filter binding actions
#
#    - Command
#    - Control
#    - Option
#    - Super
#    - Shift
#    - Alt
#
#    Multiple `mods` can be combined using `|` like this:
#       `mods: Control|Shift`.
#    Whitespace and capitalization are relevant and must match the example.
#
# - `mode`: Indicate a binding for only specific terminal reported modes
#
#    This is mainly used to send applications the correct escape sequences
#    when in different modes.
#
#    - AppCursor
#    - AppKeypad
#    - Alt
#
#    A `~` operator can be used before a mode to apply the binding whenever
#    the mode is *not* active, e.g. `~Alt`.
#
# Bindings are always filled by default, but will be replaced when a new
# binding with the same triggers is defined. To unset a default binding, it can
# be mapped to the `ReceiveChar` action. Alternatively, you can use `None` for
# a no-op if you do not wish to receive input characters for that binding.
key_bindings:
    # (Windows, Linux, and BSD only)
  - { key: V,         mods: Control|Shift, action: Paste                       }
  - { key: C,         mods: Control|Shift, action: Copy                        }
  - { key: Insert,    mods: Shift,         action: PasteSelection              }
  - { key: Key0,      mods: Control,       action: ResetFontSize               }
  - { key: Equals,    mods: Control,       action: IncreaseFontSize            }
  - { key: Plus,      mods: Control,       action: IncreaseFontSize            }
  - { key: Minus,     mods: Control,       action: DecreaseFontSize            }
  - { key: F11,       mods: None,          action: ToggleFullscreen            }
  - { key: Paste,     mods: None,          action: Paste                       }
  - { key: Copy,      mods: None,          action: Copy                        }
  - { key: L,         mods: Control,       action: ClearLogNotice              }
  - { key: L,         mods: Control,       chars: "\x0c"                       }
  - { key: PageUp,    mods: None,          action: ScrollPageUp,   mode: ~Alt  }
  - { key: PageDown,  mods: None,          action: ScrollPageDown, mode: ~Alt  }
  - { key: Home,      mods: Shift,         action: ScrollToTop,    mode: ~Alt  }
  - { key: End,       mods: Shift,         action: ScrollToBottom, mode: ~Alt  }
EOF
