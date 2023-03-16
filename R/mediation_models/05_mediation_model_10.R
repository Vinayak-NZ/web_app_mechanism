## ----latent-change-models

# model_ten

mediation_model_ten <- "

  COMM_t4 ~ efficacy_change_t4_t2 + planning_change_t4_t2 + intention_change_t2_t0 + accessibility
  
  planning_change_t4_t2 ~ intention_change_t2_t0 + efficacy_change_t4_t2 + accessibility
  
  efficacy_change_t4_t2 ~ intention_change_t2_t0
  
  intention_change_t2_t0 ~ OE_t0 + accessibility

"

mediation_model_ten <- sem(mediation_model_ten, 
                            data = imputed, 
                            group = "randomisation")


summary(mediation_model_ten, fit.measures = TRUE)

sink("output/mediation_model_10.txt")
print(summary(mediation_model_ten, fit.measures = TRUE))
sink()

semPlot::semPaths(mediation_model_ten, "par", 
                  sizeMan = 15, sizeInt = 15, sizeLat = 15, 
                  edge.label.cex = 1.5, 
                  fade=FALSE)