library(TeachingDemos)
 
#resumundo priori e posteriori
#histograma
set.seed(2)
minha_posteriori <- rbeta(10000, 71, 21)
hist(minha_posteriori)

#estimativas pontuais 

#media
mean(minha_posteriori)

#mediana
median(minha_posteriori)
 
#DP
sd(minha_posteriori)
 
median(minha_posteriori) +2*sd(minha_posteriori)
median(minha_posteriori) -2*sd(minha_posteriori)
 
#intervalor de credibilidade - 90% (equivalente ao teste de hipotese na abordagem classica)
quantile(minha_posteriori, c(0.05, 0.95))
 
#intervalor de credibilidade - 95% (equivalente ao teste de hipotese na abordagem classica)
quantile(minha_posteriori, c(0.025, 0.975))
 
#Highest porteriori Density (HPD) - Maior densidade a posteriori
 
TeachingDemos::emp.hpd(minha_posteriori, conf=0.95)
 
#não teve diferença porque a distribuição é simetrica.
#vamos ver em uma distribbuição assimetrica?
 
minha_posteriori2 <- rbeta(10000, 4, 1)
hist(minha_posteriori2)
 
quantile(minha_posteriori2, c(0.025, 0.975))
TeachingDemos::emp.hpd(minha_posteriori2, conf=0.95)
 
          
          
 
 