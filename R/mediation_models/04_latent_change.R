## ----latent-change-models

cse_change_imputed <- fit_uni_lcsm(data = imputed, 
                                   var =  c("CSE_t0", "CSE_t1", "CSE_t2", "CSE_t3", "CSE_t4"), 
                                   model = list(alpha_constant = TRUE, 
                                                beta = FALSE, 
                                                phi = TRUE))

cse_change_imputed_param <- extract_param(cse_change_imputed, printp = TRUE)
kable(cse_change_imputed_param, digits= 3)

planning_change_imputed <- fit_uni_lcsm(data = imputed, 
                                   var =  c("PL_t0", "PL_t1", "PL_t2", "PL_t3", "PL_t4"), 
                                   model = list(alpha_constant = TRUE, 
                                                beta = FALSE, 
                                                phi = TRUE))

planning_change_imputed_param <- extract_param(planning_change_imputed, printp = TRUE)
kable(planning_change_imputed_param, digits= 3)
