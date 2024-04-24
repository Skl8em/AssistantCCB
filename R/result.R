

library(magrittr)

result_table <- function(input) {
  tibble::tibble(
    "valeur" = c("Régime précédent", "Algorithme", "Quotité alternative", "Différence"),
    'Quotité finale' = c(
      quotite_fp(input), quotite_f(input),quotite_af(input),quotite_af(input) - quotite_f(input)
    ),
    'Quotité théorique' = c(
      quotite_tp(input),quotite_t(input),input$quotite_a,input$quotite_a - quotite_t(input)
      ),
    'Revenus nets' = c(
      input$salaire,input$salaire,salaire_a(input),salaire_a(input) - input$salaire
      ),
    'Reste à charge' = c(
      cout_edu_p(input),cout_edu(input),cout_edu_a(input),cout_edu_a(input) - cout_edu(input)
                         )
  ) %>%
    dplyr::mutate(
    'Revenus restant' = `Revenus nets` - `Reste à charge`
  ) %>%
    tibble::column_to_rownames("valeur") %>%
    DT::datatable(
                  options = list(
                    dom = "t"
                  )
    ) %>%
    DT::formatPercentage(
      c('Quotité finale', 'Quotité théorique')
    ) %>%
    DT::formatRound(c('Revenus nets', 'Reste à charge', 'Revenus restant'),digits = 0, mark = ' ', dec.mark = ',')
}