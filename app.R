#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  # Application title
  titlePanel("Assistant pour membre des Conseils Consulaires des Bourses"),
  tabsetPanel(parameterUI(),
              familyUI(), )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  parents <- function() {
    dplyr::case_match(input$famille,
                      "monoparentale" ~ 1,
                      "biparentale" ~ 2)
  }
  
  part <- function() {
    bourseAEFE::part(parents(), input$enfants)
  }
  quotite_f <- function() {
    bourseAEFE::quotite_post_cps(input$salaire,
                                 input$scolarite,
                                 part(),
                                 input$ippa,
                                 input$tx,
                                 input$cps)
  }
  quotite_t <- function() {
    bourseAEFE::quotite_theorique(input$salaire,
                                  input$scolarite,
                                  part(),
                                  input$ippa,
                                  input$tx)
  }
  cout_edu <- function() {
    (1 - quotite_f()) * (input$scolarite + input$periscolaire)
  }
  
  quotite_af <- function() {
    bourseAEFE::cps(input$quotite_a, input$cps)
  }
  cout_edu_a <- function() {
    (1 - quotite_af()) * (input$scolarite + input$periscolaire)
  }
  salaire_a <- function() {
    bourseAEFE::revenu_net_imp(quotite_af(),
                               input$scolarite,
                               part(),
                               input$ippa,
                               input$tx,
                               input$cps)
  }
  
  
  output$table <- renderTable({
    tibble::tibble(
      "indicateur" = c(
        'quotite finale',
        'quotite theorique',
        'revenus net',
        'reste a charge',
        'revenus restant'
      ),
      "Algorithme" = c(
        quotite_f(),
        quotite_t(),
        input$salaire,
        cout_edu(),
        input$salaire - cout_edu()
      )
      ,
      "Quotite alternative" = c(
        quotite_af(),
        input$quotite_a,
        salaire_a(),
        cout_edu_a(),
        salaire_a() - cout_edu_a()
      )
      ,
      "Difference" = c(
        quotite_af() - quotite_f(),
        input$quotite_a - quotite_t(),
        salaire_a() - input$salaire,
        cout_edu_a() - cout_edu(),
        salaire_a() - cout_edu_a() - (input$salaire - cout_edu())
      )
    )
  })
  
}

# Run the application
shinyApp(ui = ui, server = server)
