## ----manova
data_subset_key_vars <- data_subset[, 
                                    c("id", 
                                      "drop_out",
                                      "OE_t1", 
                                      "INT_t1",
                                      "CSE_t1", 
                                      "PL_t1")]

data_subset_key_vars <- data_subset_key_vars[complete.cases(data_subset_key_vars),]

data_subset_key_vars$id <- as.factor(data_subset_key_vars$id)

data_subset_key_vars$drop_out <- as.factor(data_subset_key_vars$drop_out)

res.man <- manova(cbind(OE_t1, INT_t1, CSE_t1, PL_t1) ~ drop_out, 
                  data = data_subset_key_vars)

summary.aov(res.man)
