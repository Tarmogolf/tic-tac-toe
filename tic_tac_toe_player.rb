class TicTacToePlayer

	attr_reader :marker

	def initialize(marker)
		if marker.length > 1
			marker = marker[0]
		end
		
		@marker = marker
	end

end