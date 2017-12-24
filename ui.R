
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

country_data = read.csv("data/final_data.csv")

shinyUI(fluidPage(
  # Application title
  titlePanel("Analysis of the International Population"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
     sidebarPanel(
       sliderInput("range",
                   "Contraceptive Usage Rate (%):",
                   min = min(country_data$AverageCtrpt),
                   max = max(country_data$AverageCtrpt),
                   value = c(min(country_data$AverageCtrpt),max(country_data$AverageCtrpt))) # close sliderinput
     ),#close sidebar panel

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("ctrpt"),
      plotOutput("growth"),
      plotOutput("gdp"),
      plotOutput("fertility")
    )
  )
))
