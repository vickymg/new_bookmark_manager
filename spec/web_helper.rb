def sign_up(email: 'example@example.com',
             password: 'pa$$word',
             password_confirmation: 'pa$$word')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
end
