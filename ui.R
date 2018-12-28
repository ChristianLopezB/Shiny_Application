library(shiny)
shinyUI(fluidPage(
  titlePanel("Testing for the difference in mean of two normal distributions"),
  sidebarLayout(
    sidebarPanel(
      numericInput("No", "Number of replications", value=10, step=10),
      h5("Parameters of Distribution No.1"),
      sliderInput("Mean1", "What is the Mean of the distrubution?", -10, 10, value = 0),
      sliderInput("SD1", "What is the SD of the distrubution?", 0.1, 5, value = 1),
      h5("Parameters of Distribution No.2"),
      sliderInput("Mean2", "What is the Mean of the distrubution?", -10, 10, value = 0),
      sliderInput("SD2", "What is the SD of the distrubution?", 0.11, 5, value = 1),
      checkboxInput("Plot1", "Show/Hide Density Plot", value = TRUE)
    ),
    mainPanel(
      h3("Density Plots"),
      plotOutput("plot1"),
      h3("Two sided t-test and Power-test results",align = "center"),
      h4("T-test statistic"),
      textOutput("t"),
      h4("p-value= P(Type I error)"),
      textOutput("p"),
      h4("1-Power= P(Type II error)"),
      textOutput("po")
      
    )
  )
))
