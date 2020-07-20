library(tidyverse)

# 11.2 Introduction and 11.2 Getting started
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

parse_double("1.23")
parse_double("1,23", locale = locale(decimal_mark = ","))
parse_number("$100")
parse_number("20%")
parse_number("It cost $123.45")
parse_number("$123,456,789")
parse_number("123.456.789", locale = locale(grouping_mark = "."))
parse_number("123'456'789", locale = locale(grouping_mark = "'"))

fruit <- c("apple", "banana")
parse_factor(c("apple", "banana", "bananana"), levels = fruit)

parse_datetime("2010-10-01T2010")
parse_datetime("20101010")
parse_date("2010-10-01")

library(hms)
parse_time("01:10 am")
parse_time("20:10:01")

parse_date("01/02/15", "%m/%d/%y")
parse_date("01/02/15", "%d/%m/%y")
parse_date("01/02/15", "%y/%m/%d")

# If you’re using %b or %B with non-English month names, you’ll need to set the lang argument to locale(). See the list of built-in languages in date_names_langs(), or if your language is not already included, create your own with date_names().
parse_date("1 janvier 2015", "%d %B %Y", locale = locale("fr"))



# Exercise 
locale()
# 11.3.1 What are the most important arguments to locale()?
# The locale object has arguments to set the following:
# date and time formats: date_names, date_format, and time_format
# time zone: tz
# numbers: decimal_mark, grouping_mark


# 11.3.2 What happens if you try and set decimal_mark and grouping_mark to the same character? What happens to the default value of grouping_mark when you set decimal_mark to ","? What happens to the default value of decimal_mark when you set the grouping_mark to "."?
locale(decimal_mark = ",")
locale(grouping_mark = ".")

# 11.3.3 I didn’t discuss the date_format and time_format options to locale(). What do they do? Construct an example that shows when they might be useful.
parse_date("1 janvier 2015", "%d %B %Y", locale = locale("fr"))
parse_date("14 oct. 1979", "%d %b %Y", locale = locale("fr"))

# 11.3.4 If you live outside the US, create a new locale object that encapsulates the settings for the types of file you read most commonly.
# As an example, consider Australia. Most of the defaults values are valid, except that the date format is “(d)d/mm/yyyy”, meaning that January 2, 2006 is written as 02/01/2006.

parse_date("02/01/2006")
au_locale <- locale(date_format = "%d/%m/%Y")
parse_date("02/01/2006", locale = au_locale)

# 11.3.7 Generate the correct format string to parse each of the following dates and times:
d1 <- "January 1, 2010"
d2 <- "2015-Mar-07"
d3 <- "06-Jun-2017"
d4 <- c("August 19 (2015)", "July 1 (2015)")
d5 <- "12/30/14" # Dec 30, 2014
t1 <- "1705"
t2 <- "11:15:10.12 PM"

parse_date(d1, "%B %d, %Y")
parse_date(d2, "%Y-%b-%d")
parse_date(d3, "%d-%b-%Y")
parse_date(d4, "%B %d (%Y)")
parse_date(d5,"%m/%d/%y")
parse_time(t1, "%H%M")
parse_time(t2, "%H:%M:%OS %p")

# 11.4 Parsing a File

guess_parser("2010-10-01")
guess_parser("15:01")
guess_parser(c("TRUE", "FALSE"))
guess_parser(c("1", "5", "9"))
guess_parser(c("12,352,561"))
str(parse_guess("2010-10-10"))


