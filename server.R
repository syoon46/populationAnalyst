
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(rworldmap)
library(RColorBrewer)

country_data = read.csv("data/final_data.csv")


shinyServer(function(input, output) {
  
  output$ctrpt <- renderPlot({
    par(mai=c(0,0,0.2,0),xaxs="i",yaxs="i")
    country_data_subset = country_data[(country_data$AverageCtrpt>=input$range[1] & country_data$AverageCtrpt <=input$range[2]),]
    if(length(input$continent) !=  8){
      country_data_subset = country_data_subset[country_data_subset$region %in% input$continent,]
    }
    sPDF <- joinCountryData2Map( country_data_subset, joinCode = "ISO3", nameJoinColumn = "CountryCode")
    colourPalette <- rev(RColorBrewer::brewer.pal(5,'YlOrRd'))
    mapParams <- mapCountryData( sPDF, 
                                 nameColumnToPlot= "AverageCtrpt" , 
                                 oceanCol = 'lightblue', 
                                 missingCountryCol = 'snow', 
                                 mapTitle = "Global 2010's average Contraceptive Usage", 
                                 addLegend = FALSE, 
                                 colourPalette = colourPalette )
    do.call(addMapLegend, c( mapParams , legendLabels="all"  , legendWidth=0.5 , legendIntervals="data", legendMar = 2 ) )
  })

  output$growth <- renderPlot({
    par(mai=c(0,0,0.2,0),xaxs="i",yaxs="i")
    country_data_subset = country_data[(country_data$AverageCtrpt>=input$range[1] & country_data$AverageCtrpt <=input$range[2]),]
    if(length(input$continent) !=  8){
      country_data_subset = country_data_subset[country_data_subset$region %in% input$continent,]
    }
    sPDF <- joinCountryData2Map( country_data_subset, joinCode = "ISO3", nameJoinColumn = "CountryCode")
    colourPalette <- RColorBrewer::brewer.pal(5,'PuBuGn')
    mapParams <- mapCountryData( sPDF, 
                                 nameColumnToPlot= "AverageGrowthRate" , 
                                 oceanCol = 'lightblue', 
                                 missingCountryCol = 'snow', 
                                 mapTitle = "Global 2010's average Growth Rate", 
                                 addLegend = FALSE, 
                                 colourPalette = colourPalette )
    do.call(addMapLegend, c( mapParams , legendLabels="all"  , legendWidth=0.5 , legendIntervals="data", legendMar = 2 ) )
  })
  
  output$gdp <- renderPlot({
    par(mai=c(0,0,0.2,0),xaxs="i",yaxs="i")
    country_data_subset = country_data[(country_data$AverageCtrpt>=input$range[1] & country_data$AverageCtrpt <=input$range[2]),]
    if(length(input$continent) !=  8){
      country_data_subset = country_data_subset[country_data_subset$region %in% input$continent,]
    }
    sPDF <- joinCountryData2Map( country_data_subset, joinCode = "ISO3", nameJoinColumn = "CountryCode")
    colourPalette <- RColorBrewer::brewer.pal(5,'YlGnBu')
    mapParams <- mapCountryData( sPDF, 
                                 nameColumnToPlot= "AverageGDP" , 
                                 oceanCol = 'lightblue', 
                                 missingCountryCol = 'snow', 
                                 mapTitle = "Global 2010's average GDP per capita", 
                                 addLegend = FALSE, 
                                 colourPalette = colourPalette )
    do.call(addMapLegend, c( mapParams , legendLabels="all"  , legendWidth=0.5 , legendIntervals="data", legendMar = 2 ) )
  })
  
  output$fertility <- renderPlot({
    par(mai=c(0,0,0.2,0),xaxs="i",yaxs="i")
    country_data_subset = country_data[(country_data$AverageCtrpt>=input$range[1] & country_data$AverageCtrpt <=input$range[2]),]
    if(length(input$continent) !=  8){
      country_data_subset = country_data_subset[country_data_subset$region %in% input$continent,]
    }
    sPDF <- joinCountryData2Map( country_data_subset, joinCode = "ISO3", nameJoinColumn = "CountryCode")
    colourPalette <- RColorBrewer::brewer.pal(5,'RdPu')
    mapParams <- mapCountryData( sPDF, 
                                 nameColumnToPlot= "AverageFertility" , 
                                 oceanCol = 'lightblue', 
                                 missingCountryCol = 'snow', 
                                 mapTitle = "Global 2010's average Fertility Rate", 
                                 addLegend = FALSE, 
                                 colourPalette = colourPalette )
    do.call(addMapLegend, c( mapParams , legendLabels="all"  , legendWidth=0.5 , legendIntervals="data", legendMar = 2 ) )
  }) 
})
