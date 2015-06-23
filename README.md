# Golf Score Record Keeper

Description
  - many individual rounds of golf for each golfer
  - many scores may be entered for many courses
  - many golfers may play many courses

Each round of golf will have a golfer's id and a course id associated with it.  The tables will then be able to be manipulated to show stats all together, by course, or by golfer.


## Golf course table
  - primary key/id integer
  - golf course name as a string 
  - front 9 par as integer 
  - back 9 par as integer
  

## Golfer table
  - primary key/id integer 
  - golfer name as a string 
  - career +/- in relation to par
  

## Individual Round Table
  - front 9 score as integer
  - back 9 score as integer 
  - golf course id integer 
  - golfer id

  
  
  
  
 - [ ] Should be able to filter the individual rounds table to show all rounds for a given course, and then sort scores from lowest to highest to give a leaderboard.
  
 - [ ] Should be able to filter individual rounds table by individual golfers to show personal bests.
  
 - [ ] Should not be able to enter a course with a 9 hole par lower than 27 or higher than 40.
  
 - [ ] Should not be able to enter 9 hole scores for individual rounds lower than 9.
  
 - [ ] Should not be able to enter a golf course without a name/pars.
  
 - [ ] Should not be able to create a user without entering at least one round of golf.
  
 - [ ] Should be able to create new courses even if no one has or will play them.
  
  (can't decide if I should allow changing of rounds that have already been entered.)
  
  