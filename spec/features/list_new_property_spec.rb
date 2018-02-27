feature 'Displaying listings' do
  scenario 'Landlord can fill in with information' do
    visit '/properties'
    click_button 'list property'
    fill_in "email", with: "john@example.com"
    fill_in "url", with: "https://imgur.com/rE8X4ir"
    click_button "submit"
    expect(page).to have_content("john@example.com")
  end
end
