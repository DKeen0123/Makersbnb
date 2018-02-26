feature 'testing initial setup' do
  scenario 'home page has welcome message' do
    visit '/'
    expect(page).to have_content("Welcome to Makers BnB!")
  end
end