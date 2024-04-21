library(shiny)
library(bslib)

# Define UI
ui <- page_sidebar(
  title = "Mon Tutoriel Shiny",
  sidebar = sidebar(
    "Bienvenue dans ce tutoriel Shiny ! Choisissez une section dans le menu ci-dessous :",
    tags$br(),
    actionLink("home", " Home", class = "no-text-decoration"),
    actionLink("intro", "‍ Introduction", class = "no-text-decoration"),
    actionLink("fundamentals", " Fondamentaux", class = "no-text-decoration"),
    actionLink("data_processing", " Traitement et Visualisation des données", class = "no-text-decoration"),
    actionLink("advanced_apps", " Applications avancées", class = "no-text-decoration")
  ),
  mainPanel(
    uiOutput("content")
  )
)

# Define server logic
server <- function(input, output, session) {

  output$content <- renderUI({
    switch(input$sidebarItemClicked,
      "home" = card(
        card_header("Bienvenue dans notre tutoriel Shiny !"),
        "Ceci est la page d'accueil de notre tutoriel. Choisissez une section dans le menu sur le côté.",
        card_footer("Merci de participer à notre tutoriel !")
      ),
      "intro" = card(
        card_header("Introduction à Shiny"),
        "Shiny est un package de Posit qui rend incroyablement facile de construire des applications web interactives avec R.",
        "Pour une introduction et des exemples en direct, visitez la page d'accueil de Shiny (https://shiny.posit.co).",
        card_footer("Shiny est un produit de Posit.")
      ),
      "fundamentals" = card(
        card_header("Fondamentaux de Shiny"),
        "Dans cette section, vous apprendrez les bases de Shiny pour commencer à créer vos propres applications interactives.",
        card_footer("Explorez les fondamentaux et commencez à construire !")
      ),
      "data_processing" = card(
        card_header("Traitement et Visualisation des données"),
        "Découvrez comment traiter et visualiser les données dans vos applications Shiny pour une expérience utilisateur enrichissante.",
        card_footer("Maîtrisez les compétences de traitement et de visualisation des données !")
      ),
      "advanced_apps" = card(
        card_header("Applications avancées"),
        "Explorez des techniques avancées pour créer des applications Shiny plus complexes et puissantes.",
        card_footer("Devenez un expert en construction d'applications Shiny !")
      )
    )
  })

  observeEvent(input$sidebarItemClicked, {
    # Affiche la carte correspondante au clic
    switch(input$sidebarItemClicked,
      "home", "home",
      "intro", "intro",
      "fundamentals", "fundamentals",
      "data_processing", "data_processing",
      "advanced_apps", "advanced_apps"
    ) %>%
      lapply(function(card_id) {
        updateById(card_id, style = list(display = "block"))
      }) %>%
      lapply(function(card_id) {
        updateById(~!(id %in% card_id), style = list(display = "none"))
      })
  })
}

# Run the app
shinyApp(ui = ui, server = server)
