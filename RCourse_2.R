########################
## 2. Data Structures ##
########################


## 2.1 Variables
# Variables are essential in programming because they help store and manage 
# data more efficiently. 
# 
# - For example, using variables allows to *reuse* stored values and results 
# multiple times.
# 
# - They increase the *readability* of the code when you use meaningful names
# for your variables.
# 
# - The code is also easier to *maintain* if you use variables, because if you 
# need to change the value of a variable you just have to do it where it is 
# declared on not everywhere it is used.
# 
# Overall, variables make code more efficient, organized, and scalable.
# In R, variables are defined using by assigning a value to a name using the
# assignment operator <-. Your code is much easier to understand if 
# you name your variables after what they contain (e.g. names for a collection 
# of names). 
# 
# In the following example, I do not have a very meaningful variable which 
# is why I just call it a.

a <- 44*467


# Observe that executing these commands does not show the output but stores 
# it as object a.
# 
# If I want to display a i have to write a after defining a, e.g.

a # What is a?

# We can also get more details on a using the str (structure) function. If 
# there is any named object in the working environment, then str(nameofobject)
# gives information about it, e.g.
# 
str(a)

# Be careful, if you assign a new number or element to a the old a is 
# replaced completely:
  
a <- 44/467
a
str(a)

a <- NULL
a
str(a)

## 2.2.1 Side Note on Data types
# The object a above contains a numerical (num) value. Other possible
# contents are:
#   
# - characters/strings (chr)
# 
# - logicals (logi)


b <- "Monday"
b
str(b)

c <- FALSE
c
str(c)

d <- TRUE
d
str(d)

## 2.3 More Complex Variables and Data Structures

# Instead of simple objects as a, b, c above, variables can also contain more 
# complex objects.

### 2.3.1 Vectors (one-dimensional arrays):
# A vector is an object containing an (almost) arbitrary number of entries of 
# the same type.
# 
# There are numerous possibilities on how to generate a vector in R.
# 
# a) Consecutive integers
# 
# A Vector with consecutive integers from a lower bound a to an upper bound b 
# can be defined using the notation a:b:
  
v <- 5:10
v

w <- 17:3
w

# Warning: Pay attention to parentheses! Better use more parentheses than 
# absolutely necessary...


- 1:10
-(1:10)
2 * (1:5)
2 * 1:5
2 + 1:5
(2 + 1):5


# b) Function c (combine)
#
# A vector with specific entries e1, e2, ..., en is
# generated with c(e1,e2,...,en), e.g.

a <- c(1, 5, 11.7)
a

dow <- c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")
dow

# c) Function rep (repeat)

# The function rep is mostly used if you what to fill n positions of a vector 
# with the same entry e (rep(e,n)).

a <- rep(1.999, 7)
a

# However there are different uses of rep.

b <- 1:4
b
rep(b,times=3)
rep(b,each=3)
rep(b,times=c(7,5,3,1))


# And you could also combine c() and rep(), e.g.

dow.is.wknd <- c(rep(FALSE,5),rep(TRUE,2))
dow.is.wknd

# d) Function seq (sequence)

# The function seq() generates sequences of numbers, with customizable starting
# and ending points, step sizes, and lengths. 

# If we want a sequence of elements from a to b with step size d, we write
#  seq(from=a,to=b,by=d):
  
seq(from=0,to=1,by=0.02)

# If we want a sequence of n elements from a to b, we write 
# seq(from=a,to=b,length.out=n):
  
seq(0,1,length.out=21)

## Applying relations, operators or functions to vectors
# 
# If x, y are vectors with entries of a certain type,
# applying an operator, operation or function to them
# is done component-wise:
  
x <- 0:4
x
x + 1
x
x^2
x
exp(x)  # exp(.) : exponential function
log(x)  # log(.) : natural logarithm

## Exercise:   Generate the following vectors with a few lines of code:
 # v1 contains 1, 2, 4, 8, ..., 2048
 # v2 contains 10, 20, 20, 30, 30, 30, 40, 40, 40, 40, ..., 1000, ..., 1000
 # v3 contains 1, -1, 1, -1, 1, -1, ... (50 components)
 # v4 contains 1, 3, 5, 7, ..., 99
 # v5 contains 0, 0.15, 0.3, 0.45, ..., 3.

