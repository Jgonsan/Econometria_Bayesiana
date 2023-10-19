set.seed(2) #semente

#Lancamento da moeda 

n <- 50 #lancamentos 
s <- 30 #sucesso

#Verossimilhança é binomial (n=50, s=30)

#Priori uniforme 
#Beta(1,1)
a1_pri <- 1
a2_pri <- 1

#Posteriori = beta(a1+ s, a2+n-s) calculado analiticamente
a1_pos <- a1_pri + s
a2_pos <- a2_pri + n - s

#histograma da posteriori 
hist(rbeta(10000, a1_pos, a2_pos))

# qual a probabilidade de Theta > 50%?

sim_posteriori <- rbeta(10000, a1_pos, a2_pos) #Crio o vetor da distribuição a posteriori 
head(sim_posteriori) #Observar os primeiros valores(não é necessario)
#[1] 0.5561667 0.5907238 0.6212816 0.6188034 0.5399811 0.6270481
sum(sim_posteriori > .5)/10000 #soma todos os valores onde minha posteriori é maior do que 0.5 e divido pelo numero da amostra.
#0.9203 resposta
mean(sim_posteriori) #esperança posteriori 

