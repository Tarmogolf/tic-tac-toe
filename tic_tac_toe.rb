require "./tic_tac_toe_board.rb"
require "./tic_tac_toe_player.rb"

class TicTacToe
	attr_reader :playerX
	attr_reader :playerO

	def initialize
		@game_board = TicTacToeBoard.new
		@playerX = TicTacToePlayer.new("X")
		@playerO = TicTacToePlayer.new("O")
		
	end

	def take_turn(player)
		puts "Player #{player.marker}, type an empty space to place your marker"
		index = gets.chomp.to_i
		
		until(@game_board.is_empty?(index))
			puts "That spot is already taken, enter another"
			index = gets.chomp.to_i
		end

		@game_board.add_marker(player.marker, index)
	end

	def player_wins?(marker)
		(@game_board.ttt_state[0]==@game_board.ttt_state[1]&&@game_board.ttt_state[0]==@game_board.ttt_state[2]&&@game_board.ttt_state[0]==marker) ||
		(@game_board.ttt_state[3]==@game_board.ttt_state[4]&&@game_board.ttt_state[3]==@game_board.ttt_state[5]&&@game_board.ttt_state[3]==marker) ||
		(@game_board.ttt_state[6]==@game_board.ttt_state[7]&&@game_board.ttt_state[6]==@game_board.ttt_state[8]&&@game_board.ttt_state[6]==marker) ||
		(@game_board.ttt_state[0]==@game_board.ttt_state[3]&&@game_board.ttt_state[0]==@game_board.ttt_state[6]&&@game_board.ttt_state[0]==marker) ||
		(@game_board.ttt_state[1]==@game_board.ttt_state[4]&&@game_board.ttt_state[1]==@game_board.ttt_state[7]&&@game_board.ttt_state[1]==marker) ||
		(@game_board.ttt_state[2]==@game_board.ttt_state[5]&&@game_board.ttt_state[2]==@game_board.ttt_state[8]&&@game_board.ttt_state[2]==marker) ||
		(@game_board.ttt_state[0]==@game_board.ttt_state[4]&&@game_board.ttt_state[0]==@game_board.ttt_state[8]&&@game_board.ttt_state[0]==marker) ||
		(@game_board.ttt_state[6]==@game_board.ttt_state[4]&&@game_board.ttt_state[6]==@game_board.ttt_state[2]&&@game_board.ttt_state[6]==marker)

	end

	def tie?
		!@game_board.ttt_state.include?("_")
	end

	def show_board
		puts @game_board.to_s + "\n"
	end

	def play_game
		self.show_board
		loop do
			self.take_turn(playerX)
			if player_wins?(playerX.marker)
				puts "Player X wins!"
				self.show_board
				break
			elsif tie?
				puts "It's a tie"
				self.show_board
				break
			end
			self.show_board
			self.take_turn(playerO)
			if player_wins?(playerO.marker)
				puts "Player O wins!"
				self.show_board
				break
			elsif tie?
				puts "It's a tie"
				self.show_board
				break
			end
			self.show_board
		end
	end
end

game = TicTacToe.new
game.play_game