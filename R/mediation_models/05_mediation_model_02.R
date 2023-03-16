## ----latent-change-models

# model_two

mediation_model_two <- "

  COMM_t4 ~ efficacy_change_t4_t2 + planning_change_t4_t2 + intention_change_t2_t0
  
  planning_change_t4_t2 ~ intention_change_t2_t0
  
  efficacy_change_t4_t2 ~ intention_change_t2_t0
  
  intention_change_t2_t0 ~ OE_t0

"

mediation_model_two <- sem(mediation_model_two, 
                         data = imputed, 
                         group = "randomisation")


summary(mediation_model_two, fit.measures = TRUE)

sink("output/mediation_model_02.txt")
print(summary(mediation_model_two, fit.measures = TRUE))
sink()

semPlot::semPaths(mediation_model_two, "par", 
                  sizeMan = 15, sizeInt = 15, sizeLat = 15, 
                  edge.label.cex = 1.5, 
                  fade=FALSE)