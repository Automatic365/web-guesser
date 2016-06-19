require 'sinatra'
require 'sinatra/reloader'


number = rand(100)

get '/' do
  message = check_guess(number)
  result = final(number)
  color = color_check(number)
  params['guess']
  erb :index, :locals => {:number => number, :message => message, :color => color, :result => result}

end

def check_guess(number)
  if params['guess'].to_i > number + 5
    "WAY TOO HIGH"
  elsif params["guess"].to_i < number - 5
    "WAY TOO LOW"
  elsif params["guess"].to_i > number
    "TOO HIGH"
  elsif params["guess"].to_i < number
    "TOO LOW"
  else
    "You got it right!"
  end
end

def final(number)
  if check_guess(number) == "You got it right!"
    "The SECRET NUMBER is #{number}"
  end
end

def color_check(number)
  if params['guess'].to_i > number + 5
    'red'
  elsif params['guess'].to_i < number - 5
    'red'
  elsif params['guess'].to_i > number
    'IndianRed'
  elsif params['guess'].to_i < number
    'IndianRed'
  else
    'green'
  end
end
