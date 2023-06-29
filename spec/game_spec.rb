require_relative '../app/game'

describe Game do
  describe '#start' do
    let(:game) { described_class.new }

    context 'Loops until theres a valid input' do
      before do
        allow(game).to receive(:game_ends).and_return(false, true)
        allow(game).to receive(:gets).and_return('y')
        allow_any_instance_of(Player).to receive(:gets).and_return('a2')
        allow(game).to receive(:restart).and_return(false)
      end

      it 'loop 4 times until valid' do
        allow(game.board).to receive(:record).and_return(false, false, false, true)
        expect(game.board).to receive(:record).exactly(4).times
        game.start
      end

      it 'loop 3 times until valid' do
        allow(game.board).to receive(:record).and_return(false, false, true)
        expect(game.board).to receive(:record).exactly(3).times
        game.start
      end
    end

  end

  describe '#restart' do
    let(:game) { described_class.new }

    context 'restarts game' do
      before do
        allow(Board).to receive(:new)
        allow(game).to receive(:start)
      end

      it 'creates new board' do
        expect(Board).to receive(:new).once
        game.restart
      end
      it 'calls #start to start new game' do
        expect(game).to receive(:start).once
        game.restart
      end
    end
  end
end
