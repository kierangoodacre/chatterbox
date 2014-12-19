require 'colorize'


def get_response(input)
  key = RESPONSES.keys.select {|k| /#{k}/ =~ input }.sample 
  /#{key}/ =~ input
  response = RESPONSES[key]
  response.nil? ? 'sorry?' : response % { c1: $1, c2: $2, c3: $3, c4: $4 } # ? ternary operator, acts like an if statement
end
RESPONSES = { 'how are you?' => 'I am well, how about you?',
	          'Yes really good thanks' => 'brilliant',
	          'great to have a chat' => 'yes it is, what music are you into?',
	          'goodbye' => 'bye', 
              'sayonara' => 'sayonara', 
              'the weather is (.*)' => 'I hate it when it\'s %{c1}', 
              'I love (.*)' => 'I love %{c1} too', 
              'I groove to (.*) and (.*). I\'m not really fussed about (.*) and (.*)' => 'I love %{c1} I\'m not a fan of %{c2}. I do really like %{c3} and %{c4} though',  
              'How about (.*) and (.*)' => 'Yes mate I like %{c1} and a bit of %{c2}',
              'That\'s cool, and what about (.*)' => 'yeah %{c1} aint bad'}

puts "Hello, what's your name?".colorize(:blue)
name = gets.chomp
puts "Bot - Hello #{name}".colorize(:blue)
while input = gets.chomp do
   puts 'Bot - '.colorize(:blue) + (get_response(input)).colorize(:blue)
  if input == 'see ya later' 
    puts 'see ya!'
  break
  end
end
