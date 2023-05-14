class Player
  attr_reader :piece

  def initialize(piece)
    @piece = piece
  end

  def move
    user_input = gets.chomp
    return self.move if user_input.length > 2 || user_input.empty?
    row_letter, column_number = user_input.split('')

    return [piece, row_letter, column_number.to_i]
  end
end
