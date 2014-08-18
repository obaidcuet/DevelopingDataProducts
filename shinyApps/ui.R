
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(pageWithSidebar(
                headerPanel("Number Summary"),
                sidebarPanel(
                        textInput(inputId="inputValues", label = "Input Values", 
                                  value = "1,2,3,4,5"),
                        
                        helpText(HTML("<h5>Documentation/Usage:</h5>")), 
                        
                        helpText("- This shiny application hepls calculating 
                                        number summary for a list of numbers."),
                        helpText("- Please enter your comma(,) seperated numbers 
                                         in the above text box."),
                        helpText("- The application page starts with some sample input values."),
                        helpText("- As soon values entered in the input box corresponding 
                                         summary & boxplot will be  shown in the right panel.")
                        
                ),
                mainPanel(
                        
                        h5('Input Values:'),
                        textOutput('inputValues'),
                        p(''),
                        
                        fluidPage(
                                fluidRow(
                                        column(3, 
                                               h5('Summary:'),
                                               tableOutput('SummaryTable')
                                        ),
                                        column(7,
                                               h5('Box Plot:'),
                                               plotOutput("BoxPlot")                                                            
                                        )
                                )
                                
                                
                        )
                        
                )
        )
)