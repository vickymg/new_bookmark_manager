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


def sign_in(email:, username:, password:)
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :username, with: username
  fill_in :password, with: password
  click_button 'Sign in'
end

def recover_password
  visit '/users/recover'
  fill_in :email, with: 'example@example.com'
  click_button 'Submit'
end
