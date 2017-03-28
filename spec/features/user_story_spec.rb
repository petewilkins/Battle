feature 'User Stories' do
  scenario 'Fighters see name on screen after filling in form' do
    visit('/fighters-form')
    fill_in('name', :with => 'John')
    click_on('Submit')
    expect(page).to have_content('John')
  end
end
