## ------------------------------------------------------- ##
         # Nick's Custom num_chk Function
## ------------------------------------------------------- ##
## Written by: Nick J Lyon

# Purpose:
## Demonstrate my custom num_check function
## The repository link is here:
## https://github.com/NJLyon-Projects/helpR

# Need to install my custom function R package (easier than providing the code for the function raw)
# install.packages("devtools")
devtools::install_github("NJLyon-Projects/helpR")

# Attach the library
library(helpR)

# Demonstrate `helpR::num_chk` -------------------------------------------

# Check out the help file for the function
?helpR::num_chk

# Simply, this function checks a provided column that should be numeric for any entries that would be turned into an NA if you used `as.numeric` on the column

# Example code from the help file
## Create a data frame with a numeric column where some entries would be coerced into NA
spp <- c('salmon', 'bass', 'halibut', 'eel')
ct <- c(1, '14x', '_23', 12)
fish <- data.frame('species' = spp, 'count' = ct)

## Examine that data frame
fish

## Use `num_chk()` to look for problematic entries
helpR::num_chk(data = fish, col = "count")

## Use your preferred method of solving such typos
fish2 <- fish
fish2$count <- gsub("14x", "14", fish2$count)
fish2$count <- ifelse(fish2$count == "_23", yes = 23, no = fish2$count)

## Use `num_chk()` again to see if it is fixed
helpR::num_chk(data = fish2, col = "count")

# Look at Internal Workings of `helpR::num_chk` ------------------------

# You can see how this works as you do with any other function
helpR::num_chk

# And you can run these lines outside of the function
## Define objects as the names the function guts expect
data <- fish; col <- "count"
## Remove NA entries from the dataframe
notNA <- subset(data, !is.na(data[, col]))
## Of the non-NAs, which values would be lost if the column were coerced into numeric?
bad <- subset(notNA, is.na(suppressWarnings(as.numeric(notNA[, col]))))
## Return only unique bad entries
unique(bad[, col])

# End ------------------------------------------------------------------
