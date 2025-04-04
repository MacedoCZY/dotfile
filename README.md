<h1 align="center"> Dotfile </h1>

<p align="center"> There is my linux configuration </p>

![Static Badge](https://img.shields.io/badge/debian-12-blue?style=for-the-badge) ![Static Badge](https://img.shields.io/badge/i3wm-purple?style=for-the-badge) ![Static Badge](https://img.shields.io/badge/lightdm-white?style=for-the-badge) ![Static Badge](https://img.shields.io/badge/alacritty-brown?style=for-the-badge) ![Static Badge](https://img.shields.io/badge/polybar-orange?style=for-the-badge) ![Static Badge](https://img.shields.io/badge/zsh-gren?style=for-the-badge)

###  Project View
- Polybar using --cuting
![image description](https://github.com/MacedoCZY/dotfile/blob/main/topBar.png)
![image description](https://github.com/MacedoCZY/dotfile/blob/main/botoomBar.png)
  - It will probably necessary chose the components names to work correcly. Can do this in ```~/.config/polybar/cuts``` dir, at config.ini and modules.ini

- Allacritty using ProggyCLean Nerd Font
  - If you want chose look at ```~/.config/alacritty/alacritty.yml``` file
  - Put your font files in ```~/.fonts```
 
- For chose background using lightdm
  - Look at this dir ```/usr/share/images/desktop-base``` and too in the files ```/usr/share/lightdm/lightdm-gtk-greeter.conf.d/01_debian.conf```

###  How to install
1. Clone repo
```
git clone https://github.com/MacedoCZY/dotfile
```
2. Need give permission to execution sh
```
chmod +x dotFile.sh
```
3. Execute sh in home dir
```
./dotFile.sh
```
  - At the intalattion, some option you need to chose, about the confioguration of powerlevel10k
    - For more instructions acess powerlevel10k repo: ```https://github.com/romkatv/powerlevel10k ```

###  Observation
Ideally use this sh on a clear installation of debian linux with no interface, or in others linux dist that uses apt package manager.
