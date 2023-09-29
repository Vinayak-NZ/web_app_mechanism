
control <- data_subset[data_subset$app_entry == "waitlist", ]

table(control$module_one)
table(control$module_two)
table(control$module_three)

intervention <- data_subset[data_subset$app_entry == "direct", ]

table(intervention$module_one)
table(intervention$module_two)
table(intervention$module_three)

clinic <- data_subset[data_subset$app_entry == "clinic", ]

table(clinic$module_one)
table(clinic$module_two)
table(clinic$module_three)
