feature 'User signs out' do

  before(:each) do
    User.create(email: 'example@example.com',
                password: 'pa$$word',
                password_confirmation: 'pa$$word')
  end

  scenario 'while being signed in' do
    sign_in(email: 'example@example.com', password: 'pa$$word')
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome, example@example.com')
  end

end
