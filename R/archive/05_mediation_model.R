## ----latent-change-models

# model_two

mediation.model.two <- "

  COMM_t4 ~ efficacy_change_t4_t2 + planning_change_t4_t2 + intention_change_t2_t0
  
  planning_change_t4_t2 ~ intention_change_t2_t0
  
  efficacy_change_t4_t2 ~ intention_change_t2_t0
  
  intention_change_t2_t0 ~ OE_t0

"

mediation.fit.two <- sem(mediation.model.two, 
                     data = imputed, 
                     group = "randomisation")


summary(mediation.fit.two, fit.measures = TRUE)


semPlot::semPaths(mediation.fit.two, "par", 
                  sizeMan = 15, sizeInt = 15, sizeLat = 15, 
                  edge.label.cex = 1.5, 
                  fade=FALSE)


#intention -> self efficacy -> action planning -> communication