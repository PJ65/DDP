library(shiny)
shinyUI(pageWithSidebar(
        headerPanel('Developing Data Products Course Project'),
        sidebarPanel(
                h3('How to use the application'),
                p('Please enter the girth (diameter of the tree in inches measured at 4.5 feet above the ground) and height (in feet) of black cherry tree in the fields provided below.'),
                p('The predicted Volume of timber in cubic feet will be auto generated in the main panel on the right.'),
                h3('Please enter the required inputs:'),
                numericInput('Girth', 'Tree girth diameter (inches):', 13, min = 8.3, max = 20.6, step = 0.1), # example of numeric input
                numericInput('Height', 'Tree height (feet):', 76, min = 63, max = 87, step = 1)
        ),
        mainPanel(
                h3('Prediction'),
                verbatimTextOutput("prediction"),
                plotOutput('plots'),
                p(),
                h5('Source: Ryan, T. A., Joiner, B. L. and Ryan, B. F. (1976) The Minitab Student Handbook. Duxbury Press.'),
                p()
        )
))