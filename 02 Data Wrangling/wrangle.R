incomedf <- incomedf %>% arrange(STCOU)
populationdf <- populationdf %>% arrange(STCOU)
educationdf <- educationdf %>% arrange(STCOU)

# Gets the state averages for all data and then list the states by highest household income in 2009
aggregateCountyData <- inner_join(educationdf,incomedf, populationdf, by = "AREA_NAME") %>% filter(STCOU.x%%1000==0 & STCOU.x>0) %>% arrange(MEDIAN_INCOME_2009) 

# Gets the percent of each state's population enrolled in public school in 2009
educationPop <- left_join(educationdf,populationdf,by = "AREA_NAME") %>% filter(STCOU.x%%1000==0 & STCOU.x>0) %>% mutate(ENROLL_2009/POPULATION_2010)

# Gets median income distribution across all counties in Texas
medianIncomePlot <- incomedf %>% select(STCOU,MEDIAN_INCOME_2009) %>% filter(STCOU>48000 & STCOU<49000) %>% arrange(MEDIAN_INCOME_2009)

# Gets relation between average income and percent of population enrolled in public school
countyEduInc <- full_join(educationdf,incomedf) %>% filter(STCOU%%1000!=0) 
countyPopEdu <- full_join(populationdf,countyEduInc) %>% filter(STCOU%%1000!=0) %>% mutate(ENROLL_2009/POPULATION_2010)

