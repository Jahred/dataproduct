library(shiny)
library(shinyapps)

shinyUI(fluidPage(
  titlePanel("Rapid Fibonacci Calculator"),
  pageWithSidebar(
    headerPanel('Calculates the Nth Fibonacci value for input between 0 and 1000'),
    sidebarPanel(
      numericInput('inputId','Choose N',3,min=0,max=1000,step=1),
      submitButton('Calculate')
    ),
    
    mainPanel(
      helpText('This is a simple example to demonstrate the use of the very basic concepts of Shiny.\n Just enter a number in the input field on the left side to get on the Summary tab the Fibonacci Value for the number you entered.\n On the Plot tab you can see the evolution of the Log of fibonacci from 1 to the number you entered.'),
      tabsetPanel(
        
        tabPanel("Summary", verbatimTextOutput("summary"),
                 h4('Results of Prediction'),
                 h4('You entered: '),
                 verbatimTextOutput("inputValue"),
                 h4('The Predicted Fibonacci value is: '),
                 verbatimTextOutput("prediction"),
                 h4('Date of Plot '),
                 verbatimTextOutput("dateOfPrediction")
        ), 
        tabPanel("Plot", plotOutput("predictionGraph"))
        
      )
      
    )
    
  )
)
)
