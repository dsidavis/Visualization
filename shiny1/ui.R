shinyUI(fluidPage(
      titlePanel("Getting Started - testing the forms"),

      sidebarLayout(
           sidebarPanel(
                 dateInput("date_start", label = "Start", value = "2015-01-01"),
                 dateInput("date_end", label = "Finish", value = "2015-01-02")
#                 submitButton("go")# , label = "Go")
               ),
              mainPanel(
                  h2("Output"),
                  textOutput("out"),
                  hr(),
                  img(src = "260px-Okapi2.jpg"),  # images don't seem to make it across to the Web server?
                  hr(),
                  includeHTML("htmlContent.html")
                  
              )
       )
    ))
