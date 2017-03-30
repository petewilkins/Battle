feature "reducing opponents fame points" do
  scenario "when player 1 attacks, player 2's fp reduces" do
    sign_in_and_play
    click_button('Do It')
    expect(page).to have_content("Mittens: 90fp")
  end

  scenario "when player 2 attacks, player 1's fp reduces" do
    sign_in_and_play
    click_button('Do It')
    click_button('Retaliate')
    click_button('Do It')
    expect(page).to have_content("John: 90fp")
  end

  scenario "A player loses when their fame points reaches 0" do
    full_on_fight
    expect(page).to have_content "Jog on!"
  end
end
