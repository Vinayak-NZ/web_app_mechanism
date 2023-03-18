## ----apply-hapa-dropout-model

data_subset_key_vars <- data_subset[, 
                                    c("id", 
                                      "randomisation_modified",
                                      "app_entry", 
                                      "recruitment_strategy",
                                      "early_drop_out",
                                      "OE_t1", 
                                      "INT_t1",
                                      "CSE_t1", 
                                      "PL_t1", 
                                      "age", 
                                      "education", 
                                      "fam_composition")]

data_subset_key_vars <- data_subset_key_vars[complete.cases(data_subset_key_vars),]

data_subset_key_vars$id <- as.factor(data_subset_key_vars$id)

data_subset_key_vars$early_drop_out <- factor(data_subset_key_vars$early_drop_out, 
                                           levels = c(0,1), 
                                           labels = c("No early drop out", "Early drop out"))

data_subset_key_vars$randomisation_modified <- as.factor(data_subset_key_vars$randomisation_modified)

data_subset_key_vars$app_entry <- as.factor(data_subset_key_vars$app_entry)

data_subset_key_vars$recruitment_strategy <- as.factor(data_subset_key_vars$recruitment_strategy)

# model-early-drop-out
model_1_drop_out_early <- glm(early_drop_out ~ OE_t1 + INT_t1 + CSE_t1 + PL_t1 + app_entry + age + education + fam_composition,
                        family = binomial(link='logit'),
              data = data_subset_key_vars)

summary(model_1_drop_out_early)

sink("output/model_1_drop_out_early.txt")
print(summary(model_1_drop_out_early))
sink()

sink("output/model_1_drop_out_early_confint.txt")
print(confint(model_1_drop_out_early))
sink()

# model-late-drop-out
data_subset_key_vars <- data_subset[, 
                                    c("id", 
                                      "late_drop_out",
                                      "OE_t1", 
                                      "INT_t1",
                                      "CSE_t1", 
                                      "PL_t1")]

data_subset_key_vars <- data_subset_key_vars[complete.cases(data_subset_key_vars),]

data_subset_key_vars$id <- as.factor(data_subset_key_vars$id)

data_subset_key_vars$late_drop_out <- factor(data_subset_key_vars$late_drop_out, 
                                             levels = c(0,1), 
                                             labels = c("No drop out", "Late drop out"))

model_1_drop_out_late <- glm(late_drop_out ~ OE_t1 + INT_t1 + CSE_t1 + PL_t1,
                        family = binomial(link='logit'),
                        data = data_subset_key_vars)

summary(model_1_drop_out_late)

sink("output/model_1_drop_out_late.txt")
print(summary(model_1_drop_out_late))
sink()

