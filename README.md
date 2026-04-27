📊 Analyse EDA & Performance Business


📝 Présentation du Projet

Ce projet consiste en une analyse approfondie des données de ventes d'une entreprise (données de type Retail/E-commerce). L'objectif est de transformer des données brutes en indicateurs stratégiques pour comprendre la croissance, la saisonnalité et le comportement des clients.

L'analyse repose sur deux piliers :

Exploration & Nettoyage : Compréhension des volumes et des périodes couvertes.
Analyses Avancées : Étude des tendances temporelles, croissance cumulative et segmentation marketing (VIP vs Nouveaux).

🗂️ Structure des Données

Le projet utilise un schéma en étoile composé de trois tables principales :

fact_sales : Le cœur de l'activité (transactions, quantités, montants, dates).

dim_products : Catalogue des articles (noms, catégories, coûts).

dim_customers : Profils des clients (localisation, genre, âge).

Indicateurs Clés (KPIs)🚀


Chiffre d'Affaires : 29,36 M$ (Croissance identifiée sur 3 ans).

Panier Moyen (AOV) : 1 061 $ (Indique un positionnement Premium).

Base Clients : 18 484 profils analysés.

Dominance Produit : 96% du CA provient de la catégorie Bikes.

🔍 Analyses Avancées & Insights



1. Analyse des Tendances (Saisonnalité)

Nous avons agrégé les ventes par mois pour identifier les cycles de consommation.


Insight : Les ventes montrent une accélération progressive, avec une forte activité en fin d'année (pic en novembre/décembre), suggérant une forte saisonnalité liée aux fêtes ou aux promotions de fin d'année.

2. Croissance Cumulative

L'utilisation de fonctions de fenêtrage (Window Functions) permet de suivre le "Total Cumulé" des revenus. Cela permet de visualiser la trajectoire de croissance de l'entreprise de manière lissée.

3. Segmentation des Clients (Modèle RFM simplifié)

Les clients sont classés en trois catégories basées sur leur fidélité et leur valeur :

👑 VIP : Clients fidèles (>12 mois) ayant dépensé plus de 5 000$.

👤 Réguliers : Clients fidèles mais avec un panier total modéré.

✨ Nouveaux : Clients récents, représentant le futur potentiel de croissance.

💡 Conseils & Recommandations Stratégiques

✅ Ce que nous faisons bien
Dominance du secteur "Bikes" : La catégorie des vélos génère la grande majorité du chiffre d'affaires (~28M$). C'est notre moteur principal.
Acquisition Client : La base de données montre un flux régulier de nouveaux clients, signe d'une marque attractive.

🚀 Opportunités d'Amélioration

-Diversification du Catalogue : Les accessoires et vêtements représentent une part mineure du revenu. Il serait judicieux de créer des offres groupées (bundling) : pour tout achat d'un vélo, proposer une réduction sur les accessoires.

-Programme de Fidélité VIP : Nos segments "VIP" sont les plus rentables. Il faut mettre en place un programme d'exclusivité (avant-premières, services de maintenance offerts) pour réduire leur taux d'attrition.

-Réactivation des Clients "Réguliers" : Beaucoup de clients ne commandent qu'une fois. Une campagne d'e-mailing ciblée 6 mois après le premier achat pourrait augmenter la "Lifespan" (durée de vie) moyenne.

-Optimisation des Stocks : Étant donné la forte saisonnalité observée en fin d'année, les stocks doivent être renforcés dès le mois de septembre pour éviter les ruptures sur les modèles phares.
