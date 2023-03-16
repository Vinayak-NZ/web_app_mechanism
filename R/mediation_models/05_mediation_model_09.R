## ----latent-change-models

# model_nine

mediation_model_nine <- "

  COMM_t4 ~ efficacy_change_t4_t2 + planning_change_t4_t2 + intention_change_t2_t0 + planning_evaluation
  
  planning_change_t4_t2 ~ intention_change_t2_t0 + efficacy_change_t4_t2 + planning_evaluation
  
  efficacy_change_t4_t2 ~ intention_change_t2_t0
  
  intention_change_t2_t0 ~ OE_t0

"

mediation_model_nine <- sem(mediation_model_nine, 
                           data = imputed, 
                           group = "randomisation")


summary(mediation_model_nine, fit.measures = TRUE)

sink("output/mediation_model_09.txt")
print(summary(mediation_model_nine, fit.measures = TRUE))
sink()

semPlot::semPaths(mediation_model_nine, "par", 
                  sizeMan = 15, sizeInt = 15, sizeLat = 15, 
                  edge.label.cex = 1.5, 
                  fade=FALSE)