#!/bin/bash

set -e

echo "🌟 Iniciando instalación de entorno"

# 1. Paquetes base
echo "📦 Instalando paquetes base..."
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm xorg-server xorg-xinit xorg-xrandr \
  i3-wm picom rofi alacritty polybar feh git unzip curl xclip xdotool xorg-xprop

# 2. Instalar yay
if ! command -v yay &> /dev/null; then
  echo "🔧 Instalando yay..."
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  cd /tmp/yay
  makepkg -si --noconfirm
  cd ~
fi

# 3. Instalar fuentes necesarias
echo "🔤 Instalando fuentes..."
yay -S --noconfirm ttf-jetbrains-mono-nerd ttf-font-awesome ttf-material-icons nerd-fonts-hack

# 4. Copiar dotfiles
echo "🗂️ Copiando dotfiles..."

cp -rf dotfiles/.config ~/
cp -f dotfiles/.bashrc ~/
cp -f dotfiles/.xprofile ~/
cp -f dotfiles/.xinitrc ~/
mkdir -p ~/wallpaper && cp -r dotfiles/wallpaper/* ~/wallpaper/

# 5. Instalar polybar themes
echo "🎨 Instalando polybar-themes..."

if [ ! -d ~/polybar-themes ]; then
  git clone --depth=1 https://github.com/adi1090x/polybar-themes.git ~/polybar-themes
  cd ~/polybar-themes
  chmod +x setup.sh
  ./setup.sh
  cd ~
fi

# 5.b Interfaz polybar
INTERFACE=$(ip route | awk '/default/ {print $5}')
sed -i "s/interface = .*/interface = $INTERFACE/" ~/.config/polybar/modules.ini

# 6. Asegurar permisos y autostart
chmod +x ~/.config/polybar/launch.sh 2>/dev/null || true

# 7. Mensaje final
echo -e "\n✅ Instalación completada. Podés reiniciar o ejecutar startx si usás xinit.\n"

