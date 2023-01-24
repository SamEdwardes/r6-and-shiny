library(shiny)

# ------------------------------------------------------------------------------
# Define a shiny module
# ------------------------------------------------------------------------------

mathUI <- function(id) {
  ns <- NS(id)
  tagList(
    h2(glue::glue("This is module {id}")),
    p("hello"),
    numericInput(ns("x"), label = "x", value = 10),
    p("x * 2 is:"),
    verbatimTextOutput(ns("y"))
  )
  
}

mathServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      number <- reactive({
        return(input$x)
      })
      output$y <- renderText({
        return(number() * 2)
      })
    }
  )
}

# ------------------------------------------------------------------------------
# Shiny App
# ------------------------------------------------------------------------------

ui <- fluidPage(
  titlePanel("R6 testing"),
  h2("This is the main UI"),
  p("This UI compontent is not inside a module."),
  hr(),
  mathUI("noR6")
)

server <- function(input, output) {
  mathServer("noR6")
}

shinyApp(ui = ui, server = server)