#  Segmentation des clients d'un site e-commerce
## Objectif
Interroger la base de données SQL de l'entreprise pour la réalisation d'un dashboard. Réaliser une segmentation automatique des profils clients de l'entreprise et définir les délais pour la mise à jour du modèle pour garder une classification pertinente.
## Présentation des éléments
### script
Les différentes requêtes SQL créées pour interagir avec la data base afin de remplir les objectifs suivants :
- En excluant les commandes annulées, quelles sont les commandes récentes de moins de 3 mois que les clients ont reçues avec au moins 3 jours de retard ?
- Qui sont les vendeurs ayant généré un chiffre d'affaires de plus de 100 000 Real sur des commandes livrées via Olist ?
- Qui sont les nouveaux vendeurs (moins de 3 mois d'ancienneté) qui sont déjà très engagés avec la plateforme (ayant déjà vendu plus de 30 produits) ?
- Question : Quels sont les 5 codes postaux, enregistrant plus de 30 reviews, avec le pire review score moyen sur les 12 derniers mois ?
### notebook_exploration
Notebook contenant l'analyse des données fournis par Olist, afin de repérer les plus pertinentes et de déterminez les features à créer dans l'objectif de pouvoir effectuer une clusterisation des clients selon leur profil d'acheteur.
### notebook_essais
Notebook contenant les tests permettant de définir le modèle le plus pertinent pour la segmentation des profils clients.
### notebook_simulation
Notebook permettant de définir le temps de mise à jour du modèle avant une perte trop importante de performance.
### presentation
Support de présentation du projet.
