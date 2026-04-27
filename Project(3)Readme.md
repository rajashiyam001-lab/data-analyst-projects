📦 Analyse de Performance Amazon Sales (Python EDA)

🎯 Objectif du Projet
Ce projet analyse un dataset de 50 000 transactions Amazon pour identifier les leviers de rentabilité, l'efficacité des remises et la satisfaction client par région. L'approche est centrée sur l'EDA (Exploratory Data Analysis) et la génération de recommandations actionnables.

🛠️ Stack Technique
Langage : Python 3.x
Librairies : Pandas (Traitement), Matplotlib/Seaborn (Visualisation).
Concepts : Nettoyage de données, Analyse de corrélation (Prix vs Note), Segmentation géographique.

🚀 Indicateurs Clés (KPIs)

Chiffre d'Affaires Total : 32,87 M$
Note Moyenne Client : 2.99 / 5 ⚠️ (Indicateur critique à améliorer).
Catégorie Leader : Beauty (5,55 M$), suivie de près par Books et Fashion.
Répartition Régionale : Performance très équilibrée entre le Middle East (Top 1) et l'Europe.

💡 Insights Stratégiques
Équilibre des Catégories : Contrairement à d'autres datasets, Amazon montre une répartition très homogène. Aucune catégorie ne domine outrageusement, ce qui réduit le risque de dépendance.
Alerte Satisfaction : La note moyenne de 3.0 est préoccupante. Une corrélation doit être cherchée entre le taux de remise et la déception client (attentes vs réalité).
Omnicanalité des Paiements : L'usage est parfaitement réparti entre Wallet, UPI et Cartes, soulignant l'importance d'une plateforme de paiement flexible.

conseils & Améliorations Business (Actionnables)
Pour ce jeu de données spécifique, voici où l'entreprise doit concentrer ses efforts :

🔴 Priorité n°1 : La Qualité et l'Expérience Client
Problème : Une note moyenne de 3.0/5 est un signal d'alarme pour un géant comme Amazon. Cela augmente drastiquement le taux de retour et le coût du SAV.

Conseil : Analyser les produits ayant une note < 2.5 et envisager de les retirer ou de revoir les descriptions produits (souvent source de déception).

🟡 Priorité n°2 : Stratégie de Remises (Discounts)
Problème : Les données montrent des remises allant jusqu'à 30%.

Conseil : Vérifier si les fortes remises boostent réellement le volume de vente sans détruire la marge. Si la catégorie "Beauty" se vend bien sans remise, il faut réduire les promotions pour maximiser le profit net.

🟢 Priorité n°3 : Optimisation Régionale (Europe & Asia)
Problème : L'Europe est actuellement la région la moins performante (8,11 M$ vs 8,30 M$ pour le Moyen-Orient).

Conseil : L'écart est faible mais rattrapable. Lancer des campagnes de marketing localisées en Europe sur les catégories "Fashion" et "Electronics" pour équilibrer la balance régionale.

🔵 Priorité n°4 : Fidélisation via les Moyens de Paiement
Observation : Les paiements par Wallet et UPI sont très populaires.

Conseil : Proposer un système de "Cashback" ou de points de fidélité spécifiquement pour les paiements via Wallet propriétaire afin de capturer davantage de données clients et d'encourager la récurrence d'achat.
