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


# In order to have " within our String, we had to escape them with a backslash. Then, Ruby knows not to terminate the String there, and instead treats the " as just another character to be included in the String. Using views is better
get("/") do
  erb(:elephant)
end


get("/dice/2/6") do
# Generate two random numbers between 1 and 6
  first_die = rand(1..6)
  second_die = rand(1..6)
# Add them up  
  sum = first_die + second_die

  @outcome = "You rolled a #{first_die} and #{second_die} for a total of #{sum}"

# Send back both numbers and the total in the body of the response
  erb(:two_six)
end

get("/dice/2/10") do
  # Generate two random numbers between 1 and 6
  first_die = rand(1..10)
  second_die = rand(1..10)
  # Add them up  
  sum = first_die + second_die
    
  @outcome = "You rolled a #{first_die} and #{second_die} for a total of #{sum}"
  erb(:two_ten)
end          

get("/dice/1/20") do
  # Generate two random numbers between 1 and 6
  @die = rand(1..20)
# Result  
  result = one_die
    
  @outcome = "You rolled a #{@die}."
  erb(:one_twenty)
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
    
  @outcome = "You rolled a #{first_die}, #{second_die}, #{third_die}, #{fourth_die}, and a #{fifth_die} for a total of #{sum}"
  erb(:five_four)
end      

get("/dice/100/6") do
  @rolls = []

  100.times do
    die = rand(1..6)
    @rolls.push(die)
  end

  erb(:one_hundred_six)
end
