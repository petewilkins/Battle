class AttackLibrary

  attr_reader :attack_options, :find_fp_value, :move

  def initialize(move)
    @move = move
    @attack_options = {
      "has been sent to the Jungle" => 12,
      "has been embarrassingly tripped up on the red carpet" => 15,
      "has had their private matters leaked" => -20,
      "has had their nudes leaked in the Sun (Ouch!)" => 30
    }
  end

  def find_fp_value
    attack_options[@move]
  end
end
