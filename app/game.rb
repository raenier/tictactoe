class Game
  require_relative 'board'
  require_relative 'player'

  attr_accessor :player1, :player2, :board

  def initialize
    @player1 = Player.new('x')
    @player2 = Player.new('y')
    @board = Board.new()
  end

  def start
    p 'Do you want to play? Y/N'
    return p('Thanks for stopping by!') unless gets.chomp.downcase == 'y'
    p 'Now lets get started!! Player 1 gets X and Player 2 gets O'

    #loop this until game ends
    until game_ends(board) do
      [player1, player2].each_with_index do |player, index|
        board.display
        p "Your move - player #{index + 1}: "

        until board.record(*player.move) do
          p 'Repeat, invalid move!: '
        end

        break if game_ends(board)
      end
    end

    display_stats
    restart
  end

  def game_ends(board)
    board.winner || board.full_board?
  end

  def display_stats
    p "YOUR WINNER!: PLAYER #{board.winner == 'x' ? 1 : 2}" if board.winner
    board.display
  end

  def restart
    self.board = Board.new()
    start
  end
end