# v1 contains 1, 2, 4, 8, ..., 2048
v1 <- 0:11
2^v1
#v2 contains 10, 20, 20, 30, 30, 30, 40, 40, 40, 40, ..., 1000, ..., 1000
v2 <- seq(from=10, to=1000, by=10)
v2[1:10]
##v2 <- (rep(v2, times=seq(from=1,to=100, by=1)))
v2 <- rep(v2, times=(v2/10))
v2[1:20]
# v3 contains 1, -1, 1, -1, 1, -1, ... (50 components)
# v3 <- (-1)^(0:49) where we start with -1^0 = 1
v3 <- rep(c(1,-1), times=25)
v3
# v4 contains 1, 3, 5, 7, ..., 99
v4 <- seq(from=1, to=99, by=2)
v4
# v5 contains 0, 0.15, 0.3, 0.45, ..., 3.
v5 <- seq(from=0, to=3, length.out=21)
v5
## Subsetting vectors

# Subsetting is crucial when using vectors because it allows for efficient 
# extraction, modification, and analysis of specific elements within a vector. 
# To subset from a vector, we use the square brackets [] and you specify the 
# index or condition to extract the desired elements. 

x <- 10*(1:7)
x[1]         # 1st entry
x[2]         # 2nd entry
x[2:7]       # entries 2 to 7
x[c(1,3,5)]  # entries 1, 3 and 5

x[-3]         # all but the 3rd entry
x[-(3:4)]     # all but the 3rd and 4th entry
x[-c(1,3,5)]  # all but the 1st, 3rd and 5th entry


# Often, one generates subvectors by means of logical conditions

x[x < 30] # all entries less than 30
x[x >= 50 & x <= 100] # all entries between 50 AND 100
x[x < 30 | x > 50] # all entires that are either < 30 OR > 50

## Exercise   Generate a vector with components 
## 1, 2, 1, 3, 1, 4, 1, 5, ..., 1, 100.
v6 <- numeric(2 * 99)
v6[seq(1, length(v6), by = 2)] <- 1
v6[seq(2, length(v6), by = 2)] <- 2:100
v6

### 2.3.2 Matrices (two-dimensional arrays):
# A matrix is a table with an (almost) arbitrary number of rows and columns, 
# each entry being of the same type.

# There are numerous possibilities on how to create matrices in R.

# a) cbind (column-wise binding)
# 
# The  cbind() function combines vectors or matrices by binding them 
# column-wise to form a new matrix.

x <- seq(0,1,0.1)
y <- sin(2*pi*x)
z <- cbind(x,y)
z

# This is a matrix (two-dimensional array) with numerical entries in 11 rows 
# and 2 columns. Indeed, 

str(z)

# The matrix z has an attribute "dimnames".  This is a list of two character 
# vectors, the row names (not specified) and the column names.
# 
# Alternatively, one can use dim() to get the information on the dimension 
# of our matrix. 

dim(z)

# One could also specify the column names:
  
z <- cbind('x'=x,'sin(2*pi*x)'=y)
z


# And also glue another vector to our previously created matrix:
  
z <- cbind(z,'cos(2*pi*x)'=cos(x))
str(z)

# b) rbind  (row-wise binding)
# 
# The rbind() function combines vectors or matrices by binding them row-wise, 
# creating a new matrix.

x <- seq(-2,2,0.5)
y <- exp(x)
z <- rbind('x'=x,'exp(x)'=y)
z

# c) matrix

# The matrix(v,nrow=m,ncol=n) function creates generates a matrix with m rows 
# and n columns whose components are filled column-wise with the components of v.

matrix(1:12,3,4)
matrix(1:3,3,4)
matrix(0,3,4)
matrix(NA,3,4)

# d) array
# 
# The array() function creates multi-dimensional arrays by arranging data into
# specified dimensions (such as rows, columns, and additional layers).

