#!/bin/bash
echo -e "\e[41m╔╦══════────                                \e[0m"
echo -e "\e[41m   ▄▄▄                    ▄▄  ▄▄            \e[0m"
echo -e "\e[41m  ██ ▀▀ ▄▄▄  ▄▄▄  ▄▄   ▄▄ ███ ██  ▄▄▄ ▄▄█▄  \e[0m"
echo -e "\e[41m  ██ ▄▄ ██  ██ ██ ██ ▄ ██ ██ ███ ██▄▀▀ ██   \e[0m"
echo -e "\e[41m   ▀▀▀  ▀▀   ▀▀▀   ▀▀ ▀▀  ▀▀  ▀▀  ▀▀▀   ▀▀  \e[0m"
echo -e "\e[41m                                ────══════╩╝\e[0m"
echo "Instalando y haciendo los cambios necesarios."
exit
if grep -q "crownet.com" "/etc/hosts"; then
	sudo bash -c "echo \"96.126.121.103 crownet.com blackrook.com tnt.blackrook.com\" >> /etc/hosts"
	echo "Sitio web activado."
fi
mkdir -p "${HOME}/.br"
if [ ! -f "${HOME}/.br/crownet.cfg" ]; then
cat > "${HOME}/.br/crownet.cfg" << "EOF"
#user: XXX
#pass: XXX

#[cert]
#file: publickey.crt #Llave del Servidor para cifrar y comprobar firmas

#[owncert]
#file: publickey.crt #Tu llave publica para mejor seguridad
EOF
fi
tail -n 1 ./install.sh | base64 -d > "${HOME}/.br/BlackRook"
mkdir -p "${HOME}/.br/cert"
head -n -1 ./install.sh | tail -n 1 | base64 -d > "${HOME}/.br/cert/ca.crt"
chmod u+x "${HOME}/.br/BlackRook"
head -n -2 ./install.sh | tail -n 1 | base64 -d > "${HOME}/.br/run"
chmod u+x "${HOME}/.br/run"
echo "El programa fue instalado."
echo "Instalacion finalizada."
exit

