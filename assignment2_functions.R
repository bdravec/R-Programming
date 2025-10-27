# ==========================
# File: hangman_functions.R
# ==========================
#
# This file contains the functions needed to run the
# Hangman game. Your task is to fill in the missing
# code sections marked with "TODO".
#
# =====================================================

# Draws the hangman figure based on the number of
# incorrect guesses.
#
# input wrong_count:  integer representing the number of
#                     wrong guesses
#
draw_hangman <- function(wrong_count) {
  # Always draw the gallows first
  #
  # HINT: use the lines() function for horizontal and
  # vertical lines. To test you can first open an empty plot
  # before running draw_hangman(...):
  #       plot.new()
  #       plot.window(xlim = c(0, 10), ylim = c(0, 10))
  #
  # TODO:
  # - Draw the main vertical pole
  # - the top horizontal beam
  # - the small support beam
  # - and the rope.
  
  
  # Next, conditionally draw parts of the hangman based on
  # the value of `wrong_count`
  
  # TODO: Draw the Head if one or more incorrect guesses
  # symbols() helps drawing a circle
  # ...
  # ...
  # ...
  # ...
  
  
  # TODO: Draw the Body if two or more incorrect guesses
  # ...
  # ...
  # ...
  # ...
  
  
  # TODO: Draw the Left Arm
  # ...
  # ...
  # ...
  # ...
  
  # TODO: Draw the Right Arm
  # ...
  # ...
  # ...
  # ...
  
  # TODO: Draw the Left Leg
  # ...
  # ...
  # ...
  # ...
  
  # TODO: Draw the Right Leg
  # ...
  # ...
  # ...
  # ...
}

# =====================================================

# Main function to run the Hangman game.
#
play_hangman <- function() {
  # --- 1. SETUP ---
  # TODO: Create a vector of words. Make them all uppercase.
  # HINT: toupper()
  # ...
  
  # TODO: Randomly sample one word from the list.
  # ...
  
  # TODO: Split the word into a vector of individual letters.
  # HINT: use strsplit()
  # ....
  
  # TODO: Define a vector to show the player's progress
  # (e.g., c("_", "_", "A", "_")). Initially it only consists
  # of dashes.
  # guessed <- ....
  
  # TODO: Define a vector to store the letters
  # the user has guessed incorrectly. Initially it is empty
  # wrong_guesses <- ...
  
  # The maximum number of allowed wrong guesses
  max_wrong <- 6
  # Initialize the game state
  game_over <- FALSE
  
  
  # --- 2. GAME LOOP ---
  # This loop continues as long as the game is not over
  # (win or loss).
  while (!game_over) {
    # --- 2a. DISPLAY ---
    # Setup a new plot for drawing
    plot.new()
    plot.window(xlim = c(0, 10), ylim = c(0, 10))
    
    # TODO: Call your draw_hangman function with the
    # current number of wrong guesses
    # draw_hangman(...)
    
    # TODO: Display the word-in-progress to the player
    # HINT: Use
    # text(5, 9, paste(guessed, collapse = "  "), cex = 2)
    # where guessed is the player's current progress
    # (e.g., c("_", "_", "A", "_"))
    
    
    # --- 2b. CHECK FOR WIN/LOSS ---
    # TODO: Check for a win. If the player won,
    # print a success and set `game_over` to TRUE.
    
    # TODO: Check for a loss. If the player lost,
    # print a failure message, reveal the word, and
    # set `game_over` to TRUE.
    
    
    # --- 2c. USER INPUT ---
    # Only ask for input if the game is still ongoing.
    if (!game_over) {
      # TODO: Ask the user to enter a letter and
      # HINT: use readline() and toupper()
      # guess <- ....
      
      
      # Catch invalid input
      # a) not a single letter
      if (nchar(guess) != 1) {
        cat("Please enter a single letter!\n")
      }
      # b) not a letter
      if (!grepl("[A-Z]", guess)) {
        cat("Please enter a letter not a number!\n")
      }
      # c) exclude already guessed letter
      if (guess %in% c(guessed, wrong_guesses)) {
        cat("Already guessed!\n")
      }
      
      # --- 2d. PROCESS USER INPUT ---
      # TODO: Check if the guessed letter is in the secret 
      # word.
      # - If the letter is correct:  Find all positions of
      # the letter in the word and update `guessed`.
      # - If the letter is incorrect: Add the letter to
      # `wrong_guesses`
      
      
    } # End of if(!game_over)
    
  } # End of while-loop
  
} # End of function
