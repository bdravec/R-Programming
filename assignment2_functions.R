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
  # plot.new()
  # plot.window(xlim = c(0, 10), ylim = c(0, 10))
  
  #
  # Draw the gallows
  # Draw the main vertical pole
  lines(c(1, 1), c(1, 8), lwd = 2)
  # - top horizontal pole
  lines(c(1, 4), c(8, 8), lwd = 2)
  # - the small support beam
  lines(c(1, 2), c(7, 8), lwd = 2)
  # - the rope
  lines(c(4, 4), c(8, 7), lwd = 2)
  
  # Next, conditionally draw parts of the hangman based on
  # the value of `wrong_count`
  
  #  Draw the Head if one or more incorrect guesses
  # symbols() helps drawing a circle
  if (wrong_count >= 1) {
    symbols(4, 6.5, circles = 0.5, add = TRUE, inches = FALSE, lwd = 2)
  }
  
  #  Draw the Body if two or more incorrect guesses
  if (wrong_count >= 2) {
    lines(c(4, 4), c(6, 4.5), lwd = 2)
  }
  
  #  Draw the Left Arm
  if (wrong_count >= 3) {
    lines(c(4, 3), c(5.5, 4.5), lwd = 2)
  }
  
  #  Draw the Right Arm
  if (wrong_count >= 4) {
    lines(c(4, 5), c(5.5, 4.5), lwd = 2)
  }
  
  #  Draw the Left Leg
  if (wrong_count >= 5) {
    lines(c(4, 3), c(4.5, 3), lwd = 2)
  }
  
  #  Draw the Right Leg
  if (wrong_count >= 6) {
    lines(c(4, 5), c(4.5, 3), lwd = 2)
  }
}

# =====================================================


# Main function to run the Hangman game.
#
play_hangman <- function() {
  # --- 1. SETUP ---
  # Create a vector of words. Make them all uppercase.
  words <- toupper(c("donald", "murmeltier", "computer", "rumpelstilzchen", "hacker",
                     "bananensplit", "kirschenessen", "tangens", "hausboot", "schmetterling"))
  
  # Randomly sample one word from the list.
  conundrum <- sample(words, 1)
  
  # Split the word into a vector of individual letters.
  word_letters <- strsplit(conundrum, "")[[1]]
  
  # Define a vector to show the player's progress
  # (e.g., c("_", "_", "A", "_")). Initially it only consists
  # of dashes.
  guessed <- rep("_", length(word_letters))
  
  # Define a vector to store the letters
  # the user has guessed incorrectly. Initially it is empty
  wrong_guesses <- c()
  
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
    
    # Call your draw_hangman function with the
    # current number of wrong guesses
    draw_hangman(length(wrong_guesses))
    
    # Display the word-in-progress to the player
    # HINT: Use
    # text(5, 9, paste(guessed, collapse = "  "), cex = 2)
    # where guessed is the player's current progress
    # (e.g., c("_", "_", "A", "_"))
    text(5, 9, paste(guessed, collapse = "  "), cex = 2)
    
    # --- 2b. CHECK FOR WIN/LOSS ---
    # Check for a win. If the player won,
    # print a success and set `game_over` to TRUE.
    if (all(guessed == word_letters)) {
      text(5, 5, "YOU WIN!", cex = 3, col = "green")
      game_over <- TRUE
    }
    # Check for a loss. If the player lost,
    # print a failure message, reveal the word, and
    # set `game_over` to TRUE.
    if (length(wrong_guesses) >= max_wrong) {
      text(5, 5, "GAME OVER!", cex = 3, col = "red")
      text(5, 3, paste("The word was:", conundrum), cex = 1.5)
      game_over <- TRUE
    }
    
    # --- 2c. USER INPUT ---
    # Only ask for input if the game is still ongoing.
    if (!game_over) {
      # Ask the user to enter a letter and
      # HINT: use readline() and toupper()
      guess <- toupper(readline(prompt = "Enter a letter: "))
      
      
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
      # Check if the guessed letter is in the secret 
      # word.
      # - If the letter is correct:  Find all positions of
      # the letter in the word and update `guessed`.
      # - If the letter is incorrect: Add the letter to
      # `wrong_guesses`
      if (guess %in% word_letters) {
        # Correct guess: find all positions and update
        positions <- which(word_letters == guess)
        guessed[positions] <- guess
      } else {
        # Wrong guess: add to wrong_guesses
        wrong_guesses <- c(wrong_guesses, guess)
      }
    } # End of if(!game_over)
    
  } # End of while-loop
  
} # End of function
