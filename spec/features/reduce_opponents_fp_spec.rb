feature "reducing opponents fame points" do
  scenario "when player 1 attack, player 2's fp reduces" do
    sign_in_and_play
    click_button('Do It')
    expect(page).to have_content("Mittens: 90fp")
  end
end
