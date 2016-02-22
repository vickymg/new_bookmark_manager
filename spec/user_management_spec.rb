feature 'User sign up' do

  scenario 'new user can sign up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, example@example.com")
    expect(User.first.email).to eq("example@example.com")
  end

  scenario 'user must confirm password to proceed' do
   expect { sign_up(password_confirmation: '123456' ) }.not_to change(User, :count)
 end

end
