class Player

  attr_reader :name, :attack, :fp

  def initialize(name)
    @name = name
    @fp = 100
  end

  def attack(attack)
    @attack = attack
  end

  def got_attacked(attack)
    self.fp -= 10
  end

  private

  attr_writer :fp

end
