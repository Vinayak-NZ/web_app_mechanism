data_input$id <- seq_along(data_input[,1])

data_subset <- data_input[, c("id", 
                              "OE", 
                              "CSE", 
                              "INT", 
                              "PL", 
                              "OE_t1_likert_t", 
                              "CSE_t1_t",
                              "PL_t1_t", 
                              "INT_t1_likert_t", 
                              "COMM_mean_t0", 
                              "C_m_t1")]

setDT(data_subset)

data_subset_OE <- data_subset[, c("id", 
                                  "OE", 
                                  "OE_t1_likert_t")]

data_subset_OE_long <- melt(data_subset_OE, 
                            id.vars = c("id"), 
                            variable.name = "time",
                            value.name = "OE")

data_subset_OE_long$time <- ifelse(data_subset_OE_long$time == "OE", 
                                   "baseline", 
                                   "t1")

data_subset_CSE <- data_subset[, c("id", 
                                  "CSE", 
                                  "CSE_t1_t")]

data_subset_CSE_long <- melt(data_subset_CSE, 
                            id.vars = c("id"), 
                            variable.name = "time",
                            value.name = "CSE")

data_subset_CSE_long$time <- ifelse(data_subset_CSE_long$time == "CSE", 
                                   "baseline", 
                                   "t1")

data_subset_INT <- data_subset[, c("id", 
                                   "INT", 
                                   "INT_t1_likert_t")]

data_subset_INT_long <- melt(data_subset_INT, 
                             id.vars = c("id"), 
                             variable.name = "time",
                             value.name = "INT")

data_subset_INT_long$time <- ifelse(data_subset_INT_long$time == "INT", 
                                    "baseline", 
                                    "t1")

data_subset_PL <- data_subset[, c("id", 
                                   "PL", 
                                   "PL_t1_t")]

data_subset_PL_long <- melt(data_subset_PL, 
                             id.vars = c("id"), 
                             variable.name = "time",
                             value.name = "PL")

data_subset_PL_long$time <- ifelse(data_subset_PL_long$time == "PL", 
                                    "baseline", 
                                    "t1")

data_subset_COMM <- data_subset[, c("id", 
                                  "COMM_mean_t0", 
                                  "C_m_t1")]

data_subset_COMM_long <- melt(data_subset_COMM, 
                            id.vars = c("id"), 
                            variable.name = "time",
                            value.name = "COMM")

data_subset_COMM_long$time <- ifelse(data_subset_COMM_long$time == "COMM_mean_t0", 
                                   "baseline", 
                                   "t1")


merge_one <- merge(data_subset_OE_long, data_subset_CSE_long, by = c("id", "time"))
merge_two <- merge(merge_one, data_subset_INT_long, by = c("id", "time"))
merge_three <- merge(merge_two, data_subset_PL_long, by = c("id", "time"))
data_long <- merge(merge_three, data_subset_COMM_long, by = c("id", "time"))
