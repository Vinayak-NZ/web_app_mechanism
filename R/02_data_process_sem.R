## ----variable-subset

data_input_comp$id <- seq_along(data_input_comp[,1])

data_input_comp$randomisation_modified <- ifelse(is.na(data_input_comp$KG_IG_DW) &
  data_input_comp$Standort %in% c(0, 1), 1, data_input_comp$KG_IG_DW)

data_input_comp <- data_input_comp[data_input_comp$randomisation_modified %in% c(0, 1), ] 

data_input_comp$recruitment_strategy <- ifelse(data_input_comp$Standort %in% c(0,1), "clinic", 
                                               "germany-wide")

data_input_comp$app_entry <- ifelse(data_input_comp$recruitment_strategy == "clinic", "clinic", 
                                               ifelse(data_input_comp$KG_IG_DW == 0, "waitlist", "direct"))

data_input_comp$COMM <- rowMeans(data_input_comp[, c("COMM1" ,
                                                "COMM2", 
                                                "COMM3", 
                                                "COMM4", 
                                                "COMM5" ,
                                                "COMM6", 
                                                "COMM7")], 
                             na.rm = TRUE)

data_input_comp$C_m_t4 <- rowMeans(data_input_comp[, c("COMM1_t4_likert_t" ,
                                                     "COMM2_t4_likert_t", 
                                                     "COMM3_t4_likert_t", 
                                                     "COMM4_t4_likert_t", 
                                                     "COMM5_t4_likert_t" ,
                                                     "COMM6_t4_likert_t", 
                                                     "COMM7_t4_likert_t")], 
                                 na.rm = TRUE)

data_subset <- data_input_comp[, c("id", 
                                   "Alter", 
                                   "Ausbildung", 
                                   "Familie",
                              "randomisation_modified", 
                              "recruitment_strategy", 
                              "app_entry",
                              "OE", 
                              "OE_t1_likert_t", 
                              "OE_t2_likert_t", 
                              "OE_t3_likert_t", 
                              "OE_t4_likert_t", 
                              "CSE", 
                              "CSE_t1_t",
                              "CSE_t2_t", 
                              "CSE_t3_t", 
                              "CSE_t4_t",
                              "INT", 
                              "INT_t1_likert_t",
                              "INT_t1_A_likert_t", 
                              "INT_t1_B_likert_t",
                              "INT_t1_C_likert_t",
                              "PL", 
                              "PL_t1_t", 
                              "PL_t2_t",
                              "PL_t3_t", 
                              "PL_t4_t",
                              "COMM", 
                              "C_m_t1", 
                              "C_m_t2", 
                              "C_m_t3", 
                              "C_m_t4", 
                              "L10Nuterfreundlichkeit_t1_a1", 
                              "L10Nutzen_t1_a1", 
                              "L9Zufrieden_t1_a1")]

## ----variable-edit

data_subset$Alter <- ifelse(data_subset$Alter == 1, round(runif(1, min=18, max=19), 0), 
                            ifelse(data_subset$Alter == 2, round(runif(1, min=20, max=29), 0), 
                                   ifelse(data_subset$Alter == 3, round(runif(1, min=30, max=39), 0), 
                                          ifelse(data_subset$Alter == 4, round(runif(1, min=40, max=49), 0), 
                                                 ifelse(data_subset$Alter == 5, round(runif(1, min=50, max=59), 0), 
                                                        ifelse(data_subset$Alter == 6, round(runif(1, min=60, max=69), 0), 
                                                               ifelse(data_subset$Alter == 7, round(runif(1, min=70, max=79), 0), 
                                                                      data_subset$Alter)))))))


data_subset$Alter <- ifelse(data_subset$Alter < 18, 
                            NA, 
                            data_subset$Alter)

data_subset$L10Nuterfreundlichkeit_t1_a1 <- ifelse(data_subset$L10Nuterfreundlichkeit_t1_a1 < 0, 
                            NA, 
                            data_subset$L10Nuterfreundlichkeit_t1_a1)

