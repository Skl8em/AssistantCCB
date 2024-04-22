


result_table <- function(input) {
  tibble::tibble(
    "indicateur" = c(
      'Quotité finale',
      'Quotité théorique',
      'Revenus nets',
      'Reste à charge',
      'Revenus restant'
    ),
    "Algorithme" = c(
      quotite_f(input),
      quotite_t(input),
      input$salaire,
      cout_edu(input),
      input$salaire - cout_edu(input)
    )
    ,
    "Quotité alternative" = c(
      quotite_af(input),
      input$quotite_a,
      salaire_a(input),
      cout_edu_a(input),
      salaire_a(input) - cout_edu_a(input)
    )
    ,
    "Différence" = c(
      quotite_af(input) - quotite_f(input),
      input$quotite_a - quotite_t(input),
      salaire_a(input) - input$salaire,
      cout_edu_a(input) - cout_edu(input),
      salaire_a(input) - cout_edu_a(input) - (input$salaire - cout_edu(input))
    )
  )
}