## ----latent-change-models

# model_12

mediation_model_12 <- "

  COMM_t4 ~ PL_t4 + CSE_t3 + INT_t1
  
  PL_t4 ~ CSE_t3
  
  INT_t1 ~ OE_t0


"

mediation_model_12 <- sem(mediation_model_12, 
                           data = data_subset, 
                           group = "randomisation")


summary(mediation_model_12, fit.measures = TRUE)

sink("output/mediation_model_12.txt")
print(summary(mediation_model_12, fit.measures = TRUE))
sink()

semPlot::semPaths(mediation_model_12, "par", 
                  sizeMan = 15, sizeInt = 15, sizeLat = 15, 
                  edge.label.cex = 1.5, 
                  fade=FALSE)