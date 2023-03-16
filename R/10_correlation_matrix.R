data_subset_corr_vars <- data_subset[, c("OE_t1", 
                                         "OE_t2", 
                                         "OE_t3", 
                                         "OE_t4", 
                                         "CSE_t1", 
                                         "CSE_t2", 
                                         "CSE_t3", 
                                         "CSE_t4", 
                                         "INT_t1", 
                                         "INT_t2", 
                                         "INT_t3", 
                                         "INT_t4",
                                         "PL_t1", 
                                         "PL_t2", 
                                         "PL_t3", 
                                         "PL_t4", 
                                         "COMM_t1", 
                                         "COMM_t2", 
                                         "COMM_t3", 
                                         "COMM_t4")]

corr_matrix <- rcorr(as.matrix(data_subset_corr_vars))

corr_matrix_output <- flattenCorrMatrix(corr_matrix$r, corr_matrix$P, corr_matrix$n)

write.csv(corr_matrix_output, "output/corr_matrix_output.csv")
