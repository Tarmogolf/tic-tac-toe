require "./tic_tac_toe_board.rb"
require "./tic_tac_toe_player.rb"

class TicTacToe
	attr_reader :playerX
	attr_reader :playerO

	def initialize
		@game_board = TicTacToeBoard.new
		@playerX = TicTacToePlayer.new("X")
		@playerO = TicTacToePlayer.new("O")
		@active_player = @playerX
		@inactive_player = @playerO		
	end

	def place_marker(player)
		puts "Player #{player.marker}, type an empty space to place your marker"
		index = gets.chomp.to_i
		
		until((1..9) === index)
			puts "Bad input. Type a number between 1 and 9"
			index = gets.chomp.to_i
		end

		until(@game_board.is_empty?(index-1))
			puts "That spot is already taken, enter another"
			index = gets.chomp.to_i
		end

		@game_board.add_marker(player.marker, index-1)
	end

	def swap_active_player
		@active_player,@inactive_player = @inactive_player, @active_player
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
		(1..9).each do |x|
			return false if @game_board.ttt_state.include?(x)
		end
		true
	end

	def show_board
		puts @game_board.to_s + "\n"
	end

	def play_game
		self.show_board
		loop do
			place_marker(@active_player)
			self.show_board

			if player_wins?(@active_player.marker)
				puts "Player #{@active_player.marker} wins!"
				break
			elsif tie?
				puts "it's a tie"
				break
			end

			swap_active_player
		end
	end
end

game = TicTacToe.new
game.play_game