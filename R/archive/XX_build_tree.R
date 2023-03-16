
data_long_module_marker$id <- as.factor(data_long_module_marker$id)

data_long_module_marker$max_t <- as.factor(data_long_module_marker$max_t)

tree <- rpart(max_t ~ OE + INT + CSE + PL, 
              data = data_long_module_marker, 
              control=rpart.control(cp=.0001))

printcp(tree)

rpart.plot(tree)

plotcp(tree)

summary(tree)

plot(tree, uniform = TRUE)
text(tree, use.n=TRUE, all=TRUE, cex=.8)
