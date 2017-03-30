def sign_in_and_play
  visit('/')
  fill_in(:player_1_name, :with => 'John')
  fill_in(:player_2_name, :with => 'Mittens')
  click_button('Submit')
end

def full_on_fight
  sign_in_and_play
  18.times {
    click_button('Do It')
    click_button('Retaliate')
  }
  click_button('Do It')
end
