

# outcome expetancy (t0) -> intention (t0) -> change in coping and action planning -> 
#   communication (t4)/ change in communication

data_input$id <- seq_along(data_input[,1])

plot_x <- plot_trajectories(data = data_long,
                            id_var = "id", 
                            var_list = "OE",
                            xlab = "time", 
                            ylab = "X Score",
                            connect_missing = FALSE, 
                            random_sample_frac = 0.3)

plot_x

model_fit <- fit_uni_lcsm(data = data_long, 
             var = c("OE", "CSE", "INT", "PL", "COMM"), 
             model = list(alpha_constant = TRUE, 
                          beta = FALSE, 
                          phi = TRUE))

model_fit_syntax <- fit_uni_lcsm(data = data_long, 
                          var = c("OE", "CSE", "INT", "PL", "COMM"), 
                          model = list(alpha_constant = TRUE, 
                                       beta = FALSE, 
                                       phi = TRUE), 
                          return_lavaan_syntax = TRUE)

param_model_fit <- extract_param(model_fit, printp = TRUE)             

kable(param_model_fit, digits = 3)

plot_lcsm(lavaan_object = model_fit, 
          lavaan_syntax = model_fit_syntax, 
          edge.label.cex = .9, 
          lcsm_colours = TRUE,
          lcsm = "univariate")
