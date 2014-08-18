
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)


shinyServer(
        
        function(input, output) {
                
                output$inputValues <- renderText({input$inputValues}) 
                
                valuesInput <- reactive({ 
                        convertNumeric(input$inputValues)
                })
                
                
                output$SummaryTable <- renderTable({
                        summaryTable(valuesInput())
                })
                
                output$BoxPlot <- renderPlot({                                
                        boxplot(convertNumeric(input$inputValues),
                                xlab = '', ylab = 'Input Numeric Values',
                                main = 'Box Plot') 
                        
                })
                
        }
        
)

# Convert & return the input comma(,) seperated text to numeric vector
convertNumeric <- function(inputString) {        
        as.numeric(unlist(strsplit(inputString, ",")))
}

# Calculate & return the summary of the input numeric ventor
# Returns the summary as frame, suitable to show in shiny tables
summaryTable <- function(inputVector) {
        
        summaryVals <- summary(inputVector)
        
        data.frame(Name = names(summaryVals), 
                   Value=c(summaryVals[1:6]), 
                   stringsAsFactors=FALSE, row.names=NULL)
        
}