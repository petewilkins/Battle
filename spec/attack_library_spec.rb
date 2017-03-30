require 'attack_library'

describe AttackLibrary do
  move = "has been sent to the Jungle"
  subject(:attackmethod) { described_class.new(move) }

  describe '#initialize' do
    it 'receives a valid argument' do
      expect(attackmethod.attack_options).to include move
    end
  end

  describe '#find_fp_value' do
    it 'returns damage for attack option' do
      expect(attackmethod.find_fp_value).to eq 12
    end
  end
end
