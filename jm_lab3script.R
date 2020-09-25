
library(tidyverse)
dat <- readxl::read_xls('maxwellGSS.xls')


dat <- rename(dat, party  = 'Political party affiliation')
dat <- rename(dat, edu = 'Highest year of school completed')
dat <- rename(dat, married = 'Marital status')
dat <- rename(dat, age = 'Age of respondent')
dat <- rename(dat, income = 'Total family income')
dat <- rename(dat, happiness = 'General happiness')

view(dat)
str(dat)


summary(dat$party)
dat$party <- factor(dat$party)
levels(dat$party)

summary(dat$edu)
str(dat$edu)
dat$edu <- factor(dat$edu)



dat1 <- dat %>% 
  group_by(party) %>%
  mutate(edu_avg = mean(as.numeric(edu))) %>% 
  select(party,edu_avg) %>% 
  distinct(party, .keep_all = TRUE ) %>% 
  arrange(desc(edu_avg))

dat1

View(dat1)


str(dat$edu)



view(dat1)

dat1 <- dat %>% 
  group_by(party) %>%
  mutate(edu_avg = mean(as.numeric(edu)))


View(dat1)


table1 <- dat1 %>% select(party,edu_avg) %>% distinct(party, .keep_all = TRUE ) %>% arrange(desc(edu_avg))

a <- dat1 %>% arrange(desc(edu_avg))

View(a)

table1


dat1 %>% summarize(n=n())
levels(dat1$party)
str(dat1$party)
a
