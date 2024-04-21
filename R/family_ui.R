



familyUI <- function() {
  tabPanel("Famille",
           fluidRow(
             column(
               4,
               selectInput(
                 "famille",
                 "type de famille",
                 choices = c("monoparentale", "biparentale"),
                 selected = "biparentale"
               ),
               numericInput(
                 "enfants",
                 "Nb d'enfant",
                 2,
                 min = 1,
                 max = 7,
                 step = 1
               ),
               numericInput("salaire", "salaire net", 45000),
               numericInput("scolarite", "Frais stricts de scolarité", 15000),
               numericInput("periscolaire", "Frais parascolaires", 1000),
               numericInput("quotite_a", "Quotité théorique alternative", 0.1, min = 0, max = 1),
               
             ),
             column(6,
                    # Show a plot of the generated distribution
                    mainPanel(tableOutput("table")
                              #plotOutput("distPlot")))
                    ))))
}
