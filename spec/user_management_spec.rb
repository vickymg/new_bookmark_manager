feature 'User sign up' do

  scenario 'new user can sign up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, example@example.com")
    expect(User.first.email).to eq("example@example.com")
  end

  scenario 'user must confirm password to proceed' do
   expect { sign_up(password_confirmation: '123456' ) }.not_to change(User, :count)
  end

  scenario 'user shown an error message if passwords do not match' do
    expect {sign_up(password_confirmation: '123456')}.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password and confirmation password do not match'
  end

end
