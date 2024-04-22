


parameterUI <- function() {
  tabPanel(
    "Parametre consulaire",
    numericInput("ippa", "IPPA", 100),
    numericInput("tx", "Taux de chancellerie", 1),
    numericInput("cps", "CPS en point", 0.07)
  )
}