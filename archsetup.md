# My Config from A to Z
This should be step by step guide to set up my initial configurations. This includes installing archlinux, setting up i3wm and other programs that I use frequently and their config files.

## 1. Archlinux
#### 1.1 iwctl
Connecting to wifi
```shell
$ iwctl
```

```shell
$ station __name__ scan
```

```shell
$ station __name__ connect __SSID__
```
#### 1.2 cfdisk (gpt)
Delete all existing partitions

You need to create 3 partitions:
1. 100M - Boot partition
2. 8G - Swap
3. Remaining disk - /

After that, WRITE all your partitions, and quit

#### 1.3 Format the partitions
1. Formating root:
```shell
$ mkfs.ext4 /dev/__root_partition__
```
2. Swap:
```shell
$ mkswap /dev/__swap_partition__
```
3. Boot:
```shell
$ mkfs.fat -F 32 /dev/__efi_system_partition__
```

#### 1.4 Mounting
1. Root:
```shell
$ mount /dev/__root_partition__ /mnt
```

2. Boot:
2.1 Create directory:
```shell
$ mkdir -p /mnt/boot/efi
```
2.2 Mount:
```shell
$ mount /dev/__efi_system_partition__ /mnt/boot
```
3. Swap:
```shell
$ swapon /dev/__swap_partition__
```

4. Check if everything mounted properly:
```shell
$ lsblk
```

#### 1.5 Install Base System
```shell
$ pacstrap /mnt base linux linux-firmware sof-firmware base-devel grub efibootmgr neovim networkmanager
```

And this should download and install the core system

#### 1.6 fstab
```shell
$ genfstab /mnt
```

```shell
$ genfstab /mnt > mnt/etc/fstab
```

```shell
$ cat /mnt/etc/fstab
```

#### 1.7 Changing root
```shell
$ arch-chroot /mnt
```

And now, we entered the system

#### 1.8 Timezone
```shell
$ ln -sf /usr/share/zoneinfo/Asia/Tashkent /etc/localtime
```

Then just check your time
```shell
$ date
```

```shell
$ hwclock --systohc
```

#### 1.9 Localization
```shell
$ nvim /etc/locale.gen
```

Scroll down, find ```en_US.UTF-8 UTF-8```, and uncomment it

```shell
$ locale-gen
```

``` shell
$ nvim /etc/locale.conf
```

In this file, type:

```LANG=en_US.UTF-8```

#### 1.10 Hostname
```shell
$ nvim /etc/hostname
```
And name your host whatever you want, you usually name it "admin"

#### 1.11 Root password
```shell
$ passwd
```

#### 1.12 Personal user
```shell
$ useradd -m -G wheel -s /bin/bash doniyorziyod
```

```shell
$ passwd doniyorziyod
```

#### 1.13 SUDO
1. Exit to root user
2. Open SUDOERS file
```shell
$ EDITOR=nvim visudo
```
3. Scroll below, uncomment this line:

```%wheel ALL=(ALL) ALL```

#### 1.14 Enabling Core services
```shell
$ systemctl enable NetworkManager
```

#### 1.15 Set up BOOT loader
```shell
$ grub-install /dev/sda
```

```shell
$ grub-mkconfig -o /boot/grub/grub.cfg
```

> IMPORTANT! IF YOU WANT TO DUALBOOT, YOU NEED TO CONFIGURE IT

#### 1.16 Exiting the Archiso
```shell
$ exit
```
```shell
$ unmount -a
```
```shell
$ reboot
```

Log in, check the internet connection, and go to the next step

If you disconnected from wifi, do this:
```shell
$ nmcli radio wifi
$ nmcli dev status
$ nmcli dev wifi list
$ sudo nmcli --ask dev wifi connect __WIFI_NAME__
```

# 2. i3wm
#### 2.1 Install ALL essential packages that you usually install
```shell
$ sudo pacman -Syu i3 telegram-desktop kitty fish neovide firefox i3blocks polybar rofi dmenu obsidian ripgrep tmux picom dunst i3status neofetch openssh lxappearance nitrogen pcmanfm calibre fontconfig zip unzip p7zip lazygit tree brightnessctl libnotify pamixer fzf unclutter clipmenu autotiling-rs flameshot webkitgtk-6.0 git ntp
```

#### 2.2 GIT setup
```shell
$ ssh-keygen -t ed25519 -C "your_email@example.com"
$ eval "$(ssh-agent -s)"
$ ssh-add ~/.ssh/id_ed25519
$ cat ~/.ssh/id_ed25519.pub
$ ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
```

#### Bluetooth
```shell
$ sudo systemctl start bluetooth.service
$ sudo systemctl enable bluetooth.service
```
And just use blueman-manager

#### Microphone
```shell
$ pacmd list-sources
```
Find active device (marked with *)

```shell
$ pacmd set-source-volume __id__ 30000
```

#### Time & Date
```shell
$ sudo ntpd -qg
```
