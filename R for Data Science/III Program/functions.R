# Functions
# https://r4ds.had.co.nz/functions.html

df <- tibble::tibble(
  a = c(1,2,3,4,5),
  b = c(6,7,8,9,10),
  c = c(11,12,13,14,15),
  d = c(16,17,18,19,20)
)

df$a <- (df$a - min(df$a, na.rm = TRUE)) / 
  (max(df$a, na.rm = TRUE) - min(df$a, na.rm = TRUE))

x <- df$a
x
(x - min(x, na.rm = TRUE)) / (max(x, na.rm = TRUE) - min(x, na.rm = TRUE))
rng <- range(x, na.rm = TRUE)
(x - rng[1]) / (rng[2] - rng[1])
# range functions gives you the minimun and maximun of a list

rescale01 <- function(x){
  rng <- range(x, na.rm = TRUE)
  (x - rng[1]) / (rng[2] - rng[1])
  
}
rescale01(c(0,1,4))

#a vector can be passed as an element in a function
rescale01(df$a)
rescale01(df$b)

