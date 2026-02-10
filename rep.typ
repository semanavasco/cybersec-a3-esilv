#set page(
  paper: "a4",
  margin: (x: 2cm, y: 2cm),
)
#set text(
  font: "New Computer Modern",
  lang: "fr",
  size: 11pt,
)

// En-tête du document
#align(center)[
  #text(size: 14pt, weight: "bold")[Cybersécurité\ \Introduction Crypto\ \TP1] \ \
  Vasco VALADARES SEMANA et Guillaume BLAS
]

// Contenu du document
= Donner votre avis en répondant aux questions suivantes :

== Qu’est-ce qu’une donnée personnelle ? (donner des exemples)

Une donnée personnelle est toute information se rapportant à une personne physique identifiée ou identifiable. Par exemple, le nom, l'adresse e-mail, le numéro de téléphone, l'adresse IP, les données de localisation, les informations de santé, etc.

== Que sont les données sensibles ? (donner des exemples)

Les données sensibles sont des données personnelles permettant d'identifier une personne physique de manière unique ou de révéler des informations intimes sur elle. Par exemple, les données de santé, les opinions politiques, les convictions religieuses, l'origine raciale ou ethnique, les données biométriques, etc.

== Qu’est-ce que les métadonnées ? (donner des exemples)

Les métadonnées sont des données qui décrivent d'autres données. Elles fournissent des informations sur la structure, le contenu, la provenance ou l'utilisation d'une donnée. Par exemple, les métadonnées d'une photo peuvent inclure la date et l'heure où celle-ci a été prise, les coordonnées GPS, le modèle de l'appareil photo, etc.

== Qu’est-ce que le cyberespace ?

Le cyberespace est un espace virtuel créé par les réseaux informatiques et les technologies de l'information. Il englobe l'ensemble des interactions, des communications et des activités qui se déroulent en ligne, que ce soit sur Internet, les réseaux sociaux, les applications mobiles, etc.

== Pourquoi les données personnelles passionnent tant ?

Les données personnelles passionnent tant car elles sont au coeur de nombreuses activités en ligne. Ce sont des ressources préciseuses pour comprendre les comportements, les préférences et les besoins des utilisateurs, ce qui en fait un enjeu majeur pour la vie privée et la sécurité. Elles permettent aux entreprises d'appliquer des stratégies de marketing ciblé, aux gouvernements de surveiller les citoyens, et aux individus de partager des informations sur eux-mêmes.

== Internet, est-il un cimetière de données personnelles ?

Il n'y a pas de bonne ou mauvaise réponse, cependant, nous pouvons considérer qu'Internet est un cimetière de données personnelles dans la mesure où de nombreuses informations personnelles y sont stockées, souvent sans le consentement explicite des utilisateurs, et ce, même après leur mort.

== Si  je n’utilise pas ou très peu Internet, suis-je concerné par la sécurité des données personnelles ? Pourquoi ?

Oui, même si on n'utilise pas ou très peu Internet, on est concerné par la sécurité des données personnelles, car de nombreuses données personnelles peuvent être collectées à notre sujet par d'autres moyens, tels que les transactions bancaires, les achats en magasin, les interactions avec les services publics, etc.

== Le « sentiment de sécurité dans le cloud ».

Je pense que le sentiment de sécurité dans le cloud peut être trompeur, car nous ne savons pas toujours où nos données sont stockées, qui y a accès et comment elles sont protégées, on peut croire ou être persuadés que nos données sont en sécurité, alors qu'en réalité, elles peuvent être vulnérables à des attaques ou à des fuites.

== « Pas grave si on prend mes données, je n’ai rien à cacher ». 

Ce n'est pas une question d'avoir des choses à cacher, mais plutôt une question de respect de la vie privée et de contrôle sur ses propres informations. Même si on n'a rien à cacher, on peut ne pas vouloir que nos données soient utilisées à des fins commerciales, surveillées par des gouvernements ou exposées à des risques de sécurité. Ce n'est pas parce qu'on n'a rien à cacher que l'on a pas quelque chose à perdre.

== Quels sont vos interrogations sur le monde digital ?

Comment puis-je protéger ma vie privée en ligne si tout ce que je fais est suivi sans que je n'en sois au courant ?


#set heading(numbering: "1.1 -")


= Code César

== Chiffrement et déchiffrement César

Nous avons implémenté deux fonctions : `caesar_encode` pour chiffrer un message en décalant chaque lettre de l'alphabet d'un nombre donné, et `caesar_decode` pour l'inverser. Les fonctions gèrent les majuscules, les minuscules, et préservent les ponctuations, espaces, etc..

#figure(image("1_1.png"))

== Attaque par force brute

