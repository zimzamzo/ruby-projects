# initializes the game

require_relative 'tictactoe'

puts "Hello! What is a player's name? "

name1 = gets.chomp

puts "Thanks! What is the other player's name? "

name2 = gets.chomp

TicTacToe.new(name1, name2).play