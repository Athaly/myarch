# Arch - Valentino

Este proyecto contiene un script automatizado para instalar mi entorno personalizado de Arch Linux en una nueva VM o sistema base.

## Contenido

- Window Manager: i3wm
- Terminal: Alacritty
- Compositor: Picom
- Launcher: Rofi (tema oscuro y morado)
- Panel: Polybar (tema hack personalizado)
- Shell: Bash con Oh My Bash y Git Prompt
- Fuentes: Nerd Fonts (JetBrainsMono, Hack), Font Awesome, Material Icons
- AUR helper: yay

## Instalación

1. Clonar el repositorio:
git clone https://github.com/valentinoloza/myarch
cd myarch

3. Ejecutar:
chmod +x install.sh
./install.sh


4. Reiniciar sesión gráfica o ejecutar `startx` si usás `.xinitrc`.

## Dotfiles incluidos

- .bashrc
- .xprofile
- .xinitrc
- ~/.config/i3
- ~/.config/rofi
- ~/.config/polybar
- ~/.config/alacritty
- ~/.config/picom
- ~/wallpaper (opcional)

## Notas

- Se clona e instala automáticamente polybar-themes (repo de adi1090x).
- Puede requerir ajustar manualmente la interfaz de red en modules.ini si cambia el nombre (por ejemplo enp0s3, eth0, etc).
- Requiere conexión a internet para instalar AUR y clonar temas.
- Se puede personalizar el script para agregar alias, atajos o más configuraciones.

## Requisitos

- Arch Linux base (sin entorno gráfico)
- Usuario con permisos sudo
- Conexión a internet
