# Install clusterProfiler and load:

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("clusterProfiler", version = "3.8")

library("clusterProfiler")
library("data.table")

# Import Data and process:
## Change Input Path
## Format - CSV with first column as Gene Symbol IDs

df1 <- read.csv("~/R/R Local Projects/jubilant-fortnight/Input/Amandeeps_favs.csv")
df2 <- transpose(df1)
df3 <- bitr(df2, 
            fromType = "SYMBOL", OrgDb = "org.Hs.eg.db", 
            toType = "ENTREZID")

# Write CSV and Export Data:
## Change Output Path and CSV Name

write.csv2(df3, file = "~/R/R Local Projects/jubilant-fortnight/Output/Entrez_ID_List.csv")

