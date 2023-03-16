## ----latent-change-models

# model_six

mediation_model_six <- "

  COMM_t4 ~ efficacy_change_t4_t2 + planning_change_t4_t2 + intention_change_t2_t0 + feasibility
  
  planning_change_t4_t2 ~ efficacy_change_t4_t2 + feasibility
  
  intention_change_t2_t0 ~ OE_t0

"

mediation_model_six <- sem(mediation_model_six, 
                           data = imputed, 
                           group = "randomisation")


summary(mediation_model_six, fit.measures = TRUE)

sink("output/mediation_model_06.txt")
print(summary(mediation_model_six, fit.measures = TRUE))
sink()

semPlot::semPaths(mediation_model_six, "par", 
                  sizeMan = 15, sizeInt = 15, sizeLat = 15, 
                  edge.label.cex = 1.5, 
                  fade=FALSE)