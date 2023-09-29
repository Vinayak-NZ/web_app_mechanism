## ----derive-predictors

data_subset$app_progression <- ifelse(!is.na(data_subset$COMM_t4), 4, 
                                      ifelse(!is.na(data_subset$COMM_t3), 3, 
                                             ifelse(!is.na(data_subset$COMM_t2), 2, 1)))

data_subset$module_three <- ifelse(!is.na(data_subset$COMM_t4) | 
                                   !is.na(data_subset$OE_t4) | 
                                   !is.na(data_subset$CSE_t4) | 
                                   !is.na(data_subset$INT_t4) | 
                                   !is.na(data_subset$PL_t4), 1, 0)

data_subset$module_two <- ifelse(!is.na(data_subset$COMM_t3) | 
                                   !is.na(data_subset$OE_t3) | 
                                   !is.na(data_subset$CSE_t3) | 
                                   !is.na(data_subset$INT_t3) | 
                                   !is.na(data_subset$PL_t3), 1, 0)

data_subset$module_one <- ifelse(!is.na(data_subset$COMM_t2) | 
                                   !is.na(data_subset$OE_t2) | 
                                   !is.na(data_subset$CSE_t2) | 
                                   !is.na(data_subset$INT_t2) | 
                                   !is.na(data_subset$PL_t2), 1, 0)

data_subset$early_drop_out <- ifelse(!is.na(data_subset$COMM_t4), 0, 
                                      ifelse(!is.na(data_subset$COMM_t3), 0, 1))

data_subset$late_drop_out <- ifelse(!is.na(data_subset$COMM_t4), 0, 
                                     ifelse(is.na(data_subset$COMM_t3), 1, 
                                            ifelse(is.na(data_subset$COMM_t2), 1, 
                                                   ifelse(is.na(data_subset$COMM_t1), 1, NA))))

data_subset$communication <- ifelse(!is.na(data_subset$COMM_t4), data_subset$COMM_t4, 
                                      ifelse(!is.na(data_subset$COMM_t3), data_subset$COMM_t3, 
                                             ifelse(!is.na(data_subset$COMM_t2), data_subset$COMM_t2, 
                                                    ifelse(!is.na(data_subset$COMM_t1), data_subset$COMM_t1, NA))))

data_subset$planning <- ifelse(!is.na(data_subset$COMM_t4), data_subset$PL_t3, 
                                    ifelse(!is.na(data_subset$COMM_t3), data_subset$PL_t2, 
                                           ifelse(!is.na(data_subset$COMM_t2), data_subset$PL_t1, NA)))

data_subset$self_efficacy <- ifelse(!is.na(data_subset$COMM_t4), data_subset$CSE_t3, 
                               ifelse(!is.na(data_subset$COMM_t3), data_subset$CSE_t2, 
                                      ifelse(!is.na(data_subset$COMM_t2), data_subset$CSE_t1, NA)))

data_subset$outcome_expectancy <- ifelse(!is.na(data_subset$OE_t4), data_subset$OE_t3, 
                                    ifelse(!is.na(data_subset$OE_t3), data_subset$OE_t2, 
                                           ifelse(!is.na(data_subset$OE_t2), data_subset$OE_t1, NA)))


data_subset$intention <- ifelse(!is.na(data_subset$INT_t4), data_subset$INT_t3, 
                                         ifelse(!is.na(data_subset$INT_t3), data_subset$INT_t2, 
                                                ifelse(!is.na(data_subset$INT_t2), data_subset$INT_t1, NA)))

#data_subset$outcome_expectancy <- data_subset$OE_t1

#data_subset$intention <- data_subset$INT_t1

data_subset$user_friendly_rating <- data_subset$accessibility



