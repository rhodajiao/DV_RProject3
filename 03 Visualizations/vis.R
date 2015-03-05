print(ggplot(educationPop, aes(x=AREA_NAME,y=ENROLL_2009/POPULATION_2010))+geom_point()+theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5)))
print(ggplot(medianIncomePlot, aes(x=MEDIAN_INCOME_2009)) + geom_histogram(binwidth=3000))
print(ggplot(countyPopEdu, aes(x=ENROLL_2009/POPULATION_2010, y=MEDIAN_INCOME_2009)) + geom_point())
