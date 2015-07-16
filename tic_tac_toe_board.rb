class TicTacToeBoard
	attr_accessor :ttt_state

	def initialize
		@ttt_state = []
		reset_board
	end

	def reset_board
		9.times do 
			@ttt_state.push("_")
		end
	end

	def add_marker(marker, index)
		@ttt_state[index] = marker
	end

	def to_s
		"#{@ttt_state[0]} #{@ttt_state[1]} #{@ttt_state[2]} \n" +
		"#{@ttt_state[3]} #{@ttt_state[4]} #{@ttt_state[5]} \n" +
		"#{@ttt_state[6]} #{@ttt_state[7]} #{@ttt_state[8]} \n"
	end

	def is_empty?(index)
		@ttt_state[index] == "_"
	end



end
