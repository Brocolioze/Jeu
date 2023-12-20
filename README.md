# Forgotten Warrior
Bienvenue dans mon jeu RPG miédiéval ou vous incarnez un jeune chevalier a la conquete de territoire lointain.
Je suis l'auteur @Brocolioze et je vous partage ce projet initié sur le logiciel Godot en GDSCript.
Vous trouverez ci-dessous des liens avec lequels je me suis aidé pour concevoir le jeu mais aussi des tutoriels pour celles et ceux qui veulent
en apprendre davantage sur Godot et sa prise en main.
Je vous parlerai aussi de es différentes fonctionnalités que j'ai élaboré dont certaines mon prise beaucoup de temps a les debugger.

**Bonne lecture XD !!!**

## Déctection du joueur par l'ennemi

Comme dans de nombreux jeu-vidéo vous connaissez surement le prinicpe de **Si je te vois, tu me vois**
Un algorithme qui permet de voir ses adversaires sur la map et qui peuvent aussi te voir mais seulement a partir d'une certaine distance.

![image](https://github.com/Brocolioze/Jeu/assets/49524886/82e5af33-88b7-44c9-a5a4-cbb2295d0579)

Eh bien sachez que c'est la meme chose en Godot.
Pour rendre le jeu beaucoup plus immersif.Il est bon de se faire surprendre et meme poursuivre par ses ennemies.
Cela vous fera beaucoup plus interagir dans le jeu en élaborant différentes actions pour vous en tirer d'affaire.

![image](https://github.com/Brocolioze/Jeu/assets/49524886/e77c7df6-b6fc-48a8-b5a5-190270f09db2)

Dans l'image ci-dessus vous pouvez voir notre joueur 'player' et notre ennemi qui est la petite gelule bleu.
Autour d'eux se trouve une armure (cercle bleu) que l'on nomme **collision** dans l'univers du jeu-vidéo.
Celle-ci sert a plusieurs choses mais dans notre exemple elle sert comme vous l'aurez pensez a detecter toute objet qui y pénetre
pour pouvoir effectuer une action sur le personnage.

Pour créer cela il vous suffit d'aller chercher un noeud **(Node)** appeler **CollisionShape2D** et de le mettre sur chacun des personnages comme suit:

![image](https://github.com/Brocolioze/Jeu/assets/49524886/b639c3cc-63fe-4124-b7ef-18cd955c0398)

Passons maintenant a l'algorithme :

![image](https://github.com/Brocolioze/Jeu/assets/49524886/a5dca21f-a747-407a-8ed1-d6fa5164d01d)

Ici nous utilisons des signaux qui nous permette de déclencher certain évenement.
La fonction **func _on_detection_area_body_entered(body):** prend un seul parametre qui est le **body** qui est le corps du joueur **(player)**.
Si le corps du joueur entre en collision avec la l'ennemie (representer par la gellule bleu) notre signal est donc mise en route avec la fonction
**player_chase = true**.

L'algorithme est simple a comprendre :

Nous prenons la position du joueur que nous soustrayons a celle de l'ennemie, le tout divisé par sa vitesse que nous incrémentons par la suite a celle de l'ennemie.
Ensuite nous ajoutons a cela une simple animation appelé **walk**.Ce qui donne pour effet la gellule qui poursuit sa proie en fonction de la vitesse.

Au début cela semble difficile a comprendre mais c'est des calculs mathématique avec la notion de vecteur.
Vous pouvez vous renseignez sur cela avec mon lien qui mene vers un cours complet en processing qui traite sur le sujet.
Une bonne lecture qui vous permet d'apprendre différents algorithmes de programmation ne peut que vous aider a progresser davantage.

Notions sur les vecteurs [La nature du code](https://natureofcode.com/book/chapter-1-vectors/).

## Deplacement du joueur et animation par les sprites

Dans un jeu vidéo, il est tres utile (voir primordial) de se déplacer avec le joueur que ce soit avec une souris ou une manette.
Sinon cela n'aurait aucun intéret de jouer a un jeu vidéo.
Pour cela nous utilisons dans le langage du jeu-vidéo un **sprite** a ne pas confondre avec le soda je vous vois venir XD.
OUI, OUI !!! Vous avez bien entendu un **sprite**. Qu'est-ce que c'est ?
Eh bien... c'est comme je peux dire une succession d'images d'un **character (personnage)** que nous collons les unes sur les autres sur différentes trames séparées par des fréquences de temps.

Comme dans les courts métrages dans les films Disney de 1928 ou quelque chose du genre :

![disney-mickey](https://github.com/Brocolioze/Jeu/assets/49524886/e175eaac-f45c-4de3-b4f4-29ac8aa58e2d)

Les images sont superposées les unes sur les autres ceux qui donnent un effet de mouvement.

Il s'agit du même principe pour notre joueur:

![image](https://github.com/Brocolioze/Jeu/assets/49524886/ce9ae12e-33bb-449d-85f2-6238a268514d)
![image](https://github.com/Brocolioze/Jeu/assets/49524886/faa4ab5e-a16f-4d2e-8534-3f7df22b4548)

Il est recommandé d'effectuer chaque Sprite pour chaque mouvement et chaque direction du personnage pour vous faciliter dans le code.
A part si vous etes des génies mais j'en doute.

Passons maintenant a la partie code :

![image](https://github.com/Brocolioze/Jeu/assets/49524886/38d7e45c-988c-4d65-bd00-941064d3d855)

Connaissez-vous le repere des coordonnées cartésiens ? Avec l'axe des X et Y ? Ici c'est le meme principe nous nous déplacons sur la map en fonction des coordonnées de X et Y et nous ajoutons a cela la vitesse ou nous le laissons a nul qui est le 0.

![image](https://github.com/Brocolioze/Jeu/assets/49524886/f68b510d-5079-4998-874c-0137c04513a2)

## Le fonctionnement de la caméra

Moi : Bonjour etes-vous ici pour le role d'acteur ou de figurant ? Laissez-moi devinez vous etes un futur antagoniste tel que Jack Oswald n'est-ce pas ?

Vous: Non du tout, je suis le technicien de surface

Moi : Ah oui, on vous a appelez tantot pour remplacer un cable dans notre salle de son.Vous prendrez le couloir a droite et...

Interruption 

Vous: Non non je suis la personne de ménage.

Moi : Beh voyons donc...

Comme vous l'aurez penser la  caméra est tres importante dans notre univers de jeu ,car sans elle on ne voit pas et donc conclusion on ne joue pas !!
A cache-cache peut-etre mais bon... c'est une autre histoire.
Choisir un plan de vue pour votre jeu mérite de la réfléxion.Le jeu se joue t'il a la 1er personne, 2ieme personne, 3ieme personne etc.
Bref, peu importe il vous faut un plan de vision qui lorsque que vous bouger dans l'environnement celui-ci se déplace avec vous.
Tel est le role d'une caméra pour capturer vos moindres gestes et mouvement.

[Script en GDSCript]

![image](https://github.com/Brocolioze/Jeu/assets/49524886/ab9d1f5b-6fb5-4113-b4b3-726b7502a866)

Le code ci-desssus définis les limites de la caméra qui sont en faites les extrémités de la carte ou se situe votre personnage.
Votre vision ne pourra donc pas y aller plus loin.
Nous accédons au propriété de la caméra2D de Godot avec les propriétés **limit_left, limit_right et limit_bottom** pour pouvoir définir nos limites pour que la caméra ne dépasse pas l'écran de jeu.
Pour vous faciliter la tache vous pouves y acceder manuellement dans l'onglet **inspecteur**:

![image](https://github.com/Brocolioze/Jeu/assets/49524886/e91945c8-c43f-44e5-be7f-464e89bcd9bb)

Ce qui donne :
![image](https://github.com/Brocolioze/Jeu/assets/49524886/4ee927cd-2cde-4f4f-9ac3-6e5e1fa3de26)

## Les difficultés et problemes recontrés:

La plupart des problemes que j'ai rencontré ont été d'animé le joueur avec les Sprites, les attaques ainsi que le débogage car, comme vous savez un code informatique fonctionne bien dépendamment de sa version
de logiciel dans lequel il a été concu.Ce qui veut dire que meme si votre code un parfait il se peut que votre programme CRASH a cause d'une nouvelle ou ancienne version de votre logiciel de développement.
Il se peut même que des noms de fonctions aient été changés ou supprimés avec la version de votre langage.
L'outils de débogage doit etre acquis pour pouvoir lire les erreurs et pour y apporté un solution.
Je vous montre un screen de tous mes tests de scripts fonctionnel mais non adapté pour mon jeu car il faut changé des parametres de configuration ce qui fait planté le pogramme a moins de tout re-codé.

![image](https://github.com/Brocolioze/Jeu/assets/49524886/3c0950eb-8b2f-4e7c-aa4a-a753533a7896)

![image](https://github.com/Brocolioze/Jeu/assets/49524886/259fa14c-b40c-4307-8769-497374fb7814)

Eh oui ! Sa en fait beaucoup pour développez un jeu !! 
Pour ainsi dire, l'informatique a évolué à une très grande vitesse. Vous n'avez donc plus besoin de vous casser la tete pour régler vos problèmes.
Les intelligences artificielles tel que OpenAi ou ChatGPT peuvent vous aidés et connaissent tout vos problemes.

Le débogage rendu plus facile [ChatGPT](https://chat.openai.com/).

Et pour fini voici quelques liens utiles pour votre développement:

https://dev.to/christinec_dev/lets-learn-godot-4-by-making-an-rpg-part-22-simple-shopkeeper-2efl

Extrait vidéo de mon jeu:
https://drive.google.com/file/d/1-G_2ozFrLLp9ZmJWfrF0thQFRr7HuZ8K/view?usp=sharing

ENJOY!!!



