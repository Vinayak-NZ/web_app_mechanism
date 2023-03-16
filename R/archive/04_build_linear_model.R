## ----apply-hapa-model

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

# complete-model
complete.lm <- lm(communication ~ app_progression + 
                    planning + 
                    self_efficacy + 
                    intention + 
                    outcome_expectancy, 
                  data = data_subset_key_vars)

summary(complete.lm)

sink("output/linear_model_complete.txt")
print(summary(complete.lm))
sink()

# subset-model-1
subset_model_1.lm <- lm(communication ~ app_progression + 
                          planning + 
                          self_efficacy + 
                          intention, 
                        data = data_subset_key_vars)

summary(subset_model_1.lm)

sink("output/linear_model_subset_1.txt")
print(summary(subset_model_1.lm))
sink()

# subset-model-2
subset_model_2.lm <- lm(communication ~ app_progression + 
                          planning + 
                          intention, 
                        data = data_subset_key_vars)

summary(subset_model_2.lm)

sink("output/linear_model_subset_2.txt")
print(summary(subset_model_2.lm))
sink()
