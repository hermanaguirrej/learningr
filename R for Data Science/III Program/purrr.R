# Learninf purrr
# http://www.rebeccabarter.com/blog/2019-08-19_purrr/

library(tidyverse)
# The objective of this script is to learn purrr and functions
# How to write a function and after apply it to a list, vector or df:
# function
addTen <- function(x) {
  return(x + 10)
}

# map function is one that applies the same action/function to every element of an object:
map(c(1, 2, 3), addTen)
# or
map(c(1, 2, 3), function(x) {
  return(x + 10)
})

# The function can also be written this way:
addTen1 <- function(x){
  x + 10
}
map(c(1, 2, 3), addTen)


# but a function can also apply the same action to every element of an object
df <- tibble::tibble(
  a = c(1,2,3,4,5),
  b = c(6,7,8,9,10),
  c = c(11,12,13,14,15),
  d = c(16,17,18,19,20)
)
#map_df must be applied to keep the data frame format:
df <- map_df(df,addTen1)

# What happen if some columns in a data frame are characters?
df <- tibble::tibble(
  a = c("orange","banana","melon","limon","apricot" ),
  b = c(1,2,3,4,5),
  c = c(6,7,8,9,10),
  d = c(11,12,13,14,15),
  e = c(16,17,18,19,20)
)

# Maybe I can felter before and apply after map_df function:
df_copy <- df %>% select_if(is.numeric) %>% map_df(addTen1)
df_copy$a <- df$a
df_copy %>% relocate("a")

# the same data frame can be used
df <- c(1, 2, 3)
map_df(df, function(x){
  return(data.frame(old_number = x, 
                    new_number = addTen(x)))
})


