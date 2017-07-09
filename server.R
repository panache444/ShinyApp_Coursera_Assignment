#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#

library(shiny)

shinyServer(function(input, output) {

  output$result <- renderText({
    paste("Predicted mpg for the features selected is (Miles/(US) gallon):")
  })
  output$value <- renderText({
    library("ggplot2")
    data("mtcars")
    fit<-lm(mpg~wt+hp+disp+as.factor(cyl)+as.factor(am),mtcars)
    newdata =data.frame(wt=input$wt,hp=input$hp,cyl=input$cyl,am=input$am,disp=input$disp)
    prediction<-predict(fit,newdata)
    if (prediction<0){
      0
      } else{
      round(prediction,digits = 2)
    }      
    })
  
  output$plot <- renderPlotly({
    library(plotly)
    plot_ly(mtcars,type = "scatter", x = ~wt, y = ~mpg, color = ~cyl, size = ~hp)
    })

})
