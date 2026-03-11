# Projet d'Analyse des Données & Machine Learning

> **Master d'Économie** — Université Paris 1
> Cours de **J. Rynkiewicz** 
> Date de rendu : **10 janvier 2024**

---

## Structure du projet

```
First_ML_Project
│
├── data/
│   ├── simu.txt            # 2000 observations — régression binaire
│   ├── xsimutest.txt       # 1000 observations de test
│   ├── voitures.txt        # Données voitures 2015
│   └── chiens.txt          # Caractéristiques races de chiens
│
├── exo 1 : 01_regression_binaire.R
├── exo 2 : 02_acp_voitures.R
├── exo 3 : 03_classification.R
├── exo 4 : 04_acm_chiens.R
│
└── Rapport            # Rapport final et consignes
```

---

## Exercices

### 1. Régression Binaire

**Fichier :** `simu.txt`
**Description :** Simulation d'un modèle binaire — 2000 observations, variables X1, X2, Y ∈ {1, 2}

**Objectifs :**
1. Déterminer le meilleur modèle pour P(Y | X1, X2)
2. Prédire 1000 observations du fichier `xsimutest` et sauvegarder les résultats
```r
# Sauvegarde des prédictions
write.table(predictions, "predictions.txt", row.names=F, col.names=F)
```

---

### 2. Analyse en Composantes Principales (ACP)

**Fichier :** `voitures.txt` — Mesures sur différents types de voitures vendues en 2015

**Objectifs :**
1. Calculer le **pourcentage d'inertie** expliqué par les 3 premiers facteurs et par le 1er plan factoriel
2. **Interpréter les 2 axes principaux** via les corrélations variables-axes
3. Représenter les individus sur le **1er plan factoriel** et répondre aux questions :
   - Qualité de représentation sur le plan factoriel
   - Caractéristiques des individus en haut / à droite / en bas à gauche du graphe
   - Comparaison des profils PEUGEOT RCZ vs JAGUAR F
   - Comparaison des profils LANCIA vs LAND ROVER
   - Interprétation globale du graphe individus

---

### 3. Classification

**Fichier :** `voitures.txt`

**Objectifs :**
1. **K-means** : réaliser une ou plusieurs classifications et interpréter les clusters obtenus
2. **Classification hiérarchique (Ward)** : tracer et interpréter le dendrogramme, choisir le nombre de classes optimal

---

### 4. Races de Chiens — Analyse des Correspondances Multiples (ACM)

**Fichier :** `chiens.txt`

**Variables :**

| Variable | Signification | Modalités |
|----------|--------------|-----------|
| TAI | Taille | 1=petite, 2=moyenne, 3=grande |
| POI | Poids | 1=léger, 2=moyen, 3=lourd |
| VEL | Vélocité | 1=lent, 2=moyenne, 3=rapide |
| INT | Intelligence | 1=faible, 2=moyenne, 3=grande |
| AFF | Affectuosité | 1=faible, 2=grande |
| AGR | Agressivité | 1=faible, 2=grande |
| **FON** | **Fonction** *(variable supplémentaire)* | 1=compagnie, 2=chasse, 3=garde |

**Objectifs :**
1. Réaliser une **ACM** avec FON comme variable supplémentaire
2. Décrire les différentes races de chiens à partir des résultats

---

## Environnement technique

- **Langage :** R
- **Packages recommandés :** `FactoMineR`, `factoextra`, `ggplot2`, `cluster`, `MASS`
```r
install.packages(c("FactoMineR", "factoextra", "ggplot2", "cluster", "MASS"))
```

---
























