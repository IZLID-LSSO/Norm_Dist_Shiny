
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Normal Distribution"),

    # Sidebars for sample size, mean and standard deviation
    sidebarLayout(
        sidebarPanel(
            sliderInput("sample",
                        "Sample Size:",
                        min = 1,
                        max = 100000,
                        value = 30),
            sliderInput("mean",
                        "Center of the distribution 'Mean':",
                        min = 1,
                        max = 250,
                        value = 1),
            sliderInput("stddev",
                        "Standard Deviation:",
                        min = 1,
                        max = 250,
                        value = 30)
        ),

        # Show an interactive plot of the normal dist
        mainPanel(
            plotOutput("distPlot")
        )
    )
))
