df <- read.csv(url("https://gvheisler.github.io/ds/funcionarios.csv"))

df <- df[,-1]

mean(df$Salario, na.rm = TRUE)
median(df$Salario, na.rm = TRUE)
sd(df$Salario, na.rm = TRUE)

df$Idade <- gsub("\\D", "", df$Idade)
df$Idade <- as.numeric(df$Idade)
mean(df$Idade[!is.na(df$Idade)])

df$Departamento <- tolower(trimws(df$Departamento))

df$Departamento <- gsub("financerio", "financeiro", df$Departamento)

df$Salario <- as.numeric(gsub("[^0-9]", "", df$Salario)) 

df$Salario[is.na(df$Salario)] <- median(df$Salario, na.rm = TRUE) 

media_salario <- aggregate(Salario ~ Departamento, data = df, FUN = mean)

barplot(media_salario$Salario, 
        names.arg = media_salario$Departamento, 
        main = "Média Salarial por Setor", 
        ylab = "Média Salarial", 
        xlab = "", 
        col = "lightblue", 
        las = 2, 
        cex.names = 0.8)

df$Ano_de_Contratacao <- as.numeric(df$Ano_de_Contratacao)
df_ano_Contratacao <- df$Ano_de_Contratacao[!is.na(df$Ano_de_Contratacao)]

hist(df_ano_Contratacao,
     main = "Distribuição do Ano de Contratação",
     xlab = "Ano de Contratação",
     ylab = "Frequência",
     col = "lightgreen",
     border = "black")
