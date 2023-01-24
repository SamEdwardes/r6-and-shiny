library(shiny)

ui <- fluidPage(
  titlePanel("R6 testing"),
  h2("This is the main UI"),
  p("This UI compontent is not inside a module."),
  hr(),
  # Initiate module in UI function.
  mathModule$new("definedInsideServer")$ui()
)

server <- function(input, output) {
  # Initiate module in server function.
  mathModule$new("definedInsideServer")$server()
}


shinyApp(ui = ui, server = server)