# Iteration
# https://r4ds.had.co.nz/iteration.html
library(tidyverse)
df <- tibble(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)

df <- tibble::tibble(
  a = c(1,2,3,4,5),
  b = c(6,7,8,9,10),
  c = c(11,12,13,14,15),
  d = c(16,17,18,19,20)
)

#We can to compute the median of each column. You could do with copy-and-paste:
median (df$a)
median (df$b)
median (df$c)
median (df$d)

# For Loops
#But that breaks our rule of thumb: never copy and paste more than twice. Instead, we could use a foor loop:

output <- vector("double", ncol(df))
for(i in seq_along(df)){
  output[[i]] <- median(df[[i]])
}
output


## Exercise
# 1. Compute the mean of every column in mtcars.
df <- mtcars
output <- vector('double',ncol(df))
for(i in seq_along(df)){
  output[[i]] <- mean(df[[i]])
}
output

# 2.Determine the type of each column in nycflights13::flights.
df <- nycflights13::flights
output <- vector('double',ncol(df))
for(i in seq_along(df)){
  output[[i]] <- typeof(df[[i]])
}
output


# 3. Compute the number of unique values in each column of iris.
df <- iris
output <- vector('double',ncol(df))
for( i in seq_along(df)){
  output[[i]] <- length(unique(df[[i]]))
}
output



# Modifying an existing object
df <- tibble(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)
rescale01 <- function(x) {
  rng <- range(x, na.rm = TRUE)
  (x - rng[1]) / (rng[2] - rng[1])
  
}

map(df,rescale01)

#I can do this:
df$a <- rescale01(df$a)
df$b <- rescale01(df$b)
df$c <- rescale01(df$c)
df$d <- rescale01(df$d)

#or I can do this:
for(i in seq_along(df)) {
  df[[i]] <- rescale01(df[[i]])
}

