df <- read.csv(url("https://gvheisler.github.io/ds/funcionarios.csv"))

df <- df[,-1]

df$Idade <- as.numeric(df$Idade)
