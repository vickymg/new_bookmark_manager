feature 'Reset password' do

  before do
    sign_up
    Capybara.reset!
  end
  let(:user) { User.first }

  scenario 'user can see a link to reset password' do
    visit '/sessions/new'
    click_link 'I forgot my password'
    expect(page).to have_content('Please enter your email address:')
  end

  scenario 'user is told to check their inbox after entering their email' do
    recover_password
    expect(page).to have_content 'Thanks, please check your inbox for the link.'
  end

  scenario 'user is assigned a reset token when they forget password' do
    sign_up
    expect{recover_password}.to change{User.first.password_token}
  end

  scenario 'it doesn\'t allow you to use the token after an hour' do
    recover_password
    Timecop.travel(60*60*60) do
      visit("/users/reset_password?token=#{user.password_token}")
      expect(page).to have_content 'Your token is invalid'
    end
  end

  scenario 'it asks for your new password when your token is valid' do
    recover_password
    visit("/users/reset_password?token=#{user.password_token}")
    expect(page).to have_content('Please enter your new password')
  end

  scenario 'it lets you enter a new password with a valid token' do
    recover_password
      visit("/users/reset_password?token=#{user.password_token}")
      fill_in :password, with: 'pa$$word1'
      fill_in :password_confirmation, with: 'pa$$word1'
      click_button 'Submit'
    expect(page).to have_content('Please sign in')
  end

  scenario 'it lets you sign in after password reset' do
    recover_password
      visit("/users/reset_password?token=#{user.password_token}")
      fill_in :password, with: 'pa$$word1'
      fill_in :password_confirmation, with: 'pa$$word1'
      click_button 'Submit'
      sign_in(email: 'example@example.com', username: 'example_user', password: 'pa$$word1')
      expect(page).to have_content "Welcome, #{user.username}"
  end

  scenario 'it lets you know if your passwords don\'t match' do
    recover_password
    visit("/users/reset_password?token=#{user.password_token}")
    fill_in :password, with: 'pa$$word1'
    fill_in :password_confirmation, with: 'pa$$word2'
    click_button 'Submit'
    expect(page).to have_content('Password does not match the confirmation')
  end
end
