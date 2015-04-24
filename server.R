# Load the shiny library
library(shiny)

# Use the trees dataset
data(trees)

modelFit <- lm(log(Volume) ~ log(Height) + log(Girth), data = trees)
vol <- function(girth, height) {
         modelFit$coefficients[1] + modelFit$coefficients[2] * log(height) +
                modelFit$coefficients[3] * log(girth)
}
shinyServer(
        function(input, output) {
                predicted_vol <- reactive({vol(input$Girth, input$Height)})
                output$prediction <- renderPrint({paste("Black cherry tree with height", input$Height,
                                                         "feet and girth", input$Girth,
                                                         "inches will produce",
                                                         round(predicted_vol(), 2),
                                                         "cubic feet of timber.")})
                #output$prediction <- renderPrint({paste(round(predicted_vol(), 2), " cubic feet of timber.")})
                output$plots <- renderPlot({
                        par(mfrow = c(1, 3))
                        # (1, 1)
                        with(trees, plot(Height, Volume,
                                          xlab ='Height (ft)',
                                          ylab ='Volume (cu. ft)',
                                          main ='Volume vs Height'))
                        points(input$Height, predicted_vol(), col='red', cex=3)
                        # (1, 2)
                        with(trees, plot(Girth, Volume,
                                          xlab ='Girth (in)',
                                          ylab ='Volume (cu. ft)',
                                          main ='Volume vs Girth'))
                        points(input$Girth, predicted_vol(), col='red', cex=3)
                        # (1, 3)
                        with(trees, plot(Height * Girth^2, Volume,
                                          main ='Volume vs Approximate Model'))
                        points(trees$Volume, trees$Height * trees$Girth^2, col='red', cex=3)
                })
        }
)