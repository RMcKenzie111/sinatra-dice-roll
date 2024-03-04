require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"
# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/hello") do
  "Hello World"
end

get("/zebra") do
  "We must add a route for each path we want to support."
end

get("/giraffe") do
  "Hopefully this shows up without having to restart the server."
end

get("/") do
  "<h1>Dice Roll</h1>
   <ul>
    <li><a href=\"/dice/2/6\">Roll two 6-sided dice</a></li>
    <li><a href=\"/dice/2/10\">Roll two 10-sided dice</a></li>
    <li><a href=\"/dice/1/20\">Roll one 20-sided die</a></li>
    <li><a href=\"/dice/5/4\">Roll five 4-sided dice</a></li>
   </ul> "
end


get("/dice/2/6") do
# Generate two random numbers between 1 and 6
  first_die = rand(1..6)
  second_die = rand(1..6)
# Add them up  
  sum = first_die + second_die

  outcome = "You rolled a #{first_die} and #{second_die} for a total of #{sum}"


# Send back both numbers and the total in the body of the response
  "<h1>2d6</h1>
  <p>#{outcome}</p>"
end

get("/dice/2/10") do
  # Generate two random numbers between 1 and 6
  first_die = rand(1..10)
  second_die = rand(1..10)
  # Add them up  
  sum = first_die + second_die
    
  outcome = "You rolled a #{first_die} and #{second_die} for a total of #{sum}"
  "<h1>2d10</h1>
  <p>#{outcome}</p>"
end          

get("/dice/1/20") do
  # Generate two random numbers between 1 and 6
  one_die = rand(1..20)
# Result  
  result = one_die
    
  outcome = "You rolled a #{one_die}."
  "<h1>1d20</h1>
  <p>#{outcome}</p>"
end          

get("/dice/5/4") do
# Generate two random numbers between 1 and 6
  first_die = rand(1..4)
  second_die = rand(1..4)
  third_die = rand(1..4)
  fourth_die = rand(1..4)
  fifth_die = rand(1..4)
  # Add them up  
  sum = first_die + second_die + third_die + fourth_die + fifth_die
    
  outcome = "You rolled a #{first_die}, #{second_die}, #{third_die}, #{fourth_die}, and a #{fifth_die} for a total of #{sum}"
  "<h1>5d4</h1>
  <p>#{outcome}</p>"
end          
