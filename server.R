
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

est_monthly_payment <- 0
total_amount_paid <- 0
savings <- 0
cm_ir_rate <- 0

shinyServer(function(input, output) {
  

      
      output$est_payment <- renderUI({
        interest_rate = input$rate/1200
        cm_ir_rate <- (1+interest_rate)^input$months
        total_amount_paid <- round(input$debt*cm_ir_rate)
        est_monthly_payment <- round(total_amount_paid/max(input$months,1),0)
        str1 <- paste("Calculated minimum monthly payment:",est_monthly_payment)
        str2 <- paste("Calculated total amount to pay :",total_amount_paid)
        HTML(paste(str1, str2, sep = '<br/>'))
      
      })

      
      output$savings <- renderText({
        interest_rate = input$rate/1200
        cm_ir_rate <- (1+interest_rate)^input$months
        total_amount_paid <- round(input$debt*cm_ir_rate)
        amount_w_dwpymnt = round((input$debt-input$downpayment)*cm_ir_rate,0)
        savings <- total_amount_paid-amount_w_dwpymnt
        paste("Calculated savings with this downpayment to principal:",savings)
      })
      
  })