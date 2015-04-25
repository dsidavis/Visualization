data(mtcars)

shinyServer(function(input, output) {

   output$out <- renderText(paste("check:", input$on, "; radio", input$which))

     # This should check if the variable exists
    i = reactive({ if(length(input$var) && input$var != "") pmatch(input$var, names(mtcars)) })

#    if(!is.na(i()))
     output$plot <- renderPlot({ if(length(i() == 1)) {
                                    plot(density(mtcars[[ i() ]] ))
                                    if(length(input$on) && input$on != "off")
                                        rug(mtcars[[ i() ]])
                                 }})

     output$scatterplot <- renderPlot({ if(length(i() == 1)) {
                                          plot(mtcars[[ i() ]], mtcars$mpg, xlab = names(mtcars)[i()], ylab = "Miles Per Gallon")
                                          if(length(input$on) && input$on != "off") {
                                             rug(mtcars[[ i() ]])
                                             rug(mtcars[[ "mpg" ]], side = 2)                                             
                                          }
                                 }})   
   
 })
