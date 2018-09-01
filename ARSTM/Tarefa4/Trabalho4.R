#############################################################################
# Realizar uma análise de sentimento. Para a análise de sentimento criar: 
# a.	word cloud, 
# b.	word cloud positiva, 
# c.	word cloud negativa, 
# d.	semantic network, 
# e.	dendrograma, 
# f.	word cloud bigram
#############################################################################

# inicializa o ambiente
rm(list = ls())
cat("\014")
#setwd("./git/Trabalhos/ARSTM/Tarefa4")
setwd("~/Tresors/zz-pessoal/FGV/git/Trabalhos/ARSTM/Tarefa4")
getwd()

# carrega as bibliotecas
if(!require(tidytext)) {
  install.packages("tidytext")
  library(tidytext)
}
if(!require(dplyr)) {
  install.packages("dplyr")
  library(dplyr)
}
if(!require(stringr)) {
  install.packages("stringr")
  library(stringr)
}
if(!require(tm)) {
  install.packages("tm")
  library(tm)
}
if(!require(tidyr)) {
  install.packages("tidyr")
  library(tidyr)
}

#############################################################################

## Leitura do Texto

# Para o trabalho foi escohido o Debate Presidencial apresentado na TV 
# Bandeirantes. Como foi feita a transcrição automática, o texto contém 
# imperfeições. Mantivemos estas imperfeições para estudar o impacto na 
# análise do texto e do sentimento, porém tivemos que fazer alguns ajustes
# no texto (p.e.: nomes dos candidatos) 

## Preparação do dataframe antes da análise
# Lendo o arquivo de texto escolhido
getwd()
txt <- readLines("DebBandPres2018.txt",encoding = "UTF-8")

# preparando o dataframe para analise
txt_df <- data_frame(text = txt)

txt_token <- unnest_tokens(txt_df, 
                           input = "text", 
                           output = "word",
                           token = "words",
                           to_lower = TRUE,
                           drop = TRUE)
View(txt_token)

# removendo stopwords
stop_words <- data_frame(tm::stopwords(kind="pt-BR"))
colnames(stop_words) <- "word"

txt_words <- anti_join(txt_token, stop_words, by = c("word","word"))

# contando a frequencia das palavras}
txt_count <- count(txt_words, word, sort=TRUE)
View(txt_count)

# Analisando bigramas para identificar necessidade
txt_bigramas <- unnest_tokens(tbl = txt_df,
                              input = text,
                              output = bigram,
                              token = "ngrams",
                              to_lower = TRUE,
                              n = 2,
                              drop = TRUE)

# removendo stopwords dos bigramas

txt_bigramas_sep <- separate(txt_bigramas, bigram, sep =" ", c("p1","p2"))

txt_bigramas_filt <- filter(filter(txt_bigramas_sep,!p1 %in% stop_words$word),
                            !p2 %in% stop_words$word)

# contando a frequencia dos bigramas

txt_bigramas_u <- unite(txt_bigramas_filt, bigram, p1, p2, sep = " ")

txt_bcount <- count(txt_bigramas_u, bigram, sort=TRUE)
View(txt_bcount)

# Pela listagem acima, notamos que as palavras importantes do debate estão 
# repetidas entre 20 e 50 vezes, por isso filtramos por estes valores.
# No caso dos Bigramas usamos entre 5 e 22.

# filtrando as palavras importantes
txt_analise <- filter(txt_count , 50 > n & n > 20)
txt_analise_bigramas <- filter(txt_bcount , 22 > n & n > 5)

hist(txt_count$n)
hist(txt_bcount$n)

hist(txt_analise$n)
hist(txt_analise_bigramas$n)

