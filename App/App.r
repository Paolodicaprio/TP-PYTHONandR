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
    uiOutput("content"),
    tabsetPanel(
        id = "tabs",
        tabPanel("Home", textOutput("page1_content")),
        tabPanel("Intoduction", textOutput("page2_content")),
        tabPanel("Fondamentaux", textOutput("page3_content")),
        tabPanel("Traitement et Visualisation des données", textOutput("page4_content")),
        tabPanel("Applications avancées", textOutput("page5_content"))
    ),

    textOutput("message")
  ),

)

# Define server logic
server <- function(input, output, session) {

    
    output$page2_content <- renderText(
        "contenu 2"
    )
    output$page3_content <- renderText(
        "contenu 3"
    )
    output$page4_content <- renderText(
        "contenu 4"
    )
    output$page5_content <- renderText(
        "contenu 5"
    )

    observeEvent(input$home, {
        updateTabsetPanel(session, inputId = "tabs", selected = "Page 2")
    })  

    observeEvent(input$intro, {
        updateTabsetPanel(session, inputId = "tabs", selected = "Page 3")
    })
    observeEvent(input$home, {
        # Code pour naviguer vers une autre page
        # Par exemple, rediriger vers "/page2" dans votre application
        # Pour cela, vous pouvez utiliser des méthodes comme js$redirect("/page2") de shinyjs
        output$message <- renderText("Vous avez été redirigé vers la page 2.")
    })
}

# Run the app
shinyApp(ui = ui, server = server, options = list(runtime = "shiny"))