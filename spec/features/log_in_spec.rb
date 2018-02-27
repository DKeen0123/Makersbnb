 #   User.create(name: "mike", email: "mike@test.com", password:"123")

feature 'Log in' do 
  scenario 'Existing user can log in and see welcome message' do
    visit '/properties'
    click_button 'log in'
    fill_in "email", with: "mike@test.com"
    fill_in "password", with: "123"
    click_button "log in"
    expect(page).to have_content "Welcome, mike!"
  end
end 