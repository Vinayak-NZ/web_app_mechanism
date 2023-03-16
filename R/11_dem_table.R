
data_subset_dem_vars <- data_subset[, c(
                               "age",
                               "education", 
                               "fam_composition")]

data_subset_dem_vars["education"][data_subset_dem_vars["education"] == 0 ] <- NA
data_subset_dem_vars["fam_composition"][data_subset_dem_vars["fam_composition"] == 0 ] <- NA

age_missing <- summary(data_subset_dem_vars$age)[[7]]
table_age_numbers <- table(data_subset_dem_vars$age)
table_age_prop <- prop.table(table_age_numbers) * 100

age_dem_info <- flattenDemTable("age", table_age_numbers, table_age_prop, age_missing)
write.csv(age_dem_info, "output/age_dem_info.csv")

education_missing <- summary(data_subset_dem_vars$education)[[7]]
table_education_numbers <- table(data_subset_dem_vars$education)
table_education_prop <- prop.table(table_education_numbers) * 100

education_dem_info <- flattenDemTable("education", table_education_numbers, table_education_prop, education_missing)
write.csv(education_dem_info, "output/education_dem_info.csv")

fam_composition_missing <- summary(data_subset_dem_vars$fam_composition)[[7]]
table_fam_composition_numbers <- table(data_subset_dem_vars$fam_composition)
table_fam_composition_prop <- prop.table(table_fam_composition_numbers) * 100

fam_composition_info <- flattenDemTable("fam_composition", table_fam_composition_numbers, table_fam_composition_prop, fam_composition_missing)
write.csv(fam_composition_info, "output/fam_composition_info.csv")

