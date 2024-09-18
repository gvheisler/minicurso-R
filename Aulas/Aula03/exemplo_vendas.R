df <- read.csv(url("https://gvheisler.github.io/ds/vendas.csv"))

df$Data <- as.Date(df$Data, format = "%Y-%d-%m")

plot(x = df$Data[which(df$Produto=="Produto A")], 
     y = df$Vendas[which(df$Produto=="Produto A")], 
     type = 'l', ylim = c(50,200))
lines(x = df$Data[which(df$Produto=="Produto B")],
      y = df$Vendas[which(df$Produto=="Produto B")], col = 'red')
lines(x = df$Data[which(df$Produto=="Produto C")], 
      y = df$Vendas[which(df$Produto=="Produto C")], col = 'blue')

library(dplyr)

vendas_por_dia <- df %>%
  group_by(Data) %>%
  summarise(Vendas_Totais = sum(Vendas))

plot(vendas_por_dia, type ='l')
