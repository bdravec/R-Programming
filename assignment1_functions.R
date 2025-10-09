# Global variables for current position
pen_x <- 0
pen_y <- 0

up <- function(length = 1, col = "black") {
  new_y <- pen_y + length
  segments(pen_x, pen_y, pen_x, new_y, col=col)
  pen_y <<- new_y
}

down <- function(length = 1, col = "black") {
  new_y <- pen_y - length
  segments(pen_x, pen_y, pen_x, new_y, col=col)
  pen_y <<- new_y
}

left <- function(length = 1, col = "black") {
  new_x <- pen_x - length
  segments(pen_x, pen_y, new_x, pen_y, col=col)
  pen_x <<- new_x
}

right <- function(length = 1, col = "black") {
  new_x <- pen_x + length
  segments(pen_x, pen_y, new_x, pen_y, col=col)
  pen_x <<- new_x
}

new_canvas <- function() {
  pen_x <<- 0
  pen_y <<- 0
  plot(0, 0, xlim = c(-10, 25), ylim = c(-10, 10), type = "n", 
       asp = 1, axes=F, ylab="", xlab="")
}

