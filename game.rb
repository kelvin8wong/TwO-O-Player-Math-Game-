require_relative './player.rb'
require_relative './question.rb'

class Game

  def initialize
    puts "Welcome to TwO-O Math Game!"
    print "What is the name of Player 1? "
    name = gets.chomp
    @player1 = Player.new(name)
    print "What is the name of Player 2? "
    name = gets.chomp
    @player2 = Player.new(name)
  end

  def ask_player_question(current_player, current_questioner)
    question = Question.new
    puts "#{current_questioner.name}: #{question.question_text}"
    answer = gets.chomp.to_i
    correct = question.verify_answer?(answer)
    if correct
      puts "#{current_questioner.name}: YES! You are correct."
    else
      current_player.lose_life
      puts "#{current_questioner.name}: NO! You got it wrong."
    end
  end

  def play
    until @player1.dead? || @player2.dead?
      ask_player_question(@player1, @player2)
      puts "#{@player1.name}:#{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
      puts "---------NEW TURN---------"
      ask_player_question(@player2, @player1)
      puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
      puts "---------NEW TURN---------"
    end
    if @player1.dead?
      puts "GAME OVER, #{@player2.name} wins with a score of #{@player2.lives}/3."
      puts "Good Bye!"
    else
      puts "GAME OVER, #{@player1.name} wins with a score of #{@player1.lives}/3."
      puts "Good Bye!"
    end
  end
end

game = Game.new
game.play