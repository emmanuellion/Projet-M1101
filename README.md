# Projet-M1101

<h4>LION Emmanuel</h4>
<h4>OUKINA Swann</h4>
<h4>Rostaing Hippolyte</h4>

## Sujet
On veut lister les fichiers d'un utilisateur, selon leurs types et leurs tailles. L'application en script Bash (uniquement, pas de développement dans un autre langage, pas d'appel à des applications) parcourt les répertoires et les sous-répertoires à partir d'un chemin de base, liste les fichiers présents en récupérant leur taille (via la commande `ls` par exemple) et détermine de quel type ils sont (via la commande `file`).
</br>
Les types de fichier possibles (cf les fichiers test fournis) sont :
</br></br>
<ul>
  <li>texte simple</li>
  <li>document (EXCEL ODT HTML PDF)</li>
  <li>archive (tar.gz)</li>
  <li>image (GIF JPG SVG PNG)</li>
  <li>son (MP3)</li>
  <li>vidéos (MP4 GIF animé)</li>
</ul>
</br>
L'application doit être basée sur un fichier d'initialisation qui permet de spécifier les types à lister, avec un </br>format à définir, comme par exemple :
</br></br>

```text
SVG:Scalable Vector Graphics:image
```

</br>

```text
MPEG:audio Monaural:son
```

<br><br>
La sortie de l'application est la liste, pour chaque type, de la taille totale en megaoctets des fichiers de ce type, du nom, de la taille et du chemin du fichier de taille la plus grande de ce type, et de taille la plus petite. Si des fichiers ont une extension qui ne correspond pas à leur type, il faut les lister (soupçon de fraude).
<br><br>
Les fichiers archive doivent être détectés et parcourus comme des répertoires, i.e. on liste également leurs tailles dans les autres types. Si on y trouve un fichier audio mp3, sa taille est ajoutée à la taille des fichiers mp3 globale par exemple.
<br><br>
Attention, ne vous fiez pas aux noms ou aux extensions des fichiers. Certains fichiers ne seront pas reconnus (**data**), il faudra des catégories "divers", pour ces "data" supplémentaires.
<br><br>
Vous pouvez apporter des ajouts aux points précédents (sortie en HTML, test date et heure...) mais ils ne seront notés en bonus que si les points obligatoires sont remplis.
