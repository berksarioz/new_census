# ui.R

shinyUI(fluidPage(
  titlePanel("censusVis"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Create demographic maps with 
        information from the 2010 US Census."),
      
      selectInput("var", 
                  label = "Choose a variable to display",
                  choices = c("Percent White", "Percent Black",
                              "Percent Hispanic", "Percent Asian"),
                  selected = "Percent White"),
      
      sliderInput("range", 
                  label = "Range of interest:",
                  min = 0, max = 100, value = c(0, 100)),
      
      # BEGIN FILE UPLOAD
      br(),
      fileInput('file1', 'Choose CSV File',
                accept=c('text/csv', 
                         'text/comma-separated-values', 'text/plain',
                         'comma-separated values','.csv'))
      # END FILE UPLOAD
    ),
    
    mainPanel(
      plotOutput("map"),
      br(),
      tableOutput('contents')
      )
  )
))