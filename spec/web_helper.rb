def sign_up(email: 'example@example.com',
             username: 'example_user',
             password: 'pa$$word',
             password_confirmation: 'pa$$word')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :username, with: username
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Create account'
end


def sign_in(email:, password:)
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end
