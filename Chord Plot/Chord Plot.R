library(circlize)

set.seed(2948)

numbers <- matrix(c(4, 5, 7, 8, 7,
                    7, 11, 10, 5, 9,
                    9, 9, 8, 3, 10,
                    11, 10, 9, 4, 9,
                    0, 8, 4, 9, 9,
                    0, 1, 4, 3, 0), ncol = 5, byrow = TRUE)

rownames(numbers) <- c("< 20", "21 - 30", "31 - 40", "41 - 50", "51 - 60", "> 60")
colnames(numbers) <- c("School", "Community", "Family", "Self_taught", "Friends_and_relative")

grid.colors <- c(School = "red", Community = "green", Family = "orange",
                 Self_taught = "blue", Friends_and_relative = "black")

chordDiagram(numbers, transparency = 0.1, grid.col = grid.colors)

library(tidyverse)

png("chord_diagram.png", width = 3000, height = 3000, res = 500)
circos.clear()
chordDiagram(numbers, transparency = 0.1, grid.col = grid.colors)
dev.off()