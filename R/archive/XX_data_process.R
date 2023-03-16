data_subset$expectancy_baseline <- ifelse(is.na(data_subset$expectancy_baseline),
                                          mean(data_subset$expectancy_baseline, na.rm = TRUE),
                                          data_subset$expectancy_baseline)

data_subset$intention_change <- ifelse(is.na(data_subset$intention_change),
                                       mean(data_subset$intention_change, na.rm = TRUE),
                                       data_subset$intention_change)

data_subset$efficacy_change <- ifelse(is.na(data_subset$efficacy_change),
                                      mean(data_subset$efficacy_change, na.rm = TRUE),
                                      data_subset$efficacy_change)

data_subset$planning_change <- ifelse(is.na(data_subset$planning_change),
                                      mean(data_subset$planning_change, na.rm = TRUE),
                                      data_subset$planning_change)

data_subset$communication_outcome <- ifelse(is.na(data_subset$communication_outcome),
                                            mean(data_subset$communication_outcome, na.rm = TRUE),
                                            data_subset$communication_outcome)

data_subset$feasibility <- ifelse(is.na(data_subset$feasibility),
                                            mean(data_subset$feasibility, na.rm = TRUE),
                                            data_subset$feasibility)

data_subset$accessibility <- ifelse(is.na(data_subset$accessibility),
                                    mean(data_subset$accessibility, na.rm = TRUE),
                                    data_subset$accessibility)