array(1:12,dim=c(3,4))
array(1:3,dim=c(3,4))


# In principle, there are three- (or higher-) dimensional arrays:
  
A <- array(1:24,dim=c(2,3,4))
A[,,1]
A[,,2]
A[1,,]

#3 Subsetting matrices

# As for vectors substetting is also for matrices helpful.

z[2,7]    # entry in row 2 and column 7
z[1,]     # row 1
z[,2]     # column 2
z[1,3:5]  # rows 1 and and column 3:5

## Exercise:  Specify a minimal integer nmin >= 0  and a maximal integer 
# nmax > nmin. Then generate a matrix with three columns:
#  n: containing the integers nmin,..., nmax
#  n2: containing the squares of these integers nmin^2, ..., nmax^2
#  n3: containing the cubes of these integers nmin^3, ..., nmax^3
# Four lines of code, including the specification of nmin, nmax should suffice.

nmin <- 1
nmax <- 2
matrix(c(nmin,nmin^2, nmin^3, nmax, nmax^2, nmax^3), 2, 3)

### 2.3.3 Data frames:
# A data frame is a table where each column n is a vector of arbitrary type  
# (e.g., numeric, character, factor), aka "variable" or "feature", and each 
# row corresponds to an "observation" or "case".
# Data frames can also be viewed as special lists (see below).

# Theoretically, one can create a data frame by hand. However, you will 
# typically encounter data frames in R when you work with data sets. Thus, 
# let us read a data set to study this data structure:

#file.exists("DataSets/Trees.txt")
#trees <- read.table("DataSets/Trees.txt", header = TRUE)
ds <- read.table("DataSets/Trees.txt", header=TRUE) 
head(ds) # display the first 6 rows
str(ds)

# a) Subsetting dataframes
# 
# Subsetting data frames is analoguous to subsetting matrices, i.e.

ds[3,] # 3rd row
ds[,2] # 2nd column
ds[1:5,c(1,3)] # rows 1 to 5 of columns 1 and 3

# Subsetting like done above, however, does not make your code easily 
# understandable. Thus, when working with data frames one often uses the column 
# names rather than the column index for the selection:
  
ds$height # column height
ds[2:6,]$height # rows 2:6 of columns height
ds[1:5,c("diam","volume")] # rows 1 to 5 of columns diam and volume

# b) cbind (column-wise binding)

# Sometimes during the analysis we would like to add columns (or rows) to our 
# data frame. This can be achieved by using the previously introduced function 
# cbind() (or rowbind()). For example, if I would like to add the area of the 
# cross-section to the data frame, I could do it as follows.

area <- (ds$diam/2)^2*pi
ds <- cbind(ds, area) # I need to replace the old data frame with the new one
head(ds)

# Another option to accomplish this is

dsarea2 <- (ds$diam/2)^2*pi
head(ds)

### 2.3.4 Lists:
# This is the most general data structure. It is an array of an (almost) 
# arbitrary number of items/objects, where each item can be of arbitrary 
# type itself. Arbitrary objects can be combined to lists:
  
  
  
Someone <- list(given.name='Dagobert',
                surname='Duck',
                age=57,
                residence='Duckburg',
                age.of.children=NA)
Someone
str(Someone)

Someone.else <- list(given.name='Donald',
                     surname='Duck',ge=42,
                     residence='Duckburg',
                     age.of.children=c(7,9,11))
Someone.else
str(Someone.else)


# Access to items of a list:
  
Someone[2]
Someone[[2]]
Someone$residence
Someone[[5]]
Someone.else[[5]]
Someone$profession


# One can also start with an empty list, specifying only the number or names 
# of items and fill it in later:
  
Me <- list(given.name=NULL,
           surname=NULL,age=NULL,residence=NULL,nationality=NULL)
str(Me)

# Now specify the items in this list with your data:

Me$given.name <- "Anja"
Me$surname <- 'Muehlemann'
Me[3] <- 91
Me$residence <- 'Bern'
Me$nationality <- 'swiss'
Me


# One could also start with an empty list:
  
You <- list()
Yougiven.name <- "Emily"
You



