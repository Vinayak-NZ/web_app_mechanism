## ----latent-change-models

# model_13

mediation_model_13 <- "

  COMM_t4 ~ PL_t4 + INT_t1 + accessibility
  
  PL_t4 ~ INT_t1 + accessibility
  
  INT_t1 ~ accessibility


"

mediation_model_13 <- sem(mediation_model_13, 
                          data = data_subset, 
                          group = "randomisation")


summary(mediation_model_13, fit.measures = TRUE)

sink("output/mediation_model_13.txt")
print(summary(mediation_model_13, fit.measures = TRUE))
sink()

semPlot::semPaths(mediation_model_13, "par", 
                  sizeMan = 15, sizeInt = 15, sizeLat = 15, 
                  edge.label.cex = 1.5, 
                  fade=FALSE)