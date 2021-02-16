#!/bin/bash
echo ; echo "Veuillez donner tous les chemins demandés à partir de \$home (ex:\$home\Documents)"; echo ; echo "Chemin d'accès vers le fichier d'initialisation : "
read init_file_path #chemin d'accès au fichier d'initialisation à partir de $home
echo ; echo "Nom du fichier d'initialisation (nom entier extension comprise si présente): "; read InitFile
echo ; echo "Chemin d'accès vers le dossier à analyser (dossier compris ex:\$home\Documents\DossierDeTravail)"
read working_folder_path #chemin d'accès au répertoir de travail
init_file_path=${init_file_path:6}; working_folder_path=${working_folder_path:6} #je coupe le $home au début car on ne puet pas faire cd $home/...
cd $home; cd $init_file_path
echo "@import url('https://fonts.googleapis.com/css?family=Roboto:300&display=swap');*{margin: 0; padding: 0; box-sizing: border-box; font-family: 'Roboto', sans-serif;}header{height: 100px;background: #2b2b2b;min-width: 100%;display: flex;justify-content: center;align-items: center;}footer{position: fixed;bottom: 0; width: 100%; background: #000; color: blue; text-align: center;display: flex;justify-content: center;align-items: center;}ul{width: 60%;display: flex;align-items: center;justify-content: space-between;list-style: none;}a{color: #fff;text-decoration: none;}li{padding: 10px 5px;border-radius: 10px; transition: 0.7s ease-in-out;}li:hover{background-color: #000;border: #3b3b3b;}.all{min-height:100vh;min-width: 100%;display: flex;align-items: center;justify-content: center;}.main{width: 70%;}.part{padding: 20px;border-radius: 20px;border: 1px solid #000;height: auto;width: 100%;margin-bottom: 50px;}h2{width: 100%;text-align: center;text-decoration: underline;}.fraude{margin: 20px 0;opacity: 1;font-size: 135%;}strong{color: darkorchid;text-decoration: underline darkorchid;}.foot{opacity: 1;color: red;}footer button{background-color: transparent;border: 1px solid #fff;color: red;margin-left: 20px;}footer button:hover{cursor: pointer;}#Résultat .fraude:nth-child(3n){border-bottom: 1px solid #2b2b2b;}">styles.css #création du fichier css pour l'affichage final
echo "<!DOCTYPE html><html><head> <link rel='stylesheet' type='text/css' href='styles.css'> <meta charset='utf-8'></head><body> <header> <ul> <li><a href='#Bizarre'>Suspicion et divers</a></li><li><a href='#Résultat'>Résultat</a></li></ul> </header> <div class='all'> <div class='main'> <div id='Bizarre' class='part'>">index.html #création du fichier html pour l'affichage final

#-----------------------Initialisation des variables-----------------------
name_biggest_file="nothing"; size_biggest_file=0; path_biggest_file="nowhere"
name_smaller_file="nothing"; size_smaller_file=999999999; path_smaller_file="nowhere"
sum_txt=0; sum_doc=0; sum_zip=0; sum_pic=0; sum_sound=0; sum_movie=0; sum_data=0; sum_divers=0
size_biggest_txt=0; size_biggest_doc=0; size_biggest_zip=0; size_biggest_pic=0; size_biggest_sound=0; size_biggest_video=0; size_biggest_data=0; size_biggest_divers=0
size_smaller_txt=999999999; size_smaller_doc=999999999; size_smaller_zip=999999999; size_smaller_pic=999999999; size_smaller_sound=999999999; size_smaller_video=999999999; size_smaller_data=999999999; size_smaller_divers=999999999
explored_file=0

