cubes <- as.matrix(read.csv("input.txt", header = FALSE))

exposed <- nrow(cubes) * 6

for (x in 1:3) {
  cubes <- cubes[order(cubes[, (x - 1) %% 3 + 1],
                       cubes[, (x + 0) %% 3 + 1],
                       cubes[, (x + 1) %% 3 + 1]), ]
  dists <- abs(diff(cubes))
  neighbour <- c(0, 0, 0)
  neighbour[(x + 1) %% 3 + 1] <- 1
  is_neighbour <- function(x) {
    return(identical(as.numeric(x), neighbour))
  }
  exposed <- exposed - 2 * sum(apply(dists, 1, is_neighbour))
}

print(exposed)
