
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(shinythemes)

country_data = read.csv("data/final_data.csv")

shinyUI(fluidPage(
  # Application title
  titlePanel(div(HTML("Does <strong><em>contraceptive usage</em></strong> effect <br /> individual country's <strong><em>economy</em> </strong>and <strong><em>growth</em> </strong>rate?"))
  ),
  h4(div(HTML("<strong>Sunghyun Yoon</strong>"))),
  
  # Sidebar with a slider input for number of bins
  fluidRow(
    
    column(6,
      plotOutput("ctrpt")
    ),
    column(6,
      plotOutput("growth")
    ),
    column(6,
      plotOutput("gdp")
    ),
    column(6,
      plotOutput("fertility")
    ),
    column(6,
           wellPanel(checkboxGroupInput("continent", "Continents to show:",
                                        unique(country_data$region),
                                        selected = unique(country_data$region))
           )
    ),
    column(6,
           wellPanel(
             sliderInput("range",
                         "Contraceptive Usage Rate (%):",
                         min = min(country_data$AverageCtrpt),
                         max = max(country_data$AverageCtrpt),
                         value = c(min(country_data$AverageCtrpt),max(country_data$AverageCtrpt))) # close sliderinput
           )
    )
  )
))
