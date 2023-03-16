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

# model-0
model_0 <- lm(communication ~ 1, 
              data = data_subset_key_vars)

summary(model_0)


# model-1
model_1 <- lm(communication ~ outcome_expectancy, 
              data = data_subset_key_vars)

summary(model_1)

# sink("output/model_OE.txt")
# print(summary(model_1))
# sink()

# sink("output/model_1_confint.txt")
# print(confint(model_1))
# sink()

sink("output/model_OE_anova.txt")
print(anova(model_0, model_1))
sink()


# model-2
model_2 <- lm(communication ~ outcome_expectancy +
                intention, 
              data = data_subset_key_vars)

summary(model_2)

# sink("output/model_INT.txt")
# print(summary(model_2))
# sink()

# sink("output/model_2_confint.txt")
# print(confint(model_2))
# sink()

sink("output/model_INT_anova.txt")
print(anova(model_1, model_2))
sink()

# model-3
model_3 <- lm(communication ~ outcome_expectancy + 
                intention +
                self_efficacy, 
              data = data_subset_key_vars)

summary(model_3)

# sink("output/model_CSE.txt")
# print(summary(model_3))
# sink()

# sink("output/model_3_confint.txt")
# print(confint(model_3))
# sink()

sink("output/model_CSE_anova.txt")
print(anova(model_2, model_3))
sink()

# model-5
model_4 <- lm(communication ~ outcome_expectancy +
                intention + 
                self_efficacy + 
                planning, 
              data = data_subset_key_vars)

summary(model_4)

sink("output/model_AP.txt")
print(summary(model_4))
sink()

sink("output/model_AP_confint.txt")
print(confint(model_4))
sink()

sink("output/model_AP_anova.txt")
print(anova(model_3, model_4))
sink()

# model-5
model_5 <- lm(communication ~  
                planning, 
              data = data_subset_key_vars)

summary(model_5)

sink("output/model_5.txt")
print(summary(model_5))
sink()
