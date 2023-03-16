## ----change-patterns

plot_CSE_imputed <- plot_trajectories(data = imputed,
                            id_var = "id", 
                            var_list = c("CSE_t0", "CSE_t1", "CSE_t2", "CSE_t3", "CSE_t4"),
                            xlab = "Time", 
                            ylab = "Self-efficacy",
                            connect_missing = FALSE, 
                            random_sample_frac = 0.3)

plot_CSE_imputed

ggsave("output/self_efficacy_trajectory_imputed.png")

plot_CSE <- plot_trajectories(data = data_subset,
                                      id_var = "id", 
                                      var_list = c("CSE_t0", "CSE_t1", "CSE_t2", "CSE_t3", "CSE_t4"),
                                      xlab = "Time", 
                                      ylab = "Self-efficacy",
                                      connect_missing = FALSE, 
                                      random_sample_frac = 0.3)

plot_CSE

ggsave("output/self_efficacy_trajectory.png")

plot_planning_imputed <- plot_trajectories(data = imputed,
                                      id_var = "id", 
                                      var_list = c("PL_t0", "PL_t1", "PL_t2", "PL_t3", "PL_t4"),
                                      xlab = "Time", 
                                      ylab = "Planning",
                                      connect_missing = FALSE, 
                                      random_sample_frac = 0.3)

plot_planning_imputed

ggsave("output/planning_trajectory_imputed.png")

plot_planning <- plot_trajectories(data = data_subset,
                              id_var = "id", 
                              var_list = c("PL_t0", "PL_t1", "PL_t2", "PL_t3", "PL_t4"),
                              xlab = "Time", 
                              ylab = "Planning",
                              connect_missing = FALSE, 
                              random_sample_frac = 0.3)

plot_planning

ggsave("output/planning_trajectory.png")

## ----change-distributions

ggplot(imputed, aes(x=efficacy_change_t4_t2)) + 
  geom_histogram(binwidth=1, fill = "#2F2E41") + 
  labs(title = "Change in self efficacy", 
       subtitle = "Distribution of change scores between t4 and t2",
       caption = "Data source: TeamBaby") +
  xlab("Change scores") + 
  ylab("Count") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543", face = "bold"),
        plot.caption = element_text(color = "#454543", face = "italic")
  )

ggsave("output/self_efficacy_change_distributions_imputed.png")

ggplot(data_subset, aes(x=efficacy_change_t4_t2)) + 
  geom_histogram(binwidth=1, fill = "#2F2E41") + 
  labs(title = "Change in self efficacy", 
       subtitle = "Distribution of change scores between t4 and t2",
       caption = "Data source: TeamBaby") +
  xlab("Change scores") + 
  ylab("Count") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543", face = "bold"),
        plot.caption = element_text(color = "#454543", face = "italic")
  )

ggsave("output/self_efficacy_change_distributions.png")

ggplot(imputed, aes(x=planning_change_t4_t2)) + 
  geom_histogram(binwidth=1, fill = "#2F2E41") + 
  labs(title = "Change in planning", 
       subtitle = "Distribution of change scores between t4 and t2",
       caption = "Data source: TeamBaby") +
  xlab("Change scores") + 
  ylab("Count") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543", face = "bold"),
        plot.caption = element_text(color = "#454543", face = "italic")
  )

ggsave("output/planning_change_distributions_imputed.png")

ggplot(data_subset, aes(x=planning_change_t4_t2)) + 
  geom_histogram(binwidth=1, fill = "#2F2E41") + 
  labs(title = "Change in planning", 
       subtitle = "Distribution of change scores between t4 and t2",
       caption = "Data source: TeamBaby") +
  xlab("Change scores") + 
  ylab("Count") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543", face = "bold"),
        plot.caption = element_text(color = "#454543", face = "italic")
  )

ggsave("output/planning_change_distributions.png")
