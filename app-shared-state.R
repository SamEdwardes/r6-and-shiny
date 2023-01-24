library(shiny)

# Initiate module outside of the server function. State will be shared across
# all connections. This is usually not the desired outcome.
math_module <- mathModule$new("definedOutsideServerFunction")

ui <- fluidPage(
  titlePanel("R6 testing"),
  h2("This is the main UI"),
  p("This UI compontent is not inside a module."),
  hr(),
  math_module$ui(),
)

server <- function(input, output, session) {
  math_module$server()
}

shinyApp(ui = ui, server = server)
