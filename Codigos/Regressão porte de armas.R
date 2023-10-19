install.packages("rstanarm")
# carrega bibliotecas
library(data.table)
library(tidyverse)
library(rstanarm)
library(readr)

guns_data <- readRDS("C:/Users/jhona/OneDrive/Documentos/Mestrado_UFSC/Econometria Bayesiana/Codigos/guns_data.RDS")

# inspeciona os dados importados
glimpse(guns_data)

# regressão linear padrão
# número de mortes em função de se homens envolvidos, e razão entre total de vendas permitidas e total vendido
reg <- lm(num_mortes ~ all_male_participants +  ratio_permit_totals,
          data = guns_data)
summary(reg)

# Bayes
# modelo y ~ N(mu, sigma_2)
#  mu = a0 + a1*x1 + a2*x2
# ou, y ~ N(a0 + a1*x1 + a2*x2, sigma_2)
# 4 parâmetros a estimar: a0, a1, a2 e sigma_2
# precisamos de priori para cada parâmetro, incluindo a variância.

bayes_reg <- stan_glm(num_mortes ~ all_male_participants +  ratio_permit_totals,
                      data = guns_data)

# prioris escolhidas por defautl
# quais prioris? Vamos checar?
prior_summary(bayes_reg)

