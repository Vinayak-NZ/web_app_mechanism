## ----imputation

data_subset <- data_subset[, c("id", 
                               "randomisation", 
                               "age",
                               "education", 
                               "fam_composition",
                               "OE_t0", 
                               "OE_t1", 
                               "OE_t2", 
                               "OE_t3", 
                               "OE_t4", 
                               "CSE_t0", 
                               "CSE_t1", 
                               "CSE_t2", 
                               "CSE_t3", 
                               "CSE_t4", 
                               "INT_t0", 
                               "INT_t1", 
                               "INT_t2", 
                               "INT_t3", 
                               "INT_t4",
                               "PL_t0", 
                               "PL_t1", 
                               "PL_t2", 
                               "PL_t3", 
                               "PL_t4", 
                               "COMM_t0", 
                               "COMM_t1", 
                               "COMM_t2", 
                               "COMM_t3", 
                               "COMM_t4", 
                               "feasibility", 
                               "accessibility", 
                               "planning_evaluation")]


init <- mice(data_subset, maxit = 0)
meth <- init$method
predM <- as.matrix(init$predictorMatrix)

predM[, "id"] <- 0

meth[c("id", "randomisation", "age", "education", "fam_composition")] = ""

imputed <- mice(data_subset, 
                method = meth, 
                predictorMatrix = predM, 
                m = 10)

imputed <- complete(imputed)

## ----variable-definition

# imputed
imputed$intention_change_t2_t0 <- imputed$INT_t2 -
  imputed$INT_t0

imputed$efficacy_change_t4_t2 <- imputed$CSE_t4 - 
  imputed$CSE_t2

imputed$planning_change_t4_t2 <- imputed$PL_t4 - 
  imputed$PL_t2

# non-imputed
data_subset$intention_change_t2_t0 <- data_subset$INT_t2 -
  data_subset$INT_t0

data_subset$efficacy_change_t4_t2 <- data_subset$CSE_t4 - 
  data_subset$CSE_t2

data_subset$planning_change_t4_t2 <- data_subset$PL_t4 - 
  data_subset$PL_t2