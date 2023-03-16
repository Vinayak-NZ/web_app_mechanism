## ----latent-change-models

# model_14

mediation_model_14 <- "

  COMM_t4 ~ CSE_t3 + INT_t1 + feasibility
  
  CSE_t3 ~ feasibility
  
  INT_t1 ~ feasibility


"

mediation_model_14 <- sem(mediation_model_14, 
                          data = data_subset, 
                          group = "randomisation")


summary(mediation_model_14, fit.measures = TRUE)

sink("output/mediation_model_14.txt")
print(summary(mediation_model_14, fit.measures = TRUE))
sink()

semPlot::semPaths(mediation_model_14, "par", 
                  sizeMan = 15, sizeInt = 15, sizeLat = 15, 
                  edge.label.cex = 1.5, 
                  fade=FALSE)