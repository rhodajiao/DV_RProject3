plot1 <- ggplot(educationPop, aes(x=AREA_NAME,y=ENROLL_2009/POPULATION_2010))+geom_point()+theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))
plot1 <- plot1 + labs(x="Area Name", y="% of Population Enrolled in Public School")
print(plot1)

plot2 <- ggplot(medianIncomePlot, aes(x=MEDIAN_INCOME_2009)) + geom_histogram(binwidth=3000)
plot2 <- plot2+ labs(x="Median Household Income in 2009", y="Number of Counties")
print(plot2)

plot3 <- ggplot(countyPopEdu, aes(x=ENROLL_2009/POPULATION_2010, y=MEDIAN_INCOME_2009)) + geom_point()
plot3 <- plot3 + labs(x="% of Population Enrolled in Public School",y="Median Household income in 2009")
print(plot3)
