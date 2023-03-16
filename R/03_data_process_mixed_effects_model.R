## ----create-max-t

data_subset$max_t <- ifelse(!is.na(data_subset$COMM_t4), 4, 
                                    ifelse(!is.na(data_subset$COMM_t3), 3, 
                                           ifelse(!is.na(data_subset$COMM_t2), 2, 
                                                  ifelse(!is.na(data_subset$COMM_t1), 1, NA))))

data_subset_module_marker <- data_subset[, c("id", "max_t")]

## ----create-long-dataset

data_subset_key_vars_long_prep <- data_subset[, c("id", 
                              "OE_t1", 
                              "OE_t2", 
                              "OE_t3", 
                              "OE_t4", 
                              "INT_t1", 
                              "INT_t2", 
                              "INT_t3", 
                              "INT_t4", 
                              "CSE_t1", 
                              "CSE_t2", 
                              "CSE_t3", 
                              "CSE_t4", 
                              "PL_t1", 
                              "PL_t2", 
                              "PL_t3", 
                              "PL_t4")]

setDT(data_subset_key_vars_long_prep)

data_subset_OE <- data_subset_key_vars_long_prep[, c("id", 
                                  "OE_t1", 
                                  "OE_t2", 
                                  "OE_t3", 
                                  "OE_t4")]

data_subset_OE_long <- melt(data_subset_OE, 
                            id.vars = c("id"), 
                            variable.name = "time",
                            value.name = "OE")

data_subset_OE_long$time <- ifelse(data_subset_OE_long$time == "OE_t1", 
                                   1, 
                                   ifelse(data_subset_OE_long$time == "OE_t2", 
                                   2, 
                                   ifelse(data_subset_OE_long$time == "OE_t3", 
                                   3, 4)))

data_subset_INT <- data_subset_key_vars_long_prep[, c("id", 
                                   "INT_t1", 
                                   "INT_t2", 
                                   "INT_t3", 
                                   "INT_t4")]

data_subset_INT_long <- melt(data_subset_INT, 
                             id.vars = c("id"), 
                             variable.name = "time",
                             value.name = "INT")

data_subset_INT_long$time <- ifelse(data_subset_INT_long$time == "INT_t1", 
                                    1, 
                                    ifelse(data_subset_INT_long$time == "INT_t2", 
                                    2, 
                                    ifelse(data_subset_INT_long$time == "INT_t3", 
                                    3, 4)))

data_subset_CSE <- data_subset_key_vars_long_prep[, c("id", 
                                   "CSE_t1", 
                                   "CSE_t2", 
                                   "CSE_t3", 
                                   "CSE_t4")]

data_subset_CSE_long <- melt(data_subset_CSE, 
                             id.vars = c("id"), 
                             variable.name = "time",
                             value.name = "CSE")

data_subset_CSE_long$time <- ifelse(data_subset_CSE_long$time == "CSE_t1", 
                                    1, 
                                    ifelse(data_subset_CSE_long$time == "CSE_t2", 
                                    2, 
                                    ifelse(data_subset_CSE_long$time == "CSE_t3", 
                                    3, 4)))

data_subset_PL <- data_subset_key_vars_long_prep[, c("id", 
                                  "PL_t1", 
                                  "PL_t2", 
                                  "PL_t3", 
                                  "PL_t4")]

data_subset_PL_long <- melt(data_subset_PL, 
                            id.vars = c("id"), 
                            variable.name = "time",
                            value.name = "PL")

data_subset_PL_long$time <- ifelse(data_subset_PL_long$time == "PL_t1", 
                                   1, 
                                   ifelse(data_subset_PL_long$time == "PL_t2", 
                                   2, 
                                   ifelse(data_subset_PL_long$time == "PL_t3", 
                                   3, 4)))

merge_one <- merge(data_subset_OE_long, data_subset_CSE_long, by = c("id", "time"))
merge_two <- merge(merge_one, data_subset_INT_long, by = c("id", "time"))
data_long <- merge(merge_two, data_subset_PL_long, by = c("id", "time"))

data_long_module_marker <- merge(data_long, data_subset_module_marker, by = "id")

data_long_module_marker <- data_long_module_marker[data_long_module_marker$time %in% c(1,2,3), ]

data_long_module_marker$continue_indicator <- 
  ifelse(data_long_module_marker$max_t > data_long_module_marker$time, 1, 0)
