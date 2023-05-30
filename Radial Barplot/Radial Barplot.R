library(ggplot2)

Category <- c("Herb", "Shrub", "Climber", "Tree")
Percent <- c(51, 8, 10, 31)
df <- data.frame(Category, Percent)

len <- 2
df2 <- data.frame(Category = letters[1:len], Percent = rep(0, len), Category2 = rep("", len))
df$Category2 <- paste0(df$Category, " - ", df$Percent, "%")

df <- rbind(df, df2)

df$Category <- factor(df$Category, levels = rev(df$Category))

plot <- ggplot(df, aes(x = Category, y = Percent, fill = Category2)) + 
  geom_bar(width = 0.9, stat = "identity") + 
  coord_polar(theta = "y") +
  xlab("") + ylab("") +
  ylim(c(0, 100)) +
  ggtitle("") +
  geom_text(data = df, hjust = 1, size = 5, aes(x = Category, y = 0, label = Category2)) +
  scale_fill_manual(values = c("#c6dbef", "#08306b", "#2171b5", "#6baed6", "#9ecae1")) +
  theme_minimal() +
  theme(
    legend.position = "none",
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    axis.line = element_blank(),
    axis.text.y = element_blank(),
    axis.text.x = element_blank(),
    axis.ticks = element_blank(),
    plot.background = element_rect(fill = "white", color = NA)
  )

ggsave("soecies.png", plot = plot, width = 10, height = 10, units = "cm", dpi = 300)
