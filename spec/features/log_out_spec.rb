feature 'Log Out' do 
  scenario 'signed in user can log out' do 
    visit '/properties'
    click_button 'log in'
    fill_in "email", with: "mike@test.com"
    fill_in "password", with: "123"
    click_button "log in"
    click_button "log out"
    expect(page).not_to have_content "Welcome, mike!"
    expect(current_path).to eq '/properties'
  end
end