#-----------------------Fonction pour gérer les poids lee poids le plus faible et le plus élevé en fonction de la catégorie du fichier-----------------------
verify_ext ()
{
	path=$(pwd)
	file=$2; size=$(wc -c < $file) #Je récuère le poids dans $size
	case $1 in
		"texte simple")
			if [ $size -gt $size_biggest_txt ]; then #le poids du fichier courant est-il plus lourd que le poids du plus gros fichier de la catégorie texxte simple jusqu'à maintenant ? 
    	    	       size_biggest_txt=$size; name_biggest_txt=$file; path_biggest_txt=$(pwd)"/$file"
    	       fi
    	       if [ $size -lt $size_smaller_txt ]; then #le poids du fichier courant est-il plus léger que le poids du plus léger fichier de la catégorie texxte simple jusqu'à maintenant ? 
    	    		   size_smaller_txt=$size; name_smaller_txt=$file; path_smaller_txt=$(pwd)"/$file"
    	       fi;;
		"document")if [ $size -gt $size_biggest_doc ]; then
    	    	       size_biggest_doc=$size; name_biggest_doc=$file; path_biggest_doc=$(pwd)"/$file"
    	       fi
    	       if [ $size -lt $size_smaller_doc ]; then
    	    		   size_smaller_doc=$size; name_smaller_doc=$file; path_smaller_doc=$(pwd)"/$file"
    	       fi;;
		"archive")if [ $size -gt $size_biggest_zip ]; then
    	    	       size_biggest_zip=$size; name_biggest_zip=$file; path_biggest_zip=$(pwd)"/$file"
    	       fi
    	       if [ $size -lt $size_smaller_zip ]; then
    	    		   size_smaller_zip=$size; name_smaller_zip=$file; path_smaller_zip=$(pwd)"/$file"
    	       fi;;
		"image")
		if [ $size -gt $size_biggest_pic ]; then
    	    	       size_biggest_pic=$size; name_biggest_pic=$file; path_biggest_pic=$(pwd)"/$file"
    	       fi
    	       if [ $size -lt $size_smaller_pic ]; then
    	    		   size_smaller_pic=$size; name_smaller_pic=$file; path_smaller_pic=$(pwd)"/$file"
    	       fi;;
		"son")
		if [ $size -gt $size_biggest_sound ]; then
    	    	       size_biggest_sound=$size; name_biggest_sound=$file; path_biggest_sound=$(pwd)"/$file"
    	       fi
    	       if [ $size -lt $size_smaller_sound ]; then
    	    		   size_smaller_sound=$size; name_smaller_sound=$file; path_smaller_sound=$(pwd)"/$file"
    	       fi;;
		"video")if [ $size -gt $size_biggest_video ]; then
    	    	       size_biggest_video=$size; name_biggest_video=$file; path_biggest_video=$(pwd)"/$file"
    	       fi
    	       if [ $size -lt $size_smaller_video ]; then
    	    		   size_smaller_video=$size; name_smaller_video=$file; path_smaller_video=$(pwd)"/$file"
    	       fi;;
		"data")cd $home; cd $init_file_path; echo "<p class='fraude'>Suspicion de fraude pour le fichier <strong>$file</strong></p>">>index.html #je remplis mon fichier html
		if [ $size -gt $size_biggest_data ]; then
    	    	       size_biggest_data=$size; name_biggest_data=$file; path_biggest_data=$(pwd)"/$file"
    	       fi
    	       if [ $size -lt $size_smaller_data ]; then
    	    		   size_smaller_data=$size; name_smaller_data=$file; path_smaller_data=$(pwd)"/$file"
    	       fi;;
    	* | "divers")cd $home; cd $init_file_path; echo "<p class='fraude'><strong>$file</strong> est un fichier qui n'est voulu dans la comptabilisation des catégories (image, video, archive, son, document, texte simple)</p>">>index.html #je remplis mon fichier html
    	if [ $size -gt $size_biggest_divers ]; then
    	    	       size_biggest_divers=$size; name_biggest_divers=$file; path_biggest_divers=$(pwd)"/$file"
    	       fi
    	       if [ $size -lt $size_smaller_divers ]; then
    	    		    size_smaller_divers=$size; name_smaller_divers=$file; path_smaller_divers=$(pwd)"/$file"
    	       fi;;
	esac
	if [ $size -gt $size_biggest_file ]; then #Le poids du fichier courant est-il plus élevé que le plus lourd des fichiers vu jusqu'à maintenant ?
    	size_biggest_file=$size; name_biggest_file=$file; path_biggest_file=$(pwd)"/$file"
    fi
    if [ $size -lt $size_smaller_file ]; then #'' '' '' est-il plus léger '' '' '' le plus léger '' '' '' 
    	size_smaller_file=$size; name_smaller_file=$file; path_smaller_file=$(pwd)"/$file"
    fi
    cd $path
}


