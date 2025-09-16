library(shiny)

# Define UI for MPG predictor app
shinyUI(fluidPage(
  
  titlePanel("MPG Predictor App"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("wt", "Car Weight (1000 lbs):", 
                  min = 1, max = 6, value = 3),
      sliderInput("hp", "Horsepower:", 
                  min = 50, max = 350, value = 120)
    ),
    
    mainPanel(
      h3("Predicted MPG:"),
      verbatimTextOutput("prediction"),
      plotOutput("mpgPlot")
    )
  )
))
