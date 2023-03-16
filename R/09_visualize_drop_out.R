## ----derive-predictors

data_subset_key_vars <- data_subset[, 
                                    c("id", 
                                      "early_drop_out",
                                      "app_progression",
                                      "OE_t1", 
                                      "INT_t1",
                                      "CSE_t1", 
                                      "PL_t1")]

data_subset_key_vars <- data_subset_key_vars[complete.cases(data_subset_key_vars),]

data_subset_key_vars$id <- as.factor(data_subset_key_vars$id)

setDT(data_subset_key_vars)

#drop-out

data_subset_key_vars <- data_subset[, 
                                    c("id", 
                                      "early_drop_out",
                                      "OE_t1", 
                                      "INT_t1",
                                      "CSE_t1", 
                                      "PL_t1")]

setDT(data_subset_key_vars)

data_subset_long_drop_out <- melt(data_subset_key_vars, 
                                     id.vars = c("id", "early_drop_out"), 
                                     variable.name = "HAPA_construct",
                                     value.name = "value")

data_subset_long_drop_out$early_drop_out <- 
  as.factor(data_subset_long_drop_out$early_drop_out)

ggplot(data = data_subset_long_drop_out, 
       aes(x = HAPA_construct, 
           y = value, 
           fill = early_drop_out)) + 
  geom_boxplot() +   
  labs(title = paste0("Behaviour change constructs by drop out"), 
       subtitle = "Box plots of HAPA constructs by drop out",
       caption = "Data source: TeamBaby", 
       fill = "Early drop out") +
  xlab("Health Action Process Approach Constructs") + 
  ylab("Scores") + 
  scale_fill_discrete(labels = c("No", "Yes")) +
  scale_x_discrete(labels=c("OE_t1" = "Outcome Expectancy", 
                            "INT_t1" = "Intention", 
                            "CSE_t1" = "Self-efficay", 
                            "PL_t1" = "Planning")) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543"),
        plot.caption = element_text(color = "#454543", face = "italic")
  )

ggsave("output/hapa_drop_out.png")

# app-progression
data_subset_key_vars <- data_subset[, 
                                    c("id", 
                                      "app_progression",
                                      "OE_t1", 
                                      "INT_t1",
                                      "CSE_t1", 
                                      "PL_t1")]
setDT(data_subset_key_vars)

data_subset_long_progression <- melt(data_subset_key_vars, 
                            id.vars = c("id", "app_progression"), 
                            variable.name = "HAPA_construct",
                            value.name = "value")

data_subset_long_progression$app_progression <- 
  as.factor(data_subset_long_progression$app_progression)

ggplot(data = data_subset_long_progression, 
       aes(x = HAPA_construct, 
           y = value, 
           fill = app_progression)) + 
  geom_boxplot() +   
  labs(title = paste0("Behaviour change constructs by drop out"), 
                        subtitle = "Box plots of HAPA constructs by drop out",
                        caption = "Data source: TeamBaby", 
       fill = "Time of drop out") +
  xlab("Health Action Process Approach Constructs") + 
  ylab("Scores") + 
  scale_fill_discrete(labels = c("Before t2", "At t2", "At t3", "Completed web-app")) +
  scale_x_discrete(labels=c("OE_t1" = "Outcome Expectancy", 
                            "INT_t1" = "Intention", 
                            "CSE_t1" = "Self-efficay", 
                            "PL_t1" = "Planning")) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543"),
        plot.caption = element_text(color = "#454543", face = "italic")
  )

ggsave("output/hapa_progression.png")