data_subset$L10Nuterfreundlichkeit_t1_a1 <- rescale(data_subset$L10Nuterfreundlichkeit_t1_a1, 
                                                    to = c(1, 6))

data_subset$L10Nutzen_t1_a1 <- ifelse(data_subset$L10Nutzen_t1_a1 < 0, 
                                        NA, 
                                        data_subset$L10Nutzen_t1_a1)

data_subset$L10Nutzen_t1_a1 <- rescale(data_subset$L10Nutzen_t1_a1, 
                                                    to = c(1, 6))

data_subset$L9Zufrieden_t1_a1 <- ifelse(data_subset$L9Zufrieden_t1_a1 < 0, 
                            NA, 
                            data_subset$L9Zufrieden_t1_a1)

data_subset$L9Zufrieden_t1_a1 <- rescale(data_subset$L9Zufrieden_t1_a1, 
                                       to = c(1, 6))

## ----variable-rename
names(data_subset)[names(data_subset) == 'Familie'] <- 'fam_composition'
names(data_subset)[names(data_subset) == 'Ausbildung'] <- 'education'
names(data_subset)[names(data_subset) == 'Alter'] <- 'age'
names(data_subset)[names(data_subset) == 'OE'] <- 'OE_t0'
names(data_subset)[names(data_subset) == 'OE_t1_likert_t'] <- 'OE_t1'
names(data_subset)[names(data_subset) == 'OE_t2_likert_t'] <- 'OE_t2'
names(data_subset)[names(data_subset) == 'OE_t3_likert_t'] <- 'OE_t3'
names(data_subset)[names(data_subset) == 'OE_t4_likert_t'] <- 'OE_t4'
names(data_subset)[names(data_subset) == 'CSE'] <- 'CSE_t0'
names(data_subset)[names(data_subset) == 'CSE_t1_t'] <- 'CSE_t1'
names(data_subset)[names(data_subset) == 'CSE_t2_t'] <- 'CSE_t2'
names(data_subset)[names(data_subset) == 'CSE_t3_t'] <- 'CSE_t3'
names(data_subset)[names(data_subset) == 'CSE_t4_t'] <- 'CSE_t4'
names(data_subset)[names(data_subset) == 'INT'] <- 'INT_t0'
names(data_subset)[names(data_subset) == 'INT_t1_likert_t'] <- 'INT_t1'
names(data_subset)[names(data_subset) == 'INT_t1_A_likert_t'] <- 'INT_t2'
names(data_subset)[names(data_subset) == 'INT_t1_B_likert_t'] <- 'INT_t3'
names(data_subset)[names(data_subset) == 'INT_t1_C_likert_t'] <- 'INT_t4'
names(data_subset)[names(data_subset) == 'PL'] <- 'PL_t0'
names(data_subset)[names(data_subset) == 'PL_t1_t'] <- 'PL_t1'
names(data_subset)[names(data_subset) == 'PL_t2_t'] <- 'PL_t2'
names(data_subset)[names(data_subset) == 'PL_t3_t'] <- 'PL_t3'
names(data_subset)[names(data_subset) == 'PL_t4_t'] <- 'PL_t4'
names(data_subset)[names(data_subset) == 'COMM'] <- 'COMM_t0'
names(data_subset)[names(data_subset) == 'C_m_t1'] <- 'COMM_t1'
names(data_subset)[names(data_subset) == 'C_m_t2'] <- 'COMM_t2'
names(data_subset)[names(data_subset) == 'C_m_t3'] <- 'COMM_t3'
names(data_subset)[names(data_subset) == 'C_m_t4'] <- 'COMM_t4'
names(data_subset)[names(data_subset) == 'L10Nuterfreundlichkeit_t1_a1'] <- 'feasibility'
names(data_subset)[names(data_subset) == 'L10Nutzen_t1_a1'] <- 'accessibility'
names(data_subset)[names(data_subset) == 'L9Zufrieden_t1_a1'] <- 'planning_evaluation'



