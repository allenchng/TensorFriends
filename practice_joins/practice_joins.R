library(readr)
library(dplyr)

### dplyr practice

player_data <- read_csv('/home/achang35/Desktop/practice_joins/player_data.csv')
players <- read_csv('/home/achang35/Desktop/practice_joins/Players.csv')
season_stats <- read_csv('/home/achang35/Desktop/practice_joins/Seasons_Stats.csv')

### inner
inner_join(players, player_data, by = c('Player' = 'name'))

### semi
semi_join(players, player_data, by = c('Player' = 'name'))

### left
left_join(players, player_data, by = c('Player' = 'name'))

### right
right_join(player_data, players, by = c('name' = 'Player'))

### anti
anti_join(player_data, players, by = c('name' = 'Player'))  # returns rows from left that are not in right

## full join
full_join(player_data, players, by = c('name' = 'Player'))  # joins all data

### filtering
## ==
## >, >=
## &, |, !, xor()
## is.na()

## between()
inner_join(players, player_data, by = c('Player' = 'name')) %>% filter(between(year_start, 1953, 1962))

## n()
inner_join(players, player_data, by = c('Player' = 'name')) %>% 
  filter(between(year_start, 1953, 1962)) %>% 
  summarise(num_players = n())

## dplyr union, intersect, setdiff, union_all, setequal
first <- players[1:50, ]
second <- players[40:100, ]
union(first, second)  # like bind_rows, but only keeps distinct rows
union_all(first, second)  # duplicates rows

intersect(first, second)  # overlap between the two sets
setdiff(first, second)  # which rows don't exist in target data frame (only keep first 40 rows from first)

setequal(first, second)  # returns boolean for whether sets are identical


