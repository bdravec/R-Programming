source("assignment1_functions.R")


# Image 1: Staircase
new_canvas()
for (i in 1:7) {
  up(1)
  right(2)

}

# Image 2: Growing Squares
new_canvas()
for (i in 1:8){
  up(i)
  right(i)
  down(i)
  left(i)
}

# Image 3: Decreasing Squares
new_canvas()
for (i in 0:13){
  size <- 1.4 - i*0.1
  
  up(size)
  right(size)
  down(size)
  left(size)
  
  right(size) 
}

# Image 4: Colored Barplot
new_canvas()
for (i in 0:4){
  h=0.4
  up(i+h, col="red")
  right(1/2, col="blue")
  down(i+h, col="red")

}

# Image 5: Colored Spiral
new_canvas()
for (i in 1:16){
  if (i%%2==1){
    color="orange"
  }else{
    color="purple"
  }
  l=0.5
  right(i*l, col=color)
  up(i*l, col=color)
  left(i*l+0.25, col=color)
  down(i*l+0.25, col=color)

}


# Image 6: Colorful Comb
new_canvas()
for (i in 1:6){
  if (i%%2==1){
    color="gold"
  }else{
    color="darkgreen"
  }
  l=0.5
  up(l*i, col=color)
  down(l*i, col=color)
  right(1)
  
}

# Image 7: Coloreful Zig-Zag with while-loop
new_canvas()
n=1
while(n<=8){
  l=0.5
  if (n%%2==1){
    color="blue"
    down(n*l, col=color)
    right(l)
  }else{
    color2="red"
    up((n)*l, col=color2)
    right(l)
  }
  n=n+1
}

