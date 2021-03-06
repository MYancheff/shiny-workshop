#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
or_data <- read_csv("data/oregon_census_clean.csv")
# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Racial Demographics of Oregon by County"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         selectInput("County",
                     "Select a county:",
                     choices = or_data[["Qualifying Name"]],
                     selected = "Baker County, Oregon")
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$distPlot <- renderPlot({
      # generate bins based on input$bins from ui.R
      x    <- faithful[, 2] 
      bins <- seq(min(x), max(x), length.out = input$bins + 1)
      
      # draw the histogram with the specified number of bins
      hist(x, breaks = bins, col = 'darkgray', border = 'white')
   })
   
   something <- reactive(ayy(filter == "test"))
}

# Run the application 
shinyApp(ui = ui, server = server)

