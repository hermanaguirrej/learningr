library(tidyverse)

# 11.2 and 11.2
heights <- read_csv("data/heights.csv")
read_csv("a,b,c
1,2,3
4,5,6")

read_csv("The first line of metadata
  The second line of metadata
  x,y,z
  1,2,3", skip = 2)

read_csv("# A comment I want to skip
  x,y,z
  1,2,3", comment = "#")

read_csv("1,2,3\n4,5,6", col_names = FALSE)

read_csv("1,2,3\n4,5,6", col_names = c("x", "y", "z"))

read_csv("a,b,c\n1,2,.", na = ".")

# Exercises
# 11.2.1 What function would you use to read a file where fields were separated with “|”?
read_delim(file, delim = "|")

# 11.2.2 Apart from file, skip, and comment, what other arguments do read_csv() and read_tsv() have in common?
intersect(names(formals(read_csv)), names(formals(read_tsv)))
identical(names(formals(read_csv)), names(formals(read_tsv)))

# 11.2.3 What are the most important arguments to read_fwf()?
#The most important argument to read_fwf() which reads “fixed-width formats”, is col_positions which tells the function where data columns begin and end.

# 11.2.4 Sometimes strings in a CSV file contain commas. To prevent them from causing problems they need to be surrounded by a quoting character, like " or '. By convention, read_csv() assumes that the quoting character will be ", and if you want to change it you’ll need to use read_delim() instead. What arguments do you need to specify to read the following text into a data frame? "x,y\n1,'a,b'"

x <- "x,y\n1,'a,b'"
read_delim(x, ",", quote = "'")
read_csv(x, quote = "'")

# 11.2.5 Identify what is wrong with each of the following inline CSV files. What happens when you run the code?
read_csv("a,b\n1,2,3\n4,5,6")
read_csv("a,b,c\n1,2\n1,2,3,4")
read_csv("a,b\n\"1")
read_csv("a;b\n1;3")
read_csv2("a;b\n1;3")

# 11.3 Parsing Vector
parse_logical(c("TRUE", "FALSE", "NA"))
str(parse_logical(c("TRUE", "FALSE", "NA")))
str(parse_integer(c("1", "2", "3")))
str(parse_date(c("2010-01-01", "1979-10-14")))

parse_integer(c("1", "231", ".", "456"), na = ".")
x <- parse_integer(c("123", "345", "abc", "123.45"))
problems(x)
