library(shiny)
library(shinydashboard)
library(shinyjs)

ui <- dashboardPage(
  
    dashboardHeader(title = "Tutoriel Shiny"),
    dashboardSidebar(
        sidebarMenu(
        menuItem("Home", tabName = "page1"),
        menuItem("Introcuction", tabName = "page2"),
        menuItem("Fondamentaux", tabName = "page3"),
        menuItem("Traitement et Visualisation", tabName = "page4"),
        menuItem("Applications avancées", tabName = "page5")
        )
    ),
    
    
    dashboardBody(
        tags$head(
            tags$link(rel = "stylesheet", href = "all.min.css"),
            tags$style(HTML("
            .icon-text i {
                color: red; /* Couleur rouge */
            }
            "))
        ),
        tabItems(
            tabItem("page1",
                fluidRow(
                    column(width = 12, align = "center",
                        img(src = "shiny.png", height = 140, width = 400),
                        column(width = 12,
                        tabsetPanel(
                            tabPanel("Description",
                                    p(h3("Shiny est un framework open source en R conçu pour simplifier le processus de création d'applications web interactives destinées à l'analyse et à la visualisation de données.

                                        Il offre une expérience de développement rapide en permettant aux utilisateurs de transformer leurs scripts R en applications web avec quelques lignes de code.

                                        Shiny se distingue par sa simplicité d'utilisation et son orientation vers les développeurs et les data scientists, éliminant la complexité inhérente au développement web traditionnel.

                                        Il prend en charge la création de tableaux de bord interactifs, la visualisation de données, l'intégration de widgets interactifs et offre une expérience utilisateur fluide.

                                        Shiny est devenu populaire dans le domaine de la science des données pour sa facilité d'apprentissage, son efficacité et sa capacité à accélérer le déploiement d'applications web basées sur R."))),
                            tabPanel("Avantages",
                                    p("
                                    Shiny présente plusieurs avantages qui ont contribué à sa popularité croissante, notamment dans le domaine de la science des données et du développement d'applications web interactives. Voici quelques-uns des avantages clés de Shiny :
                                        1. Facilité d'utilisation et Rapidité de Développement : Shiny offre une expérience de développement intuitive et rapide, permettant aux utilisateurs de se concentrer sur la création d'applications interactives sans se soucier des détails techniques complexes du développement web.
                                        2. Intégration Transparente avec R : En tant que framework conçu spécifiquement pour R, Shiny s'intègre harmonieusement avec les fonctionnalités et les packages de ce langage, offrant ainsi aux développeurs un environnement familier et puissant pour l'analyse de données et la visualisation.
                                        3. Widgets Intuitifs et Visualisation Dynamique : Grâce à une gamme étendue de widgets interactifs et à la capacité de visualiser instantanément les données, Shiny permet de créer des applications qui captivent les utilisateurs et offrent une expérience immersive.
                                        4. Serveur Intégré et Déploiement Simplifié : Avec son serveur web intégré, Shiny simplifie le processus de déploiement des applications, offrant ainsi aux développeurs une solution clé en main pour rendre leurs créations accessibles en ligne.
                                        5. Personnalisation CSS et Documentation Complète : Shiny permet une personnalisation légère du style via CSS, offrant ainsi aux développeurs la liberté de créer des interfaces uniques. De plus, la documentation complète et la communauté active facilitent l'apprentissage et le support continu.
                                        En résumé, Shiny se distingue par sa facilité d'utilisation, son intégration transparente avec R, ses fonctionnalités interactives avancées, son processus de déploiement simplifié, sa personnalisation flexible et son support complet, faisant de lui un choix privilégié pour le développement d'applications web interactives en R.")),
                            tabPanel("Plan du cours",
                                    p("1. Introduction à Shiny
                                        Présentation de Shiny et ses avantages
                                        Utilisation et applications de Shiny dans l'analyse de données et la création d'applications web interactives
                                        2. Installation de Shiny
                                        Téléchargement et installation de Shiny
                                        Configuration de l'environnement de développement pour travailler avec Shiny
                                        3. Premiers Pas avec Shiny
                                        Création d'une application Shiny de base \"Hello World\"
                                        Exploration de la structure de base d'une application Shiny
                                        4. Fondamentaux de Shiny
                                        Introduction aux widgets interactifs (boutons, curseurs, etc.)
                                        5. Utilisation des widgets pour créer des interactions avec les visualisations
                                        Affichage de Données
                                        Intégration de DataFrames dans les applications Shiny
                                        Personnalisation de l'affichage des données pour une meilleure compréhension
                                        6. Traitement de Données avec Shiny
                                        Chargement et traitement de données dans les applications Shiny
                                        Utilisation de bibliothèques telles que Pandas pour manipuler les données
                                        7. Visualisations Interactives
                                        Création de graphiques interactifs avec des bibliothèques comme Matplotlib, Plotly, etc.
                                        Personnalisation des visualisations pour une présentation dynamique des données
                                        8. Applications Avancées avec Shiny
                                        Création d'applications multi-pages pour une meilleure organisation des fonctionnalités
                                        Utilisation de st.session_state pour gérer les sessions utilisateur
                                        9. Déploiement d'Applications Shiny
                                        Options de déploiement telles que Shinyapps.io, Heroku, etc.
                                        Optimisation des performances des applications déployées
                                        10. Projets Pratiques
                                        Projet 1 : Dashboard interactif de données
                                        Création d'un tableau de bord interactif avec des widgets pour une exploration approfondie des données
                                        Projet 2 : Analyse de données en temps réel
                                        Intégration de données en temps réel dans une application Shiny avec des mises à jour dynamiques
                                        11. Conclusion et Perspectives
                                        Récapitulatif des principaux concepts et compétences acquises
                                        Perspectives futures pour explorer davantage les fonctionnalités avancées de Shiny et ses applications dans le domaine de l'analyse de données interactives.")),
                            tabPanel("Quelques liens utiles",
                                    p("tags$a(href = \"https://shiny.rstudio.com/\", \"Site officiel de Shiny\"),
                                        tags$a(href = \"https://shiny.rstudio.com/articles/\", \"Documentation officielle de Shiny\"),
                                        tags$a(href = \"https://rstudio.cloud/\", \"RStudio Cloud\"),
                                        tags$a(href = \"https://shiny.rstudio.com/gallery/\", \"Galerie de Shiny\"),
                                        tags$a(href = \"https://github.com/rstudio/shiny\", \"GitHub de Shiny\"),
                                        tags$a(href = \"https://community.rstudio.com/c/shiny/\", \"Communauté de Shiny\"),
                                        tags$a(href = \"https://www.youtube.com/playlist?list=PL6wLL_Rq9PnZHgxKn5sMA8WwMgkCukRci\", \"Chaîne YouTube de Shiny\")"))
                                            
                                            )
                        )
                    )
                )        
            ),
            tabItem("page2",
                fluidRow(
                    column(width = 12, align = "center",
                    h2("INTRODUCTION")),
                    column(width = 12,
                        tabsetPanel(
                            tabPanel(
                                div(
                                    class = "icon-text",
                                    tags$i(class = "fas fa-arrow-alt-circle-down", style = "color: blue;"),
                                    "Installation"),
                                p("Pour installer Shiny R, il faut avoir R instalé sur votre machine."),
                                p("Ensuite, vous ouvrez une console R et lancez la commande:"),
                                div(class = "code-container",
                                    verbatimTextOutput("code1Output"),
                                    actionButton("copyButton", "Copier le code")
                                ),
                                p("Bravo, vous venez d'installer shiny")   
                            ),
                            tabPanel(
                                div(
                                    class = "icon-text",
                                    tags$i(class = "fas fa-plane"),
                                    "Lancement"),
                                HTML("L'exemple <b>Hello Shiny</b> trace un histogramme de faithfull'ensemble de données de R avec un nombre configurable de groupes.<br/> Les utilisateurs peuvent modifier le nombre de bacs avec une barre coulissante et l'application répondra immédiatement à leur saisie.<br/>
                                Vous utiliserez <b>Hello Shiny</b> pour explorer la structure d’une application Shiny et créer votre première application.<br/>Pour exécuter <b>Hello Shiny</b> , tapez :"),
                                
                                actionButton("copyButton", "Copier le code"),
                                verbatimTextOutput("code2"),
                                verbatimTextOutput("code3")
                            ),
                            tabPanel(
                                div(
                                class = "icon-text",
                                tags$i(class = "fas fa-info-circle", style = "color: black;"),
                                "Compléments"),
                                HTML("Pour ajouter du contenu plus avancé, utilisez l'une des fonctions de balise <b>HTML</b> de Shiny.<br/> Ces fonctions sont parallèles aux balises <b>HTML5</b> courantes.")
                            )
                        )
                    )
                )
            ),
            tabItem("page3",
                fluidRow(
                    column(width = 12, align = "center",
                    h2("FONDAMENTAUX")),
                    column(width = 12,
                        tabsetPanel(
                            tabPanel(
                                div(
                                    class = "icon-text",
                                    tags$i(class = "fas fa-hand-pointer"),
                                    "Hello word"
                                ),
                                HTML("Pour commencer, créons dans un dossier, un fichier <b>app.R</b> dans lequel nous allons écrire le code suivant:"),
                                verbatimTextOutput("code4"),
                                actionButton("copyButton", "copier le code"),
                                p("Puis dans l'invite de commande exécutons notre application en lançant:"),
                                verbatimTextOutput("code5"),
                                actionButton("copyButton", "copier le code")
                                ),
                            tabPanel(
                                div(
                                    class = "icon-text",
                                    tags$i(class = "fas fa-font", style = "color: blue;"),
                                    "Texte"
                                ),
                                tabsetPanel(
                                    tabPanel(
                                        "Structures",
                                        HTML("<h2>Tutoriel <font color = red>Shiny</font><p><font color = blue> Introduction aux bases de données</font></p><p>👨🏾‍💻 Applications web</p><p><em><h4>Ma première application web avec Shiny!</h4></em></p>")
                                    )
                                )
                            )
                        )
                    )    
                )
            ),

            tabItem("page4",
                fluidRow(
                    column(width = 12, align = "center",
                        h2("TRAITEMENT ET VISUALISATION DES DONNES")),
                    column(width = 12,
                    tabsetPanel(
                        tabPanel("Métriques",
                                p(h3("Shiny est un package R qui facilite la création d'applications Web interactives (applications) directement à partir de R.
                                    Il s'agit d'une extension de RStudio qui facilite le développement d'applications web avec une interface utilisateur graphique intuitive. Cette leçon vous permettra de commencer immédiatement à créer des applications Shiny."))),
                        tabPanel("Upload data",
                                p("Contenu de l'onglet 2")),
                        tabPanel("Data Frame",
                                p("Contenu de l'onglet 3")),
                        tabPanel("Charts",
                                p("Contenu de l'onglet 4"))
                        )
                    )
                )        
            ),

            tabItem("page5",
                fluidRow(
                    column(width = 12, align = "center",
                        h2("APPLICATION AVANCEES")),
                    column(width = 12,
                        tabsetPanel(
                            tabPanel("Applications multi-pages",
                                    p(h3("Shiny est un package R qui facilite la création d'applications Web interactives (applications) directement à partir de R.
                                        Il s'agit d'une extension de RStudio qui facilite le développement d'applications web avec une interface utilisateur graphique intuitive. Cette leçon vous permettra de commencer immédiatement à créer des applications Shiny."))),
                            tabPanel("Session state",
                                    p("Contenu de l'onglet 2")),
                            tabPanel("Barre de progression",
                                    p("Contenu de l'onglet 3")),
                            tabPanel("Spinner",
                                    p("Contenu de l'onglet 4")),
                            tabPanel("Configuration de pages",
                                    p("Contenu de l'onglet 4"))
                        )
                    ),
                )
            )

        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

  code1 <- "install.packages(\"shiny\")"
  
  output$code1Output <- renderPrint({
    code1
  })
  
  observeEvent(input$copyButton, {
    shinyjs::runjs("navigator.clipboard.writeText($('#code1Output').text());")
  })
  
  code2 <- "library(shiny)"
  code3 <- "runExample(\"01_hello\")"
  
  output$code2 <- renderPrint({
    code2
  })
  output$code3 <- renderPrint({
    code3
  })
  
  observeEvent(input$copyButton, {
    code <- paste(code2, code3, sep = "\n\n")
    shinyjs::clipboard(code)
    #runjs(paste0("navigator.clipboard.writeText(`", code2, "`)"))
    shinyjs::showNotification("Code copié", duration = 5)
    
  })
  
  code4 <- HTML("library(shiny)

    ui <- fluidPage(
    textOutput(\"hello_world\")
    )

    server <- function(input, output, session) {
    output$hello_world <- renderText({
        \"Hello World !\"
    })
    }

    shinyApp(ui = ui, server = server)")
  
  output$code4 <- renderPrint({
    code4
  })
  observeEvent(input$copyButton, {
    shinyjs::clipboard(code4)
    shinyjs::showNotification("Code copié", duration = 5)
  })
  code5 <- HTML("shiny::runApp(\"app.R\")")
  
  output$code5 <- renderPrint({
    code5
  })
  observeEvent(input$copyButton, {
    shinyjs::clipboard(code4)
    shinyjs::showNotification("Code copié", duration = 5)
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
