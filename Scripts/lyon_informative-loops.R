## ------------------------------------------------------- ##
# In(for)mative Loops & If/Else Calls
## ------------------------------------------------------- ##
## Written by: Nick J Lyon

# Purpose:
## Demonstrate a nifty way of getting your loops & if/else calls to let you know how their progress is going

# Clear environment
rm(list = ls())

# For Loop Variant ------------------------------------------

# You may want to know how your for loop is progressing (especially if it is an intense one that takes a  looong time to run)
# This (admittedly kind of hacky) method lets you do that easily

# Here's a demonstration
for (i in 1:10) {
  
  # Do whatever the loop was supposed to do
  i * 10
  
  # Add the following to the end of any loop for an easy diagnostic check
  print(paste('Processing element', i, 'complete'))
  }

# You can also get fancier by adding more bits inside the `print(paste())`
for (i in 1:10) {
  
  # Do whatever the loop was supposed to do
  i / 10
  
  # Add the following to the end of any loop for an easy diagnostic check
  print(paste('Processing element', i, 'completed at', Sys.time()))
}

# If the above loop included operations that took minutes (or hours!) the system time call would let you know how much time elapsed for each component

# If/Else Variant ---------------------------------------------------

# This also works for if/else calls!
## Give vector to pass to if/else
x <- TRUE

## Do if else
if(x == T) {
  print(paste('Condition met!'))
} else {
  print(paste('Condition NOT met.'))
}

# If that if/else call was super complicated it would be nice to have confirmation for whether the if/else call was doing the `if` part or the `else` part

# I've also used this `print(paste())` in Shiny apps as an easy way to print success/warning/error messages that the user can see easily

# End ----------------------------------------------------------------
