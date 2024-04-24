


familyUI <- function() {
  tabPanel(
    "Famille",
    selectInput(
      "famille",
      "Type de famille",
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
    numericInput("salaire", "Revenus nets", 45000),
    numericInput("scolarite", "Frais stricts de scolarité", 15000),
    numericInput("periscolaire", "Frais parascolaires", 1000),
    shinyWidgets::formatNumericInput(
      "quotite_a",
      "Quotité théorique alternative",
      0.5, format = "percentageEU2dec")
    
  )
}
