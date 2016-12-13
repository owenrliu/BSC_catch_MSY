for(i in 1:10) {
   print(i^3)
}

#playing around with vectors
x.vec <- vector(length=10)
x.vec[3] <- 3.4
print(x.vec)
x.vec[] <- NA
print(x.vec)
x.vec[1:4] <- 10.3
print(x.vec)
x.vec[c(3,5,9)] <- 11.6
print(x.vec)
x.vec[-1] <- 6.7
print(x.vec)

#playing around with matrices
x.mat <- matrix(nrow=3, ncol=4)
print(x.mat)
x.mat[] <- 2.89
print(x.mat)
x.mat[2,4] <- 0
print(x.mat)
x.mat[1,] <- NA
print(x.mat)
x.mat[,4] <- -1
print(x.mat)
x.mat[1:2,3:4] <- "help"
print(x.mat)
x.mat[-1,-1] <- 0
print(x.mat)

#if-then-else statement
x <- 1
if (x < 3) {
   y <- x+2
} else {
   y <- x+4
}

#ifelse statement (similar to Excel), returns a value
ifelse(x<3,6,2)

#for loop
for (i in 1:10) {
   print(i^3)
} 

#for loop
for (crazyval in c(100,"help", "August")) {
   print(crazyval)
}

#sequences of values
1:10
10:1
3:9
c(3,9,5,7)  #the c() command concatenates numbers into a vector
LETTERS     #defined vector
letters     #defined vector
seq(from=1,to=11,by=2)  #odd numbers
seq(1,11,2)             #note how much harder this is to understand
seq(from=5,to=50,length.out=10)  #produce a vector of 10 values


#while loop
x <- 1
while(x<3) {
   x <- x +1  #this statement may or may not be run
   print(x)
}

#repeat loop
x <- 1
repeat { 
   x <- x + 1  #this statement is always run at least once
   print(x)
   if(x > 10) break() 
}

#function to do sum of squares
SSvalue <- function(x,y) {
   SS <- (x-y)^2
   return(SS)
}
SSvalue(x=10,y=3)
answer <- SSvalue(x=10,y=3)
print(answer)

#function that does stuff and does not return a value
PlotRandom <- function(x,y) {
   plot(x=x,y=y)
}
PlotRandom(x=1:10,y=rnorm(n=10))

#function to do sum of squares on vectors
SSvecs <- function(xvec,yvec) {
   n <- length(xvec)  #assume two vectors are same length
   SS <- 0
   for (i in 1:n) {
      SS <- SS+SSvalue(xvec[i],yvec[i])
   }   
   return(SS)
}
SSvecs(x=c(3,4,5),y=c(2,4,6))

#the length() function
length(1)
length(1:10)
length(LETTERS)

#removing all global variables and functions
rm(list=ls())

#difference between global and local variables
xx <- 4
dumb <- function() {
   yy <- xx+4
   print(yy)
   xx <- 3
   print(xx)
}
dumb()  #calls the function
print(xx)  #value was not changed inside the function, instead new variable xx created inside function
print(yy)  #variable not available outside the function

#no global variables used within the function, instead passed as parameter
smarter <- function(x) {  #function has one parameter x
   yy <- x+4
   print(yy)   #does not return the value, just prints it to the console. 
}
xx <- 4        #global variable
smarter(x=xx)  #passes global variable to function

#reading in data from a .csv file
xdata <- read.csv(file="values.csv")
head(xdata)
xdata <- read.csv(file="values.csv", header=T, sep=",")
xdata[,3]
xdata <- read.csv(file="values.csv", header=T, sep=",", stringsAsFactors=T)
xdata[,3]
xdata <- read.csv(file="values.csv", header=T, sep=",", colClasses=c("numeric","numeric","character"))
xdata[,3]
xdata[,2]

#write data to a file
write.csv(x=xdata, file="temp.csv")
write.csv(x=xdata, file="tables\\temp.csv")
write.csv(x=xdata, file="C:\\Users\\Trevor Branch\\Documents\\2013 FISH458 Quantitative\\1 Labs\\Lab 4 Intro to R\\tables")
#unreadable code
for (i in 1:4) {  if(i>3) { print(i) }
for (j in 1:3) { for (k in 1:3) { if (j>k) print(j) }}}

#more readable code
for (i in 1:4) {  
   if(i>3) { 
      print(i) 
   }
   for (j in 1:3) { 
      for (k in 1:3) { 
         if (j>k) {
            print(j) 
         }
      }
   }
}

#defensive coding
if(x>1) {
   print(x)
} else {
   print(x+2)
}

if(x>1) print(x) else 
   print(x+2)

x <- 0
if(x>1) print(x) else 
   print(x+2)
   print(x+5)

#naming parameters when calling functions
seq(0,20,2)
seq(from=0, to=20, by=2)

seq(20,0,2)
seq(to=20, from=0, by=2)