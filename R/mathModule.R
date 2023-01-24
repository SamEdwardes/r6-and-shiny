mathModule <- R6::R6Class(
  "mathModule",
  public = list(
    
    # Define attributes
    id = NULL,
    number = NULL,
    
    # Initialize
    initialize = function(id) {
      self$id <- id
    },
    
    # Define the UI for the Class
    ui = function() {
      ns <- shiny::NS(self$id)
      shiny::tagList(
        shiny::h2(glue::glue("This is module {self$id}")),
        shiny::p("hello"),
        shiny::numericInput(ns("x"), label = "x", value = 10),
        shiny::p("x * 2 is:"),
        shiny::verbatimTextOutput(ns("y"))
      )
    },
    
    # Define the server side logic
    server = function() {
      shiny::moduleServer(
        self$id,
        function(input, output, session) {
          
          self$number <- reactive({
            print(glue::glue("{session$token} -> x is {input$x}"))
            return(input$x)
          })
          
          output$y <- shiny::renderText({
            print(glue::glue("{session$token}-> self$number is {self$number()}"))
            return(self$number() * 2)
          })
          
        }
      )
    }
    
  )
)