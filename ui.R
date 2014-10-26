
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Measure your Savings on that downpayment"),
  sidebarLayout(
    sidebarPanel( "Debt Information",
    column(numericInput("debt", 
           label = h3("Debt Total"), 
           value = 10000), 
           sliderInput("rate", 
           label = h3("Interest Rate (Yearly)"), 
           min=0, max = 25, step = 0.5, value=10), 
           sliderInput("months", 
           label = h3("Loan Period (Months)"), 
           min = 0, max = 240, step = 1,value = 24),
           htmlOutput("est_payment"),width = 12)),
    
    mainPanel("This program will show you what amount of interest payments you could save by making a downpayment on your debt's principal",
              column(numericInput("downpayment", 
                    label = "DownPayment to Principal", 
                    value = 0),
                    br(),width=12)
              ," The 'calculated minimum monthly payment' amount is an approximation of what a bank would
                usually request as a minimum monthly payment. As you can see it is not much, but in 
                the end it becomes quite expensive to pay back your debt only with that!",
              h3(textOutput("savings")),"If you make a downpayment to principal early on in the credit, you will 
              save more. That is not always possible (there was a reason to borrow money after all), but
              it is always good to know one's choices.","The amount appearing as savings with this downpayment
              is the amount of money that you will save (this number will reduce the the 'total amount to pay' amount)"
              ,wellPanel(h3("Documentation"),"For using the application, simply input the total amount of money for the debt
              , the number of months that the original payment plan considers, and finally provide the yearly interest rate for the debt",
                         "The estimated monthly payment is calculated automatically, an is designed to give an approximation
              of what a bank woould expect you to pay. Below it the total amount that will be paid for this debt, assuming
only the minimum monthly payments are done, is shown. To update this, simply adjust the relevant inputs and it will
refresh automatically.", "Please input then in downpayment field the amount you are considering paying into the debt's principal.
              This will automatically update the field for 'Savings'. This is the estimated amount of money that you won't have to pay
              if you provide this downpayment. So if total amount reads 12 000 but savings reads 6000, it means that, once you do that
              downpayment, the total amount remaining to pay to finish the debt, assuming only minimum payments are done,
              is 6000 (total amount - savings)."),width=8)
  )

  ,theme="bootstrap.css"))
