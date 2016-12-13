####################################################################
#LAB 4: introduction to R
#Creating building blocks for a fisheries stock assessment model.
#length-weight, von Bertalanffy, logistic selectivity curve,
#Beverton-Holt with steepness
#Created by Trevor A. Branch tbranch@uw.edu starting 22 April 2013.
####################################################################

###Converts length (cm) to weight (kg) using parameters a and b.
LengthWeight <- function(L, a, b) {
   W <- a*L^b
   return(W)
}
LengthWeight(L=30, a=0.0002, b=3.05)

###VonBertalanffy growth equation converts age (yr) to length (cm)
#using parameters k (growth rate), Linfinity (asymptotic length)
#and t0 (age at "zero" length). 
VonBertalanffy <- function(age, k, Linfinity, t0) {
   Length = Linfinity*(1-exp(-k*(age-t0)))
   return(Length)
}
VonBertalanffy(age=5, k=0.2, Linfinity=80, t0=-0.2)

###Logistic selectivity curve converts length (cm) to selectivity [0,1]
#using parameters L50 (length at 50% selectivity), and L95 (length
#at 95% selectivity.
LogisticSel <- function(L, L50, L95) {
    Sel <- 1/(1+exp(-1*log(19)*(L-L50)/(L95-L50)))  
    return(Sel)
}
LogisticSel(L=55, L50=40, L95=60)

###Convert a vector of ages into a vector of lengths, weights, 
#and selectivities
AgeValues <- function(age.vec, a, b, k, Linfinity, t0, L50, L95) {
    n <- length(age.vec)   #number of elements in the age vector
    lengths <- vector(length=n)
    weights <- vector(length=n)
    selectivities <- vector(length=n)
    
    for (i in 1:n) {
       lengths[i] <- VonBertalanffy(age=age.vec[i], k=k, 
                                    Linfinity=Linfinity, t0=t0)
       weights[i] <- LengthWeight(L=lengths[i], a=a, b=b)
       selectivities[i] <- LogisticSel(L=lengths[i], L50=L50, L95=L95)
    }
    print("Lengths")
    print(lengths)
    print("Weights")
    print(weights)
    print("Selectivities")
    print(selectivities)
}
AgeValues(age.vec=0:5, a=0.0002, b=3.05, k=0.2, 
          Linfinity=80, t0=-0.2, L50=40, L95=60)   

###Beverton-Holt steepness curve plots
#Given h, R0 and S0, create a plot showing the relation between S(t) and R(t+1)
BevertonHolt <- function(h, R0, S0) {
   alpha <- (1-h)/(4*h*R0)*S0
   beta <- (5*h-1)/(4*h*R0)
   
   Svec <- seq(from=0,to=S0,length.out=100)
   Rvec <- vector(length=100)
   
   for (i in 1:100) {
      Rvec[i] <- Svec[i]/(alpha + beta*Svec[i])
   }
   plot(x=Svec, y=Rvec, type="l", xaxs="i", yaxs="i")  
   abline(v=0.2, lty=2)
   abline(h=h, lty=2)
}
BevertonHolt(h=0.5, R0=1, S0=1)
par(new=T)
BevertonHolt(h=0.9, R0=1, S0=1)
