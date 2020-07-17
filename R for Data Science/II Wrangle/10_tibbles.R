library(tidyverse)
df <- tibble(
  a = lubridate::now() + runif(1e3) * 86400,
  b = lubridate::today() + runif(1e3) * 30,
  c = 1:1e3,
  d = runif(1e3),
  e = sample(letters, 1e3, replace = TRUE)
)

# How many rows you want to print
nycflights13::flights %>% 
  print(n = 15, width = Inf)

df <- tibble(
  x = runif(1000),
  y = rnorm(1000)
)
#The function above are really important: runif is a type of probability distribution in which all outcomes are equally likely. rnomr is a normal distribution probability.

hist(df[['x']])
hist(df[['y']])

# a column can be retrieved from a tibble using a placeholder:
df %>% .[['y']]

# I can use that information to create a graph
df %>% .$y %>%  hist()
df %>%  .[['y']] %>% hist()


## Exercise 
# 10.1 How can you tell if an object is a tibble? 
mtcars
as_tibble(mtcars)
is_tibble(mtcars)
# there are a difference between them when you print
is_tibble(ggplot2::diamonds)
is_tibble(nycflights13::flights)
class(mtcars)
class(ggplot2::diamonds)
class(nycflights13::flights)


# 10.2 Compare and contrast the following operations on a data.frame and equivalent tibble. What is different? Why might the default data frame behaviours cause you frustration?
df <- data.frame(abc = 1, xyz = "a")
df$a
df$x
df[, "xyz"]
df[, c("abc", "xyz")]

tbl <- as_tibble(df)
tbl$x
tbl[, "xyz"]
tbl[, c("abc", "xyz")]


# 10.3 If you have the name of a variable stored in an object, e.g. var <- "mpg", how can you extract the reference variable from a tibble?
var <- "mpg"
mtcars[[var]]
mtcars$var


# 10.4 Practice referring to non-syntactic names in the following data frame by: 
# 1. Extracting the variable called 
annoying <- tibble(
  `1` = 1:10,
  `2` = `1` * 2 + rnorm(length(`1`))
)

annoying[['2']]
annoying$`2` # becareful use a back ticket

# 2. Plotting a scatterplot of 1 vs 2.  
annoying %>% ggplot(mapping = aes(x = `1`, y = `2`)) + geom_point()

# 3.Creating a new column called 3 which is 2 divided by 1.  
mutate(annoying, `3` = `2`/`1`)
annoying[['4']] <- annoying[['2']]/annoying[['1']]
annoying$`5` <- annoying$`4`*5

# 4.Renaming the columns to one, two and three.
annoying <- rename(annoying, one = `1`, two = `2`)
glimpse(annoying)


# 10.5 What does tibble::enframe() do? When might you use it?
#converts named vectors to a data frame with names and values
enframe(c(a = 1, b = 2, c = 3))
jjj <- enframe(c(a = 1, b = 2, c = 3))

tibble(
  a = c(1,2,3),
  b = c(2,5,6)
)