#-----------------------Fonction pour vérifier si le fichier est corrompu et s'il nous voulons le compter dans une catégorie ou qu'il aille dans divers-----------------------
look_ext ()
{
	explored_file=$(($explored_file+1)) #débogage
	path=$(pwd); cd $home; cd $init_file_path; #je me rends dans le répertoir où se trouve le fichier d'initialisation
	inode=$1; ext_exist=0;
	ext_file="${1##*.}" #Je prends l'extension en partant de la fin pour éviter les éventuels '.' dans le nom du fichier
	for el in $(cut -d':' -f2 $InitFile)
	do
		if [ $ext_file = $el ]; then #Je regarde si l'extension du fichier courant "match" avec l'une des extensions dans le fichier d'initialisatio 
			ext_exist=1
		fi
	done
	type_exist=0; t=$(grep $ext_file $InitFile); type_file=$(echo $t|cut -d':' -f1); cate=$(grep $ext_file $InitFile|cut -d':' -f3) #je récupère le type et la catégorie associé(e) à cette extension
	cd $path     #je retourne dans le répertoir où se trouve le fichier en cours d'analyse
	typ=$(file $1 | cut -d ',' -f1); typ=$(echo $typ | cut -d ':' -f2); typ=$(echo $typ | sed "s/\[//g")     #je récupère le type du fichier en cours d'analyse
	if [ "$typ" = "$type_file" ]; then     #Je regarde si le type associé à l'extension dans le fichier d'initialisation est le même que celui du fichier courant
		type_exist=1
	fi
	verif_add=$(($ext_exist+$type_exist))
	if [ $verif_add -eq 2 ]; then #test pour voir si le type et l'extension sont bons
		cate=$cate
	elif [ $verif_add -eq 1 ]; then #sinon je teste pour voir si le type OU l'extension correspond à quelque chose de mon fichier d'initialisation
		cate="data"
	elif [ $type_exist -eq 0 ]; then #si rien ne correspond à rien de mon fichier d'initialisation alors il est dans la catégorie 'divers'
		cate="divers"; fi
	sum_of_sum=$((sum_of_sum+size)) #Somme total des fichier
	
	#----répartition des fichiers dans leur catégorie pour l'analyse des poids----------
	case $cate in
		"texte simple")sum_txt=$((sum_txt+size))
			verify_ext "texte simple" $inode;;
		"document")sum_doc=$((size+sum_doc))
			verify_ext "document" $inode;;
		"image")sum_pic=$((size+sum_pic))
		    verify_ext "image" $inode;;
		"son")sum_sound=$((size+sum_sound))
		    verify_ext "son" $inode;;
		"video")sum_movie=$((size+sum_movie))
		    verify_ext "video" $inode;;
		"archive")sum_zip=$((size+sum_zip))
		    verify_ext "archive" $inode;;
		"data")sum_data=$((size+sum_data)) 
		    verify_ext "data" $inode;;
		* | "divers")sum_divers=$((size+sum_divers)) 
		    verify_ext "divers" $inode;;
	esac
}

#------------------------fonction pour dézipper les archives--------------------
dezip ()
{
	path=$(pwd)
	for el in $(find * -type f) #cherche tous les fichiers
	do
		ext=$(echo $el | sed 's/.*\.//g')
		if [ $ext = "gz" ]; then #si un fichier est une archive
			mkdir $path"/tmp"; tar -xzvf $el -C ./tmp #je créer un dossier temp et dézippe l'archive dedans (vu que mkdir n'est pas idempotente elle ne va pas recréer le dossier)
		fi 
	done 
}


cd $home; cd $working_folder_path #C'est la suite directe de la ligne 18
dezip #j'appelle la fonction pour tout dézipper
echo "----------------"
#------------------------------------------------Boucle principale--------------------------------------------------
for rep in $(find -type d) #je ressors tous les dossiers y comprit l'actuel (le dossier . est donc comprit)
do
	cd $home; cd $working_folder_path/$rep #je me rends dans le dossier à explorer
	for el in $(find * -maxdepth 0 -type f) #je ressors tous les fichiers dans le répertoir actuel et pas plus loin graĉe à -maxdepth 0
	do
		look_ext $(echo $el | awk -F"/" '{print $NF}') #j'appelle la fonction 'look_ext' avec comme paramètre le nom du fichier courant
	done
done 


cd $home; cd $init_file_path #je reviens dans le répertoire où se trouev mon fichier html
echo "</div><div id='Résultat' class='part'>">>index.html #je complète mon fichier

