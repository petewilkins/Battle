feature 'switch player turn' do

  scenario 'player 1 begins the game' do
      sign_in_and_play
      expect(page).not_to have_content("Mittens, its your turn to cause havoc!")
      expect(page).to have_content("John, its your turn to cause havoc!")
  end

  scenario "after player 1 attacks, it switches to player 2's turn" do
    sign_in_and_play
    click_button('Do It')
    click_button('Retaliate')
    expect(page).not_to have_content("John, its your turn to cause havoc!")
    expect(page).to have_content("Mittens, its your turn to cause havoc!")
  end

end
