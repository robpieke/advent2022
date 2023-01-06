data <- read.csv("input.txt", header = FALSE)

mn <- apply(data, 2, min) - 1
mx <- apply(data, 2, max) + 1
sz <- mx - mn + 1

seen <- array(0, dim = sz)
cubes <- array(0, dim = sz)

for (r in 1:nrow(data)) {
  p <- data[r,] - mn + 1
  cubes[p[[1]], p[[2]], p[[3]]] <- 1
}

exposed <- 0
queue <- list(c(1, 1, 1))

while (length(queue) > 0) {
  cell <- queue[[1]]
  queue <- queue[-1]
  if (seen[cell[[1]], cell[[2]], cell[[3]]] == 1) {
    next
  }
  seen[cell[[1]], cell[[2]], cell[[3]]] <- 1

  for (i in 1:3) {
    if (cell[i] - 1 >= 1) {
      ncell <- c(cell[1] - if (i == 1) 1 else 0,
                 cell[2] - if (i == 2) 1 else 0,
                 cell[3] - if (i == 3) 1 else 0)
      if (cubes[ncell[[1]], ncell[[2]], ncell[[3]]] == 1) {
        exposed <- exposed + 1
      } else {
        queue <- c(queue, list(ncell))
      }
    }
    if (cell[i] + 1 <= sz[i]) {
      ncell <- c(cell[1] + if (i == 1) 1 else 0,
                 cell[2] + if (i == 2) 1 else 0,
                 cell[3] + if (i == 3) 1 else 0)
      if (cubes[ncell[[1]], ncell[[2]], ncell[[3]]] == 1) {
        exposed <- exposed + 1
      } else {
        queue <- c(queue, list(ncell))
      }
    }
  }
}

print(exposed)
