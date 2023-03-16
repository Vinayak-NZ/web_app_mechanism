## ----latent-change-models

# model_seven

mediation_model_seven <- "

  COMM_t4 ~ efficacy_change_t4_t2 + planning_change_t4_t2 + efficacy_change_t4_t2 + intention_change_t2_t0 + feasibility
  
  planning_change_t4_t2 ~ intention_change_t2_t0 + feasibility
  
  efficacy_change_t4_t2 ~ intention_change_t2_t0
  
  intention_change_t2_t0 ~ OE_t0 + feasibility

"

mediation_model_seven <- sem(mediation_model_seven, 
                           data = imputed, 
                           group = "randomisation")


summary(mediation_model_seven, fit.measures = TRUE)

sink("output/mediation_model_07.txt")
print(summary(mediation_model_seven, fit.measures = TRUE))
sink()

semPlot::semPaths(mediation_model_seven, "par", 
                  sizeMan = 15, sizeInt = 15, sizeLat = 15, 
                  edge.label.cex = 1.5, 
                  fade=FALSE)