Nous avons implémenté une fonction de force brute (`brute_force_caesar`) qui teste les 26 clés possibles (0 à 25) pour déchiffrer un message César.

#figure(image("1_2.png"))

Extraits du brute force pour les messages 1 et 2 :

#raw("============ Message 1 ============
Clé  0: WP NZOLRP PDE FY LCE
Clé  1: VO MYNKQO OCD EX KBD
Clé  2: UN LXMJPN NBC DW JAC
  ...
Clé 10: MF DPEBHF FTU VO BSU
Clé 11: LE CODAGE EST UN ART
Clé 12: KD BNCZFD DRS TM ZQS
Clé 13: JC AMBYEC CQR SL YPR
Clé 14: IB ZLAXDB BPQ RK XOQ
Clé 15: HA YKZWCA AOP QJ WNP

============ Message 2 ============
Clé  0: HA YKZWCA AOP QJ WNP
Clé  1: GZ XJYVBZ ZNO PI VMO
Clé  2: FY WIXUAY YMN OH ULN
  ...
Clé 21: MF DPEBHF FTU VO BSU
Clé 22: LE CODAGE EST UN ART
Clé 23: KD BNCZFD DRS TM ZQS
Clé 24: JC AMBYEC CQR SL YPR
Clé 25: IB ZLAXDB BPQ RK XOQ")

- Message 1 : "WP NZOLRP PDE FY LCE" → déchiffré avec la clé *11* : "LE CODAGE EST UN ART"

- Message 2 : "HA YKZWCA AOP QJ WNP" → déchiffré avec la clé *22* : "LE CODAGE EST UN ART"

On remarque que les deux messages donnent exactement le même texte en clair mais avec des clés différentes (11 et 22), ce qui montre qu'avec le chiffrement César, il existe plusieurs clés possibles pour obtenir le même résultat.


#pagebreak()


== Déchiffrement avec majuscules et minuscules

Comme on a déjà implémenté ces contraintes dans nos fonctions on passe à la brute-force, nous avons identifié les messages :

#figure(image("1_3a.png"))

#raw("============ Brute force Message 3 ============
  ...
Clé 18: pendant la seconde guerre mondiale les americains employerent des indiens navajos pour crypter des messages. c'est l'un des rares codes de l'histoire a n'avoir jamais ete brise. l'impenetrabilite du code navajo vient en particulier du fait que cette langue n'a aucun lien avec une quelconque langue europeenne ou asiatique.
  ...

============ Brute force Message 4 ============
  ...
Clé  3: Demain, des l'aube, a l'heure ou blanchit la campagne, Je partirai. Vois-tu, je sais que tu m'attends. J'irai par la foret, j'irai par la montagne. Je ne puis demeurer loin de toi plus longtemps. Je marcherai les yeux fixes sur mes pensees, Sans rien voir au dehors, sans entendre aucun bruit, Seul, inconnu, le dos courbe, les mains croisees, Triste, et le jour pour moi sera comme la nuit. Je ne regarderai ni l'or du soir qui tombe, Ni les voiles au loin descendant vers Harfleur, Et quand j'arriverai, je mettrai sur ta tombe Un bouquet de houx vert et de bruyere en fleur. Victor Hugo - Les Contemplations
  ...")

La vérification par re-chiffrement confirme que nos fonctions sont correctes :

#figure(image("1_3b.png"))

= Indice de Coïncidence

== Calcul de l'indice de coïncidence et détection de langue

Notre fonction `coincidence_index` calcule l'indice pour chaque message, puis `detect_language` compare la valeur obtenue avec les indices présents dans le tableau :

#figure(image("2_1a.png"))

#figure(image("2_1b.png"))

Le seul correct est le message 3 qui est bien en français.

= L'Analyse Fréquentielle

== Déchiffrement par analyse fréquentielle

Notre fonction `decrypt_by_frequency_analysis` combine deux techniques :
1. L'indice de coïncidence pour déterminer la langue probable du message
2. L'analyse des fréquences des lettres pour trouver la clé de déchiffrement

#figure(image("3_1a.png"))
#figure(image("3_1b.png", height: 380pt))

