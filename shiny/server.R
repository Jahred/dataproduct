fibonacci <-function(n){
  cache <-numeric(n)
  cache[0]=0
  cache[1]=1
  cache[2]=1
  result=0
  if(n ==0 || n==1 || n ==2){
    return (cache[n])
  }
  
  for (p in 3:n){
    a<-cache[p-1]
    b <-cache[p-2]
    cache[p]<-a+b
  }
  result <-cache[n]
  result
}
  fibsToN <- function(num){
    fibs=vector()
    for(i in 1:num){
      fibs[i] <- log(fibonacci(i))
    }
    fibs
  }

shinyServer(
  function(input,output){
    output$inputValue <- renderPrint({input$inputId})
    output$prediction <- renderPrint({
      fibonacci(input$inputId)
      })
    output$dateOfPrediction <-   renderPrint({date()})
   
      output$predictionGraph <-renderPlot({
        output$dateOfPrediction <-   renderPrint({date()})
        fibs <-fibsToN(input$inputId)
       plot(1:input$inputId,fibs, xlab = "Log fibonacci of n",ylab = "n",type = "l",lwd=3,col="blue",main="Evolution of Log of fibonacci")
    })
   
  }
  
  
  
  
  )
