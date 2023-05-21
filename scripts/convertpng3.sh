#!/bin/bash

convert_imagens_jpg_para_png(){
	cd /home/alisson/Downloads/imagens-livros

	##se não existir a pasta png crie-a.
	if [ ! -d png ]
	then
		mkdir png
	fi
	##root@alisson-desktop:/home/alisson/Downloads/imagens-livros# ls cordova.jpg | awk -F. '{print $1}'
	##cordova

	for image in *.jpg
	do
		##usa awk para tirar o nome da extensão.
		local img_sem_extensao=$(ls $image | awk -F. '{print $1}')
		convert $img_sem_extensao.jpg png/$img_sem_extensao.png
	done
}
convert_imagens_jpg_para_png

if [ $? -eq 0 ]
then
    echo "script executado com sucesso!"
else
    echo "algo de errado não deu certo!"
fi
