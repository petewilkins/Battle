require 'game'

describe Game do

  subject(:game) {described_class.new(john, mittens)}
  let(:john) {double :john, attack: option}
  let(:mittens) {double :mittens, got_attacked: option}
  let(:option) {double :Jungle}

  describe '#attack' do
    it "damages the opponent with option selected" do
      expect(mittens).to receive(:got_attacked)
      game.attack(mittens, option)
    end

    it 'changes player turn' do
      game.attack(mittens, option)
      game.switch_turns
      expect(game.current_turn).to eq mittens
    end
  end

  describe '#initialize' do
    it "player 1's turn to start" do
      expect(game.current_turn).to eq john
    end
  end

  describe '#player_1' do
    it 'retrieves the first player' do
      expect(game.player_1).to eq john
    end
  end

  describe '#player_1' do
    it 'retrieves the second player' do
      expect(game.player_2).to eq mittens
    end
  end
end
