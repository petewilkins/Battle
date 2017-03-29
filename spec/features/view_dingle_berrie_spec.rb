feature 'View fame points' do
  scenario 'see player 2\'s fame points' do
  visit('/')
  fill_in(:player_1_name, :with => 'John')
  fill_in(:player_2_name, :with => 'Mittens')
  click_button('Submit')
  expect(page).to have_content('Mittens: 0 Fame Points')
  end
end
