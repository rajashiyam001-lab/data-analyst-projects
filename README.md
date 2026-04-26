📊 Analyse Exploratoire des Données (EDA) - Sales SQL
🎯 Présentation du Projet
Ce projet consiste en une analyse approfondie d'un entrepôt de données de vente. L'objectif est de transformer des données brutes en informations stratégiques pour comprendre la performance de l'entreprise, le comportement des clients et la rentabilité des produits.

🛠️ Étapes de l'Analyse
1️⃣ Exploration de la Base de Données
Audit Global : Identification de toutes les tables disponibles via le schéma d'information.

2️⃣ Exploration des Dimensions
Segmentation Clients : Analyse des pays d'origine des clients.
Catalogue Produits : Exploration de la hiérarchie entre catégories, sous-catégories et articles.

3️⃣ Exploration Temporelle (Dates)
Période d'Activité : Identification des dates de la première et de la dernière commande.
Étendue : Calcul de l'historique total des données en années.

4️⃣ Mesures et "Big Numbers"
Génération d'un rapport consolidé affichant les indicateurs clés :
Ventes Totales : Somme des revenus générés.
Prix Moyen : Prix de vente moyen par article.
Quantité Totale : Volume total des produits vendus.

5️⃣ Indicateurs Clés du Business
Portée Produit : Nombre total de références uniques.
Engagement Client : Calcul du nombre de clients inscrits par rapport à ceux ayant effectué un achat.

6️⃣ Analyse de Magnitude (Comparaisons)
Comparaison des performances pour comprendre l'importance de chaque segment :
Ventes par Pays : Classement géographique de la performance.
Volume par Catégorie : Identification des catégories de produits les plus populaires.
Structure des Coûts : Analyse du coût moyen par catégorie.
Fidélité : Nombre total de commandes passées par chaque client.

7️⃣ Classement et Ranking
Identification des extrêmes pour la prise de décision :
Top Performance : Les 5 meilleurs produits et les 10 meilleurs clients par revenu.
Sous-Performance : Les 5 produits les moins vendus.
Bottom Ranking : Les clients ayant le plus faible volume de commandes.

💻 Compétences SQL Utilisées
Agrégations : SUM(), AVG(), COUNT(DISTINCT).
Jointures : LEFT JOIN entre les tables de faits et de dimensions.
Transformation : UNION ALL pour créer des rapports de synthèse.
Logique Temporelle : DATEDIFF() et fonctions de dates.