#---------------------------------------------Affichage final-----------------------------------------------
#echo "txt = $((sum_txt/1000000))"
echo "------------TXT------------"
echo $name_biggest_txt;echo $size_biggest_txt;echo $path_biggest_txt;echo $name_smaller_txt;echo $size_smaller_txt;echo $path_smaller_txt
echo "------------DOC------------"
#echo "doc = $((sum_doc/1000000))"
echo $name_biggest_doc;echo $size_biggest_doc;echo $path_biggest_doc;echo $name_smaller_doc;echo $size_smaller_doc;echo $path_smaller_doc
echo "------------ZIP------------"
#echo "zip = $((sum_zip/1000000))"
echo $name_biggest_zip;echo $size_biggest_zip;echo $path_biggest_zip;echo $name_smaller_zip;echo $size_smaller_zip;echo $path_smaller_zip
echo "------------IMG------------"
#echo "pic = $((sum_pic/1000000))"
echo $name_biggest_pic;echo $size_biggest_pic;echo $path_biggest_pic;echo $name_smaller_pic;echo $size_smaller_pic;echo $path_smaller_pic
echo "------------SON------------"
#echo "sound = $((sum_sound/1000000))"
echo $name_biggest_sound; echo $size_biggest_sound; echo $path_biggest_sound; echo $name_smaller_sound; echo $size_smaller_sound; echo $path_smaller_sound
echo "------------VIDEO------------"
#echo "movie = $((sum_movie/1000000))"
echo $name_biggest_video; echo $size_biggest_video; echo $path_biggest_video; echo $name_smaller_video; echo $size_smaller_video; echo $path_smaller_video
echo "------------DATA------------"
#echo "data = $((sum_data/1000000))"
echo $name_biggest_data; echo $size_biggest_data; echo $path_biggest_data; echo $name_smaller_data; echo $size_smaller_data; echo $path_smaller_data
echo "------------DIVERS------------"
#echo "divers = $((sum_divers/1000000))"
echo $name_biggest_divers; echo $size_biggest_divers; echo $path_biggest_divers; echo $name_smaller_divers; echo $size_smaller_divers; echo $path_smaller_divers
echo "================================================="
echo "name biggest = $name_biggest_file";echo "size '' = $size_biggest_file";echo "path '' = $path_biggest_file";echo "name smaller = $name_smaller_file";echo "size '' = $size_smaller_file";echo "path '' = $path_smaller_file"
echo "================================================="
#sum_of_sum=$((sum_txt+sum_doc+sum_zip+sum_pic+sum_movie+sum_wrong))
lambda=`echo "$sum_of_sum / 1000000" |bc -l`; echo "$lambda Mo" ;echo $explored_file


