#!/usr/bin/bash

################################################################################
#
# Tarea 01 - Seguridad
# Malware y Control de Procesos
#
# Virus en shell ejecutable que apaga la computadora después de 5
# minutos. Adicionalmente descarga una imagen de Rick Astley y la
# establece como wallpaper (esto sólo fue probado en gnome). Además
# abre el video de Never Gona Give You Up en YouTube con browser
# establecido como default.
#
#
# Sitios consultados para la elaboración de este script
#
# (1) Kai Yuan, Extracting a Substring in Bash,
# [https://www.baeldung.com/linux/bash-substring]
#
# (2) How to convert a string from uppercase to lowercase in Bash?,
# [https://stackoverflow.com/questions/11392189/how-to-convert-a-string-from-uppercase-to-lowercase-in-bash#11392248]
#
# (3) Change desktop wallpaper from terminal,
# [https://unix.stackexchange.com/questions/59653/change-desktop-wallpaper-from-terminal]
#
# (4) is there a way to open browser using terminal?,
# [https://askubuntu.com/questions/682542/is-there-a-way-to-open-browser-using-terminal]
#
#
#
# Imagen Tomada de https://tec.com.pe/
#
################################################################################


BASE=https://www.tec.com.pe/wp-content/uploads/2021/02/
FILE=572c4830-721d-11eb-bb63-96959c3b62f2.cf_.jpg

# Apagaremos el sistema en 5 minutos
shutdown +5

# Descargamos una imagen que será utilizada como wallpaper
wget ${BASE}${FILE}

# Asignamos la imagen como wallpaper
DESKTOP=$(cut -d : -f 2 <<< "${XDG_CURRENT_DESKTOP}")
DESKTOP=${DESKTOP,,}
gsettings set org.${DESKTOP}.desktop.background picture-uri \'${FILE}\'


# Abrimos la canción en el browser default
xdg-open https://www.youtube.com/watch?v=dQw4w9WgXcQ
