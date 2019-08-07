

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$distPlot <- renderPlot({

        # generate inputs from sliders
        num_samp <-(seq(min(input$sample), max(input$sample), length.out = input$sample))
        means <-(seq(min(input$mean), max(input$mean), length.out = input$mean))
        stddev <-(seq(min(input$stddev), max(input$stddev), length.out = input$stddev))
        
        # Coombine inputs from sliders into a normal distribution
        normdist <- rnorm(num_samp, mean= means, sd= stddev)
        
        # draw the histogram with the specified number of bins
        hist(normdist, breaks = 100, col = 'skyblue', border = 'grey') #plot
        abline(v = means -stddev, col="red") # abline for -1 sd
        abline(v = means +stddev, col="red") # abline for +1 sd
        abline(v = means, col="green") # abline to highlight the mean
        legend("topright", c("Mean", "1 Standard Deviation"), fill = c("green", "red")) # legend for the ablines

    })

})
