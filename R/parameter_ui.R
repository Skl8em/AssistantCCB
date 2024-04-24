


parameterUI <- function() {
  tabPanel(
    "Parametre consulaire",
    numericInput("ippa", "IPPA", 100),
    numericInput("tx", "Taux de chancellerie", 1),
    shinyWidgets::formatNumericInput("cps", "CPS en point", 0.07, format = "percentageEU2dec"),
    numericInput("ippa_prec", "IPPA précédente", 100),
    numericInput("tx_prec", "Taux de chancellerie précédent", 1),
    shinyWidgets::formatNumericInput("cps_prec", "CPS en point précédente", 0.07, format = "percentageEU2dec")
  )
}