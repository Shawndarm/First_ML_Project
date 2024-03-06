install.packages("FactoMineR")
library(FactoMineR)
install.packages("factoextra")
library(factoextra)

df_chiens <- data.frame(
  TAI = c(3, 1, 3, 2, 1, 3, 1, 1, 2, 3, 2, 3, 3, 2, 3, 3, 1, 3, 2, 3, 3, 1, 3, 3, 3, 1, 3),
  POI = c(2, 1, 2, 2, 1, 3, 1, 1, 1, 2, 2, 2, 3, 2, 2, 2, 1, 2, 2, 2, 3, 1, 2, 3, 2, 1, 3),
  VEL = c(3, 1, 3, 2, 1, 1, 2, 1, 1, 3, 2, 3, 3, 2, 2, 3, 2, 2, 2, 3, 1, 1, 3, 1, 3, 1, 1),
  INT = c(2, 1, 3, 2, 2, 3, 3, 1, 2, 2, 2, 3, 1, 3, 2, 1, 2, 1, 2, 1, 1, 1, 3, 2, 2, 2, 2),
  AFF = c(2, 1, 2, 2, 2, 1, 2, 2, 2, 2, 2, 1, 1, 2, 1, 1, 2, 1, 2, 1, 1, 2, 1, 1, 1, 2, 1),
  AGR = c(2, 2, 2, 2, 1, 2, 1, 1, 2, 1, 1, 2, 2, 1, 1, 2, 2, 2, 1, 1, 2, 1, 1, 2, 1, 1, 1),
  FON = c(3, 2, 3, 1, 1, 3, 1, 1, 1, 1, 1, 3, 3, 2, 2, 2, 1, 2, 2, 2, 3, 1, 2, 3, 2, 1, 3)
)

row.names(df_chiens) <- c("beaucero", "basset", "bergeral", "boxer", "buldog", "bullmast", "caniche", "chihuahu",
                          "cocker", "colley", "dalmatie", "doberman", "dogueall", "epagneub", "epagneuf", "foxhound",
                          "foxterri", "gbdeasco", "labrador", "levrier", "mastiff", "pekinois", "pointer", "saintber",
                          "setter", "teckel", "terreneu")

df_chiens
str(df_chiens)
df_chiens$TAI <- as.factor(df_chiens$TAI)
df_chiens$POI <- as.factor(df_chiens$POI)
df_chiens$VEL <- as.factor(df_chiens$VEL)
df_chiens$INT <- as.factor(df_chiens$INT)
df_chiens$AFF <- as.factor(df_chiens$AFF)
df_chiens$AGR <- as.factor(df_chiens$AGR)
df_chiens$FON <- as.factor(df_chiens$FON)

resultats <- MCA(df_chiens, quali.sup=7, graph=FALSE)
print(resultats)

#Nous allons nous intéresser principalement aux objets 1 (valeurs propres), 
#3 (coordonnées des modalités actives), 5 (contributions des modalités actives),
#8 (coordonnées des individus), et 12 (coordonnées des modalités qualitatives 
# supplémentaires). 

#Combien de facteurs faut-il retenir ?
#Dans notre exemple, on va donc obtenir au maximum 10 facteurs (16 modalités - 6 variables
# principales), classés du plus important au moins important (ou du plus explicatif au moins
# explicatif) et à chacun de ces 10 facteurs va être associée une « valeur propre » qui 
# traduit la quantité d’information expliquée par le facteur

print(resultats$eig)

# Pour notre analyse, on se contentera des 2 premiers facteurs qui cumulent environ 52% de
# l'inertie totale

round(resultats$var$contrib[,1:2], 1)

round(resultats$var$coord[, 1:2], 2)

#Graphique des modalités

par(mfrow=c(1,1))

# Créer un graphique vide avec des étiquettes d'axe basées sur la variance expliquée
plot(resultats$var$coord[, 1:2] * 1.2, type="n",
     xlab=paste0("Axe 1 (", round(resultats$eig[1,2], 1), "%)"),
     ylab=paste0("Axe 2 (", round(resultats$eig[2,2], 1), "%)"),
     main="Premier plan factoriel", cex.main=1, cex.axis=0.8, cex.lab=0.7, font.lab=3)

abline(h=0, v=0, col="grey", lty=3, lwd=1)

points(resultats$var$coord[, 1:2], pch=19, cex=0.5, col="blue")

text(resultats$var$coord[, 1:2], labels=rownames(resultats$var$coord), cex=0.7, pos=4)

print(resultats$quali.sup$coord[, 1:2])
text(resultats$quali.sup$coord[c(1, 2, 3), 1:2]*1.2, labels=rownames(resultats$quali.sup$coord[c(1, 2, 3), ]), cex=0.8, col="blue", font=3)

#Nuage de points des individus

par(mfrow=c(1,1))
plot(resultats$ind$coord[, 1:2]* 1.2, type="n", 
     xlab=paste0("Axe 1 (", round(resultats$eig[1,2], 1), "%)"), 
     ylab=paste0("Axe 2 (", round(resultats$eig[2,2], 1), "%)"), 
     main="Nuage des individus selon la fonction", cex.main=1, cex.axis=0.8, cex.lab=0.8, font.lab=3)
abline(h=0, v=0, col="grey", lty=3, lwd=1)
points(resultats$ind$coord[,1:2], col=as.numeric(df_chiens$FON), pch=19)
legend("topleft", legend=levels(df_chiens$FON), bty="o", text.col=1:3, col=1:3, pch=19, cex=0.8)
text(x = resultats$ind$coord[,1], 
     y = resultats$ind$coord[,2],
     labels = rownames(resultats$ind$coord),
     cex = 0.7, # Taille du texte, ajustez selon vos besoins
     pos = 4) # Position du texte par rapport aux points (4 = à droite)


      