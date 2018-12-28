library(shiny)
library(ggplot2)
shinyServer(function(input, output) {
  
  Plot<-reactive({
    
    Dist1<- as.data.frame(matrix(c(rnorm(input$No,input$Mean1, input$SD1), rep("Distribution 1",input$No )), ncol=2))
    Dist2<-as.data.frame(matrix(c(rnorm(input$No,input$Mean2, input$SD2 ), rep("Distribution 2",input$No )), ncol=2))
    
    
    Dist1$V1<-as.numeric(as.character(Dist1$V1))
    Dist2$V1<-as.numeric(as.character(Dist2$V1))
    
    Dist_all<-rbind(Dist1,Dist2)
    test<-t.test(Dist_all$V1~Dist_all$V2)
    power<-power.t.test(n=input$No,delta =1, sd=sqrt( mean(c((sd(Dist1$V1)^2),(sd(Dist2$V1)^2)))), type = "two.sample",
                        alternative = "two.sided")
    return(list(gg=ggplot(Dist_all,aes(x=V1, fill=V2)) + geom_density(alpha=0.25), t=test, po=power))
    

})
  



 output$plot1 <- renderPlot({
   if(input$Plot1){
     Plot()$gg}
 })
 output$t <- renderText({
   round((Plot()$t)[[1]],4)
 })

 output$p <- renderText({
   round((Plot()$t)[[3]],5)
 })
 
 output$po <- renderText({
   1-round((Plot()$po)[[5]],5)
 })
})