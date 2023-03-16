## ----latent-change-models

# model_eight

mediation_model_eight <- "

  COMM_t4 ~ efficacy_change_t4_t2 + planning_change_t4_t2 + intention_change_t2_t0 + feasibility
  
  planning_change_t4_t2 ~ intention_change_t2_t0 + efficacy_change_t4_t2 + feasibility
  
  efficacy_change_t4_t2 ~ intention_change_t2_t0
  
  intention_change_t2_t0 ~ OE_t0 + feasibility

"

mediation_model_eight <- sem(mediation_model_eight, 
                           data = imputed, 
                           group = "randomisation")


summary(mediation_model_eight, fit.measures = TRUE)

sink("output/mediation_model_08.txt")
print(summary(mediation_model_eight, fit.measures = TRUE))
sink()

semPlot::semPaths(mediation_model_eight, "par", 
                  sizeMan = 15, sizeInt = 15, sizeLat = 15, 
                  edge.label.cex = 1.5, 
                  fade=FALSE)