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

# model-adhoc-1
model_adhoc_1 <- lm(communication ~ app_progression + 
                intention + 
                self_efficacy + 
                planning, 
              data = data_subset_key_vars)

summary(model_adhoc_1)

sink("output/model_adhoc_1.txt")
print(summary(model_adhoc_1))
sink()

# model-adhoc-2
model_adhoc_2 <- lm(communication ~ app_progression + 
                      intention + 
                      planning, 
                    data = data_subset_key_vars)

summary(model_adhoc_2)

sink("output/model_adhoc_1.txt")
print(summary(model_adhoc_2))
sink()
