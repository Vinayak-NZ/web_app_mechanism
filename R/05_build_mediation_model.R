## ----path-model

data_subset_key_vars <- data_subset[, 
                                    c("id", 
                                      "communication",
                                      "app_progression", 
                                      "self_efficacy",
                                      "planning", 
                                      "intention", 
                                      "outcome_expectancy")]

data_subset_key_vars <- data_subset_key_vars[complete.cases(data_subset_key_vars),]

data_subset_key_vars$id <- as.factor(data_subset_key_vars$id)

# model_app_effect

model_app_effect <- "

  intention ~ self_efficacy + outcome_expectancy
  
  planning ~  intention + self_efficacy
  
  communication ~ planning + intention + self_efficacy


"

mediation_model_app_effect <- sem(model_app_effect, 
                          data = data_subset_key_vars, 
                          se = "bootstrap", 
                          bootstrap = 5000, 
                          parallel = "snow", 
                          ncpus = 8)


summary(mediation_model_app_effect, fit.measures = TRUE)

sink("output/mediation_model_app_effect.txt")
print(summary(mediation_model_app_effect, fit.measures = TRUE))
sink()

sink("output/mediation_model_app_effect_confidence_interval.txt")
print(standardizedSolution(mediation_model_app_effect))
sink()

semPlot::semPaths(mediation_model_app_effect, "par", 
                  sizeMan = 15, sizeInt = 15, sizeLat = 15, 
                  edge.label.cex = 1.5, 
                  fade=FALSE)


## ----indirect-effect

indirect_effect_thru_intention <- "
        # path one
        intention ~ a * self_efficacy + outcome_expectancy
        
        # path two
        planning ~ b * intention

        # path three
        communication ~ c * planning

        # prime path 
        communication ~ pp * self_efficacy

        # indirect and total effects
        abc := a * b * c
        total := pp + abc

"

indirect_effect_sem_thru_intention <- sem(indirect_effect_thru_intention, 
                           data = data_subset_key_vars, 
                           se = "bootstrap", 
                           bootstrap = 5000)

sink("output/indirect_effect_thru_intention.txt")
print(summary(indirect_effect_sem_thru_intention, standardized = TRUE))
sink()

indirect_effect_thru_planning <- "
        # path one
        planning ~ a * self_efficacy
        
        # path two
        communication ~ b * planning

        # prime path 
        communication ~ pp * self_efficacy

        # indirect and total effects
        ab := a * b
        total := pp + ab

"

indirect_effect_sem_thru_planning <- sem(indirect_effect_thru_planning, 
                                          data = data_subset_key_vars, 
                                          se = "bootstrap", 
                                          bootstrap = 5000)

sink("output/indirect_effect_thru_planning.txt")
print(summary(indirect_effect_sem_thru_planning, standardized = TRUE))
sink()

indirect_effect_outcome_expectancy <- "
        # path one
        intention ~ a * outcome_expectancy
        
        # path two
        planning ~ b * intention
        
        # path three
        communication ~ c * planning

        # prime path 
        communication ~ pp * outcome_expectancy

        # indirect and total effects
        abc := a * b * c
        total := pp + abc

"

indirect_effect_sem_outcome_expectancy <- sem(indirect_effect_outcome_expectancy, 
                                         data = data_subset_key_vars, 
                                         se = "bootstrap", 
                                         bootstrap = 5000)

sink("output/indirect_effect_sem_outcome_expectancy.txt")
print(summary(indirect_effect_sem_outcome_expectancy, standardized = TRUE))
sink()

indirect_effect_self_efficacy <- "
        # path one
        intention ~ a * self_efficacy + outcome_expectancy
        
        # path two
        planning ~ b * intention + c * self_efficacy

        # path three
        communication ~ d * planning

        # prime path 
        communication ~ pp * self_efficacy

        # indirect and total effects
        abcd := a * b * c * d
        total := pp + abcd

"

indirect_effect_sem_self_efficacy <- sem(indirect_effect_self_efficacy, 
                                          data = data_subset_key_vars, 
                                          se = "bootstrap", 
                                          bootstrap = 5000)

sink("output/indirect_effect_sem_self_efficacy.txt")
print(summary(indirect_effect_sem_self_efficacy, standardized = TRUE))
sink()
