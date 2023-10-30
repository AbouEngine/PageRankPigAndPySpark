# PageRankPigAndPySpark
Benchmark du Pagerank en Pig et en PySpark dans les clusters de Google Cloud

Nous avons deux programmes (Pig et Spark) qui permet de faire le calcul de pagerank.
L'objectif de cette tâche est de faire une comparaison (en terme de temps d'exécution) entre les deux programmes. Du coup nous avons créé un cluster sur google cloud platform et ensuite nous avons augmenté le nombre de workers.
# Expérimentation
Les temps d'exécution dans le tableau ci-dessous sont en secondes.
| Nb workers | 2 | 4 | 6 |
|-----------|-----------|-----------|-----------|
| Pig| 3117 | 2318 | 1853 |
| PySpark | 2511| 1685 | 1522 |


# Conclusion
Le pagerank en pySpark a un temps d'exécution inférieur à celui en Pig. PySpark est plus rapide et cela confirme la théorie sur pySpark (vu en classe).

