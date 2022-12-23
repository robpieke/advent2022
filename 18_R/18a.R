cubes <- as.matrix(read.csv("input.txt", header = FALSE))

exposed <- nrow(cubes) * 6

for (x in 1:3) {
  cubes <- cubes[order(cubes[,x], cubes[,x%%3+1], cubes[,(x+1)%%3+1]),]
  dists <- abs(diff(cubes))
  neighbour <- c(0, 0, 0)
  neighbour[(x+1)%%3+1] <- 1
  exposed <- exposed - 2 * sum(apply(dists, 1, function(x) identical(as.numeric(x), neighbour)))
}

print(exposed)
