## ----latent-change-models

# model_16

mediation_model_16 <- "

  COMM_t4 ~ CSE_t3 + feasibility
  
  CSE_t3 ~ feasibility
  
  INT_t1 ~ feasibility


"

mediation_model_16 <- sem(mediation_model_16, 
                          data = data_subset, 
                          group = "randomisation")


summary(mediation_model_16, fit.measures = TRUE)

sink("output/mediation_model_16.txt")
print(summary(mediation_model_16, fit.measures = TRUE))
sink()

semPlot::semPaths(mediation_model_16, "par", 
                  sizeMan = 15, sizeInt = 15, sizeLat = 15, 
                  edge.label.cex = 1.5, 
                  fade=FALSE)