Résultats :
- *Message 4* :
  - Indice de coïncidence : 0.0710 (indice proche du Danois, mais c'est du français)
  - Lettre la plus fréquente : H (15.1%)
  - Clé trouvée : 3 (écart entre H et E)
  - Texte déchiffré : Demain, des l'aube, a l'heure ou blanchit la campagne, Je partirai. Vois-tu, je sais que tu m'attends. J'irai par la foret, j'irai par la montagne. Je ne puis demeurer loin de toi plus longtemps. Je marcherai les yeux fixes sur mes pensees, Sans rien voir au dehors, sans entendre aucun bruit, Seul, inconnu, le dos courbe, les mains croisees, Triste, et le jour pour moi sera comme la nuit. Je ne regarderai ni l'or du soir qui tombe, Ni les voiles au loin descendant vers Harfleur, Et quand j'arriverai, je mettrai sur ta tombe Un bouquet de houx vert et de bruyere en fleur. Victor Hugo - Les Contemplations

- *Message 5* :
  - Indice de coïncidence : 0.0832 (indice proche du Malaysien, mais c'est du français)
  - Lettre la plus fréquente : T (20.1%)
  - Clé trouvée : 15 (écart entre T et E)
  - Texte déchiffré : Julie et Jules ont invente un moyen de communication secret. l'expediteur ecrit le texte ligne par ligne dans un rectangle de 6 lignes et 3 colonnes. ensuite il le recopie colonne par colonne. Jules, pendant le controle de reseaux, a oublie sa calculette. il envoie le message suivant: BQTFZYLTKEDPCB ?PF. quelle doit etre la reponse de Julie?

== Validation avec le message 6

Pour valider notre méthode, nous l'appliquons au message 6 qui est en anglais :
- Indice de coïncidence : 0.0737 (plus proche du Finnois mais c'est de l'anglais...)
- Lettre la plus fréquente : L (13.1%)
- Clé trouvée : 7 (écart entre L et E)
- Texte déchiffré : William Blake The Tiger TIGER, tiger, burning bright In the forests of the night, What immortal hand or eye Could frame thy fearful symmetry? In what distant deeps or skies Burnt the fire of thine eyes? On what wings dare he aspire? What the hand dare seize the fire? And what shoulder and what art Could twist the sinews of thy heart? And when thy heart began to beat, What dread hand and what dread feet? What the hammer? what the chain? In what furnace was thy brain? What the anvil? What dread grasp Dare its deadly terrors clasp? When the stars threw down their spears, And water'd heaven with their tears, Did He smile His work to see? Did He who made the lamb make thee? Tiger, tiger, burning bright In the forests of the night, What immortal hand or eye Dare frame thy fearful symmetry ?

Cela confirme que notre méthode d'analyse fréquentielle fonctionne efficacement pour les textes en français comme en anglais. Même si l'indice de coïncidence n'est pas parfaitement aligné avec les valeurs de référence, l'analyse des fréquences permet de trouver la clé correcte et d'obtenir un texte en clair cohérent.

== Analyse par digrammes et trigrammes

Pour déterminer si un message est en clair ou chiffré, nous avons implémenté une analyse basée sur les digrammes (groupes de 2 lettres) et les trigrammes (groupes de 3 lettres).

Nous avons d'abord écrit les fonctions `count_digrams` et `count_trigrams` qui comptent les occurrences de chaque groupe de lettres dans un texte. Ensuite, la fonction `is_plaintext` compare les digrammes et trigrammes les plus fréquents du texte avec les références connues pour le français et l'anglais. Si un nombre suffisant de correspondances est trouvé, le texte est considéré comme étant en clair.

#figure(image("3_3a.png"))
#figure(image("3_3b.png"))

#pagebreak()

Résultats sur les messages chiffrés :
- Les 4 messages chiffrés sont correctement identifiés comme "Texte chiffre" avec des scores de 0 ou 1 (aucun digramme/trigramme courant détecté)

Résultats sur les messages déchiffrés :
- Message 3 (français) : texte en clair, score = 15 (12 digrammes + 3 trigrammes correspondants)
- Message 4 (français) : texte en clair, score = 14 (12 digrammes + 2 trigrammes correspondants)
- Message 5 (français) : texte en clair, score = 15 (12 digrammes + 3 trigrammes correspondants)
- Message 6 (anglais) : texte en clair, score = 18 (12 digrammes + 6 trigrammes correspondants)

La différence de score entre les messages chiffrés (0-1) et déchiffrés (14-18) est très nette, ce qui confirme que l'analyse par digrammes et trigrammes est une méthode fiable pour distinguer un texte en clair d'un texte chiffré par substitution.

== (BONUS) Lettres répétées consécutivement 

Notre fonction `count_repeated_letters` parcourt le texte et identifie toutes les lettres qui apparaissent consécutivement un nombre donné de fois (2 ou 3 fois).

#figure(image("3_4.png", height: 420pt))

Cette analyse des lettres répétées peut servir d'indice supplémentaire pour la reconnaissance de la langue d'un texte. Par exemple, les doubles lettres les plus fréquentes en français sont les SS, LL, TT, et EE, ce qui correspond bien à nos résultats.
