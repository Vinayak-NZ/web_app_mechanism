## ----latent-change-models

# model_four

mediation_model_four <- "

  COMM_t4 ~ efficacy_change_t4_t2 + planning_change_t4_t2 + intention_change_t2_t0
  
  planning_change_t4_t2 ~ efficacy_change_t4_t2
  
  intention_change_t2_t0 ~ OE_t0

"

mediation_model_four <- sem(mediation_model_four, 
                           data = imputed, 
                           group = "randomisation")


summary(mediation_model_four, fit.measures = TRUE)

sink("output/mediation_model_04.txt")
print(summary(mediation_model_four, fit.measures = TRUE))
sink()

semPlot::semPaths(mediation_model_four, "par", 
                  sizeMan = 15, sizeInt = 15, sizeLat = 15, 
                  edge.label.cex = 1.5, 
                  fade=FALSE)