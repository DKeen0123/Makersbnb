feature 'User sign up' do
  scenario 'A new user signs up and gets confirmation' do
    visit '/'
    fill_in 'name', with: 'Jared'
    fill_in 'signupemail', with: 'jared@test.com'
    fill_in 'password', with: '123'
    click_button 'Sign up'
    expect(page).to have_content 'Welcome, Jared!'
  end
end
