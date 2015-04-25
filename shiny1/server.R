shinyServer(function(input, output) {

   output$out <- renderText(paste("starting at", input$date_start, "; ending at", input$date_end, list.files("../")[1]))
    
 })
