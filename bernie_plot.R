install.packages('Ecdat')
remotes::install_github("R-CoderDotCom/ggbernie@main")

data(incomeInequality)
library('Ecdat')
library('tidyverse')
library('ggbernie')
library('gganimate')


dat <- 
  incomeInequality %>%
  select(Year, P99, median) %>% 
  rename(income_median = median,
         income_99percent = P99) %>% 
  pivot_longer(cols = starts_with("income"),
               names_to = "income",
               names_prefix = "income_")

  
  ggplot(dat, aes(x=Year, y=value, group=income, color=income)) +
  geom_line(size = 2) +
  viridis::scale_color_viridis(discrete = TRUE) +
  ggtitle("Jimmy, make a meme about income inequality.") +
  scale_y_continuous(labels=scales::dollar_format()) +
  theme_bw() + 
  geom_bernie(bernie = "sitting") +
  ylab("That's a lot of pastrami sandwiches!") +
  transition_reveal(Year)

anim_save("bernie_inequality.gif")

