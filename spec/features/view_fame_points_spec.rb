feature 'View fame points' do
  scenario 'see player 2\'s fame points' do
  sign_in_and_play
  expect(page).to have_content('Mittens: 100 Fame Points')
  end
end
