library(shiny)

# Define server logic
server <- function(input, output) {
  
  # Load dataset and fit model
  data(mtcars)
  fit <- lm(mpg ~ wt + hp, data = mtcars)
  
  # Reactive prediction
  output$prediction <- renderText({
    newdata <- data.frame(wt = input$wt, hp = input$hp)
    pred <- predict(fit, newdata)
    paste("Predicted MPG:", round(pred, 2))
  })
  
  # Reactive plot
  output$plot <- renderPlot({
    plot(mtcars$wt, mtcars$mpg,
         xlab = "Weight (1000 lbs)", ylab = "MPG",
         main = "MPG vs Car Weight",
         pch = 19, col = "blue")
    abline(lm(mpg ~ wt, data = mtcars), col = "red", lwd = 2)
    points(input$wt, predict(fit, newdata = data.frame(wt = input$wt, hp = input$hp)),
           col = "darkgreen", pch = 19, cex = 2)
  })
}
