feature 'User sign in' do

  let(:user) do
    User.create(email: 'example@example.com',
                password: 'pa$$word',
                password_confirmation: 'pa$$word')
  end

  scenario 'user can sign in with correct credentials' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.email, 'notmypassword')).to be_nil
  end
  
end
