#!/bin/bash

PATH_TO_FOLDER=/home/alisson/Downloads/imagens-livros

##-> converter pelo nome normal
##convert /home/alisson/Downloads/imagens-livros/amazon_aws.jpg /home/alisson/Downloads/imagens-livros/amazon_aws.png

##->converter utilizando variaveis, usuario pode executar:"bash /path/to/nome_do_script.sh nome_da_imagem_jpg"
##convert /home/alisson/Downloads/imagens-livros/$1.jpg /home/alisson/Downloads/imagens-livros/$1.png

##->converter duas "manualmente" 
##convert $PATH_TO_FOLDER/$1.jpg $PATH_TO_FOLDER/$1.png
##convert $PATH_TO_FOLDER/$2.jpg $PATH_TO_FOLDER/$2.png

##looping para mais parametros na execução do arquivo.
for image in $@
do
	convert $PATH_TO_FOLDER/$image.jpg $PATH_TO_FOLDER/$image.png
done
