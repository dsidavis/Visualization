shinyServer(function(input, output) {

         output$text1 <- renderText({
                       paste("You have selected this", input$var, input$range[1])
                   })

     }
)
