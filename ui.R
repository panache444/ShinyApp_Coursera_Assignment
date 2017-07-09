#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#


library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Motor Trend Car Road Tests"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("wt", "Weight (1000 lbs):", min = 0, max = 10, value = 3),
      sliderInput("disp", "Displacement (cu.in.):", min = 0, max = 500, value = 230),
      sliderInput("hp", "Gross horsepower:", min = 0, max = 350, value = 145),
      selectInput("cyl", "Number of cylinders:",c(4,6,8)),
      selectInput("am", "Transmission (0 = automatic, 1 = manual):",c(0,1))
  ),
    mainPanel(
      plotlyOutput("plot"),
      h4(textOutput("result")),
      verbatimTextOutput("value")
    )
  )
))
