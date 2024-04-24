parents <- function(input) {
  dplyr::case_match(input$famille,
                    "monoparentale" ~ 1,
                    "biparentale" ~ 2)
}

part <- function(input) {
  bourseAEFE::part(parents(input), input$enfants)
}

quotite_f <- function(input) {
  bourseAEFE::quotite_post_cps(input$salaire,
                               input$scolarite,
                               part(input),
                               input$ippa,
                               input$tx,
                               input$cps)
}

quotite_t <- function(input) {
  bourseAEFE::quotite_theorique(input$salaire,
                                input$scolarite,
                                part(input),
                                input$ippa,
                                input$tx)
}

cout_edu <- function(input) {
  (1 - quotite_f(input)) * (input$scolarite + input$periscolaire)
}

quotite_af <- function(input) {
  bourseAEFE::cps(input$quotite_a, input$cps)
}

cout_edu_a <- function(input) {
  (1 - quotite_af(input)) * (input$scolarite + input$periscolaire)
}

salaire_a <- function(input) {
  bourseAEFE::revenu_net_imp(quotite_af(input),
                             input$scolarite,
                             part(input),
                             input$ippa,
                             input$tx,
                             input$cps)
}

quotite_fp <- function(input) {
  bourseAEFE::quotite_post_cps(input$salaire,
                               input$scolarite,
                               part(input),
                               input$ippa_prec,
                               input$tx_prec,
                               input$cps_prec)
}

quotite_tp <- function(input) {
  bourseAEFE::quotite_theorique(input$salaire,
                                input$scolarite,
                                part(input),
                                input$ippa_prec,
                                input$tx_prec)
}

cout_edu_p <- function(input) {
  (1 - quotite_fp(input)) * (input$scolarite + input$periscolaire)
}