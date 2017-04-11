# Exercise 4: Working with Data Frames

# Load R's "USPersonalExpenditure" dataest using the `data()` function


# The variable USPersonalExpenditure is now accessible to you. Unfortunately, it's not a data.frame
# Test this using the is.data.frame function
is.data.frame(USPersonalExpenditure)

# Luckily, you can simply pass the USPersonalExpenditure variable to the data.frame function
# to convert it a data.farme

# Create a new variable by passing the USPersonalExpenditure to the data.frame function
into.data.frame <- data.frame(USPersonalExpenditure, stringsAsFactors = FALSE)

# What are the column names of your dataframe?
colnames(into.data.frame)

# Q: Why are they so strange?
# A: The system doesn't let yout name columns with numbers

# What are the row names of your dataframe?
rownames(into.data.frame)

# Create a column `category` that is equal to your rownames
into.data.frame$category <- rownames(into.data.frame)

# How much money was spent on personal care in 1940?
ps1940 <- into.data.frame["Personal Care", "X1940"]

# How much money was spent on Food and Tobacco in 1960
fnt1960 <- into.data.frame["Food and Tobacco", "X1960"]

# What was the highest expenditure category in 1960?
highest.1960 <- into.data.frame$category[into.data.frame$X1960 == max(into.data.frame$X1960)]

### Bonus ###

# Write a function that takes in a year as a parameter, and 
# returns the highest spending category of that year
HighestSpendingCategory <- function(year) {
  return (into.data.frame$category[into.data.frame[year] == max(into.data.frame[year])])
}

# Using your function, determine the highest spending category of each year
highest.1940 <- HighestSpendingCategory("X1940")
highest.1945 <- HighestSpendingCategory("X1945")
highest.1950 <- HighestSpendingCategory("X1950")
highest.1955 <- HighestSpendingCategory("X1955")
highest.1960 <- HighestSpendingCategory("X1960")

# Write a loop to cycle through the years, and store the highest spending category of
# each year in a list
highest <- list()
for (year in c(1940, 1945, 1950, 1955, 1960)) {
  year.format <- paste0("X", year)
  highest[year.format] <- HighestSpendingCategory(year.format)
}
