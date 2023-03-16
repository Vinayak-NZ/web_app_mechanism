## ----mixed-effects-model

# convert categorical variables to factors
data_long_module_marker$id <- as.factor(data_long_module_marker$id)

data_long_module_marker$continue_indicator <- as.factor(data_long_module_marker$continue_indicator)

m <- glmer(continue_indicator ~ OE + INT + CSE + PL + (1 | id), 
           data = data_long_module_marker, 
           family = binomial, 
           control = glmerControl(optimizer = "bobyqa"),
           nAGQ = 10)

summary(m)