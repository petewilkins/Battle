feature "Attack player 2" do
  scenario "Get confirmation of attacking player 2" do
    sign_in_and_play
    click_button('Do It')
    expect(page).to have_content("Mittens has been sent to the Jungle")
  end
end