#----------------------------Je complète mon fichier html et l'exécute pour un joli affichage (en tout cas plus joli que celui de la console)---------------------------------------------------
echo "<p class='fraude'><b>La totalité</b> de la catégorie <b>'texte simple'</b> pèse <strong class='size'>$sum_txt</strong></p><p class='fraude'>La catégorie '<strong>texte simple</strong>' a comme <strong>plus gros</strong> fichier <strong>$name_biggest_txt</strong> se trouvant dans <strong>$path_biggest_txt</strong> avec un poids de <strong class='size'>$size_biggest_txt</strong></p><p class='fraude'>La catégorie '<strong>texte simple</strong>' a comme <strong>plus petit</strong> fichier <strong>$name_smaller_txt</strong> se trouvant dans <strong>$path_smaller_txt</strong> avec un poids de <strong class='size'>$size_smaller_txt</strong></p>">>index.html
echo "<p class='fraude'><b>La totalité</b> de la catégorie <b>'document'</b> pèse <strong class='size'>$sum_doc</strong></p><p class='fraude'>La catégorie '<strong>document</strong>' a comme <strong>plus gros</strong> fichier <strong>$name_biggest_doc</strong> se trouvant dans <strong>$path_biggest_doc</strong> avec un poids de <strong class='size'>$size_biggest_doc</strong></p><p class='fraude'>La catégorie '<strong>document</strong>' a comme <strong>plus petit</strong> fichier <strong>$name_smaller_doc</strong> se trouvant dans <strong>$path_smaller_doc</strong> avec un poids de <strong class='size'>$size_smaller_doc</strong></p>">>index.html
echo "<p class='fraude'><b>La totalité</b> de la catégorie <b>'archive'</b> pèse <strong class='size'>$sum_zip</strong></p><p class='fraude'>La catégorie '<strong>archive</strong>' a comme <strong>plus gros</strong> fichier <strong>$name_biggest_zip</strong> se trouvant dans <strong>$path_biggest_zip</strong> avec un poids de <strong class='size'>$size_biggest_zip</strong></p><p class='fraude'>La catégorie '<strong>archive</strong>' a comme <strong>plus petit</strong> fichier <strong>$name_smaller_zip</strong> se trouvant dans <strong>$path_smaller_zip</strong> avec un poids de <strong class='size'>$size_smaller_zip</strong></p>">>index.html
echo "<p class='fraude'><b>La totalité</b> de la catégorie <b>'image'</b> pèse <strong class='size'>$sum_pic</strong></p><p class='fraude'>La catégorie '<strong>image</strong>' a comme <strong>plus gros</strong> fichier <strong>$name_biggest_pic</strong> se trouvant dans <strong>$path_biggest_pic</strong> avec un poids de <strong class='size'>$size_biggest_pic</strong></p><p class='fraude'>La catégorie '<strong>image</strong>' a comme <strong>plus petit</strong> fichier <strong>$name_smaller_pic</strong> se trouvant dans <strong>$path_smaller_pic</strong> avec un poids de <strong class='size'>$size_smaller_pic</strong></p>">>index.html
echo "<p class='fraude'><b>La totalité</b> de la catégorie <b>'son'</b> pèse <strong class='size'>$sum_sound</strong></p><p class='fraude'>La catégorie '<strong>son</strong>' a comme <strong>plus gros</strong> fichier <strong>$name_biggest_sound</strong> se trouvant dans <strong>$path_biggest_sound</strong> avec un poids de <strong class='size'>$size_biggest_sound</strong></p><p class='fraude'>La catégorie '<strong>son</strong>' a comme <strong>plus petit</strong> fichier <strong>$name_smaller_sound</strong> se trouvant dans <strong>$path_smaller_sound</strong> avec un poids de <strong class='size'>$size_smaller_sound</strong></p>">>index.html
echo "<p class='fraude'><b>La totalité</b> de la catégorie <b>'video'</b> pèse <strong class='size'>$sum_movie</strong></p><p class='fraude'>La catégorie '<strong>video</strong>' a comme <strong>plus gros</strong> fichier <strong>$name_biggest_video</strong> se trouvant dans <strong>$path_biggest_video</strong> avec un poids de <strong class='size'>$size_biggest_video</strong></p><p class='fraude'>La catégorie '<strong>video</strong>' a comme <strong>plus petit</strong> fichier <strong>$name_smaller_video</strong> se trouvant dans <strong>$path_smaller_video</strong> avec un poids de <strong class='size'>$size_smaller_video</strong></p>">>index.html
echo "<p class='fraude'><b>La totalité</b> de la catégorie <b>'data'</b> pèse <strong class='size'>$sum_data</strong></p><p class='fraude'>La catégorie '<strong>data</strong>' a comme <strong>plus gros</strong> fichier <strong>$name_biggest_data</strong> se trouvant dans <strong>$path_biggest_data</strong> avec un poids de <strong class='size'>$size_biggest_data</strong></p><p class='fraude'>La catégorie '<strong>data</strong>' a comme <strong>plus petit</strong> fichier <strong>$name_smaller_data</strong> se trouvant dans <strong>$path_smaller_data</strong> avec un poids de <strong class='size'>$size_smaller_data</strong></p>">>index.html
echo "<p class='fraude'><b>La totalité</b> de la catégorie <b>'divers'</b> pèse <strong class='size'>$sum_divers</strong></p><p class='fraude'>La catégorie '<strong>divers</strong>' a comme <strong>plus gros</strong> fichier <strong>$name_biggest_divers</strong> se trouvant dans <strong>$path_biggest_divers</strong> avec un poids de <strong class='size'>$size_biggest_divers</strong></p><p class='fraude'>La catégorie '<strong>divers</strong>' a comme <strong>plus petit</strong> fichier <strong>$name_smaller_divers</strong> se trouvant dans <strong>$path_smaller_divers</strong> avec un poids de <strong class='size'>$size_smaller_divers</strong></p>">>index.html
echo "<p class='fraude'><strong>Le plus gros de tous les fichiers est $name_biggest_file se trouvant dans $path_biggest_file et pesant <strong class='size'>$size_biggest_file</strong> <br>Le plus petit de tous les fichiers est $name_smaller_file se trouvant dans $path_smaller_file et pesant <strong class='size'>$size_smaller_file</strong></strong></p>">>index.html
echo "</div></div></div><footer><p class='fraude foot'>*Le poids est affiché en octets</p><button onclick='conv()'>Convertir les tailles en Mégaoctets</button></footer> <script>var turn=0; function conv(){turn++; const but=document.getElementsByTagName('button')[0]; if(turn % 2==0){for(var i=0; i < document.querySelectorAll('.size').length; i++){document.querySelectorAll('.size')[i].innerHTML=document.querySelectorAll('.size')[i].innerHTML*1000000;}but.innerHTML='Convertir les tailles en Mégaoctets';}else{for(var i=0; i < document.querySelectorAll('.size').length; i++){document.querySelectorAll('.size')[i].innerHTML=document.querySelectorAll('.size')[i].innerHTML/1000000;}but.innerHTML='Convertir les tailles en octets';}}</script></body></html>">>index.html
x-www-browser index.html