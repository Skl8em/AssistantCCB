#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(DT)


# Define UI for application that draws a histogram
ui <- fluidPage(
  # Application title
  titlePanel("Assistant numérique pour membre des conseils consulaires des bourses scolaires"),
  fluidRow(column(4,
                  tabsetPanel(
                    parameterUI(),
                    familyUI(),
                  )),
           column(6,
                  # Show the resulting result table
                  mainPanel(
                    DT::DTOutput("table")
                  )))
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  output$table <- DT::renderDT(result_table(input))
}

# Run the application
shinyApp(ui = ui, server = server)
